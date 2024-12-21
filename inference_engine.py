from pyswip import Prolog

class PrologInferenceEngine:
    def __init__(self, kb_path="kb.pl", grammar_path="grammar.pl"):
        self.prolog = Prolog()
        self.prolog.consult(kb_path)
        self.prolog.consult(grammar_path)

    def parse_input_to_symptoms(self, input_str):
        # Convert the input string into a Prolog query
        query_str = f'parse_symptoms("{input_str}", Symptoms)'
        result = list(self.prolog.query(query_str))
        if result:
            # Symptoms is a Prolog list of atoms
            return [str(sym) for sym in result[0]["Symptoms"]]
        return []

    def get_all_diseases(self):
        result = list(self.prolog.query("disease(D, _, _)"))
        return [res["D"] for res in result]

    def get_probability(self, disease, symptoms):
        # Convert Python list of symptoms into Prolog list
        if symptoms:
            prolog_list = "[" + ",".join(symptoms) + "]"
        else:
            prolog_list = "[]"
        query_str = f"get_disease_probability({disease}, {prolog_list}, Prob)"
        result = list(self.prolog.query(query_str))
        if result:
            return float(result[0]["Prob"])
        return 0.0

    def rank_diseases(self, symptoms):
        diseases = self.get_all_diseases()
        probabilities = []
        for d in diseases:
            p = self.get_probability(d, symptoms)
            if p > 20:
                probabilities.append((d, p))
        # Sort by probability descending
        probabilities.sort(key=lambda x: x[1], reverse=True)
        return probabilities