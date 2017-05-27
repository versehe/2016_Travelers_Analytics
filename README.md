# 2016_Travelers_UCONN_vs_UMASS_Analytics_Case_Competition

The 2016 Travelers Analytics Case Competition is a modeling competition between UCONN and UMASS. The students were presented with real auto insurance data and have to provide a method for predicting the claim cost for each policy.

Dataset:
You work for Kangaroo Auto Insurance Company, an Australian company. The Kangaroo data set is based on one-year vehicle insurance policies from 2004 to 2005. There are 67856 policies, of which 4624 (6.8%) had at least one claim. The data will be split to three parts, training data, validation data and hold out data. In hold out data, claimcst0, clm and numclaims will be set to NA. You can build your model on training data and test the model on validation data. In the end, you can use your best model to score the hold out data. Your model is evaluated based on your hold out data prediction. There will be two rounds of submission. The higher one will be your final score. For your information, the score will be evaluated by gini index. Only top teams will be chosen to the final presentation. The winning students were invited to a job-shadowing day at Travelers in January.

Data Dictionary:
ID: policy identity
Veh_value: market value of the vehicle
Exposure: The basic unit underlying an insurance premium
Clm: Occurrence of claim (0=no, 1=yes)
Numclaims: The number of claims
Claimcst0:  Claim amount (our response variable)
Veh_body: Type of vehicles
Veh_age: Age of vehicles (1=youngest, 4=oldest)
Gender: Gender of driver
Area: Driving area of residence
Agecat: Driver’s age category from young (1) to old (6)

**Required (caret, statmod and cplm) **

Our final submission scored 0.2458354, highest among all fifty teams. Top three teams were invited to job-shadowing day event and presented to the professionals in Travelers.  As my teammate Xin Ni said, “Without a doubt I was very excited the moment when Patrick Buckley, the manager of the Advanced Analytics Leadership Development Program at Travelers, announced our team was the champion. I could not stop smiling after that moment. I also took a lot of pictures with the trophy. This championship is a milestone of my analytics study and future work. It gives me the confidence to go deep in this field.”  

Running:
Travelers_Case_Competition_Code_Hartford.R

