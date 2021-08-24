# [Voice Up | Hacktable 2021](https://devpost.com/software/voice-up) <img src="https://user-images.githubusercontent.com/37346450/126910854-c1392f33-be05-464b-8d64-5afb3428c5cc.png" align="right" height="50" />


## Inspiration
Coming from a developing country, the daunting numbers of unreported assaults and sexual abuse strikes fear in the general public, often leading them to fall victim to patterns of such incidents. A reliable and trust-worthy tool that complements the law enforcement is of utmost need these days. Voice up aims to offer just that.

## What it does
Voice Up gives users a simple and reliable SOS app that lets them trigger a **2-tier distress signal** when facing an untoward situation. Users can also report such incidents at a later point of time anonymously or otherwise, with the convenience of voice-enabled input. The data collected from these features are made available to the local police/authorities and _symbl.ai_ powerful APIs help us deliver tailored data analysis to them. 

## Key Features 
- SOS calls: two-tiers, Yellow Alert for "I feel like something bad might happen", Red Alert for "Something bad is happening and I need help now!"
-  **Yellow alert** sends a message with live location to contacts you've listed as yellow
-  **Red alert** sends the same, but to contacts under red _and_ yellow, as well as the police
-  Speak about past experiences as well, and our app will extract key data such as tags (topics) and incident severity (sentiment analysis) using Symbl's speech-to-text and analytics APIs
- **In-app map feature** for general public to view incident summary in areas around you, as well as enhanced, deeper insights for law enforcement authorities through a **dedicated web-based dashboard**! 

## Thoughtful Design
- **Bold**, _simple text for times of emergency_
- **Soothing, calm tones** _for overall app; bright standout colors for SOS triggers_
- **Audio is our primary input medium**- _because talking comes naturally to us as humans, and is known to have therapeutic effects_ 
-  **Sentiment analysis**  _for insights into incident severity_
- **Tags, date and location** _generated for deeper insights to be provided to police. This can help them plan **better daily patrols** for specific areas and times._   


## How we built it
After analysing our problem statement and hours of brainstorming, the team got to work by picking the _Flutter SDK for Mobile and Web_. This lets us have a unified code base for cross-platform existence. We followed the _BLoC_ code structure to ensure easier debugging and readable code. Tasks were taken up by all team members and integrated with the app as and when complete.

## Challenges we ran into
Specifically, 
- **Audio integration** and management of audio files locally
- **Live locations and SMS** was another interesting challenge 
But we were able to get past them!
It was a great learning experience for us as a team. It was quite a hustle trying to implement voice enabled ai sentience analysis. All in all it has been a great experience which was filled with both learning and very intriguing challenges.

## Accomplishments that we're proud of
We are proud of how the app has been considered a 2-tier distress signal when facing an untoward situation. We are proud of how the app takes a step in the direction of safety of people and reducing the crime rate. We aim on bringing comfort and a sense of security to the minds of people. We aspire to ensure that the world is aware of the crimes taking place and ensure that they take immediate precautions to avoid any such thing from happening to them in the future.

## What we learned
We gained immense knowledge during the brainstorming, research and development phases of the project. Not only did we learn how to develop a project using Flutter, Postman, _symbl.ai_, etc. but we also learned a lot about the heinous crimes occurring in our neighbourhoods. It was a challenge to come up with a technical solution to this problem and came with with 'Voice Up' which is our own way of dealing with this issue.

## What's next for Voice Up
**VoiceUp gets alerted to custom voice enabled SOS trigger words !** which works even in the background. More efficient implementation of Symbl's speech-to-text and sentient analysis. Having a record of the next 30sec of audio once the Red Alert is triggered . This is our step towards bringing the world a safer future.
