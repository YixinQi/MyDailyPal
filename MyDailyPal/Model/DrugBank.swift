//
//  DrugBank.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 11/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class DrugBank {
    var drugList = [Drug]()
    
    init() {
        //Drug 1 : LAMIVUDINE/ NEVIRAPINE/ ZIDOVUDINE 150/200/300
        drugList.append(Drug(
         name: "LAMIVUDINE/ NEVIRAPINE/ ZIDOVUDINE 150/200/300",
         dosageInformation: "1 Tablet Twice daily (not indicated for children weighing less than 25 kg/).",
         foodRestrictions:"With or without food.",
         commonSideEffects:"fatigue, headache, nausea, vomiting, stomach pain, diarrhoea, fever, rash (red, raised or itchy), increase in certain liver enzymes, joint pain, muscle pain & other muscle disorders, dizziness, cough, nasal symptoms, tiredness, difficulty sleeping, hair loss, anemia, neutropenia.",
         uncommonSideEffects :"Flatulence, breathlessness, general aches and pains and decrease of platelets, patchy colour changes inside the mouth, nail and skin colour changes etc.",
         precautions: "Anemia or History of liver disease.",
         drugInteractions: "AVOID – Rifampicin, St. John’s wort, stavudine, emtricitabine, efavirenz, several protease inhibitors, ribavirin, antifungals, probenecid. ; Use with caution – Oral contraceptives, Antifungals, rifabutin, clarithromycin, anti-malarials, anti-convulsants, warfarin, doxorubicin.",
         pregnancyCategory:"C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."))
        //Drug 2 : Tenofovir/ Lamivudine/ Efavirenz 300/300/600mg Tablets.
        drugList.append(Drug(
            name: "Tenofovir/ Lamivudine/ Efavirenz 300/300/600mg Tablets.",
            dosageInformation: "1 Tablet Once daily (not for use by children under 12 years of age or weighing less than 40 kg).",
            foodRestrictions:"On empty stomach (1 hour before or 2 hours after a meal)",
            commonSideEffects:"Dizziness, diarrhoea, feeling sick (nausea), vomiting, Skin rash , Changes in fat metabolism (increased lipid levels in the blood), Stomach pain, flatulence,  Cough, nasal symptoms - Headache - Abnormal dreams, difficulties sleeping, sleepiness, anxiety, depression, disturbance in attention, Hair loss, Itching, Feeling weak, fever, Pain in muscles and joints, Disturbed liver function (elevation of liver enzymes in blood).",
            uncommonSideEffects :"Anaemia, low white blood cell count, low platelet count, angry behaviour, mood being affected, abnormal thoughts, nervousness, euphoric mood, mania, seizures, giddiness, lightheadedness (vertigo), Blurred vision",
            precautions: "History of Kidney or Liver disease, Lactic acidosis, Pregnancy.",
            drugInteractions: "AVOID -  Adefovir, Emtricitabine; Use with caution – other antivirals (including HIV), methadone, buprenorphine, statins, antifungals, anticonvulsants, antimalarials, Tuberculosis drugs, antibiotics, calcium channel blockers, immunosuppressants, midazolam, triazolam or warfarin.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 3 : TENOFOVIR/ EMTRICITABINE/ EFAVIRENZ 300/200/600
        drugList.append(Drug(
            name: "Tenofovir/ Lamivudine/ Efavirenz 300/300/600mg Tablets.",
            dosageInformation: "1 Tablet Once daily (not for use by children under 12 years of age or weighing less than 40 kg).",
            foodRestrictions:"On empty stomach (1 hour before or 2 hours after a meal).",
            commonSideEffects:"Dizziness, headache, diarrhoea, feeling sick (nausea), vomiting,  rashes, feeling weak, changes in skin colour including darkening of the skin, pain, stomach pain, difficulty sleeping, abnormal dreams, feeling worried or depressed - problems with digestion, loss of appetite - tiredness - itching - disturbances of coordination and balance, allergic reactions.",
            uncommonSideEffects :"Angry behaviour, suicidal thoughts, strange thoughts, paranoia, unable to think clearly, mood being affected, hallucinations, suicide attempts, personality change - forgetfulness, confusion, seizures, incoherent speech, tremor, blurred vision,  vertigo, whistling, ringing or other persistent noise in the ears, dry mouth.",
            precautions: "Kidney disease, Mental illness, Substance or Alcohol abuse.",
            drugInteractions: "AVOID – Adefovir, lamivudine, Voriconazole, St.John’s wort, astemizole, terfenadine, bepridil, cisapride, ergot alkaloids, pimozide; Use with caution – Aminoglycosides, Vancomycin, Antifungals, Foscarnet, Ganciclovir, Cidofovir, Tacrolimus, Interleukin-2.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 4 : Abacavir/Lamivudine/Zidovudine 300/150/300mg Tablets
        drugList.append(Drug(
            name: "Abacavir/Lamivudine/Zidovudine 300/150/300mg Tablets",
            dosageInformation: "1 Tablet Once daily (not for use by children under 12 years of age or weighing less than 40 kg).",
            foodRestrictions:"On empty stomach (1 hour before or 2 hours after a meal).",
            commonSideEffects:"Dizziness, headache, diarrhoea, feeling sick (nausea), vomiting,  rashes, feeling weak, changes in skin colour including darkening of the skin, pain, stomach pain, difficulty sleeping, abnormal dreams, feeling worried or depressed - problems with digestion, loss of appetite - tiredness - itching - disturbances of coordination and balance, allergic reactions.",
            uncommonSideEffects :"Angry behaviour, suicidal thoughts, strange thoughts, paranoia, unable to think clearly, mood being affected, hallucinations, suicide attempts, personality change - forgetfulness, confusion, seizures, incoherent speech, tremor, blurred vision,  vertigo, whistling, ringing or other persistent noise in the ears, dry mouth.",
            precautions: "Kidney disease, Mental illness, Substance or Alcohol abuse.",
            drugInteractions: "AVOID – Adefovir, lamivudine, Voriconazole, St.John’s wort, astemizole, terfenadine, bepridil, cisapride, ergot alkaloids, pimozide; Use with caution – Aminoglycosides, Vancomycin, Antifungals, Foscarnet, Ganciclovir, Cidofovir, Tacrolimus, Interleukin-2.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 5: Lamivudine/ Nevirapine/ Zidovudine 30/50/60mg Dispersible Tablets
        drugList.append(Drug(
            name: "Lamivudine/ Nevirapine/ Zidovudine 30/50/60mg Dispersible Tablets",
            dosageInformation: "3-6 Kg,1 M(morning) + 1 Evening (E); 6-10 Kg, 2M + 1E; 10-14 Kg, 2M + 2E; 14-20 Kg, 3M + 2E; 20-25 Kg, 3M + 3E.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"fatigue, headache, nausea, vomiting, stomach pain, diarrhoea, fever, rash (red, raised or itchy), increase in certain liver enzymes, joint pain, muscle pain & other muscle disorders, dizziness, cough, nasal symptoms, tiredness, difficulty sleeping, hair loss, anemia, neutropenia.",
            uncommonSideEffects :"Flatulence, breathlessness, general aches and pains and decrease of platelets, patchy colour changes inside the mouth, nail and skin colour changes etc.",
            precautions: "Anemia, neutropenia or History of liver disease.",
            drugInteractions: "AVOID – Rifampicin, St. John’s wort, stavudine, emtricitabine, efavirenz, several protease inhibitors, ribavirin, antifungals, probenecid. ; Use with caution – Oral contraceptives, Antifungals, rifabutin, clarithromycin, anti-malarials, anti-convulsants, warfarin, doxorubicin.",
            pregnancyCategory:" "))
        //Drug 6: Abacavir/Lamivudine/Zidovudine 60/30/60mg Tablets
        drugList.append(Drug(
            name: "Abacavir/Lamivudine/Zidovudine 60/30/60mg Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"Skin rash (without any other illness), anaemia, leucopenia, nausea, vomiting, abdominal pain, diarrhea, fever, lethargy, fatigue, loss of appetite, muscle pain, raised liver enzymes.",
            uncommonSideEffects :"Low platelet count, difficulties breathing, itching, aplastic anaemia (low cell levels in the bone marrow).",
            precautions: "History of Liver disease, Kidney disease, Anaemia or Neutropenia. Contact your doctor immediately if – You get a skin rash or one or more of – fever; shortness of breath, sore throat or cough; nausea, vomiting, diarrhoea, abdominal pain; severe tiredness, aching, feeling ill.",
            drugInteractions: "AVOID – Stavudine, emtricitabine, ribavirin; Use with caution – oral vitamin A related medicines, rifampicin, co-trimoxazole, anti-convulsants, ganciclovir, interferons, lopinavir/r, tipranavir/r, i.v. pentamidine, i.v.dapsone, antifungals, probenecid, methadone, vincristine, vinblastine, doxorubicin, alcohol.",
            pregnancyCategory:" "))
        //Drug 7: Lamivudine 150mg/ Zidovudine 300mg – Single tablet
        drugList.append(Drug(
            name: "Lamivudine 150mg/ Zidovudine 300mg – Single tablet",
            dosageInformation: "1 Tablet Twice daily.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"fatigue, headache, nausea, vomiting, stomach pain, diarrhoea, fever, rash (red, raised or itchy), increase in certain liver enzymes, joint pain, muscle pain and other muscle disorders, dizziness, cough, nasal symptoms, tiredness, difficulty sleeping, hair loss, anaemia (low red blood cell count) and neutropenia (low white blood cell count).",
            uncommonSideEffects :"flatulence, breathlessness, general aches and pains and decrease of platelets",
            precautions: "Severe anemia, Neutropenia. Inform the doctor if you have – A history of Liver disease.",
            drugInteractions: "Avoid – Stavudine, Emtricitabine or Ribavirin. Use with Caution – Phenytoin, Valproic acid, Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:"C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."))
        //Drug 8: Lopinavir/ritonavir 200/50mg Tablets
        drugList.append(Drug(
            name: "Lopinavir/ritonavir 200/50mg Tablets",
            dosageInformation: "1 Tablet Twice daily.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"Changes in fat distribution (loss of fat from legs, increased fat in belly, breasts, neck), Headache, Difficulty in sleeping; Lack of strength and energy; Nausea, vomiting, abdominal pain (possible pancreatitis); Abnormal stools, upset stomach, flatulence,Taste perversion,Pain, Fever, Rash, acne, Tingling, prickling or numbness of the skin;  increased glucose or amylase in blood or abnormal liver function tests.",
            uncommonSideEffects :"Decrease in red blood cells & white blood cells, enlargement of the lymph nodes; buzzing, ringing or whistling in one or both ears; Abnormal vision; racing of heart, skipping a beat’ or pounding, heart attack, lung oedema, Enlarged abdomen, constipation, dry mouth, difficulty swallowing etc.",
            precautions: "History of Liver disease, Hemophilia, High cholesterol",
            drugInteractions: "Use with caution/ Better to Avoid – Antiarrhythmic drugs, Antiallergics, Pimozide, Sedatives, Anxiolytics, Ergot alkaloids, Statins, Opiate analgesics, Anti malarial & Tuberculosis drugs.",
            pregnancyCategory:"C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."))
        //Drug 9: Lopinavir/ritonavir 100/25mg Tablets
        drugList.append(Drug(
            name: "Lopinavir/ritonavir 100/25mg Tablets",
            dosageInformation: "10-14kg – 2 Tablets Morning(M)+1 Tablet (Evening); 14-20kg 2M+2E; 20-25kg 3M+2E; 25-35kg 3M+3E",
            foodRestrictions:"With or without food.",
            commonSideEffects:"Changes in fat distribution (loss of fat from legs, increased fat in belly, breasts, neck), Headache, Difficulty in sleeping; Lack of strength and energy; Nausea, vomiting, abdominal pain (possible pancreatitis); Abnormal stools, upset stomach, flatulence,Taste perversion,Pain, Fever, Rash, acne, Tingling, prickling or numbness of the skin;  increased glucose or amylase in blood or abnormal liver function tests.",
            uncommonSideEffects :"Decrease in red blood cells & white blood cells, enlargement of the lymph nodes; buzzing, ringing or whistling in one or both ears; Abnormal vision; racing of heart, skipping a beat’ or pounding, heart attack, lung oedema, Enlarged abdomen, constipation, dry mouth, difficulty swallowing etc.",
            precautions: "History of Liver disease, Hemophilia, High cholesterol",
            drugInteractions: "Use with caution/ Better to Avoid – Antiarrhythmic drugs, Antiallergics, Pimozide, Sedatives, Anxiolytics, Ergot alkaloids, Statins, Opiate analgesics, Anti malarial & Tuberculosis drugs.",
            pregnancyCategory:"C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."))
        //Drug 10: Tenofovir/ Lamivudine 300/300mg Tablets
        drugList.append(Drug(
            name: "Tenofovir/ Lamivudine 300/300mg Tablets",
            dosageInformation: "1 Tablet Once daily (not for use by children under 10 years of age or adolescents weighing less than 30 kg)",
            foodRestrictions:"With a meal.",
            commonSideEffects:"dizziness, diarrhoea, feeling sick (nausea), vomiting, stomach pain, flatulence, Headache, difficulties sleeping, rash, itching, changes in skin colour including darkening of the skin in patches, Hair loss, feeling weak, fever, Pain in muscles and joints, low phosphate in blood.",
            uncommonSideEffects :"Anemia, low white blood cell count, low platelet count, increased blood levels of liver function tests.",
            precautions: "History of Kidney or Liver disease, Lactic acidosis, Pregnancy. Inform your doctor if you have or develop – Bone or Joint related problems.",
            drugInteractions: "AVOID – Emtricitabine, Adefovir; Use with caution – aminoglycosides or vancomycin; amphotericin B or pentamidine; foscarnet, ganciclovir, or cidofovir; Tacrolimus.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 11: Tenofovir/ Emtricitabine 300/200mg tablets
        drugList.append(Drug(
            name: "Tenofovir/ Emtricitabine 300/200mg tablets",
            dosageInformation: "1 Tablet Once daily (not for use by children under 10 years of age or adolescents weighing less than 30 kg)",
            foodRestrictions:"With or without food.",
            commonSideEffects:"Dizziness, headache, diarrhoea, feeling sick (nausea), being sick (vomiting), abdominal pain, weakness, stomach pain, difficulty sleeping, abnormal dreams, • problems with digestion, flatulence, weight decrease, rashes, changes in skin color, other allergic reactions, such as wheezing, etc. Blood tests may show low phosphate levels, low WBC, increased triglycerides, bile or sugar in the blood.",
            uncommonSideEffects :"anaemia,  pain in the abdomen caused by inflammation of the pancreas, breakdown of muscle, muscle pain or weakness,  swelling of the face, lips, tongue or throat. Blood tests may show decreases in potassium, increased creatinine in blood.",
            precautions: "History of Kidney or Liver disease",
            drugInteractions: "AVOID – Tenofovir, Emtricitabine, Lamivudine combinations; Use with caution – Aminoglycosides, Vancomycin, Antifungals, Foscarnet, Ganciclovir, Cidofovir, Tacrolimus, Interleukin-2, NSAIDs & Didanosine.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 12: Atazanavir/ Ritonavir 300/100mg Tablets.
        drugList.append(Drug(
            name: "Atazanavir/ Ritonavir 300/100mg Tablets.",
            dosageInformation: "1 Capsule Once daily with 100mg ritonavir.",
            foodRestrictions:"With food",
            commonSideEffects:"Headache, sceral icterus, jaundice, nausea, vomiting, diarrhoea, an uncomfortable feeling in the stomach or belching after eating, abdominal pain, isolated elevated bilirubin levels in the blood, elevated liver enzymes in the blood, rash, weakness/fatigue.",
            uncommonSideEffects :"Decreased or abnormal skin sensation, fainting, loss of memory, dizziness, sleepiness, altered sense of taste, shortness of breath, gastritis, hepatitis, pancreatitis, loss of appetite, kidney stones, muscle wasting, malaise, weakness, allergic reactions.",
            precautions: "History of liver or kidney disease, allergies, high cholesterol, diabetes, or haemophilia.",
            drugInteractions: "AVOID – Rifampicin, halofantrine, quinidine, terfenadine, astemizole, cisapride, triazolam, oral midazolam, pimozide, bepridil, ergot derivatives, St. John's wort, statins, sildenafil; Use with caution – Antacids, proton pump inhibitors, anti-malarials, tuberculosis drugs, immunosuppressants, other HIV medicines, warfarin, calcium channel blockers, sedatives, hormonal contraceptives.",
            pregnancyCategory:"B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."))
        //Drug 13: Abacavir/ Lamivudine 600/300mg Tablets.
        drugList.append(Drug(
            name: "Abacavir/ Lamivudine 600/300mg Tablets.",
            dosageInformation: "1 Tablet Once daily (Not recommended in children <25 kg).",
            foodRestrictions:"With or without food.",
            commonSideEffects:"Hypersensitivity reaction, headache, vomiting, feeling sick (nausea),  diarrhea, stomach pains, loss of appetite, tiredness, lack of energy, fever, malaise, insomnia,  muscle pain and discomfort, joint pain, cough, irritated or runny nose, skin rash, hair loss.",
            uncommonSideEffects :"Anemia, neutropenia, an increase in the level of liver enzymes, thrombocytopenia.",
            precautions: "History of Liver or Kidney disease. Some patients taking Abacavir may develop a hypersensitivity reaction (serious allergic reaction) which can be life-threatening – STOP THE MEDICINE & CONTACT YOUR DOCTOR IMMEDIATELY IF – you get a skin rash and one or more symptoms of – fever; shortness of breath, sore throat or cough; nausea or vomiting or diarrhoea or abdominal pain; severe tiredness or achiness or generally feeling ill (in general, this type of life threatening rash is uncommon in African populations).",
            drugInteractions: "AVOID – Emtricitabine, cotrimoxazole, cladribine; Use with caution – Phenytoin, methadone, ribavirin.",
            pregnancyCategory:"C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."))
        //Drug 14: Lamivudine/ Zidovudine 30/60 mg Tablets
        drugList.append(Drug(
            name: "Lamivudine/ Zidovudine 30/60 mg Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"headache, nausea, skin rash, hair loss, anaemia, decreased white blood cell count., vomiting, abdominal pain, diarrhoea, dizziness, trouble sleeping, lethargy, fatigue, raised blood levels of liver enzymes, muscle pain",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Severe anemia, Neutropenia",
            drugInteractions: "AVOID – Emtricitabine, cotrimoxazole, cladribine; Use with caution – Phenytoin, methadone, ribavirin.",
            pregnancyCategory:" "))
        //Drug 15: Lamivudine/ Zidovudine 30/60 mg Dispersible Tablets
        drugList.append(Drug(
            name: "Lamivudine/ Zidovudine 30/60 mg Dispersible Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 15: Lamivudine/ Zidovudine 30/60 mg Dispersible Tablets
        drugList.append(Drug(
            name: "Lamivudine/ Zidovudine 30/60 mg Dispersible Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 16: Abacavir/ Lamivudine 60/30mg Tablets. -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Abacavir/ Lamivudine 60/30mg Tablets.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
            //Drug 17: Lamivudine 150mg tablet -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Lamivudine 150mg tablet",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
            //Drug 18: Lamivudine 300mg tablet -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Lamivudine 300mg tablet",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 19: Abacavir 300mg tablet -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Abacavir 300mg tablet.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 20: Abacavir 600mg tablet -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Abacavir 600mg tablet.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 21: Nevirapine 200mg Tablets -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Nevirapine 200mg Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 22: Efavirenz 600mg Tablets -- from here ** 2nd sprint
        drugList.append(Drug(
        name: "Efavirenz 600mg Tablets",
        dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
        foodRestrictions:"With or without food.",
        commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
        uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
        precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
        drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
        pregnancyCategory:" "))
            //Drug 23: Zidovudine 300mg Tablets -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Zidovudine 300mg Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 24: Tenofovir Disoproxil Fumarate 300mg Tablets -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Tenofovir Disoproxil Fumarate 300mg Tablets",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 25: Atazanavir 150mg Capsules -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Atazanavir 150mg Capsules",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 26: Atazanavir 300mg Capsules -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Atazanavir 300mg Capsules",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
            //Drug 27: Ritonavir 100mg Tablets. -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Ritonavir 100mg Tablets.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 28: Abacavir 60mg tablet. -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Abacavir 60mg tablet.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
        //Drug 29: Efavirenz 50mg/ 100mg/ 200mg  Capsules. -- from here ** 2nd sprint
        drugList.append(Drug(
            name: "Efavirenz 50mg/ 100mg/ 200mg  Capsules.",
            dosageInformation: "1 Tablet Twice daily. 3-6 Kg,1 Tablet b.d; 6-10 Kg, 1.5 tabs/day; 10-14 Kg, 2/ day; 14-20 Kg, 2.5/day  20-25 Kg, 3 tabs/day.",
            foodRestrictions:"With or without food.",
            commonSideEffects:"vomiting, diarrhea, stomach pains, loss of appetite, feeling dizzy,  tiredness, lack of energy, fever, malaise, insomnia, muscle pain and discomfort, joint pain, cough,  irritated or runny nose, skin rash, hair loss",
            uncommonSideEffects :"low platelet count, difficulties breathing, skin itching, muscle breakdown, bone breakdown.",
            precautions: "Anemia, neutropenia or leucopenia, an increase in liver enzymes, increased bilirubin. (Each tablet contains 18 mg aspartame, which may be a source of phenylalanine. May be harmful for people with phenylketonuria).",
            drugInteractions: "Avoid – Stavudine, emtricitabine, cladribine or ribavirin. Use with Caution – Anti-convulsants,  Ganciclovir, Interferons, Co-trimoxazole, i.v. pentamidine, dapsone, antifungals, anti-malarials, methadone anti-cancer medicines & probenecid (for gout).",
            pregnancyCategory:" "))
    }
}
