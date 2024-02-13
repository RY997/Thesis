#let abstract_en() = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(
    leading: 1em,
    justify: true
  )

  
  // --- Abstract (DE) ---
  v(1fr)
  align(center, text(font: body-font, 1em, weight: "semibold", "Abstract"))
  
  text[
    In response to the challenges posed by larger class sizes in computer science education, Artemis, an open-source learning platform, adopts interactive learning principles to enhance scalability and adaptability. However, the platform faces shortcomings in catering to the diverse skill levels and learning needs of students. This motivates the exploration of adaptive programming exercise generation, aiming to offer tailored challenges for individual learners. Adaptive exercises have the potential to both challenge advanced students and support beginners effectively, fostering intellectual growth and confidence. Leveraging advancements in Artificial Intelligence (AI), particularly Large Language Models (LLMs), this thesis introduces a novel approach to create adaptive programming exercises. The objectives include the development of a chatbot named Iris for intelligent exercise planning, enabling LLMs for dynamic exercise change plan execution, and seamlessly integrating exercise changes into the Artemis platform. This innovative methodology promises to revolutionize computer science education by providing personalized learning experiences and promoting continuous growth among students.
    ]
  
  v(1fr)
}