% Knowledge base of diseases and their symptoms.

% Format: disease(DiseaseName, [SymptomList], BaseProbability).

% 1. Common Cold
disease(common_cold, 
    [runny_or_stuffy_nose, sneezing, sore_throat, mild_cough, mild_headache, low_grade_fever, mild_body_aches_or_fatigue],
    0).

% 2. Influenza (Flu)
disease(influenza,
    [high_fever, chills, severe_headache, muscle_aches_joint_pain, sore_throat, dry_cough, profound_fatigue_weakness, nasal_congestion],
    0).

% 3. Type 2 Diabetes Mellitus
disease(type_2_diabetes_mellitus,
    [excessive_thirst, frequent_urination, increased_hunger, unintentional_weight_change, blurry_vision, slow_healing_wounds, tingling_numbness_in_extremities, fatigue],
    0).

% 4. Hypertension (High Blood Pressure)
disease(hypertension,
    [no_symptoms_often, occasional_headaches, dizziness, blurred_vision, nosebleeds, fatigue_confusion],
    0).

% 5. Asthma
disease(asthma,
    [difficulty_breathing, wheezing, chest_tightness, coughing_worse_at_night, rapid_breathing, fatigue_during_attacks],
    0).

% 6. Allergic Rhinitis (Hay Fever)
disease(allergic_rhinitis,
    [sneezing_fits, stuffy_runny_nose_clear, itchy_red_watery_eyes, itchy_throat_or_nose, postnasal_drip, mild_fatigue],
    0).

% 7. Depression (Major Depressive Disorder)
disease(depression,
    [persistent_sadness, loss_of_interest, appetite_changes, significant_weight_changes, sleep_disturbances, fatigue_or_loss_of_energy, difficulty_concentrating, feelings_of_guilt, thoughts_of_death_or_suicide],
    0).

% 8. Generalized Anxiety Disorder (GAD)
disease(gad,
    [excessive_worry, restlessness, difficulty_concentrating, irritability, muscle_tension, sleep_disturbances, fatigue],
    0).

% 9. Alzheimer’s Disease
disease(alzheimers,
    [memory_loss_short_term, difficulty_finding_words, trouble_completing_familiar_tasks, confusion_time_place, poor_judgment, mood_personality_changes, social_withdrawal],
    0).

% 10. Migraine
disease(migraine,
    [throbbing_headache_one_sided, sensitivity_to_light, sensitivity_to_sound, nausea_vomiting, visual_disturbances_auras, fatigue_difficulty_concentrating, neck_stiffness],
    0).

% 11. Pneumonia
disease(pneumonia,
    [persistent_cough_with_mucus, fever_sweating_chills, shortness_of_breath, rapid_shallow_breathing, chest_pain_with_breathing, fatigue_weakness, loss_of_appetite],
    0).

% 12. Gastroenteritis (Stomach Flu)
disease(gastroenteritis,
    [nausea_vomiting, watery_diarrhea, abdominal_cramps_pain, low_grade_fever, headache_body_aches, dehydration_symptoms],
    0).

% 13. Tuberculosis (TB)
disease(tuberculosis,
    [persistent_cough_3_weeks, coughing_up_blood, night_sweats, fever_chills, unintentional_weight_loss, fatigue_weakness, chest_pain_discomfort],
    0).

% 14. Chronic Obstructive Pulmonary Disease (COPD)
disease(copd,
    [chronic_productive_cough, shortness_of_breath_exertion, wheezing_noisy_breathing, chest_tightness, frequent_respiratory_infections, fatigue_reduced_exercise_tolerance],
    0).

% 15. Rheumatoid Arthritis
disease(rheumatoid_arthritis,
    [joint_pain_swelling_symmetrical, morning_stiffness_30mins, fatigue_fever_malaise, reduced_range_of_motion, rheumatoid_nodules, joint_deformities_long_term],
    0).

% 16. Osteoarthritis
disease(osteoarthritis,
    [joint_pain_with_activity, stiffness_less_30mins, reduced_flexibility, bone_spurs, mild_joint_swelling, crepitus_joints],
    0).

% 17. Hypothyroidism (Underactive Thyroid)
disease(hypothyroidism,
    [fatigue_sluggishness, weight_gain, cold_intolerance, dry_skin_brittle_hair, constipation, muscle_weakness_aches, depression_low_mood, slow_heart_rate],
    0).

% 18. Infectious Mononucleosis (Mono)
disease(mono,
    [extreme_fatigue, fever, severe_sore_throat, swollen_lymph_glands, swollen_tonsils, headache, rash, muscle_aches],
    0).

% 19. Chickenpox (Varicella)
disease(chickenpox,
    [itchy_blister_like_rash, fever, fatigue_malaise, headache, loss_of_appetite, rash_starts_trunk_spreads],
    0).

% 20. Meningitis
disease(meningitis,
    [severe_headache, stiff_neck, fever_chills, nausea_vomiting, sensitivity_to_light, confusion_concentration_issues, drowsiness_difficulty_waking, seizures_coma],
    0).

% Probability calculation
get_disease_probability(Disease, SelectedSymptoms, Prob) :-
    disease(Disease, DiseaseSymptoms, _BaseP),
    intersection(SelectedSymptoms, DiseaseSymptoms, MatchedSymptoms),
    length(MatchedSymptoms, MatchCount),
    length(DiseaseSymptoms, TotalCount),
    ( TotalCount > 0 -> Prob is (MatchCount / TotalCount)*100 ; Prob is 0 ).