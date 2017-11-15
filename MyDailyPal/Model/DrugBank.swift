//
//  DrugBank.swift
//  MyDailyPal
//
//  Created by ROD Shangari on 11/2/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import Foundation

class DrugBank {
    var drugList = [[String]]()
    
    init() {
       //Drug 1
        let drug1 = ["Lamivudine/ Nevirapine/ Zidovudine 150/200/300mg Tablets.",
                     "Dose in Adults/ Adolescents & Children > 25kg: 1 Tablet Twice daily (not indicated for children weighing less than 25 kg).",
                     "Food Restrictions: With or without food.",
                     "Common Side effects: fatigue, headache, nausea, vomiting, stomach pain, diarrhoea, fever, rash (red, raised or itchy), increase in certain liver enzymes, joint pain, muscle pain & other muscle disorders, dizziness, cough, nasal symptoms, tiredness, difficulty sleeping, hair loss, anemia, neutropenia.",
                     "Uncommon Side effects: Flatulence, breathlessness, general aches and pains and decrease of platelets, patchy colour changes inside the mouth, nail and skin colour changes etc.",
                     "WARNING/ PRECAUTION: Anemia or History of liver disease.",
                     "Drug Interactions: AVOID – Rifampicin, St. John’s wort, stavudine, emtricitabine, efavirenz, several protease inhibitors, ribavirin, antifungals, probenecid. ; Use with caution – Oral contraceptives, Antifungals, rifabutin, clarithromycin, anti-malarials, anti-convulsants, warfarin, doxorubicin.",
                     "Pregnancy Category: C (Safety in human pregnancy has not been determined; animal studies either are positive for fetal risk or have not been conducted, and the drug should not be used unless the potential benefit outweighs the potential risk to the fetus)."]
       //Drug 2
        let drug2 = ["Tenofovir/ Lamivudine/ Efavirenz 300/300/600mg Tablets.",
                     "Dose in Adults/ Adolescents: 1 Tablet Once daily (not for use by children under 12 years of age or weighing less than 40 kg).",
                     "Food Restrictions: On empty stomach (1 hour before or 2 hours after a meal)",
                     "Common Side effects: Dizziness, diarrhoea, feeling sick (nausea), vomiting, Skin rash , Changes in fat metabolism (increased lipid levels in the blood), Stomach pain, flatulence,  Cough, nasal symptoms - Headache - Abnormal dreams, difficulties sleeping, sleepiness, anxiety, depression, disturbance in attention, Hair loss, Itching, Feeling weak, fever, Pain in muscles and joints, Disturbed liver function (elevation of liver enzymes in blood).",
                     "Uncommon Side effects: Anaemia, low white blood cell count, low platelet count, angry behaviour, mood being affected, abnormal thoughts, nervousness, euphoric mood, mania, seizures, giddiness, lightheadedness (vertigo), Blurred vision",
                     "WARNING/ PRECAUTION: History of Kidney or Liver disease, Lactic acidosis, Pregnancy.",
                     "Drug Interactions: AVOID -  Adefovir, Emtricitabine; Use with caution – other antivirals (including HIV), methadone, buprenorphine, statins, antifungals, anticonvulsants, antimalarials, Tuberculosis drugs, antibiotics, calcium channel blockers, immunosuppressants, midazolam, triazolam or warfarin.",
                     "Pregnancy Category: B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."]
       //Drug 1
        let drug3 = ["Tenofovir/ Emtricitabine/ Efavirenz 300/200/600mg Tablets.",
                     "Dose in Adults/ Adolescents: 1 Tablet Once daily (not for use by children under 12 years of age or weighing less than 40 kg).",
                     "Food Restrictions: On empty stomach (1 hour before or 2 hours after a meal).",
                     "Common Side effects: Dizziness, headache, diarrhoea, feeling sick (nausea), vomiting,  rashes, feeling weak, changes in skin colour including darkening of the skin, pain, stomach pain, difficulty sleeping, abnormal dreams, feeling worried or depressed - problems with digestion, loss of appetite - tiredness - itching - disturbances of coordination and balance, allergic reactions.",
                     "Uncommon Side effects: Angry behaviour, suicidal thoughts, strange thoughts, paranoia, unable to think clearly, mood being affected, hallucinations, suicide attempts, personality change - forgetfulness, confusion, seizures, incoherent speech, tremor, blurred vision,  vertigo, whistling, ringing or other persistent noise in the ears, dry mouth.",
                     "WARNING/ PRECAUTION: Kidney disease, Mental illness, Substance or Alcohol abuse.",
                     "Drug Interactions: AVOID – Adefovir, lamivudine, Voriconazole, St.John’s wort, astemizole, terfenadine, bepridil, cisapride, ergot alkaloids, pimozide; Use with caution – Aminoglycosides, Vancomycin, Antifungals, Foscarnet, Ganciclovir, Cidofovir, Tacrolimus, Interleukin-2,.",
                     "Pregnancy Category: B (Animal reproduction studies fail to demonstrate a risk to the fetus, and adequate, but well-controlled, studies of pregnant women have not been conducted). Inform doctor immediately if you are pregnant."]
        drugList.append(drug1)
        drugList.append(drug2)
        drugList.append(drug3)
    }
}
