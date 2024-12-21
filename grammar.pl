:- discontiguous symptom/3.

% Tokenize input string into a list of words
split_into_words(Str, Words) :-
    string_lower(Str, LowerStr),  % Convert to lowercase for consistent matching
    split_string(LowerStr, " ,.", "", RawWords),  % Split by spaces, commas, or periods
    exclude(==( ""), RawWords, Words).  % Remove empty strings

% Define parse_symptoms/2 which uses the DCG
parse_symptoms(Input, UniqueSymptoms) :-
    split_into_words(Input, Words),
    findall(Symptoms, phrase(sentence(Symptoms), Words), AllSymptoms),
    flatten(AllSymptoms, FlattenedSymptoms),
    sort(FlattenedSymptoms, UniqueSymptoms).


% DCG to parse sentence and find symptoms
sentence(Symptoms) --> find_symptoms(Symptoms).

find_symptoms([Symptom|Rest]) --> symptom(Symptom), find_symptoms(Rest).
find_symptoms([]) --> [].

% DCG to parse symptoms with flexible matching

% Common Cold symptoms
symptom(runny_or_stuffy_nose) --> words_before, ["runny"], words_between, ["nose"], words_after.
symptom(runny_or_stuffy_nose) --> words_before, ["stuffy"], words_between, ["nose"], words_after.
symptom(runny_or_stuffy_nose) --> words_before, ["runny"], words_between, ["or"], words_between, ["stuffy"], words_between, ["nose"], words_after.
symptom(sneezing) --> words_before, ["sneezing"], words_after.
symptom(sore_throat) --> words_before, ["sore"], words_between, ["throat"], words_after.
symptom(mild_cough) --> words_before, ["mild"], words_between, ["cough"], words_after.
symptom(mild_headache) --> words_before, ["mild"], words_between, ["headache"], words_after.
symptom(low_grade_fever) --> words_before, ["low-grade"], words_between, ["fever"], words_after.
symptom(low_grade_fever) --> words_before, ["low"], words_between, ["grade"], words_between, ["fever"], words_after.
symptom(mild_body_aches_or_fatigue) --> words_before, ["mild"], words_between, ["body"], words_between, ["aches"], words_after.
symptom(mild_body_aches_or_fatigue) --> words_before, ["mild"], words_between, ["fatigue"], words_after.

% Influenza
symptom(high_fever) --> words_before, ["high"], words_between, ["fever"], words_after.
symptom(chills) --> words_before, ["chills"], words_after.
symptom(severe_headache) --> words_before, ["severe"], words_between, ["headache"], words_after.
symptom(muscle_aches_joint_pain) --> words_before, ["muscle"], words_between, ["aches"], words_after.
symptom(muscle_aches_joint_pain) --> words_before, ["joint"], words_between, ["pain"], words_after.
symptom(profound_fatigue_weakness) --> words_before, ["profound"], words_between, ["fatigue"], words_after.
symptom(nasal_congestion) --> words_before, ["nasal"], words_between, ["congestion"], words_after.
symptom(dry_cough) --> words_before, ["dry"], words_between, ["cough"], words_after.

% Type 2 Diabetes Mellitus
symptom(excessive_thirst) --> words_before, ["excessive"], words_between, ["thirst"], words_after.
symptom(frequent_urination) --> words_before, ["frequent"], words_between, ["urination"], words_after.
symptom(increased_hunger) --> words_before, ["increased"], words_between, ["hunger"], words_after.
symptom(unintentional_weight_change) --> words_before, ["unintentional"], words_between, ["weight"], words_between, ["change"], words_after.
symptom(blurry_vision) --> words_before, ["blurry"], words_between, ["vision"], words_after.
symptom(slow_healing_wounds) --> words_before, ["slow-healing"], words_between, ["wounds"], words_after.
symptom(tingling_numbness_in_extremities) --> words_before, ["tingling"], words_between, ["or"], words_between, ["numbness"], words_between, ["in"], words_between, ["extremities"], words_after.
symptom(fatigue) --> words_before, ["fatigue"], words_after.

% Hypertension
symptom(no_symptoms_often) --> words_before, ["no"], words_between, ["symptoms"], words_after.
symptom(occasional_headaches) --> words_before, ["occasional"], words_between, ["headaches"], words_after.
symptom(dizziness) --> words_before, ["dizziness"], words_after.
symptom(blurred_vision) --> words_before, ["blurred"], words_between, ["vision"], words_after.
symptom(nosebleeds) --> words_before, ["nosebleeds"], words_after.
symptom(fatigue_confusion) --> words_before, ["fatigue"], words_between, ["confusion"], words_after.
symptom(fatigue_confusion) --> words_before, ["fatigue"], words_after.

% Asthma
symptom(difficulty_breathing) --> words_before, ["difficulty"], words_between, ["breathing"], words_after.
symptom(wheezing) --> words_before, ["wheezing"], words_after.
symptom(chest_tightness) --> words_before, ["tightness"], words_between, ["chest"], words_after.
symptom(coughing_worse_at_night) --> words_before, ["coughing"], words_between, ["worse"], words_between, ["at"], words_between, ["night"], words_after.
symptom(rapid_breathing) --> words_before, ["rapid"], words_between, ["breathing"], words_after.
symptom(fatigue_during_attacks) --> words_before, ["fatigue"], words_between, ["during"], words_between, ["attacks"], words_after.

% Allergic Rhinitis
symptom(sneezing_fits) --> words_before, ["sneezing"], words_between, ["fits"], words_after.
symptom(stuffy_runny_nose_clear) --> words_before, ["stuffy"], words_between, ["or"], words_between, ["runny"], words_between, ["nose"], words_between, ["clear"], words_after.
symptom(itchy_red_watery_eyes) --> words_before, ["itchy"], words_between, ["red"], words_between, ["watery"], words_between, ["eyes"], words_after.
symptom(itchy_throat_or_nose) --> words_before, ["itchy"], words_between, ["throat"], words_after.
symptom(itchy_throat_or_nose) --> words_before, ["itchy"], words_between, ["nose"], words_after.
symptom(postnasal_drip) --> words_before, ["postnasal"], words_between, ["drip"], words_after.
symptom(mild_fatigue) --> words_before, ["mild"], words_between, ["fatigue"], words_after.

% Depression
symptom(persistent_sadness) --> words_before, ["persistent"], words_between, ["sadness"], words_after.
symptom(loss_of_interest) --> words_before, ["loss"], words_between, ["of"], words_between, ["interest"], words_after.
symptom(appetite_changes) --> words_before, ["appetite"], words_between, ["changes"], words_after.
symptom(significant_weight_changes) --> words_before, ["significant"], words_between, ["weight"], words_between, ["changes"], words_after.
symptom(sleep_disturbances) --> words_before, ["sleep"], words_between, ["disturbances"], words_after.
symptom(fatigue_or_loss_of_energy) --> words_before, ["fatigue"], words_between, ["or"], words_between, ["loss"], words_between, ["of"], words_between, ["energy"], words_after.
symptom(difficulty_concentrating) --> words_before, ["difficulty"], words_between, ["concentrating"], words_after.
symptom(feelings_of_guilt) --> words_before, ["feelings"], words_between, ["of"], words_between, ["guilt"], words_after.
symptom(thoughts_of_death_or_suicide) --> words_before, ["thoughts"], words_between, ["of"], words_between, ["death"], words_between, ["or"], words_between, ["suicide"], words_after.

% GAD
symptom(excessive_worry) --> words_before, ["excessive"], words_between, ["worry"], words_after.
symptom(restlessness) --> words_before, ["restlessness"], words_after.
symptom(irritability) --> words_before, ["irritability"], words_after.
symptom(muscle_tension) --> words_before, ["muscle"], words_between, ["tension"], words_after.

% Alzheimer’s
symptom(memory_loss_short_term) --> words_before, ["memory"], words_between, ["loss"], words_after.
symptom(difficulty_finding_words) --> words_before, ["difficulty"], words_between, ["finding"], words_between, ["words"], words_after.
symptom(trouble_completing_familiar_tasks) --> words_before, ["trouble"], words_between, ["completing"], words_between, ["familiar"], words_between, ["tasks"], words_after.
symptom(confusion_time_place) --> words_before, ["confusion"], words_between, ["time"], words_between, ["place"], words_after.
symptom(poor_judgment) --> words_before, ["poor"], words_between, ["judgment"], words_after.
symptom(mood_personality_changes) --> words_before, ["mood"], words_between, ["personality"], words_between, ["changes"], words_after.
symptom(social_withdrawal) --> words_before, ["social"], words_between, ["withdrawal"], words_after.

% Migraine
symptom(throbbing_headache_one_sided) --> words_before, ["throbbing"], words_between, ["headache"], words_after.
symptom(sensitivity_to_light) --> words_before, ["sensitivity"], words_between, ["to"], words_between, ["light"], words_after.
symptom(sensitivity_to_sound) --> words_before, ["sensitivity"], words_between, ["to"], words_between, ["sound"], words_after.
symptom(nausea_vomiting) --> words_before, ["nausea"], words_between, ["vomiting"], words_after.
symptom(visual_disturbances_auras) --> words_before, ["visual"], words_between, ["disturbances"], words_after.
symptom(fatigue_difficulty_concentrating) --> words_before, ["fatigue"], words_between, ["difficulty"], words_between, ["concentrating"], words_after.
symptom(neck_stiffness) --> words_before, ["neck"], words_between, ["stiffness"], words_after.

% Pneumonia
symptom(persistent_cough_with_mucus) --> words_before, ["persistent"], words_between, ["cough"], words_between, ["with"], words_between, ["mucus"], words_after.
symptom(fever_sweating_chills) --> words_before, ["fever"], words_between, ["sweating"], words_between, ["chills"], words_after.
symptom(shortness_of_breath) --> words_before, ["shortness"], words_between, ["of"], words_between, ["breath"], words_after.
symptom(rapid_shallow_breathing) --> words_before, ["rapid"], words_between, ["shallow"], words_between, ["breathing"], words_after.
symptom(chest_pain_with_breathing) --> words_before, ["chest"], words_between, ["pain"], words_between, ["with"], words_between, ["breathing"], words_after.
symptom(fatigue_weakness) --> words_before, ["fatigue"], words_between, ["weakness"], words_after.
symptom(loss_of_appetite) --> words_before, ["loss"], words_between, ["of"], words_between, ["appetite"], words_after.

% Gastroenteritis
symptom(nausea_vomiting) --> words_before, ["nausea"], words_between, ["vomiting"], words_after.
symptom(watery_diarrhea) --> words_before, ["watery"], words_between, ["diarrhea"], words_after.
symptom(abdominal_cramps_pain) --> words_before, ["abdominal"], words_between, ["cramps"], words_between, ["pain"], words_after.
symptom(headache_body_aches) --> words_before, ["headache"], words_between, ["body"], words_between, ["aches"], words_after.
symptom(dehydration_symptoms) --> words_before, ["dehydration"], words_between, ["symptoms"], words_after.

% Tuberculosis
symptom(persistent_cough_3_weeks) --> words_before, ["persistent"], words_between, ["cough"], words_between, ["3"], words_between, ["weeks"], words_after.
symptom(coughing_up_blood) --> words_before, ["coughing"], words_between, ["up"], words_between, ["blood"], words_after.
symptom(night_sweats) --> words_before, ["night"], words_between, ["sweats"], words_after.
symptom(fever_chills) --> words_before, ["fever"], words_between, ["chills"], words_after.
symptom(unintentional_weight_loss) --> words_before, ["unintentional"], words_between, ["weight"], words_between, ["loss"], words_after.
symptom(chest_pain_discomfort) --> words_before, ["chest"], words_between, ["pain"], words_between, ["discomfort"], words_after.

% COPD
symptom(chronic_productive_cough) --> words_before, ["chronic"], words_between, ["productive"], words_between, ["cough"], words_after.
symptom(shortness_of_breath_exertion) --> words_before, ["shortness"], words_between, ["of"], words_between, ["breath"], words_between, ["exertion"], words_after.
symptom(wheezing_noisy_breathing) --> words_before, ["wheezing"], words_between, ["noisy"], words_between, ["breathing"], words_after.
symptom(frequent_respiratory_infections) --> words_before, ["frequent"], words_between, ["respiratory"], words_between, ["infections"], words_after.
symptom(fatigue_reduced_exercise_tolerance) --> words_before, ["fatigue"], words_between, ["reduced"], words_between, ["exercise"], words_between, ["tolerance"], words_after.

% Rheumatoid Arthritis
symptom(joint_pain_swelling_symmetrical) --> words_before, ["joint"], words_between, ["pain"], words_between, ["swelling"], words_after.
symptom(morning_stiffness_30mins) --> words_before, ["morning"], words_between, ["stiffness"], words_after.
symptom(fatigue_fever_malaise) --> words_before, ["fatigue"], words_between, ["fever"], words_between, ["malaise"], words_after.
symptom(reduced_range_of_motion) --> words_before, ["reduced"], words_between, ["range"], words_between, ["of"], words_between, ["motion"], words_after.
symptom(rheumatoid_nodules) --> words_before, ["rheumatoid"], words_between, ["nodules"], words_after.
symptom(joint_deformities_long_term) --> words_before, ["joint"], words_between, ["deformities"], words_after.

% Osteoarthritis
symptom(joint_pain_with_activity) --> words_before, ["joint"], words_between, ["pain"], words_between, ["with"], words_between, ["activity"], words_after.
symptom(stiffness_less_30mins) --> words_before, ["stiffness"], words_between, ["less"], words_between, ["30mins"], words_after.
symptom(reduced_flexibility) --> words_before, ["reduced"], words_between, ["flexibility"], words_after.
symptom(bone_spurs) --> words_before, ["bone"], words_between, ["spurs"], words_after.
symptom(mild_joint_swelling) --> words_before, ["mild"], words_between, ["joint"], words_between, ["swelling"], words_after.
symptom(crepitus_joints) --> words_before, ["crepitus"], words_between, ["joints"], words_after.

% Hypothyroidism
symptom(fatigue_sluggishness) --> words_before, ["fatigue"], words_between, ["sluggishness"], words_after.
symptom(weight_gain) --> words_before, ["weight"], words_between, ["gain"], words_after.
symptom(cold_intolerance) --> words_before, ["cold"], words_between, ["intolerance"], words_after.
symptom(dry_skin_brittle_hair) --> words_before, ["dry"], words_between, ["skin"], words_between, ["brittle"], words_between, ["hair"], words_after.
symptom(constipation) --> words_before, ["constipation"], words_after.
symptom(muscle_weakness_aches) --> words_before, ["muscle"], words_between, ["weakness"], words_between, ["aches"], words_after.
symptom(depression_low_mood) --> words_before, ["depression"], words_between, ["low"], words_between, ["mood"], words_after.
symptom(slow_heart_rate) --> words_before, ["slow"], words_between, ["heart"], words_between, ["rate"], words_after.

% Infectious Mononucleosis (Mono)
symptom(extreme_fatigue) --> words_before, ["extreme"], words_between, ["fatigue"], words_after.
symptom(swollen_lymph_glands) --> words_before, ["swollen"], words_between, ["lymph"], words_between, ["glands"], words_after.
symptom(swollen_tonsils) --> words_before, ["swollen"], words_between, ["tonsils"], words_after.
symptom(rash) --> words_before, ["rash"], words_after.
symptom(muscle_aches) --> words_before, ["muscle"], words_between, ["aches"], words_after.

% Chickenpox
symptom(itchy_blister_like_rash) --> words_before, ["itchy"], words_between, ["blister-like"], words_between, ["rash"], words_after.
symptom(fatigue_malaise) --> words_before, ["fatigue"], words_between, ["malaise"], words_after.
symptom(rash_starts_trunk_spreads) --> words_before, ["rash"], words_between, ["starts"], words_between, ["trunk"], words_between, ["spreads"], words_after.

% Meningitis
symptom(severe_headache) --> words_before, ["severe"], words_between, ["headache"], words_after.
symptom(stiff_neck) --> words_before, ["stiff"], words_between, ["neck"], words_after.
symptom(nausea_vomiting) --> words_before, ["nausea"], words_between, ["vomiting"], words_after.
symptom(sensitivity_to_light) --> words_before, ["sensitivity"], words_between, ["to"], words_between, ["light"], words_after.
symptom(confusion_concentration_issues) --> words_before, ["confusion"], words_between, ["concentration"], words_between, ["issues"], words_after.
symptom(drowsiness_difficulty_waking) --> words_before, ["drowsiness"], words_between, ["difficulty"], words_between, ["waking"], words_after.
symptom(seizures_coma) --> words_before, ["seizures"], words_between, ["coma"], words_after.

% Allow unrelated words to appear before, between, or after symptoms
words_before --> [].
words_before --> [_], words_before.

words_between --> [].
words_between --> [_], words_between.
words_between --> [], [].

words_after --> [].
words_after --> [_], words_after.