#let abstract_de() = {
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

  
  // --- Abstract (EN) ---
  v(1fr)
  align(center, text(font: body-font, 1em, weight: "semibold", "Zusammenfassung"))
  
  text[
    Als Reaktion auf die Herausforderungen, die sich aus größeren Klassen in der Informatikbildung ergeben, übernimmt Artemis, eine Open-Source-Lernplattform, interaktive Lernprinzipien, um die Skalierbarkeit und Anpassungsfähigkeit zu verbessern. Die Plattform sieht sich jedoch mit Mängeln konfrontiert, wenn es darum geht, auf die unterschiedlichen Fähigkeitsniveaus und Lernbedürfnisse der Studierenden einzugehen. Dies motiviert die Erforschung der Erzeugung adaptiver Programmieraufgaben, die darauf abzielt, maßgeschneiderte Herausforderungen für einzelne Lernende anzubieten. Adaptive Aufgaben haben das Potenzial, sowohl fortgeschrittene Studierende herauszufordern als auch Anfänger effektiv zu unterstützen, um intellektuelles Wachstum und Selbstvertrauen zu fördern. Durch die Nutzung von Fortschritten in der künstlichen Intelligenz (KI), insbesondere von großen Sprachmodellen (LLMs), stellt diese Arbeit einen neuartigen Ansatz zur Erstellung adaptiver Programmieraufgaben vor. Die Ziele umfassen die Entwicklung eines Chatbots namens Iris für die intelligente Planung von Übungen, die Ermöglichung von LLMs für die dynamische Ausführung von Übungsänderungsplänen und die nahtlose Integration von Übungsänderungen in die Artemis-Plattform. Diese innovative Methodik verspricht, die Informatikbildung durch die Bereitstellung personalisierter Lernerfahrungen zu revolutionieren und ein kontinuierliches Wachstum bei den Studierenden zu fördern.
    ]
  
  v(1fr)
}