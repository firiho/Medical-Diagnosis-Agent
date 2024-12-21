let chosenSymptoms = [];

document.addEventListener('DOMContentLoaded', () => {
    const symptomContainer = document.getElementById('symptomContainer');

    symptomContainer.addEventListener('click', async (event) => {
        const target = event.target;
        if (target.classList.contains('symptomBubble')) {
            const symptom = target.dataset.symptom;

            // Toggle symptom in chosenSymptoms
            if (chosenSymptoms.includes(symptom)) {
                chosenSymptoms = chosenSymptoms.filter((s) => s !== symptom);
                target.classList.remove('selected');
            } else {
                chosenSymptoms.push(symptom);
                target.classList.add('selected');
            }

            // Automatically submit symptoms after selection
            await submitSymptoms();
        }
    });
});

async function submitSymptoms() {
    try {
        const response = await fetch('/diagnose', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(chosenSymptoms),
        });

        const data = await response.json();
        const resultDiv = document.getElementById('result');

        if (data.diagnoses) {
            const diagnoses = data.diagnoses.map(
                (d) => `<a href="https://www.google.com/search?q=${d[0]}+treatment" target="_blank"> <li>${d[0]}: ${d[1]}%</li> </a>`
            ).join('');
            resultDiv.innerHTML = `
            <h2>Possible Diagnoses</h2>
            <ul>${diagnoses}</ul>`;
        } else if (data.message) {
            resultDiv.innerHTML = `<p>${data.message}</p>`;
        }
    } catch (error) {
        console.error('Error fetching diagnosis:', error);
        document.getElementById('result').innerHTML = `<p>Error fetching results. Please try again.</p>`;
    }
}

async function submitTextSymptoms() {
    const inputText = document.getElementById("symptomText").value;
    const response = await fetch(`/diagnose_text?input_text=${encodeURIComponent(inputText)}`, {
        method: "POST"
    });    
    const data = await response.json();
    const resultDiv = document.getElementById("result");
    if (data.diagnoses) {
      const diagnoses = data.diagnoses.map(d => `<a href="https://www.google.com/search?q=${d[0]}+treatment" target="_blank" > <li>${d[0]}: ${d[1]}%</li></a>`).join('');
      resultDiv.innerHTML = `
            <h2>Possible Diagnoses</h2>
            <ul>${diagnoses}</ul>`;
    } else {
      resultDiv.innerHTML = `<p>${data.message}</p>`;
    }
}

function restart() {
    // go to /
    window.location.href = '/';
}