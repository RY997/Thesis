#let acknowledgement() = {
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

  set par(leading: 1em)

  
  // --- Acknowledgements ---
  align(left, text(font: sans-font, 2em, weight: 700,"Acknowledgements"))
  text[
I would like to express my heartfelt gratitude to the following people, whose contributions were indispensable in bringing this thesis to fruition:

To Prof. Dr. Stephan Krusche, for his invaluable guidance and unwavering support throughout this project.

To my thesis advisor, Patrick Bassner, for his mentorship and encouragement, which helped me navigate through the challenges of this thesis.

To my project partner, Michael Dyer, for his hard work, dedication, and countless hours spent collaborating with me which were instrumental to the success of this project.

To Timor Morrien, for his invaluable assistance and insightful advice during the development of this thesis.

To participants of the Interactive Learning practical course (Summer Semester 2023), for their dedication and efforts in founding the Iris project, laying the groundwork for the success of this thesis.

To members of the Artemis developer team: for their meticulous review and constructive feedback on this thesis project.

To my friends, Yanjie Li and Basak Akan, for their encouragement, which was a source of strength during challenging times throughout this project.

To my parents, for their unconditional love and unwavering support.

  ]
  v(15mm)
}