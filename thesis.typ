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

In the digital age, the demand for computer scientists has witnessed a remarkable surge, resulting in an increasing number of students choosing computer-related majors in universities. This influx of students, however, has led to larger class sizes, presenting challenges to conventional teaching methods.

In response to this issue, Artemis, an open-source learning platform designed for large computer science classes @krusche2018artemis, introduces an innovative teaching philosophy known as interactive learning. Unlike traditional lecture-based methods, interactive learning encourages students to engage with course content through discussions, problem-solving activities, and hands-on experiences.

Artemis's incorporation of interactive learning principles goes beyond traditional teaching approaches, providing students with a more dynamic and personalized learning experience. This approach not only enhances scalability and adaptability @krusche2021interactive but also fosters a deeper understanding of complex concepts by promoting active involvement in the learning process.

In the realm of computer science education, where programming plays a pivotal role @scherer2020meta, practical hands-on experience is crucial for students to grasp programming concepts effectively @teusner2017aspects. Recognizing this, Artemis leverages interactive learning to transform the learning experience, offering a platform that encourages exploration, collaboration, and critical thinking among students.

Moreover, Artemis holds the potential to extend the benefits of interactive learning beyond traditional classroom interactions. By integrating dynamic programming exercise creation into the platform, Artemis can further amplify the advantages of interactive learning, providing tailored and adaptive content that aligns with individual student needs. This evolution in teaching methods not only addresses the challenges of larger class sizes but also ensures a more engaging and effective learning environment in the digital age.

== Problem
Considering the diverse range of students participating in programming exercises, it is important to acknowledge that they possess varying levels of
mastery in the relevant content and possess different programming experiences.

While instructors strive to balance exercise difficulty to accommodate
the majority of students, it is inevitable that certain exercises will still
pose challenges for some individuals. This can result in students becoming stuck at specific tasks, impeding their progress and necessitating the
need for assistance from teaching assistants or peers. Prolonged instances
of being stuck can lead to demotivation among students. As a result, students may likely learn very little and generally make teaching painful and
frustrating @filgona2020motivation.

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
growth @aberle2022adaptive.

== Objectives

The rapid advancement of Artificial Intelligence (AI), particularly Generative Pre-trained Transformer (GPT) models, presents a unique opportunity to revolutionize the field of computer science education @kasneci2023chatgpt. In this master's thesis, our objective is to harness the capabilities of Large Language Models (LLMs) to create adaptive programming exercises. This innovative approach allows us to customize exercises precisely to meet the individual learning objectives and proficiency levels of students. To achieve this overarching goal, we have identified the following specific sub-goals:

- *Intelligent Exercise Planning*
Our first aim is to develop a chatbot named Iris, leveraging LLM technology. Iris will engage in dialogue with users to gain a comprehensive understanding of their needs and propose tailored exercise adaptation plans. These plans will be intelligently crafted to include adaptation strategies for the involved exercise components, enhancing feasibility and implementability.

- *Dynamic Exercise Execution*
Our next objective is to enable LLMs to execute exercise plans seamlessly. By passing each component adaptation plan along with the current content of the corresponding component, we allow LLMs to generate the required changes based on these plans. To maintain consistency between components, this process follows a linear trajectory. Once the adaptation plan for one component is executed, the next component's adaptation plan and content are forwarded.

- *Automated Exercise Application*
Lastly, we seamlessly integrate exercise changes into the existing system, Artemis. This integration necessitates the analysis and accurate application of changes generated through Iris to the corresponding parts of the relevant components. By automating this process, we streamline exercise modifications, easing the burden on users and enhancing overall efficiency.

== Outline

In Chapter 2, a concise overview of large language model is presented, followed by an in-depth examination of Artemis. The discussion extends to the programming exercise within Artemis, various roles within the system, and a comprehensive analysis of both the Iris and Pyris subsystems.

Chapter 3 delves into the existing methodology for programming exercise creation and adaptation in Artemis. This is followed by the introduction of our novel system proposal, elucidating its functional and nonfunctional aspects, complemented by detailed system models.

Building upon these foundational components, Chapter 4 explores the overarching system design and its practical implementation. 

The subsequent focus in Chapter 5 is on the evaluation of the adaptation of programming exercises using Iris.

The concluding Chapter 6 serves as a reflection on accomplished and ongoing objectives, providing a comprehensive wrap-up of our exploration. Additionally, this chapter highlights potential avenues for future research, encapsulating the essence of the thesis.

#pagebreak()

= Background
In this chapter, we present the key concepts and technologies essential to this
thesis. As Iris is itself a sub-system of Artemis we will first have to go over the general structure of Artemis. Next, we discuss the CoFee framework; this
is the current method employed by Athena to generate feedback suggestions for
text exercises. This is followed by an overview of the ThemisML approach, the
proposed strategy for Athena to generate feedback suggestions for programming
exercises. Finally, we give an overview of the microservice architecture, which
Athena leverages to structure its components

== Large Language Model (LLM)
Large language models refer to sophisticated artificial intelligence systems designed to understand and generate human-like language. These models are typically built on deep learning architectures and are trained on vast datasets to learn the patterns, nuances, and contextual information of language. Notable examples include GPT-3 (Generative Pre-trained Transformer 3) and similar models. Large language models demonstrate advanced capabilities such as natural language understanding, text completion, translation, and even creative content generation. They have found applications in various fields, including natural language processing, content generation, chatbots, and machine translation, revolutionizing the way AI interacts with and produces human language.

== Artemis

Artemis transforms interactive learning by providing immediate, personalized feedback on programming exercises, quizzes, modeling tasks, and beyond. Tailored for instructors' preferences and fostering real-time collaboration among students, it seamlessly merges creativity and education #footnote("https://github.com/ls1intum/Artemis"). 
=== Programming exercise
The programming exercise feature in Artemis encompasses a comprehensive set of components, including the problem statement, template repository, solution repository, and test repository with version control. It supports automatic individual feedback and assessment based on test cases and static code analysis for diverse programming languages. It is also interactive, allowing instructors to embed instructions and UML diagrams directly into dynamic problem statements. Instructors can prepare the exercise locally in their preferred IDE or use the online code editor without any setup. The feature ensures security by running test cases and student code in Docker environments on build agents, with additional support from test frameworks like Ares to prevent cheating.
=== Roles
Artemis implements a granular permission system catering to various users, currently supporting the following roles in ascending order of permissions:

- Anonymous
- Student
- Tutor
- Editor
- Instructor
- Administrator

It is crucial to highlight that creating or editing programming exercises necessitates a user to hold the role of Editor or higher. Hence, when referencing a user throughout this thesis, it implicitly denotes a user possessing the role of Editor or higher, unless explicitly specified otherwise.

== Iris

Iris #footnote("https://artemis.cit.tum.de/about-iris"), an Artemis subsystem, harnesses the power of large language models, and its development commenced during the Interactive Learning Practical Course in the summer semester of 2023. Designed to offer tailored responses, Iris draws context from diverse sources, such as a student's code, enabling personalized answers to all student queries.

While seamlessly integrated into Artemis, Iris also includes a standalone component known as Pyris #footnote("https://github.com/ls1intum/Pyris"). Iris aims to employ various large language models for responding to student inquiries. Microsoft's Guidance, which introduces the Handlebars templating language to address common concerns in dealing with large language models, proves to be a valuable tool for managing and controlling different models. However, it is available solely as a Python package. Consequently, we initiated the development of Pyris to act as a bridge between Artemis and Guidance. The primary architectural objective of the Iris subsystem is extendability, allowing other Artemis subsystems to seamlessly leverage the functionality of large language models.

#pagebreak()

= Related Work
@leiker2023prototyping investigates the use of Large Language Models (LLMs) in asynchronous course creation for adult learning, training, and upskilling, with initial findings indicating that LLMs can facilitate faster content creation without compromising accuracy or clarity. The study highlights the potential of LLMs to transform the landscape of learning and education, necessitating further research and discussions on their strategic and ethical use in learning design.

@shirafuji2023exploring investigates the capabilities of large language models (LLMs) such as Codex and ChatGPT in solving programming problems, emphasizing their understanding of problem descriptions and code generation processes. Experimental findings demonstrate that Codex and CodeGen are sensitive to minor alterations in problem descriptions, notably affecting their code generation performance. Codex's reliance on specific variable names is highlighted, with randomized variables significantly reducing its solving rate. In contrast, state-of-the-art models like InstructGPT and ChatGPT exhibit higher robustness to superficial modifications and excel in problem-solving tasks. The study underscores the importance of carefully formatted prompts for optimal code generation performance, as slight modifications can greatly impact results.

@nijkamp2023codegen2 proposes that it will make the training of large language models (LLMs) for program synthesis more efficient by unifying model architectures, learning methods, infill sampling, and data distributions.


#pagebreak()

= Requirements Analysis

== Overview

We proposed Iris code editor feature which aims to revolutionize the process of programming exercise adaptation by leveraging generative AI capabilities. Unlike the current manual adaptation process, which users need to do it manually, Iris integrates a ChatGPT-style chatbot to enable instructors to articulate their exercise vision effortlessly. This collaboration empowers instructors to maintain full control over exercise adaptation while allowing AI to seamlessly introduce numerous additions or modifications, from entire exercise structures to single lines of code.

The system's functional requirements encompass the interaction between users and the system, including features such as chatting with Iris, reviewing and modifying exercise plans, executing plans, and viewing applied changes. Additionally, nonfunctional requirements ensure usability, supportability, reliability, and performance aspects of the system. And all of these requirements would be considered into our design.

By streamlining the exercise creation process and fostering dynamic collaboration between instructors and AI, the Iris code editor system promises to accelerate exercise development, create a collaborative environment, and enhance the effectiveness of programming education.

== Current System
  
The current system for programming exercises in Artemis primarily involves manual adaptation, either through the online Code Editor or a local Integrated Development Environment (IDE). Within the online Code Editor, users can access the four main components - the problem statement, template repository, solution repository, and test repository - by toggling between different repositories. Changes made within the online editor can be submitted, triggering automatic build processes with test case checks. However, it's important to note that the feature set of the online editor may not be as comprehensive as that of a local IDE; for instance, it may lack the ability to check code compilation before submission.

Alternatively, users can opt for a local IDE, which offers greater flexibility in editing code. However, this method requires additional configuration efforts and the need to clone the repository using Git for each exercise. After updating the code repository content locally, users must commit and push the changes to remote repositories, allowing Artemis to fetch the latest version via the version control system and repository service. This process necessitates users to have a certain understanding of version control practices.

Importantly, both approaches require manual editing by users, which can be cumbersome and time-consuming. This manual intervention is a significant aspect of the current system, highlighting the need for a more efficient and automated solution in the future.

== Proposed System
Our exploration commences with a detailed examination of the decision-making process involved in choosing between two prototypes. This critical design phase sets the foundation for the subsequent stages of our system. We will delve into the factors, considerations, and methodologies that guide us through this pivotal step, ensuring the selection of a prototype that aligns seamlessly with our objectives.

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

#figure(
  image("figures/chat-window-dark.png", width: 60%),
  caption: [
    The Iris chat window UI
  ],
) <chat-window>

Upon comparing the two prototypes, Prototype One's design closely aligns with a specific use case—namely, adjusting the difficulty of exercises. However, its limitations become apparent in terms of scalability and interactive capabilities. In contrast, Prototype Two boasts a more versatile design with a broader range of usage scenarios. Practical experimentation has underscored its efficacy in facilitating exercise modifications, showcasing commendable performance in scenarios involving changes to difficulty levels. 

Consequently, after thorough consideration, we have opted to adopt the design of Prototype 2 and proposed Iris code editor system which is enhanced with generative AI capabilities. Through collaboration with an embedded ChatGPT-style chatbot, instructors can effortlessly articulate their vision for the exercise, witnessing the Code Editor automatically adapt to their specifications. This innovative approach empowers instructors with the flexibility to maintain full control over the exercise while allowing the AI to seamlessly introduce numerous additions or modifications. The generated content, shaped by the AI, can span the entirety of the exercise or be as concise as a single line of code. This streamlined and intuitive process not only accelerates exercise creation but also fosters a dynamic and collaborative environment between instructors and artificial intelligence, unlocking new possibilities for engaging and effective programming education. In the following,
we will describe the functional and non-functional requirements of Iris code editor system using
the Requirements Analysis Document Template in @bruegge2009object

=== Functional Requirements

Functional requirements stand independent of implementation details, specifically focusing on describing the interactions between the system and its environment, as articulated in @bruegge2009object.

- FR1 Chat with Iris in Code Editor: The user can chat with Iris via a chat window in Code Editor.
- FR2 Iris suggests plan: In the event that the LLM decides it understands the user’s request, the LLM will additionally suggest a plan of action for adapting the exercise based on the user’s input, which will be displayed to the user in the chat window.
- FR3 Review exercise plan: The user should be able to review the plan of each component.
- FR4 Modify exercise plan: The user will be able to modify the generation plan.
- FR5 Execute exercise plan: The user will be able to execute the plan, which will trigger the LLM to perform the actions described in each component of the plan. The plan will be executed in the order in which the components appear in the plan.
- FR6 Pause and resume exercise plan: The user should be able to pause and resume the execution of the plan at any time, causing Iris to stop or resume at the next possible step.
- FR7 View plan execution error: If an error occurs while executing the plan, the user should be notified of the error and the plan will be paused.
- FR8 View changes in Code Editor: Users should be able to view the applied changes in the code editor and compare them to what was before the changes.
- FR9 Clear chat history: The chat window will have a button that allows the user to clear the chat history.
- FR10 Undo changes: The user will be able to undo Iris' changes to the exercise.

=== Nonfunctional Requirements <nfr>
Nonfunctional requirements shed light on the aspects of a system that are not directly related to its functionality @bruegge2009object.

*Usability*
- NFR1 Minimizable and Resizeable: The chat window will be minimizable and resizeable with a single click or drag respectively.
- NFR2 Transparent Process: The system will display accurate error messages to the user in the case of exceptional behavior, such as invalid input or invalid responses from the LLM.
- NFR3 Identifiable: The chat window will be clearly labeled and identifiable as a chat window.
- NFR4 Model Configurable: The system will be configurable, allowing the user to specify the LLM that the system will communicate with.

*Supportability*
- NFR5 LLM-agnostic: The system will be LLM-agnostic, supporting any LLM that is capable of communicating with the system via the chat window.

*Reliability*
- NFR6 Input Processing: The system will be able to handle any input from the user, including invalid input, without crashing.
- NFR7 Response Processing: The system will be able to handle any response from the LLM, including invalid responses, without crashing.
*Performance*
- NFR8 Reaction Time: The response of Iris should be displayed to users within 30 seconds for 95% of requests.


== System Models

In this section of the requirements analysis, we delineate the system models for the project. We commence by elucidating the envisioned scenarios for the system. Subsequently, we present the use case model, analysis object model, dynamic model, and user interface of the system, accompanied by comprehensive diagrams and detailed descriptions.
=== Scenarios

As defined by @bruegge2009object, a scenario is described as 'a concrete, focused, informal description of a single feature of the system from the viewpoint of a single actor.' A visionary scenario represents an idealized solution to a problem, even if it may not be entirely achievable. In contrast, a demo scenario is one that is feasible, implementable, and can be demonstrated by the conclusion of this thesis. In this section, we will present both a visionary scenario and a demo scenario for our project.

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
While this visionary scenario presents an idealized representation of the functionality we aspire to achieve, it remains grounded in realism. However, it is crucial to acknowledge that realizing such an advanced level of functionality within the scope of this thesis may be ambitious. Through our exploration, we have identified challenges in relying solely on the LLM, particularly when Iris is granted significant discretionary space for exercise adaptation compared to scenarios with more specific restrictions. This has prompted the need for implementing a guardrail mechanism to ensure that changes made by the LLM align with user approval.

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

Recognizing the limitations and complexities involved, we set realistic expectations for the LLM's performance and its ability to incorporate continuous feedback. In light of these considerations, we shift our focus towards more achievable functionality and specific scenarios within the confines of this thesis. As an alternative, we propose a demo scenario that aligns with our practical goals and expectations, aiming to strike a balance between innovation and feasibility.

The demo scenario is more realistic than the previous one as it provides Iris with more specific instructions. These precise instructions enhance Iris's comprehension and organizational capabilities, providing a fixed endpoint and constraint. Furthermore, users have the capability to monitor the entire process. The execution of the corresponding plan only takes place after users approve Iris's proposed plan, enabling them to closely observe the execution process and subsequently review the changes implemented by Iris.
=== Use Case Model

According to Bruegge and Dutoit, use cases are described as 'a function provided by the system that yields a visible result for an actor' @bruegge2009object. In the context of this discussion, the actors are represented by editors interacting with the system Iris.

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

As described by Bruegge and Dutoit, we use the analysis model to prepare for
the architecture of the system @bruegge2009object. The corresponding analysis object model is
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

#figure(
  image("figures/activity-diagram.png", width: 80%),
  caption: [
    Activity diagram of Iris code editor feature
  ],
)<activity-diagram>

The dynamic model describes the behavior of the system in terms of state changes
@bruegge2009object. @activity-diagram shows the dynamic model for the Iris integration into the Code
Editor in the form of a UML activity diagram.


This model delineates the intricacies of adapting an exercise using Iris within the Code Editor. The user initiates the process by communicating with Iris through the chat window (FR1). Subsequently, Artemis engages Pyris to generate a response to the user's message, potentially yielding an exercise plan (FR2). The user is presented with the option to execute this plan or to continue interacting with Iris through text messages. Opting to execute the plan prompts Artemis to commence the sequential execution of plan steps.

For each step, Artemis sends a request to Pyris, facilitating the retrieval of exercise modifications, subsequently applying these changes to the exercise, and reloading the client (FR3). Users maintain control over the process by having the option to pause the plan (FR4) at any point. Subsequently, users can choose to either resume the plan (FR4) or resume communication with Iris through text messages.

Upon completing the exercise modifications, users have the flexibility to submit their changes and exit the Code Editor. This model encapsulates a dynamic and iterative workflow, allowing users to seamlessly transition between executing pre-defined plans and engaging in freeform interactions with Iris. The incorporation of these features ensures a responsive and user-centric experience within the Code Editor, facilitating the efficient adaptation of exercises to meet specific requirements.

=== User Interface

This section presents the user interface for the integration of Iris into the Code Editor.

To enhance accessibility, the Iris button is now prominently positioned in the top right corner of the Code Editor. By clicking this button, users can open the chat window located in the bottom right corner. @editor-night illustrate the Iris button and open chat window in dark themes of the Code Editor Page. An introductory message has been thoughtfully incorporated into the chat window, serving as an invitation for users to initiate a conversation with Iris.

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

#pagebreak()

= System Design

In this section, we will discuss design decisions made in the implementation of the Iris Code Editor project.

== Overview

Our proposed system, the Iris Code Editor, is designed to enhance the Artemis ecosystem by introducing advanced capabilities for exercise adaptation. With a focus on reliability, usability, cost-effectiveness, performance, and extensibility, derived from nonfunctional requirements, the Iris Code Editor aims to become a dependable feature within Artemis, encompasses meticulous exercise and user request analysis, forming a dynamic trio with Pyris and the Large language model, facilitating efficient communication through dedicated APIs.

== Design Goals
#rect(
  width: 100%,
  radius: 10%,
  stroke: 0.5pt,
  fill: yellow,
)[
  Note: Derive design goals from your nonfunctional requirements, prioritize them (as they might conflict with each other) and describe the rationale of your prioritization. Any trade-offs between design goals (e.g., build vs. buy, memory space vs. response time), and the rationale behind the specific solution should be described in this section
]
In the design of our proposed system, we prioritize the following design goals, derived from the nonfunctional requirements outlined in @nfr:

Reliability Criteria: The foremost goal is to ensure that the Iris Code Editor becomes a reliable feature within the Artemis ecosystem. Achieving a high level of system availability, particularly in handling user inputs (NFR6) and LLM responses (NFR7), is paramount. This ensures a seamless user experience and builds trust in the system's performance.

Usability Criteria: User experience is central to our design goals as it directly impacts the effectiveness of the editors within Artemis. Users should be able to effortlessly navigate the exercise adaptation process (NFR2), configure preferred models (NFR4), and interact with a user interface that is identifiable (NFR3) and intuitive to use (NFR1).

Cost Criteria: Given Artemis's status as an open-source project with limited funding, minimizing maintenance and administration costs is crucial. Therefore, we aim to balance affordability with the quality of exercise adaptation results and user satisfaction, ensuring cost-effective solutions without compromising functionality or user experience.

Performance Criteria: Seamless integration within the Artemis exercise adaptation workflow is essential, necessitating swift provision of exercise adaptation plans by Iris, ideally within 20 seconds (NFR 8). While maintaining a high standard of response times, we acknowledge the need for some trade-offs to ensure the quality of results while optimizing resource usage.

Extensibility Criteria: While the extensibility of LLM models (NFR5) is valuable for future enhancements, we prioritize limited models with good performance. This approach ensures a balance between flexibility and performance, allowing for manageable integration and scalability within the Artemis ecosystem.

This prioritization strategy aims to establish the Iris Code Editor Feature as a reliable, user-centric, cost-effective, and extensible addition to the Artemis ecosystem. By aligning with the community-driven, open-source nature of the project, we strive to deliver a solution that meets the diverse needs of users while upholding high standards of reliability and usability.


== Subsytem Decomposition

As an integral subsystem of Artemis, Iris plays a pivotal role in enhancing the overall user experience by meticulously analyzing exercises and user requests to generate highly-targeted suggestions. Functioning in harmony with Pyris, which acts as the intermediary for user requests and responses from the LLM—Iris forms a dynamic trio to empower Artemis with advanced capabilities.

Pyris acts as the communication bridge between Artemis and the LLM, efficiently handling requests and relaying responses in a timely manner.

This intricate network of subsystems communicates seamlessly, as illustrated in <subsystem-component>, with the exchange facilitated through dedicated APIs and employing the versatile REST interface and websocket service. The utilization of JSON serialization further streamlines the data exchange process, ensuring efficiency and compatibility across all components. 

#figure(
  image("figures/subsystem.svg", width: 80%),
  caption: [
    Subsystem decomposition diagram: Overview of the interaction between Iris,
Artemis and Pyris
  ],
) <subsystem-component>

=== Artemis Server
The Artemis Server, meticulously crafted using Java and Spring Boot, stands as a cornerstone in the endeavors discussed within this thesis. 

@server-component offers an insightful depiction of the Artemis Server’s subsystems. The system's architecture is structured into three distinct layers: the web layer, the application layer, and the data layer. Within this framework, the modules for _Iris Code Editor Session Resource_ and _Iris Code Editor Message Resource_ are pivotal, as they expose endpoints facilitating the retrieval and creation of Iris code editor sessions and messages.

Whenever updates occur within these domains, the _Iris Code Editor Session Service_, serving as the cornerstone of the Iris Code Editor feature, is triggered. This service relies on the _Iris Settings Service_ to procure the currently configured guidance template for the respective course in which the user is actively participating. Additionally, it employs repository classes to locate and validate sessions, messages, and exercise plan steps. The _Iris Connector Service_ manages communication with Pyris to obtain responses from LLM, which are then parsed and relayed to the user through the _Iris Code Editor Websocket Service_.

This intricate orchestration of services highlights the comprehensive functionality of the Artemis Server, particularly in the context of Iris and its seamless integration within the Code Editor environment.

#figure(
  image("figures/ServerSubsystem.svg", width: 90%),
  caption: [
    Subsystem decomposition of the Artemis Server
  ],
) <server-component>


=== Artemis Client
The Artemis Client, crafted using Angular, is structured into two primary layers: the UI layer, composed of Angular components, and the service layer, which primarily handles interactions with the Artemis API.

@client-component provides an insightful overview of the Iris Code Editor project within the Artemis client's subsystems.

The _Iris Code Editor Websocket Service_ assumes a pivotal role in receiving messages from the server via a WebSocket connection, subsequently exposing them through an observable stream. The _Code Editor Instructor And Editor Container Component_, representing the _Code Editor_, subscribes to this stream and forwards WebSocket messages to the _Iris Chatbot Widget Component_ via the _Iris Code Editor Chatbot Button Component_. The latter will pass the information of the current session to the widget component. User requests are transmitted to the server through the _Iris Code Editor Session Service_ within the _Iris Chatbot Widget Component_. Concurrently, the IrisStateStore monitors the session status and continuously stores the messages.

This intricate collaboration ensures a seamless and responsive integration of Iris features within the Code Editor component.

#figure(
  image("figures/ClientSubsystem.svg", width: 90%),
  caption: [
    Subsystem decomposition of the Artemis Client
  ],
) <client-component>

== Process Control
In prioritizing user experience, we aim to empower users with control over the plan execution process. With this approach, clients are granted authority to manage the process. By enabling actions such as executing and pausing plans, the client sends distinct requests to the server and presents corresponding statuses to the user, as illustrated in @communication.

#figure(
  image("figures/CommunicationDiagram.svg", width: 90%),
  caption: [
    Communication diagram of plan execution process
  ],
) <communication>

== Access Control
In the Iris Code Editor subsystem, the application client interacts with resources and operations through REST-based HTTP communication and WebSocket service. Each implemented endpoint on the server verifies that the requesting user possesses the necessary privileges for the relevant course and exercise.

To ensure secure access, the server utilizes an existing service to validate whether the requester has permission to access the specified exercise.

In terms of Iris settings configuration, access is restricted to users with administrator rights within the Artemis environment.

Regarding the Iris Code Editor feature, access is limited to users with editor rights specific to the exercise. Additionally, each user is assigned a unique session ID when communicating with Iris, ensuring privacy, as only the respective user can access the chat history between themselves and Iris.


#pagebreak()

= Implementation Details

This section introduces some details worth mentioning of the current implementation. First, we introduce the methods employed in the generation and application of changes by the Language Model Manager (LLM) to the exercise. This phase is integral to the dynamic adaptability of our system, encompassing the fine-grained details of how the LLM orchestrates modifications, ensuring precision and coherence with the overarching goals of the exercise adaptation process. We will unravel the intricacies of this transformative process, shedding light on the mechanisms that underpin the seamless integration of changes proposed by the LLM into the exercise structure. Next we introduce new changes to the Pyris system where we optimize response formats for the specific needs of code editor use cases.

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

== Pyris

In our pursuit of optimizing the response format for the specific needs of the code editor use case, we have undertaken a crucial modification in Pyris. This enhancement involves the creation of a novel message endpoint /api/v2/messages tailored to our requirements. In contrast to the conventional response format, which typically returns only the 'response' variable,  our new endpoint is designed to yield all content generated within a guidance program. For example, if the generated variables from LLM looks like this: {contextfile: this is a test context file, response: this is a test response}, the initial system endpoint (/api/v1/messages) will return {response: this is a test response}, but the new endpoint will return all content of the generated variables {contextfile: this is a test context file, response: this is a test response}.


This alteration is particularly impactful for the code editor use case, providing a more comprehensive and nuanced insight into the guidance program's outcomes. By retrieving all content, we ensure that every element generated by the guidance program is accessible, facilitating a richer and more detailed understanding for further processing.

Furthermore, in an effort to streamline and simplify interactions with Pyris, we have refined the template parameter. The new endpoint now accommodates just a string as the template parameter, eliminating the need for an object containing both a string and an unused id. This modification enhances the efficiency and clarity of communication with Pyris, aligning more closely with the specific demands of the code editor use case.

In essence, these adaptations in Pyris underscore our commitment to tailoring the system to the unique requirements of the code editor integration, ensuring a more seamless and effective interaction between Pyris and the code editor component.

#pagebreak()

= Evaluation

Ensuring the alignment of our proposed solution with organizational goals and meeting expected standards is paramount. Our evaluation process employs a rigorous experimental methodology meticulously crafted to address specific hypotheses regarding the performance of the LLM-based programming exercise adaptation system. 

== Design 
In this section, we present the design of the evaluation process. We begin by outlining the objectives and participants involved, followed by an overview of the evaluation procedures. Lastly, we introduce the survey component of the evaluation.

=== Objective
The overarching goal of this experimental study is to assess the performance and capabilities of Iris, our programming exercise adaptation system. Two distinct experiments have been designed, each focusing on specific aspects of Iris's functionality.

=== Experimental Groups

Users of Iris Code Editor feature are programming exercise creators using Artemis. Therefore, we selected participants from the exercise creator group of Introduction to Programming lecture WS23/24 becuase they are experienced with programming exercise creation and adaptation process in Artemis.

- *Control Group*: Participants in this group will adapt the programming exercise manually, following the conventional approach.
- *Experimental Group*: Participants in this group will utilize Iris to adapt the programming exercise.

We conducted a series of three experiments to comprehensively assess its capabilities.

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

In addition to the survey questions, we would like to gather text feedback based on the following open-ended questions:
- What do you think of the overall Iris exercise adaptation feature? Can it be useful for the real work of editor or is it a redundant feature and not very helpful?
- What needs to be improved? Which aspect is good?
- What kind of tasks will you prefer to do by yourself instead of using Iris?
- What kind of tasks will you prefer to let Iris do it?

We also ask evaluators to record their entire experiment process. This approach will strengthen our ability to analyze the system's accuracy and effectiveness.

== Results


We gathered data from four sets of control groups, four complete sets of experimental groups, three subsets of experimental group data that exclusively participated in Experiment 1, and received responses from seven completed questionnaires, along with five pieces of text feedback provided in Appendix A.

#figure(
  grid(
    columns: 2,
    rows: 3,
    gutter: 1em,
    image("/figures/ex1.1.png"),
    image("/figures/ex1.2.png"),
    image("/figures/ex2.1.png"),
    image("/figures/ex2.2.png"),
    image("/figures/ex3.1.png"),
    image("/figures/ex3.2.png"),  
  ),
  caption: [Survey results for component plans related questions: left - accuracy, right - consistency (top to bottom: Experiment 1-3)]
) <component-plan>

#figure(
  grid(
    columns: 2,
    rows: 3,
    gutter: 1em,
    image("/figures/ex1.3.png"),
    image("/figures/ex1.4.png"),
    image("/figures/ex2.3.png"),
    image("/figures/ex2.4.png"),
    image("/figures/ex3.3.png"),
    image("/figures/ex3.4.png"),  
  ),
  caption: [Survey results for component changes related questions: left - accuracy, right - consistency (top to bottom: Experiment 1-3)]
) <component-change>

Through the aforementioned experiments, we have acquired results regarding component plan accuracy and consistency, as depicted in @component-plan. Furthermore, the obtained results for component changes accuracy and consistency are illustrated in @component-change.

#grid(columns: 2, gutter: 2em)[
  #figure(
    image("figures/group-time.png"),
    caption: [
      Time spent in control group and experimental group (y:minutes)
    ],
  ) <group-time>
][
  #figure(
    image("figures/wait-time.png"),
    caption: [
      The total time spent in the experimental group and the time spent waiting for Iris response (y:minutes)
    ],
  ) <wait-time>

]

@group-time presents a comparative analysis of the time taken between the control group and the experimental group across all three experiments.

@wait-time showcases a comparison between the time spent waiting for the Iris response and the remaining time within the experimental group.


#grid(columns: 2, gutter: 1em)[
  #figure(
    image("figures/overGPT.png"),
    caption: [
      Survey results of question: I prefer Iris over ChatGPT to adapt the programming exercise
    ],
  ) <overGPT>
][
  #figure(
    image("figures/potential.png"),
    caption: [
      Survey results of question: Iris' potential to improve the exercise creation process is high
    ],
  ) <potential>
]

@overGPT illustrates the statistics pertaining to the survey question "I prefer Iris over ChatGPT to adapt the programming exercise," while @potential showcases the statistics for the survey question "Iris' potential to improve the exercise creation process is high."


== Findings

While our conclusions are somewhat constrained by the small sample size, several noteworthy findings have emerged:

- Finding 1: Regardless of the complexity of the requirement, Iris consistently generates component plans that are more accurate and consistent compared to the component changes it produces.

- Finding 2: During the first experiment, the experimental group invested significantly more time than the control group. However, in subsequent experiments, the experimental group spent less time than the control group. Upon reviewing the screen recordings, we observed that a substantial portion of the initial time spent by the experimental group in Experiment 1 was devoted to becoming familiar with the use of Iris and the online code editor.

- Finding 3: The experimental group spent a considerable amount of time simply waiting for Iris to respond, including replying to requests and executing plans. This waiting time accounted for more than one-third of the total experimental duration. Improving Iris's response speed and allowing users to browse changes during plan execution could effectively reduce the time spent on adaptation exercises.

- Finding 4: Currently, users do not exhibit a clear preference between Iris and ChatGPT for adapting exercises. However, they acknowledge Iris's potential to enhance the efficiency of exercise adaptation within Artemis.

- Finding 5: Iris demonstrates strong performance when fulfilling initial requests for both component plan proposals and applied component changes. However, its performance diminishes when users request further modifications.



== Discussion


In addressing the identified inaccuracies in component changes (Finding 1), our further investigation revealed that these discrepancies primarily stem from the inherent challenges of find and replace operations. To minimize token usage, we opted for a find and replace approach instead of a complete rewrite. However, this approach presents a challenge in ensuring the accuracy of the find operation. We observed instances where, despite LLM generating fairly accurate component changes, minor inconsistencies with the original content, such as an additional space or a missing symbol, resulted in the rejection of the change during execution.

Regarding the inconsistencies in component changes (Finding 1), our exploration highlighted the impact of inconsistencies in the content of various exercise components as context. Here, we provide a brief overview of the component change generation process. We pass the four components of the exercise and the corresponding component plan to LLM, which then generates specific component change based on these contextual inputs. 

However, to allow users to review and potentially undo changes proposed by Iris, we refrain from immediately saving changes to the database. Instead, users are prompted to submit changes they agree with. However, to maintain system stability, we retrieve the content of the four components from the database and pass them to LLM. This approach inadvertently introduces inconsistencies between the current content displayed to the user and the content sent to LLM. 

While this discrepancy is negligible for initial requests, where simply following the component plan yields satisfactory results, it significantly impacts subsequent requests (Finding 5). Users refrain from submitting changes until they approve them, potentially leading to minor disruptions in component plans. Nevertheless, these plans remain generally consistent with each other, primarily due to users' clear and accurate requests facilitating LLM in generating the component plan. However, this poses a significant challenge for component changes generation, as none of the contextual inputs received by LLM are sufficiently accurate.

Regarding the waiting time for responses (Finding 3), our analysis of screen recordings revealed that it takes approximately 30 seconds to receive a response, including proposed component plans, with an additional 2-3 minutes required to complete plan execution. Users have the option to review changes during execution, provided the chat window remains open; otherwise, execution pauses. This pause decision is designed based on the user's regular behavior. Overall, it increases efficiency if users understand and can review the changes that have been made as the plan executes.

== Limitations

The evaluation presented here is constrained by the following factors:

- *Scope and Sample Limitations*
The study's scope is restricted to three experiments, two sets of programming exercises, and the collection of only four complete sets of experimental group data. This limitation constrains the generalizability of the research findings. Future studies should broaden the evaluation to encompass a wider array of practice and educational contexts, incorporating a more diverse sample of submissions.

- *Time and Computational Constraints*
The experiments were constrained by limitations in time and computational resources, including token constraints, which restricted the depth of the analyses. Subsequent research efforts should prioritize more extensive evaluations to enhance the comprehensiveness of the findings.

- *Fixed LLM Model and Configuration*
The experiments exclusively utilized one model, the OpenAI GPT4-turbo, with fixed configuration parameters, such as temperature. This fixed model and configuration may not represent the optimal choice for all scenarios. Future investigations could explore alternative models and configurations to enhance the robustness and versatility of the research outcomes.

#pagebreak()

= Summary

In the subsequent sections, we delve into the current state of the thesis, highlight key conclusions, and explore potential avenues for future research.

== Status

#let open = circle(
  radius: 0.3em,
  fill: white,
  stroke: black,
) 

#let partial = circle(
  radius: 0.3em,
  fill: gray,
  stroke: gray,
)

#let fulfilled = circle(
  radius: 0.3em,
  fill: black,
  stroke: black,
)
@status provides a comprehensive overview of the status of functional requirements of the project. The subsequent notation is employed to monitor the current state of each objective.

#grid(
  columns: 2,
  gutter: 1em,
  open, [
    *Open*: This requirement falls outside the scope of this thesis, leaving it open for future exploration.
  ],
  partial, [
    *Partially Fulfilled*: This requirement was partially achieved in the scope of this thesis.
    We suggest further effort in this domain.
  ],
  fulfilled, [
    *Fulfilled*: This requirement has been fully satisfied within the scope of this thesis.
  ]
)

#figure(
  table(
    columns: 3,
    [*ID*], [*Requirement*], [*Status*],
    [FR1], [Chat with Iris in Code Editor], fulfilled,
    [FR2], [Iris suggests plan], fulfilled,
    [FR3], [Review exercise plan], fulfilled,
    [FR4], [Modify exercise plan], open,
    [FR5], [Execute exercise plan], fulfilled,
    [FR6], [Pause and resume exercise plan], fulfilled,
    [FR7], [View plan execution error], fulfilled,
    [FR8], [View changes in Code Editor], partial,
    [FR9], [Clear chat history], fulfilled,
    [FR10], [Undo changes], open,
  ),
  caption: [
    Status of Iris Code Editor Project
  ],
) <status>


=== Realized Goals

Several goals outlined in the functional requirements have been successfully achieved. Firstly, FR1 enables users to engage in a chat with Iris directly within the Code Editor. Building upon this, FR2 introduces a feature where Iris not only comprehends user requests but also suggests a plan of action for adapting the exercise based on the user's input, displayed within the chat window. Users can thoroughly review the proposed exercise plan, as facilitated by FR3. 

Additionally, FR5 empowers users to execute the exercise plan, triggering Iris to perform actions in the specified order. The system supports user flexibility with FR6, allowing the pause and resume of the plan at any point, effectively halting or continuing Iris's actions. In case of plan execution errors (FR7), users receive prompt notifications, and the plan is automatically paused for their attention. FR8 ensures that users can readily inspect the applied changes in the Code Editor; however, it is important to note that the comparison aspect of this feature has not been fully completed. Finally, FR9 caters to user convenience by incorporating a feature that allows clearing the chat history in the chat window. 

Collectively, these achievements signify successful integration and implementation of essential features, enhancing the overall user experience within the Code Editor interface.

=== Open Goals

Considering the collaboration of two individuals in 6 months, our primary focus lies on ensuring the quality of the main feature of the project. Therefore, certain requirements have been identified as open goals within the project's scope. Specifically, FR4 involves enabling users to modify the generation plan, thereby fostering a more personalized and adaptable approach to exercise adaptation. Additionally, FR10 introduces the capability for users to undo changes made by Iris to the exercise, providing a layer of flexibility and control over the modification process. However, due to the instability of the current online code editor, implementing this requirement has proven to be more time-consuming than anticipated.


== Conclusion
This thesis addresses the challenge of the complex adaptation process for programming exercises within the Artemis platform. This complexity not only drains instructors' energy but also hinders the provision of adaptive programming exercises for effective learning. Leveraging Large Language Models (LLMs), we enhance the adaptation process of programming exercises on the Artemis platform. By doing so, we aim to improve instructors' efficiency in adapting programming exercises and enable the platform to cater to students' diverse skill levels and learning needs. 

The thesis makes a significant contribution to the academic discourse surrounding the utilization of Large Language Models (LLMs) in educational technology. Through empirical data and analysis, it offers valuable insights into the capabilities and limitations of employing LLMs for programming exercise adaptation. These findings not only enrich our understanding of LLM applications in education but also provide valuable guidance for future research endeavors in this domain.


== Future Work

In addition to the aforementioned open goals, the following steps are proposed as future enhancements for the Iris code editor feature.

=== Displaying Differences between Iris Changes and Original Content
Enhancing user experience and efficiency, users should have the ability to visualize the discrepancies between the changes proposed by Iris and the original content in real-time. This feature would provide users with a clearer understanding of the alterations made and guide their subsequent actions effectively.

=== Real-Time Sending of Exercise Content to LLM
To enhance the accuracy and consistency of component plans and changes, Iris should be capable of receiving real-time updates of exercise content, similar to those made by users. This ensures that Iris adapts based on the most up-to-date information, improving the alignment between user actions and Iris-generated suggestions.

=== Detailed Visualization of Response Process
Iris could offer a more detailed breakdown of its execution process to users, providing insights into the steps taken during response generation. This enhanced visualization would empower users with a deeper understanding of the mechanisms behind Iris's actions, fostering greater transparency and trust in the system.
