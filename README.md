# AI-Based Medical Diagnosis Agent

## Table of Contents
- [Project Overview](#project-overview)
- [Key Components](#key-components)
- [Main Prolog Predicates](#main-prolog-predicates)
- [How to Run the Project](#how-to-run-the-project)
  - [Prerequisites](#prerequisites)
  - [Instructions](#instructions)


## Project Overview

This project implements an AI-driven, rule-based medical diagnosis agent designed to provide preliminary medical guidance to users. Leveraging a Prolog knowledge base, the system represents and reasons about various diseases and their associated symptoms. Users interact with the agent through a web-based interface, where they can select symptoms from a predefined list or describe them in natural language. The system then infers the most likely conditions and presents a ranked list of potential diagnoses. Each identified disease includes a direct link to a Google search for treatment information, facilitating access to credible medical resources.

## Key Components

1. **Knowledge Base (`kb.pl`)**
   - **Description:** Defines diseases and their characteristic symptoms as Prolog facts.
   - **Structure:**
     ```prolog
     disease(DiseaseName, [SymptomList], 0).
     ```
   - **Function:** These facts are utilized by the inference engine to compute the likelihood of each disease based on user-provided symptoms.

2. **Grammar Parsing (`grammar.pl`)**
   - **Description:** Implements a Definite Clause Grammar (DCG) to parse natural language descriptions of symptoms into a standardized, machine-readable format.
   - **Main Predicate:**
     ```prolog
     parse_symptoms(InputString, UniqueSymptoms).
     ```
   - **Function:** Uses DCG rules such as `sentence/1` and `symptom/1` to recognize known symptoms and map them to their canonical representations.

3. **Inference Engine (`inference_engine.py`)**
   - **Description:** Serves as the bridge between the Python web application and the Prolog knowledge base.
   - **Key Functions:**
     ```python
     parse_input_to_symptoms(input_str)  # Returns a list of recognized symptom atoms.
     rank_diseases(symptoms)             # Returns a list of (Disease, Probability) tuples.
     ```
   - **Function:** 
     - Parses user input text into recognized symptoms.
     - Computes the intersection between user symptoms and each disease’s symptom list.
     - Returns a ranked list of possible diseases with associated probabilities.

4. **Web Application (`app.py`)**
   - **Description:** A FastAPI-based web server that provides endpoints and serves the frontend interface.
   - **Endpoints:**
     - `POST /diagnose`: Handles symptom selection from the list.
     - `POST /diagnose_text`: Handles free-text symptom descriptions.
   - **Function:** Processes user inputs, invokes the inference engine, and displays the results as a ranked list of potential diagnoses with clickable links to treatment information.

5. **Frontend (`templates/index.html` & `static` files)**
   - **Description:** A user-friendly interface that lists available symptoms, allows text input, and displays diagnoses along with their probabilities.
   - **Components:**
     - **HTML (`index.html`):** Structure of the web page.
     - **CSS (`static/style.css`):** Styling for the web interface.
     - **JavaScript (`static/script.js`):** Handles user interactions and dynamically updates the results.

6. **Database Mappings (`database.py`)**
   - **Description:** Provides mappings between internal Prolog symptom/disease identifiers and user-friendly names.
   - **Function:** Facilitates human-readable output by translating internal identifiers to descriptive names displayed to the user.

## Instructions

- Run ```python app.py```
- Visit the application: Open your web browser and go to http://0.0.0.0:8000