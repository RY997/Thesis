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
    I would like to extend my sincere gratitude to the following people, without
whom this thesis would not have been possible:

To Prof. Dr. Stephan Krusche, for his motivating and supportive supervision of
this project.

To my thesis advisor Patrick Bassner, for his encouraging mentorship and for
helping me to stay on track.

To my project partner Xinyao Liu, for her hard work and dedication and for
spending many long hours with me working on this project.

To Timor Morrien, whom Xinyao and I have been working closely with on the
Iris project, for his invaluable assistance and advice in the development of this
thesis.

To the participants of the Interactive Learning practical course in the Summer
Semester of 2023, for their hard work and dedication in founding the Iris
project. I am proud to have been a part of this team.

To the members of Artemis developer team, for their careful review and feedback of this thesis project.

And finally, to my parents, for their unconditional love and support.
  ]
  v(15mm)
}