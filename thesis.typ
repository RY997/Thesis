#import "thesis_template.typ": *
#import "common/cover.typ": *
#import "common/titlepage.typ": *
#import "thesis_typ/disclaimer.typ": *
#import "thesis_typ/acknowledgement.typ": *
#import "thesis_typ/abstract_en.typ": *
#import "thesis_typ/abstract_de.typ": *
#import "common/metadata.typ": *


#cover(
  title: titleEnglish,
  degree: degree,
  program: program,
  author: author,
)

#titlepage(
  title: titleEnglish,
  titleGerman: titleGerman,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate
)

#disclaimer(
  title: titleEnglish,
  degree: degree,
  author: author,
  submissionDate: submissionDate
)

#acknowledgement()

#abstract_en()

#abstract_de()

#show: project.with(
  title: titleEnglish,
  titleGerman: titleGerman,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate
)

= Introduction
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Introduce the topic of your thesis, e.g. with a little historical overview.

  Extend
]

  In the digital age, the demand for computer scientists has seen a significant
rise, leading to a growing number of students opting for computer-related
majors in universities. The increasing number of students enlarges class
sizes, posing challenges to traditional teaching methods.

Artemis, an open source teaching platform, addresses this issue by introducing a new teaching philosophy known as interactive learning. This
approach is specifically designed to cater to larger courses, offering scalability and adaptability [Kru21]. In computer science education, computer
programming plays a crucial role [SSV20], and programming exercises are
a great way to give students hands-on experience to program in a practical
context [THH17].

Currently, programming exercises in Artemis are manually written by
instructors and will distributed to all students uniformly which means that
all students will get the same exercise.

== Problem
Considering the diverse range of students participating in programming exercises, it is important to acknowledge that they possess varying levels of
mastery in the relevant content and possess different programming experiences.

While instructors strive to balance exercise difficulty to accommodate
the majority of students, it is inevitable that certain exercises will still
pose challenges for some individuals. This can result in students becoming stuck at specific tasks, impeding their progress and necessitating the
need for assistance from teaching assistants or peers. Prolonged instances
of being stuck can lead to demotivation among students. As a result, students may likely learn very little and generally make teaching painful and
frustrating [FSGO20].

Conversely, some students may find the exercises too simple and feel that
they do not provide an opportunity for self-improvement. Consequently, such
students may perceive the exercises as mere energy-draining tasks, lacking
the ability to enhance their skills.

Therefore, it is evident that the existing platform does not yet proactively
adapt to the varying skill levels and individual learning needs of students.

== Motivation
Applying adaptive programming exercise generation holds great importance
for the field of programming education as it offers numerous benefits. By
providing adaptive programming exercises to students, instructors can effectively cater to the diverse skill levels and learning needs of their students.

One significant advantage of adaptive exercises is their ability to appropriately challenge advanced learners. These exercises can be tailored to push
the boundaries of their knowledge and skills, presenting them with complex
programming problems that stimulate critical thinking and creativity. By offering advanced learners exercises that align with their capabilities, adaptive
programming exercise generation promotes intellectual growth and fosters
a sense of achievement, encouraging them to continuously push themselves
further.

On the other hand, adaptive exercises also play a crucial role in adequately supporting beginners. Programming can be an intimidating subject
for novices, and overly complex exercises may overwhelm them, leading to
frustration and discouragement. However, adaptive exercises can adapt to
the learner’s current proficiency level, providing them with tasks that are
suitable for their understanding and skill set. This personalized approach
helps beginners build a strong foundation, gradually increasing the difficulty
as they progress, thereby boosting their confidence and motivation to learn.

Moreover, when students engage in programming exercises that challenge
them at an appropriate level, they are more likely to apply the knowledge
acquired from lectures and coursework effectively. As a result, their programming skills improve steadily, and they develop a deeper comprehension
of the subject matter.

Consequently, learners can experience a more captivating and effective
learning journey, fostering their skill development and facilitating continuous
growth [Abe22].

== Objectives
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Split to bullet points, more clear and general.
]

The rapid advancement of Artificial Intelligence (AI), especially Generative
Pre-trained Transformer (GPT) models, presents a unique opportunity to
enhance the domain of computer science education [KSK+23]. In this master
thesis, we will harness the power of Large Language Model (LLM) to generate
adaptive programming exercises. This approach allows us to create exercises
that are specifically tailored to the learning objectives and skill levels of
students.

To fulfill the objective of adaptive programming exercise generation, we
leverage the four key components of a programming exercise: the problem statement, template repository, solution repository, and test repository.
These components serve as the foundation for adjusting the difficulty level
of programming exercises.

When aiming to make programming exercises easier than the basic level,
we employ a strategy of breaking down the task into detailed steps and
providing comprehensive guidance. By offering explicit instructions and additional explanations, learners can better comprehend the problem at hand.

Conversely, to increase the difficulty level of programming exercises, we
adopt a different approach. We limit the task description, consolidate multiple tasks into a more complex problem, and provide a reduced amount
of pre-written code in the template. By reducing the amount of scaffolding and guidance, we encourage advanced learners to apply their knowledge
creatively.

To implement these methods, the problem statement part and the template repository part mainly need to be adjusted accordingly on the basis
of the basic exercises. To enable adaptive adjustment of the problem statement and template repository, we harness the power of prompt engineering
techniques in conjunction with a LLM. By utilizing the contextual inputs
provided by the four exercise components, the LLM can generate exercises
of varying difficulty levels. The model takes into account the existing context, and generates additional details and code hints accordingly for easier
version or limits guidance and template codes for harder version. This way,
instructors can effortlessly create exercises tailored to the specific needs and skill levels of their students.

Instructors will have access to a user-friendly interface that seamlessly
integrates the adaptive exercise generation process. Instructors can take
advantage of the ’Generate variants’ feature, showcased in Figure 1, to effortlessly create new adaptive exercises with varying difficulty levels. This
functionality allows them to build upon the foundation of a basic exercise
and generate variations to suit diverse needs. Moreover, instructors can utilize the “Adapt” feature on ’Edit in editor’ page, illustrated in Figure 2, to
customize existing exercises by providing their own unique prompts which
empowers them to tailor the exercises to better align with their teaching
objectives.

And to illustrate the workflow of this adaptive exercise generation process, Figure 3 showcases a visual representation of the iterative generation
of exercise components based on the available context. The model can iteratively refine the problem statement, adjusts the template repository, and
generates suitable code hints, resulting in exercises of varying difficulty levels.

== Outline
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Describe the outline of your thesis
]

= Background
In this chapter, we present the key concepts and technologies essential to this
thesis. As Iris is itself a sub-system of Artemis we will first have to go over the general structure of Artemis. Next, we discuss the CoFee framework; this
is the current method employed by Athena to generate feedback suggestions for
text exercises. This is followed by an overview of the ThemisML approach, the
proposed strategy for Athena to generate feedback suggestions for programming
exercises. Finally, we give an overview of the microservice architecture, which
Athena leverages to structure its components

== LLM
LLM is

== Artemis

Artemis is build using the Spring Boot framework and uses the MVC architecture to keep everything organized. The models are represented by the domain objects and database repositories. The views are the specific REST endpoints using Spring resources. The controllers are Spring services and implement the business logic.

Within Artemis a bunch of different sub-systems already exist. Most notably are the Hestia, Metis, Apollon, and Athena subsystems, but there are also less obvious one, like the programming exercise sub-system and the lecture sub-system. Each of them integrates with Artemis in a slightly different way, but they all follow the same Artemis guidelines.
We have added another subsystem called Iris to this, which provides LLM functionality to the other sub-systems. As part of our work it is already used by the programming-exercise and Hestia subsystems.

== Iris

Iris is

== Pyris

Pyris is

== Programming exercise in Artemis
Components, other roles, etc.

= Requirements Analysis
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This chapter follows the Requirements Analysis Document Template in @bruegge2004object. Important: Make sure that the whole chapter is independent of the chosen technology and development platform. The idea is that you illustrate concepts, taxonomies and relationships of the application domain independent of the solution domain! Cite @bruegge2004object several times in this chapter.

]


== Overview
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Provide a short overview about the purpose, scope, objectives and success criteria of the system that you like to develop.
]

In this section, we will define the formal requirements for the AI assistant integrated into the Code Editor. To provide context, we will begin by introducing the current system and our proposed system then explore a series of scenarios that illustrate the envisioned utilization of Iris within the Code Editor. Subsequently, we will delineate a comprehensive list of functional requirements and non-functional requirements. Finally, we will present our system model.

== Current System
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  current approach to adapt a programming exercise → manually

]  
  
  The entirety of the programming exercise demands manual adaptation either through the online Code Editor or within a local Integrated Development Environment (IDE). It is crucial to acknowledge that the feature set of the online code editor might not be as extensive as that of a local IDE. However, opting for a local IDE involves additional configuration efforts and the necessity to clone the repository for each exercise.

== Proposed System
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: If you leave out the section “Current system”, you can rename this section into “Requirements”.

  based on current Iris system
]
We propose Iris code editor system which is enhanced with generative AI capabilities. Through collaboration with an embedded ChatGPT-style chatbot, instructors can effortlessly articulate their vision for the exercise, witnessing the Code Editor automatically adapt to their specifications. This innovative approach empowers instructors with the flexibility to maintain full control over the exercise while allowing the AI to seamlessly introduce numerous additions or modifications. The generated content, shaped by the AI, can span the entirety of the exercise or be as concise as a single line of code. This streamlined and intuitive process not only accelerates exercise creation but also fosters a dynamic and collaborative environment between instructors and artificial intelligence, unlocking new possibilities for engaging and effective programming education. In the following,
we will describe the functional and non-functional requirements of Iris code editor system using
the Requirements Analysis Document Template in [BD09]

=== Functional Requirements
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: List and describe all functional requirements of your system. Also mention requirements that you were not able to realize. The short title should be in the form “verb objective”

  - FR1 Short Title: Short Description. 
  - FR2 Short Title: Short Description. 
  - FR3 Short Title: Short Description.
]
Functional requirements stand independent of implementation details, specifically focusing on describing the interactions between the system and its environment, as articulated in [BD09].

- FR1 Chat with Iris in Code Editor: The user can chat with Iris via a chat window in Code Editor.
- FR2 Iris suggests plan: In the event that the LLM decides it understands the user’s request, the LLM will additionally suggest a plan of action for adapting the exercise based on the user’s input, which will be displayed to the user in the chat window.
- FR3 Review exercise plan: The user should be able to review the plan of each component.
- FR4 Modify exercise plan: The user will be able to modify the generation plan.
- FR5 Execute exercise plan: The user will be able to execute the plan, which will trigger the LLM to perform the actions described in each component of the plan. The plan will be executed in the order in which the components appear in the plan.
- FR6 Pause and resume exercise plan: The user should be able to pause and resume the execution of the plan at any time, causing Iris to stop or resume at the next possible step.
- FR7 View plan execution error: If an error occurs while executing the plan, the user should be notified of the error and the plan will be paused.
- FR8 View changes in Code Editor: The user should be able to view applied changes in Code Editor.
- FR9 Clear chat history: The chat window will have a button that allows the user to clear the chat history.

=== Nonfunctional Requirements
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: List and describe all nonfunctional requirements of your system. Also mention requirements that you were not able to realize. Categorize them using the FURPS+ model described in @bruegge2004object without the category functionality that was already covered with the functional requirements.

  - NFR1 Category: Short Description. 
  - NFR2 Category: Short Description. 
  - NFR3 Category: Short Description.

]

- NFR1 Functionality: The changes made by the LLM to the exercise will be accurate and relevant to the user’s input and the context of the exercise.
- NFR2 Usability: The chat window will be minimizable and resizeable with a single click or drag respectively.
- NFR3 Usability: The chat window will be clearly labeled and identifiable as a chat window.
- NFR4 Supportability: The system will be LLM-agnostic, supporting any LLM that is capable of communicating with the system via the chat window.
- NFR5 Supportability: The system will be configurable, allowing the user to specify the LLM that the system will communicate with.
- NFR6 Reliability: The system will be able to handle any input from the user, including invalid input, without crashing.
- NFR7 Reliability: The system will be able to handle any response from the LLM, including invalid responses, without crashing.
- NFR8 Usability: The system will display accurate error messages to the user in the case of exceptional behavior, such as invalid input or invalid responses from the LLM.

== System Models
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This section includes important system models for the requirements analysis.
]
In this section of the requirements analysis, we delineate the system models for the project. We commence by elucidating the envisioned scenarios for the system. Subsequently, we present the use case model, analysis object model, dynamic model, and user interface of the system, accompanied by comprehensive diagrams and detailed descriptions.
=== Scenarios
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: If you do not distinguish between visionary and demo scenarios, you can remove the two subsubsections below and list all scenarios here.

  *Visionary Scenarios*

  Note: Describe 1-2 visionary scenario here, i.e. a scenario that would perfectly solve your problem, even if it might not be realizable. Use free text description.

  *Demo Scenarios*

  Note: Describe 1-2 demo scenario here, i.e. a scenario that you can implement and demonstrate until the end of your thesis. Use free text description.
]
As defined by [BD09], a scenario is described as 'a concrete, focused, informal description of a single feature of the system from the viewpoint of a single actor.' A visionary scenario represents an idealized solution to a problem, even if it may not be entirely achievable. In contrast, a demo scenario is one that is feasible, implementable, and can be demonstrated by the conclusion of this thesis. In this section, we will present both a visionary scenario and a demo scenario for our project.

We introduce the scenarios featuring Jane, an editor of a course in Artemis. Jane's objective is to adapt a sorting strategy programming exercise tailored to meet the diverse needs of students with varying levels of experience.
#rect(
  width: 100%,
  radius: 2%,
  stroke: 0.5pt,
  fill: gray,
)[
Visionary Scenario: Add a Creative Theme and Adjust the Exercise Accordingly

Jane engages in a thoughtful conversation with Iris, expressing a desire to infuse the sorting strategy exercise with a creative and meaningful animal theme so that it would be more accessible to beginners. Iris, demonstrating a keen understanding of the request, meticulously incorporates the animal theme into the problem statement. Further, Iris adeptly adapts the input data structure and tasks to align seamlessly with the chosen theme.

To ensure a harmonious and cohesive experience, Iris meticulously adjusts the code within the template repository, solution repository, and test repository. Each repository undergoes a transformation to mirror the newly introduced animal theme. Notably, the template repository is deliberately configured to encounter failures in all test cases, serving as a challenging starting point for participants. On the contrary, the solution repository is thoughtfully crafted to successfully navigate and pass all tests, providing a rewarding culmination to the adapted exercise. 
]
While this scenario presents an idealized representation of the functionality we aspire to achieve, it remains grounded in realism. However, it is crucial to acknowledge that realizing such an advanced level of functionality within the scope of this thesis may be ambitious. Through our exploration, we have identified challenges in relying solely on the LLM, particularly when Iris is granted significant discretionary space for exercise adaptation compared to scenarios with more specific restrictions. This has prompted the need for implementing a guardrail mechanism to ensure that changes made by the LLM align with user approval.

Recognizing the limitations and complexities involved, we set realistic expectations for the LLM's performance and its ability to incorporate continuous feedback. In light of these considerations, we shift our focus towards more achievable functionality and specific scenarios within the confines of this thesis. As an alternative, we propose a scenario that aligns with our practical goals and expectations, aiming to strike a balance between innovation and feasibility.

#rect(
  width: 100%,
  radius: 2%,
  stroke: 0.5pt,
  fill: gray,
)[
Demo Scenario: Assisted Change of Specific Exercise Tasks

Jane opens a sorting strategy exercise in the Code Editor page and initiates a conversation with Iris through the Iris chat window. Instead of altering the whole theme, Jane expresses his intent to replace the existing bubble sort algorithm with the insertion sort algorithm while preserving the technical objectives of the exercise for experienced students.

Engaging in a collaborative and creative conversation, Iris discusses the exercise requirements with Jane and suggests a step-by-step plan to seamlessly transition from bubble sort to insertion sort. Jane reviews the proposed plan and approves it, authorizing Iris to proceed with the modifications.

As Iris executes each step of the plan, Jane monitors the progress in the chat window. With every completed step, Jane inspects the corresponding changes in the exercise code. A few minutes into the process, Iris notifies Jane that the exercise is ready for review.

Upon examination, Jane observes that the exercise has undergone a significant transformation, aligning with the insertion sort request. However, he identifies lingering references to the old bubble sort algorithm that require replacement. 

To address these remaining modifications, Jane manually fine-tunes the exercise, replacing residual references to the previous tasks. Once satisfied with the exercise's adaptation to the insertion sort algorithm, Jane publishes the revised exercise for integration into his course.
]
The above scenario is more realistic than the previous one as it provides Iris with more specific instructions. These precise instructions enhance Iris's comprehension and organizational capabilities, providing a fixed endpoint and constraint. Furthermore, users have the capability to monitor the entire process. The execution of the corresponding plan only takes place after users approve Iris's proposed plan, enabling them to closely observe the execution process and subsequently review the changes implemented by Iris.
=== Use Case Model
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This subsection should contain a UML Use Case Diagram including roles and their use cases. You can use colors to indicate priorities. Think about splitting the diagram into multiple ones if you have more than 10 use cases. *Important:* Make sure to describe the most important use cases using the use case table template (./tex/use-case-table.tex). Also describe the rationale of the use case model, i.e. why you modeled it like you show it in the diagram.

]
According to Bruegge and Dutoit, use cases are described as 'a function provided by the system that yields a visible result for an actor' [BD09]. In the context of this discussion, the actors are represented by editors interacting with the system Iris.

The @use-case visually illustrates comprehensive use cases derived directly from the functional requirements outlined in Section 3.3.1. The interactive functionalities of the system empower users to seamlessly communicate with Iris through a dedicated chat window integrated into the Code Editor (FR1). This establishes a direct and intuitive channel for users to convey their requirements and receive assistance from Iris (FR2).

#figure(
  image("figures/use-case-diagram.svg", width: 80%),
  caption: [
    Use case diagram of Iris code editor feature
  ],
) <use-case>

Upon receiving a proposed exercise plan from Iris, users are empowered to take decisive actions. Specifically, they can review (FR3) and execute the plan (FR5), allowing for the systematic implementation of suggested modifications. The flexibility of the system further allows users to exercise control over the process by enabling them to pause and later resume the plan at their convenience (FR6). This responsiveness to user needs ensures a dynamic and user-centric experience.

Recognizing the iterative nature of exercise planning, users can actively engage with the system by modifying the steps of the proposed plan (FR4). This capability promotes a collaborative environment where users can tailor the plan to their specific requirements, fostering a sense of ownership over the adaptation process.

Following the execution of the plan, users can seamlessly verify the applied changes in the exercise (FR8) or check the error message (FR7) if the execution failed.

=== Analysis Object Model
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This subsection should contain a UML Class Diagram showing the most important objects, attributes, methods and relations of your application domain including taxonomies using specification inheritance (see @bruegge2004object). Do not insert objects, attributes or methods of the solution domain. *Important:* Make sure to describe the analysis object model thoroughly in the text so that readers are able to understand the diagram. Also write about the rationale how and why you modeled the concepts like this.

]
As described by Bruegge and Dutoit, we use the analysis model to prepare for
the architecture of the system [BD09]. The corresponding analysis object model is
shown in @analysis-object-model and includes the most important objects, attributes, methods
and relations of the application domain. 

#figure(
  image("figures/analysis-object-diagram.svg", width: 80%),
  caption: [
    Analysis object model of Iris code editor feature
  ],
) <analysis-object-model>

The IrisCodeEditorSession which is one of the subtypes of IrisSession, a key element determined by the programming exercise, encompasses lists of IrisMessage entities dedicated to storing user interactions with Iris within the Code Editor Session. Each IrisMessage can encapsulate lists of IrisMessageContent, a category now expanded to include multiple subtypes. Notably, IrisTextMessageContent represents a straightforward textual message, while IrisExercisePlan denotes a specialized type indicating an exercise plan proposed by Iris. The IrisExercisePlan class is further refined, comprising one to four IrisExercisePlanStep instances.

Within the IrisExercisePlanStep, a fundamental unit of the exercise plan, lies an IrisExerciseComponent, signifying either the problem statement or one of the three distinct code repositories. Accompanying this is a set of instructions detailing the required modifications for the associated component. Crucially, an ExecutionStage attribute categorizes each step's current status, indicating whether it is pending, actively being executed, has encountered an error, or has been successfully completed.

This modular and hierarchical structure within the IrisCodeEditorSession facilitates a granular representation of user interactions, allowing for the management and tracking of messages, content types, and exercise plans. The inclusion of subtypes in IrisMessageContent enhances the system's versatility, accommodating diverse forms of communication between users and Iris. The robust definition of IrisExercisePlan and its associated components ensures a comprehensive framework for proposing, executing, and monitoring exercise plans, thereby contributing to the overall effectiveness and adaptability of the Iris system.

=== Dynamic Model
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This subsection should contain dynamic UML diagrams. These can be a UML state diagrams, UML communication diagrams or UML activity diagrams.*Important:* Make sure to describe the diagram and its rationale in the text. *Do not use UML sequence diagrams.*
]
#figure(
  image("figures/activity (2).svg", width: 80%),
  caption: [
    Activity diagram of Iris code editor feature
  ],
)<activity-diagram>

The dynamic model describes the behavior of the system in terms of state changes
[BD09]. @activity-diagram shows the dynamic model for the Iris integration into the Code
Editor in the form of a UML activity diagram.


This model delineates the intricacies of adapting an exercise using Iris within the Code Editor. The user initiates the process by communicating with Iris through the chat window (FR1.1). Subsequently, Artemis engages Pyris to generate a response to the user's message, potentially yielding an exercise plan (FR1.2). The user is presented with the option to execute this plan or to continue interacting with Iris through text messages. Opting to execute the plan prompts Artemis to commence the sequential execution of plan steps.

For each step, Artemis sends a request to Pyris, facilitating the retrieval of exercise modifications, subsequently applying these changes to the exercise, and reloading the client (FR1.3). Users maintain control over the process by having the option to pause the plan (FR1.4) at any point. Subsequently, users can choose to either resume the plan (FR1.4) or resume communication with Iris through text messages.

Upon completing the exercise modifications, users have the flexibility to submit their changes and exit the Code Editor. This model encapsulates a dynamic and iterative workflow, allowing users to seamlessly transition between executing pre-defined plans and engaging in freeform interactions with Iris. The incorporation of these features ensures a responsive and user-centric experience within the Code Editor, facilitating the efficient adaptation of exercises to meet specific requirements.

=== User Interface
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Show mockups of the user interface of the software you develop and their connections / transitions. You can also create a storyboard. *Important:* Describe the mockups and their rationale in the text.
]

This section presents the user interface for the integration of Iris into the Code Editor.

To enhance accessibility, the Iris button is now prominently positioned in the top right corner of the Code Editor. By clicking this button, users can open the chat window located in the bottom right corner. Figures @editor-day and @editor-night illustrate the Iris button and open chat window in both light and dark themes of the Code Editor Page¹³. An introductory message has been thoughtfully incorporated into the chat window, serving as an invitation for users to initiate a conversation with Iris.
#figure(
  image("figures/code-editor-day.png", width: 80%),
  caption: [
    Iris UI in the code editor page (light theme)
  ],
) <editor-day>

#figure(
  image("figures/code-editor-night.png", width: 80%),
  caption: [
     Iris UI in the code editor page (dark theme)
  ],
) <editor-night>

Subsequently, we engaged Iris to replace the BubbleSort sorting algorithm in a sample exercise with the InsertionSort sorting algorithm. Iris, in turn, proposed a comprehensive plan, encompassing a summary presented in plain text and adaptation plans for four key components. Figures @chat and @exercise-plan showcase the initial appearance of the exercise plan in the chat window. Users can expand and review details for each component adaptation plan, as demonstrated in @exercise-plan.

@plan-execution captures the exercise plan in progress, while @plan-complete portrays the UI when the exercise plan is successfully completed. Completed component plans are highlighted in green, the currently executing plan is indicated in yellow, and pending plans retain their original color. The bottom button in the exercise plan message dynamically changes between “Execute,” “Pause,” “Resume,” and “Complete” based on the ongoing execution process.
#figure(
  image("figures/chat.png", width: 60%),
  caption: [
    Chat between user and Iris
  ],
) <chat>

#figure(
  image("figures/exercise-plan.png", width: 90%),
  caption: [
    Exercise plan proposed by Iris
  ],
) <exercise-plan>
In the event of an error during the execution of the fourth step, as depicted in @plan-error, the corresponding step is displayed in red, accompanied by an error message. The "Execute" button has been replaced with a "Retry" button, facilitating the re-attempt of plan execution from the beginning of the failed step. This iterative and visually intuitive interface enhances user engagement and provides clear feedback throughout the exercise adaptation process.


#grid(columns: 3)[
  #figure(
    image("figures/plan-execution.png"),
    caption: [
      Executing exercise plan
    ],
  ) <plan-execution>
][
  #figure(
    image("figures/plan-complete.png", width: 92%),
    caption: [
      Exercise plan execution completed
    ],
  ) <plan-complete>

][
  #figure(
    image("figures/plan-error.png", width: 93%),
    caption: [
      An error occured during the execution
    ],
  ) <plan-error>
]

@bubble depicts the original exercise, and upon the execution of the exercise plan, the resulting changes seamlessly integrate into the Code Editor, as illustrated in @insertion. The status indicator, highlighted in @insertion, appropriately displays "unsubmitted," serving as a clear indication of the newly implemented modifications suggested by Iris. Users can thoroughly review and verify these changes at their convenience, ensuring a transparent and user-friendly experience.
#figure(
  image("figures/bubble.png", width: 80%),
  caption: [
    The solution repository of exercise before adapting
  ],
) <bubble>

#figure(
  image("figures/insertion.png", width: 80%),
  caption: [
    The solution repository of exercise after adapting
  ],
) <insertion>

= System Design
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This chapter follows the System Design Document Template in @bruegge2004object. You describe in this chapter how you map the concepts of the application domain to the solution domain. Some sections are optional, if they do not apply to your problem. Cite @bruegge2004object several times in this chapter.
]
In this section, we will discuss design decisions made in the implementation of the Iris Code Editor project.

== Overview
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Provide a brief overview of the software architecture and references to other chapters (e.g. requirements analysis), references to existing systems, constraints impacting the software architecture..
]
Our exploration commences with a detailed examination of the decision-making process involved in choosing between two prototypes. This critical design phase sets the foundation for the subsequent stages of our system. We will delve into the factors, considerations, and methodologies that guide us through this pivotal step, ensuring the selection of a prototype that aligns seamlessly with our objectives.

Following this, our focus shifts to the intricate lower-level methods employed in the generation and application of changes by the Language Model Manager (LLM) to the exercise. This phase is integral to the dynamic adaptability of our system, encompassing the fine-grained details of how the LLM orchestrates modifications, ensuring precision and coherence with the overarching goals of the exercise adaptation process. We will unravel the intricacies of this transformative process, shedding light on the mechanisms that underpin the seamless integration of changes proposed by the LLM into the exercise structure.

== Prototype Design
*Prototype 1* focuses on the crucial aspect of exercise adaptation—adjusting the difficulty level—addressing the high-demand needs inherent in adaptive learning. When tailoring programming exercises to be more accessible than the basic level, our approach involves breaking down the task into detailed steps and providing comprehensive guidance. By furnishing explicit instructions and supplementary explanations, learners gain a deeper understanding of the problem, enhancing their foundational skills.

Conversely, elevating the difficulty level of programming exercises demands a distinct strategy. Here, we streamline the task description, amalgamate multiple tasks into a more intricate problem, and reduce the pre-written code in the template. This reduction in scaffolding and guidance encourages advanced learners to apply their knowledge creatively, fostering a deeper engagement with the material.

To implement these adaptive methods, adjustments to the problem statement and template repository sections are primarily required based on the foundational exercises. Additional instructions, such as providing comprehensive task guidance or increasing algorithmic complexity, are seamlessly integrated into the corresponding guidance template. This ensures that the Language Model Manager (LLM) produces results that are creative yet grounded in realism.

In terms of template design, we introduce five guidance templates tailored to adapt the difficulty level of programming exercises:

1. Harder Problem Statement Adaptation Template
2. Easier Problem Statement Adaptation Template
3. Template Repository Adaptation Template to modify the template code in accordance with the new problem statement.
4. Solution Repository Adaptation Template to adjust the solution code based on the new problem statement and template repository.
5. Test Repository Adaptation Template to modify the test code considering the new problem statement, template repository, and solution repository.
The user interface (UI) design caters to the seamless integration of the adaptive exercise generation process for instructors. Utilizing the 'Generate Variants' feature, depicted in @generate-variant, instructors can effortlessly create new adaptive exercises across varying difficulty levels. This functionality empowers instructors to build upon the foundational basic exercise, generating diverse variations to cater to a wide spectrum of learner needs.

#figure(
  image("figures/generate-variant.png", width: 80%),
  caption: [
    The mockup of generating new adaptive exercise
  ],
) <generate-variant>

*Prototype 2* is strategically designed to enhance the versatility and scalability of the project by expanding its scope to handle a broader array of adaptation requests.

In this iteration, we adopt a more generalized approach, refraining from the inclusion of specific instructions regarding how to adapt to more challenging exercises. Instead, the Language Model Manager (LLM) is empowered to analyze the user's adaptation requests independently and determine the most effective means of fulfilling these requests. This adaptive functionality necessitates a dynamic interaction model where the LLM engages in a conversation with the user, seeking clarification on the request and subsequently generating a corresponding adaptation plan for the exercise.

To facilitate this, we provide the LLM with a comprehensive context of the exercise, encompassing the problem statement and all three code repositories. This holistic approach maximizes the LLM's capabilities and enables it to perform its adaptive tasks with heightened efficacy.

In terms of template design, our methodology identifies the requirement for five distinct Guidance templates, catering to diverse use cases:

1. Chat Template: Designed to comprehend the exercise context and respond intelligently to user messages.
2. Problem Statement Adaptation Template: Facilitates modifications to the problem statement based on the other three components.
3. Template Repository Adaptation Template: Enables adjustments to the template code in alignment with the other three components.
4. Solution Repository Adaptation Template: Supports modifications to the solution code based on the other three components.
5. Test Repository Adaptation Template: Allows for alterations to the test code in concordance with the other three components.

In the realm of user interface (UI) design, the Iris UI remains a reusable and integral component of Prototype 2. As depicted in @chat-window, showcasing the current UI, we leverage the existing Iris UI to ensure consistency and familiarity for users while accommodating the evolved capabilities of the LLM in adapting to a broader spectrum of user requests. 

Upon comparing the two prototypes, Prototype One's design closely aligns with a specific use case—namely, adjusting the difficulty of exercises. However, its limitations become apparent in terms of scalability and interactive capabilities. In contrast, Prototype Two boasts a more versatile design with a broader range of usage scenarios. Practical experimentation has underscored its efficacy in facilitating exercise modifications, showcasing commendable performance in scenarios involving changes to difficulty levels. Consequently, after thorough consideration, we have opted to adopt the design of Prototype 2.


#figure(
  image("figures/chat-window-dark.png", width: 60%),
  caption: [
    The Iris chat window UI
  ],
) <chat-window>


== Apply changes
Firstly, it is important to note that, considering user experience and the precision of changes introduced by Iris, changes will not be automatically saved in the database. Instead, they will be displayed in the online code editor for the user to review. Only upon user approval will the changes be saved by submitting the code and saving the problem statement to update the database.

We proposed two approaches to inject exercise changes into the corresponding part of Artemis.

*Inject Changes into Client-Side:* This involves the online code editor, comprising an Ace editor for three code repositories editing and a Markdown editor for problem statement editing. The status of the target file should be checked before any other actions. If the target file is in fileSession, changes can be edited directly, meaning the target changes can be injected. If it's not included in the fileSession, it needs to be included first before injecting the changes.

The advantage is that we can always include the current status of the editor, encompassing the latest content of the exercise - content changed by the user but not yet submitted or the initial content of the exercise saved in the database if there are no user-initiated changes. This allows Iris to keep track of the exercise's latest status and generate the corresponding response and exercise plan. 

The disadvantage is that, since the editor has not been maintained for a long time, potential problems may arise when adding new functions. Additionally, as the editor function is a core function of Artemis, it has wide coverage, and the code composition is relatively complex. Moreover, the editor parameters bound to the three code repositories are different, making it challenging to manage the three code repositories with a common function. Although we were able to successfully inject changes, the robustness was not optimal, and occasional problems occurred.

*Inject Changes into Server-Side:* The related repository services on the server define all methods for interactions between Artemis and programming exercise repositories. One method is responsible for managing the unsaved changes of the programming exercise. We can simply checkout the target file content using the corresponding repository URL and file name, and write the new changes into it without committing to Git and saving into the database.

The advantage is that the implementation is simpler than the client-side and more robust. 

The disadvantage is that it's difficult to obtain the unsaved changes of the repository during the execution of the plan and send it to LLM, as we don't want to save the changes into the repository directly before user approval. Therefore, a new storage approach is needed to save the latest content of the repository to send to LLM during the execution of the plan.

Considering the performance and robustness of the project, we decided to implement the second approach. However, due to time constraints, we did not achieve the new storage method. It will be included in future work.

== Subsytem Decomposition
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Describe the architecture of your system by decomposing it into subsys- tems and the services provided by each subsystem. Use UML class diagrams including packages / components for each subsystem.
]
As an integral subsystem of Artemis, Iris plays a pivotal role in enhancing the overall user experience by meticulously analyzing exercises and user requests to generate highly-targeted suggestions. Functioning in harmony with two other essential subsystems—namely, the Git service, responsible for managing the code repositories of the programming exercises, and Pyris, which acts as the intermediary for user requests and responses from the LLM—Iris forms a dynamic trio to empower Artemis with advanced capabilities.

The Git service ensures seamless access to a comprehensive array of programming exercises, fostering a diverse and engaging learning environment. Meanwhile, Pyris acts as the communication bridge between Artemis and the LLM, efficiently handling requests and relaying responses in a timely manner.

This intricate network of subsystems communicates seamlessly, as illustrated in <subsystem-component>, with the exchange facilitated through dedicated APIs and employing the versatile REST interface and websocket service. The utilization of JSON serialization further streamlines the data exchange process, ensuring efficiency and compatibility across all components. This collaborative approach enables Artemis to deliver a sophisticated and responsive platform, seamlessly integrating Iris's analytical prowess with the expansive exercise repositories managed by the Git service and the dynamic communication capabilities of Pyris.

#figure(
  image("figures/subsystem.svg", width: 80%),
  caption: [
    Subsystem decomposition diagram: Overview of the interaction between Iris,
Artemis and Pyris
  ],
) <subsystem-component>

=== Artemis Server
The Artemis Server, meticulously crafted using Java and Spring Boot, stands as a cornerstone in the endeavors discussed within this thesis. Iris, a pivotal subsystem, is integrated into the Code Editor and uses Iris code editor session to manage the interactions between Code Editor and Iris, observed within the Code Editor component, as exemplified in @server-component. For seamless user interaction, the message resource and session resource expose pertinent REST endpoints, allowing users to perform actions such as creating a code editor session and communicating with Iris (FR1), as well as executing individual steps of an exercise plan (FR5).

@server-class offers a static structural overview of the server classes related to the IrisCodeEditorSessionService, a critical class for Iris Chatbot functionality, presented as a UML class diagram. The IrisCodeEditorSessionService relies on the IrisSettingsService to fetch the currently configured guidance template for the course in which the user is engaged. It further utilizes repository classes to locate and validate sessions, messages and exercise plan steps. Message storage is facilitated by the IrisMessageService, while communication with Pyris is managed through the IrisConnectorService to obtain a response from LLM. This response is parsed and subsequently relayed to the user via the IrisWebsocketService. This intricate interplay of services underscores the comprehensive functionality of the Artemis Server, particularly in the context of Iris and its dynamic integration within the Code Editor.

#figure(
  image("figures/artemis-server.svg", width: 80%),
  caption: [
    Subsystem decomposition of the Artemis Server and Iris subsystem
  ],
) <server-component>
#figure(
  image("figures/server-class.svg", width: 80%),
  caption: [
    Class diagram of Iris code editor session (server)
  ],
) <server-class>

=== Artemis Client
@client-class provides insight into the static structure of client classes involved in the Iris Code Editor project.

The client-side IrisCodeEditorWebsocketService plays a pivotal role in receiving messages from the server through a WebSocket connection, subsequently exposing them via an observable stream. The CodeEditorInstructorAndEditorContainerComponent, representing the Code Editor, subscribes to this stream. Beyond message handling, this component, assisted by the ProfileService and IrisSettingsService, ensures that Iris is enabled both in Artemis and the current course. It selectively displays the Iris button and chat window only if these conditions are met.

The CodeEditorInstructorAndEditorContainerComponent then forwards WebSocket messages to the IrisChatbotWidgetComponent via IrisCodeEditorChatbotButtonComponent for presentation to the user. Importantly, the IrisChatbotWidgetComponent possesses the capability to send message requests to the server through the IrisHttpCodeEditorMessageService, with these requests being received by the IrisCodeEditorMessageResource. In the meanwhile, IrisStateStore keeps track on the status of the session and stores the messages continuously. This intricate interplay of client classes ensures a seamless and responsive integration of Iris features within the Code Editor component.

#figure(
  image("figures/client-class.svg", width: 80%),
  caption: [
    Class diagram of Iris code editor session (client)
  ],
) <client-class>


=== Pyris

In our pursuit of optimizing the response format for the specific needs of the code editor use case, we have undertaken a crucial modification in Pyris. This enhancement involves the creation of a novel message endpoint /api/v2/messages tailored to our requirements. In contrast to the conventional response format, which typically returns only the 'response' variable, our new endpoint is designed to yield all content generated within a guidance program.

This alteration is particularly impactful for the code editor use case, providing a more comprehensive and nuanced insight into the guidance program's outcomes. By retrieving all content, we ensure that every element generated by the guidance program is accessible, facilitating a richer and more detailed understanding for further processing.

Furthermore, in an effort to streamline and simplify interactions with Pyris, we have refined the template parameter. The new endpoint now accommodates just a string as the template parameter, eliminating the need for an object containing both a string and an unused id. This modification enhances the efficiency and clarity of communication with Pyris, aligning more closely with the specific demands of the code editor use case.

In essence, these adaptations in Pyris underscore our commitment to tailoring the system to the unique requirements of the code editor integration, ensuring a more seamless and effective interaction between Pyris and the code editor component.

== Hardware Software Mapping
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This section describes how the subsystems are mapped onto existing hardware and software components. The description is accompanied by a UML deployment diagram. The existing components are often off-the-shelf components. If the components are distributed on different nodes, the network infrastructure and the protocols are also described.
]

== Access Control
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Optional section describing the access control and security issues based on the nonfunctional requirements in the requirements analysis. It also de- scribes the implementation of the access matrix based on capabilities or access control lists, the selection of authentication mechanisms and the use of en- cryption algorithms.
]


= Evaluation
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: If you did an evaluation / case study, describe it here.
]
Ensuring the alignment of our proposed solution with organizational goals and meeting expected standards is paramount. Our evaluation process employs a rigorous experimental methodology meticulously crafted to address specific hypotheses regarding the performance of the LLM-based programming exercise adaptation system. 

== Design 
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Describe the design / methodology of the evaluation and why you did it like that. E.g. what kind of evaluation have you done e.g. questionnaire, personal interviews, simulation, quantitative analysis of metrics, what kind of participants, what kind of questions, what was the procedure?
]
=== Objective
The overarching goal of this experimental study is to assess the performance and capabilities of Iris, our programming exercise adaptation system. Two distinct experiments have been designed, each focusing on specific aspects of Iris's functionality.

=== Experimental Groups

- *Control Group*: Participants in this group will adapt the programming exercise manually, following the conventional approach.
- *Experimental Group*: Participants in this group will utilize Iris to adapt the programming exercise.

We conducted a series of two experiments to comprehensively assess its capabilities.

=== Experiment 1: Replacing Search Algorithms

We introduced a new programming exercise titled "Searching with the Strategy Pattern," instead of the existing one which we used for optimizing our prompt template to enhance result reliability. And given the stringent requirements with a fixed endpoint makes it easier to measure the performance. The procedure is as follows:

1. *Task:* Participants will be tasked with replacing one searching algorithm with another within the programming exercise. The modifications should be implemented across all four components of the exercise.
2. *Objective:* The primary objective is to comprehensively evaluate Iris's performance concerning both functional and non-functional requirements. This experiment aims to cover all functions of Iris related to algorithm replacement.

=== Experiment 2: Making an Exercise Harder

A new programming exercise is presented, tailored to serve as an accessible starting point. The task at hand involves the deliberate removal of pre-filled code snippets from the template repository. To elevate the complexity of the exercise, additional tasks are introduced, compelling students to re-implement the removed code. The procedure is as follows:

1. *Tasks:* Given an exercise that is currently easy, participants will make it harder by removing some of the prefilled code in the template.
2. *Objective:* To test if Iris can understand that making an exericse harder can be achieved by adding more tasks and thereby removing some of the template code.

=== Experiment 3: Adding a Creative Theme

A new programming exercise devoid of background description and a meaningful theme, but comprising only coding tasks, was used. The challenge was to introduce a creative theme and adjust the exercise accordingly to enhance student engagement. The procedure is as follows:

1. *Task:* Participants will add a creative theme to the programming exercise, enhancing its appeal and comprehensibility for students.
2. *Objective:* The primary goal is to showcase Iris's proficiency in assisting humans with creative ideation in programming exercise design. Furthermore, given the experiment's flexible scenario that permits Iris to showcase adaptability without stringent requirements, another goal is to assess Iris's performance in creatively adapting exercises within a less constrained environment. This emphasizes Iris's ability to generate inventive ideas and adapt exercises with diverse themes.

=== Survey
We have designed a survey to gather valuable feedback from our evaluators. Following each experiment, we will ask them if agree with the following statement:

- Iris accurately understands a given request when generating component plans
- The component plans generated by Iris are consistent with each other.
- Iris accurately follows the specified plan when generating component changes.
- The component changes generated by Iris are consistent with each other.

After completing the three experiments, participants will be presented with the following survey for evaluation. Each statement in the survey offers five response options, allowing raters to indicate their level of agreement.

- Iris assistance in programming exercise creation is helpful to me
- It takes less time to adapt a programming exercise with Iris
- Iris is especially useful to 
    - apply changes to the exercise content
    - change the exercise complexity
    - change the exercise theme
- I prefer Iris over ChatGPT to adapt the programming exercise
- Iris' potential to improve the exercise creation process is high

In addition to the ratings, we let evaluators record as the whole process. This practice will enhance our ability to analyze the accuracy and effectiveness of the system.

== Results
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Summarize the most interesting results of your evaluation (without interpretation). Additional results can be put into the appendix.
]

== Findings
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Interpret the results and conclude interesting findings
]

== Discussion
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Discuss the findings in more detail and also review possible disadvantages that you found
]

== Limitations
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Describe limitations and threats to validity of your evaluation, e.g. reliability, generalizability, selection bias, researcher bias
]
bias

= Summary
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: This chapter includes the status of your thesis, a conclusion and an outlook about future work.
]

In the subsequent sections, we delve into the current state of the thesis, highlight key conclusions, and explore potential avenues for future research.

== Status
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Describe honestly the achieved goals (e.g. the well implemented and tested use cases) and the open goals here. if you only have achieved goals, you did something wrong in your analysis.
]

#let open = circle(
  radius: 0.3em,
  fill: white,
  stroke: black,
) 

#let partial-g = circle(
  radius: 0.5em,
  fill: gradient.linear((black, 0%), (white, 70%), (white, 100%)),
  stroke: black,
)

#let fulfilled-g = circle(
  radius: 0.5em,
  fill: black,
  stroke: black,
)
Tables 8.1 provides a comprehensive overview of the status of functional requirements of the project. Each functional requirement is labeled as (fulfill-g) for realized, partial-g for partially realized, and #open for not realized. Further details on realized goals and ongoing objectives are discussed in the subsequent sections.



=== Realized Goals
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Summarize the achieved goals by repeating the realized requirements or use cases stating how you realized them.
]

=== Open Goals
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Summarize the open goals by repeating the open requirements or use cases and explaining why you were not able to achieve them. Important: It might be suspicious, if you do not have open goals. This usually indicates that you did not thoroughly analyze your problems.
]

== Conclusion
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Recap shortly which problem you solved in your thesis and discuss your *contributions* here.
]

== Future Work
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Tell us the next steps (that you would do if you have more time). Be creative, visionary and open-minded here.
]