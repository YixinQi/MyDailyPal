//
//  TipsViewController.swift
//  MyDailyPal
//
//  Created by mingfei on 11/3/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Take your medicines as prescribed by the doctor, same time every day.",
                "Adherence is nothing but 'taking your medicines at the same time every day'.",
                "When you miss 1 dose, it is not just 1 dose that you missed. But you actually gave the virus 1 chance to multiply further.",
                "Never miss a dose of your HIV medication. Remember, by taking every dose every day you are as good as someone who does not have HIV.",
                "Suppressing your viral load means your viral load is not detectable. That also means you are as good as someone who does not have HIV in his blood. And it also means that you are not giving any chance for HIV related illnesses.",
                "100% Adherence means reducing the chance for treatment failure or developing any other HIV related illnesses.",
                "The HIV in your blood is always looking to multiply or find new ways to attack your immune system. Taking your medicines every day without fail will stop it from doing so.",
                "In HIV, treatment is prevention. By taking your medicines without fail you are suppressing the virus in your blood and prevent it from spreading.",
                "Suppress the Virus. Control the disease. Keep away any related illnesses. Stay healthy. Take your medicine every day at the same time.",
                "Studies have shown that Adherence rates > 95% result in minimum or no virologic failure.",
                "In clinical trials, patients who reported 100% adherence rates had significantly increased CD4 cell counts when compared to those with lesser adherence rates.",
                "Side effects should not stop you from taking your medicines. Beware of simple symptoms like headache, nausea (feeling sick), vomiting, loose motions, rashes, itching etc. Call your doctor immediately if you cannot manage.",
                "Request for the contact details of your doctor & health center during your visits. In case of a problem or a side effect, call immediately. Never miss a dose.",
                "Do not be stressed or depressed. Do not think you are HIV positive. Think you have suppressed your virus. Take your medicine every day at the same time.",
                "Drink plenty of water. Water helps your medicines metabolize, keeps you well hydrated and reduces the undesirable effects. But do not miss a single dose.",
                "Majority of side effects due to HIV medications are gastrointestinal. Have plenty of seasonal fruits, nuts, leaves and foods that are easily digestible to reduce these effects.",
                "Every medicine you take every day prolongs life from illnesses. Do not miss your dose.",
                "Several studies have demonstrated that adherence to HIV medications is second only to CD4 cell counts in accurately predicting progression to AIDS and death.",
                "Nonadherence is usually associated with increased rate of hospitalization and longer hospital stays.",
                "Sleep early. Wake up early. Maintain a healthy life style. Fight the virus by strengthening your immune system.",
                "Check your weight regularly. Keeping fit & healthy is also a way to fight HIV.",
                "Pay attention to your diet. Be aware of what you are eating. A balanced diet can help you to stay healthy longer. Do not forget to take your medicine every day.",
                "Failure to take your HIV medications every day contributes significantly to drug resistance, which may mean faster progression to AIDS or higher cost or running out of options.",
                "If you missed a day’s dose and remembered it next day, do not take double the dose. The body cannot metabolize beyond its capacity and may lead to undesirable effects.",
                "Before starting the treatment, discuss your medical history thoroughly. Note down all your problems & medications you are taking and any allergies you have – and tell him in detail.",
                "Avoid alcohol while on HIV therapy. Alcohol will not increase your viral load or decrease your CD4 cell count. But it can damage the liver which is already under stress metabolizing all the HIV medicines you take.",
                "Smoking will affect your lungs, heart, predisposes to cancer and makes your disease progression faster putting you at a greater risk of clinical failure.",
                "In a Danish study, a person with HIV lost 5 years due to the disease. A person who is a smoker but no HIV lost 4 years of his life due to smoking. But a smoker with HIV lost a total of 12 years of his life.",
                "Eating Ginger, dry Ginger, Ginger ale or tea will help you in preventing or reducing nausea & vomiting, due to HIV medications.",
                "Do not take long, hot showers or baths or use skin products with alcohol so that you can avoid rashes or skin reactions which are a common side effect to HIV medications.",
                "Protein builds muscles and organs, wards off the weakness and strengthens the immune system. Have more of fruits, vegetables, fish, nuts & low-fat dairy products.",
                "Drink plenty of water. Extra water helps in, transporting nutrients, flushing out medicines, reducing the side effects and keeps away dehydration.",
                "Adherence to ART has been shown to be the main determinant of measuring the outcomes in HIV, including HIV RNA level, CD4 lymphocyte count and genotypic resistance.",
                "In the Mannheimer study (2005), participants who reported 100% ART adherence achieved significantly higher QOL scores at 12 months of follow-up when compared to those with poorer ART adherence, and QOL improved with ART treatment and ART adherence.",
                "Factors associated with low adherence to HIV medicines include - Psychological factors, such as drug abuse, alcohol addiction and mental health problems like depression."]
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as! TIpsTableViewCell
        cell.tipLabel.text = list[indexPath.row]
        cell.roundImg.layer.cornerRadius = cell.roundImg.frame.size.width/2
        cell.roundImg.clipsToBounds = true
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "TipDetail") as! TipDetailViewController
        DetailVC.getText = list[indexPath.row] as! String
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
