
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "André M. Silva"
#let locale-catalog-page-numbering-style = context { "André M. Silva - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in June 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= André M. Silva

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)CAUP, Rua das Estrelas, 4150-762 Porto, Portugal],
  [#box(original-link("mailto:Andre.Silva@astro.up.pt")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)Andre.Silva\@astro.up.pt])],
  [#box(original-link("https://orcid.org/0000-0003-4920-738X")[#fa-icon("orcid", size: 0.9em) #h(0.05cm)0000-0003-4920-738X])],
  [#box(original-link("https://github.com/Kamuish")[#fa-icon("github", size: 0.9em) #h(0.05cm)Kamuish])],
)
#connections(connections-list)



== Short Bio


#one-col-entry(
  content: [I am André Silva, a postdoctoral researcher at the Instituto de Astrofísica e Ciências do Espaço. My research spans instrumentation and exoplanetary science. I am currently working on the PoET solar telescope, leading the development of its observation software. In parallel, I focus on the development of novel algorithms for precise radial velocity extraction and analyze systematic effects that impact such measurements. Over the past three years, I have lectured an advanced course on Python, a Master's-level course on Bayesian statistics, and a PhD-level module on high-resolution spectroscopy.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[Faculdade de Ciências], Doctor's Degree in Astronomy
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis - A new paradigm for the estimation of precise stellar radial velocities],)
  ],
  right-content: [
    Universidade do Porto

2019 – 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MsC]],
  middle-content: [
    #strong[Faculdade de Ciências], Mestrado Integrado em Engenharia Física
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis - An expansion to the CHEOPS mission official pipeline.],)
  ],
  right-content: [
    Universidade do Porto

2014 – 2019
  ],
)



== Awards


#two-col-entry(
  left-content: [
    #link("https://www.iau.org/Iau/News/Ann2025/ann25017.aspx")[#strong[IAU PhD Prize 2024]], Division B
  ],
  right-content: [
    2025
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Awarded the PhD Prize 2024 from the International Astronomical Union \(IAU\) Division B \(Facilities, Technologies, and Data Science\) for the work developed during my PhD thesis.],)
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Instituto de Astrofísica e Ciências do Espaço], Post-doctoral researcher
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Development of the observational software for the PoET solar telescope.],)
  ],
  right-content: [
    CAUP

Nov 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Faculdade Ciências da Universidade do Porto], Invited Assistant Professor
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Invited assistant to teach a PhD-level unit on high-resolution spectroscopy],)
  ],
  right-content: [
    Physics department

Nov 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Faculdade de Ciências da Universidade de Lisboa], Post-doctoral researcher
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Development of software to measure day-time seeing, under the FIERCE ERC project],)
  ],
  right-content: [
    FCiências.ID

Aug 2024 – Nov 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Faculdade Ciências da Universidade do Porto], Invited assistant
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Invited assistant for the practical classes of MsC-level unit on Bayesian data analysis.],)
  ],
  right-content: [
    Physics department

Feb 2024 – Sept 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Instituto de Astrofísica e Ciências do Espaço], PhD fellow
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([FCT funding for the PhD thesis \"A new paradigm for the estimation of precise stellar radial velocities\"],)
  ],
  right-content: [
    Physics department

2019 – July 2024
  ],
)



== Talks


#two-col-entry(
  left-content: [
    #link("https://plato-esp2025.sciencesconf.org/?lang=en")[#strong[Planets throughout the Habitable Zone]], A systematic bias in template-based RV extraction algorithms
  ],
  right-content: [
    June 2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://www.iastro.pt/research/conferences/poet2024/")[#strong[PoET workshop 2]], 2 talks: PoET observation software; Observing strategies and their role in the improvement of RV analysis
  ],
  right-content: [
    Nov 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("http://www.iastro.pt/research/conferences/toe3-2023/")[#strong[TOI III]], Approaches for RV extraction -- s-BART and the first steps towards a fully Bayesian model
  ],
  right-content: [
    July 2023
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://conference.ipac.caltech.edu/eprv5/")[#strong[EPRV 5]], Towards a fully Bayesian RV extraction model
  ],
  right-content: [
    Mar 2023
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Exoplanets 4 EPRV splinter], sBART application to the ESPRESSO WG1 targets
  ],
  right-content: [
    Feb 2023
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ESPRESSO science team meeting], s BART  a semi Bayesian implementation of template matching for precise Radial Velocities
  ],
  right-content: [
    May 2022
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Seminars


#two-col-entry(
  left-content: [
    #strong[Astronomy department, Uni. of Geneva], Avenues for radial velocity extraction -- s-BART & PoET
  ],
  right-content: [
    Jan 2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ESA research seminar, European Space Agency \(Madrid\)], Towards an improvement in the characterisation of stellar radial velocities
  ],
  right-content: [
    May 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://indico.lip.pt/category/38/")[Café com Física]  Departamento de Fisica da Universidade de Coimbra], The \(radial\) velocity of stars - detection and characterisation of exoplanets
  ],
  right-content: [
    Mar 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Supervision


#two-col-entry(
  left-content: [
    #strong[Transforming H-alpha images of the Sun in astronomical seeing for the PoET solar telescope], Supervisor

    
  ],
  right-content: [
    Undergraduate project

Feb 25 - now
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Looking at the Sun, finding other Earths - Identification of Solar Regions], Co-supervisor

    
  ],
  right-content: [
    MsC thesis

Oct 22 - Nov 23
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of a GUI interface for the exploitation of data from the s-BART pipeline], Co-supervisor

    
  ],
  right-content: [
    Undergraduate project

Feb 2024 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Solar-to-sky coordinate conversion for PoET operations], Co-supervisor

    
  ],
  right-content: [
    Undergraduate project

Feb 2024 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Exoplanet detection through a new model for the correction of instrumental effects], Co-supervisor

    
  ],
  right-content: [
    Undergraduate project

Feb 2024 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of a tool for the normalization of stellar spectra - application to ESPRESSO data], Co-supervisor of BII project with ref #link("https://www.astro.up.pt/caup/index.php?WID=142&CID=1&Lang=pt")[CIAAUP-03\/2023-BII]

    
  ],
  right-content: [
    Funded project

Feb 2024 – July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A new activity proxy for finding other Earths], Co-supervisor

    
  ],
  right-content: [
    Bachelors project

Nov 2022 – Feb 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[An analysis of the performance of CHEOPS mission pipelines - the DRP and archi], Co-supervisor

    
  ],
  right-content: [
    Bachelors project

Feb 2020 – June 2020
  ],
)



== First Author Publications


#two-col-entry(
  left-content: [
    #strong[A novel framework for semi-Bayesian radial velocities through template matching]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[archi: pipeline for light curve extraction of CHEOPS background stars]

  ],
  right-content: [
    2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al])



== Co-authored Publications


#two-col-entry(
  left-content: [
    #strong[PoET: the Paranal solar ESPRESSO Telescope]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Santos et al; \(Published in The Messenger vol. 194, #link("http://dx.doi.org/10.18727/0722-6691/5381")[10.18727\/0722-6691\/5381]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[TOI-512: Super-Earth transiting a K-type star discovered by TESS and ESPRESSO]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Rodrigues et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202452887")[10.1051\/0004-6361\/202452887]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[TESS and HARPS-N unveil two planets transiting TOI-1453: A super-Earth and one of the lowest mass sub-Neptunes]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Stalport et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202452969")[10.1051\/0004-6361\/202452969]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Planet Candidate Orbiting near the Hot Jupiter TOI-2818 b Inferred through Transit Timing]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);McKee et al; \(ApJ, #link("http://dx.doi.org/10.3847/1538-4357/adac63")[10.3847\/1538-4357\/adac63]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Revisiting the multi-planetary system of the nearby star HD 20794: Confirmation of a low-mass planet in the habitable zone of a nearby G-dwarf]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Nari et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202451769")[10.1051\/0004-6361\/202451769]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A sub-Earth-mass planet orbiting Barnard’s star: No evidence of transits in TESS photometry]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Stefanov et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202452450")[10.1051\/0004-6361\/202452450]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[KOBE-1: The first planetary system from the KOBE survey: Two planets likely residing in the sub-Neptune mass regime around a late K-dwarf]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Balsalobre-Ruza et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202452631")[10.1051\/0004-6361\/202452631]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Characterization of K2-167 b and CALM, a new stellar activity mitigation method]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);De Beurs et al; \(Monthly Notices of the Royal Astronomical Society, #link("http://dx.doi.org/10.1093/mnras/stae207")[10.1093\/mnras\/stae207]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Expanding the frontiers of cool-dwarf asteroseismology with ESPRESSO: Detection of solar-like oscillations in the K5 dwarf ϵ Indi]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Campante et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202449197")[10.1051\/0004-6361\/202449197]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[TESS and ESPRESSO discover a super-Earth and a mini-Neptune orbiting the K-dwarf TOI-238]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Suárez Mascareño et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202348958")[10.1051\/0004-6361\/202348958]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Confronting compositional confusion through the characterisation of the sub-Neptune orbiting HD 77946]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Palethorpe et al; \(Monthly Notices of the Royal Astronomical Society, #link("http://dx.doi.org/10.1093/mnras/stae707")[10.1093\/mnras\/stae707]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The compact multi-planet system GJ 9827 revisited with ESPRESSO]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Passegger et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202348592")[10.1051\/0004-6361\/202348592]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Implementation of a seeing measurement device for the PoET solar telescope]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Wehbé et al; \(Proc. SPIE , #link("http://dx.doi.org/10.1117/12.3017481")[10.1117\/12.3017481]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PoET, the Paranal solar ESPRESSO Telescope: a spatially resolved Sun in a high resolution spectrograph]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Leite et al; \(Proc. SPIE , #link("http://dx.doi.org/10.1117/12.3016776")[10.1117\/12.3016776]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ESPRESSO reveals blueshifted neutral iron emission lines on the dayside of WASP-76 b]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Costa Silva et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202449935")[10.1051\/0004-6361\/202449935]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A sub-Earth-mass planet orbiting Barnard’s star]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);González Hernández et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202451311")[10.1051\/0004-6361\/202451311]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Two temperate Earth-mass planets orbiting the nearby star GJ1002]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Mascareño et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202244991")[10.1051\/0004-6361\/202244991]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[An unusually low-density super-Earth transiting the bright early-type M-dwarf GJ 1018 \(TOI-244\)]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Castro-González et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202346550")[10.1051\/0004-6361\/202346550]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[KOBEsim: A Bayesian observing strategy algorithm for planet detection in radial velocity blind-search surveys]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Balsalobre-Ruza et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202243938")[10.1051\/0004-6361\/202243938]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Automatic model-based telluric correction for the ESPRESSO data reduction software: Model description and application to radial velocity computation]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Allart et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202243629")[10.1051\/0004-6361\/202243629]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A candidate short-period sub-Earth orbiting Proxima Centauri]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Faria et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202142337")[10.1051\/0004-6361\/202142337]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The KOBE experiment: K-dwarfs Orbited By habitable Exoplanets: Project goals, target selection, and stellar characterization]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Lillo-Box et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202243898")[10.1051\/0004-6361\/202243898]\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[HD22496b: the first ESPRESSO standalone planet discovery]

  ],
  right-content: [
    2021
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Lillo-Box et al; \(A&A, #link("http://dx.doi.org/10.1051/0004-6361/202141714")[10.1051\/0004-6361\/202141714]\)])



== Posters


#two-col-entry(
  left-content: [
    #strong[The Paranal solar ESPRESSO Telescope - towards a resolved view of the Sun]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Leiden, Exoplanets 5])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A fully-Bayesian model for RV extraction]

  ],
  right-content: [
    2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Leiden, Exoplanets 5])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Bayesian template matching approach applied to HARPS : towards the improvement of the RV precision]

  ],
  right-content: [
    2021
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Online, European Astronomical Society Annual meeting 2021])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A semi-Bayesian implementation of template matching for precise Radial Velocities]

  ],
  right-content: [
    2021
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Online, Statistical challenges in Modern astronomy VII])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A semi-Bayesian implementation of template matching for precise Radial Velocities]

  ],
  right-content: [
    2021
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Online, Encontro Ciência 21])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ARCHI: pipeline for light curve extraction of CHEOPS background stars]

  ],
  right-content: [
    2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Online, Europlanet Science Congress 2020])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Bayesian approach to precise Radial Velocities]

  ],
  right-content: [
    2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);André M. Silva et al, Online, 30th Encontro Nacional de Astronomia e Astrofísica])



== Grants


#two-col-entry(
  left-content: [
    #strong[Post-doctoral fellowship]
  ],
  right-content: [
    Aug-Nov 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Software development for the PoET telescope, funded by the FIERCE ERC project, grant number 101052347, Faculdade de Ciências da Universidade de Lisboa])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PhD fellowship, Fundação para a Ciência e Tecnologia \(FCT\)]
  ],
  right-content: [
    2021-2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\"A new paradigm for the estimation of precise stellar radial velocities - towards the development of an innovative data analysis software\", Ref. 2020.05387.BD])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[FLAD grant]
  ],
  right-content: [
    2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Fund travel to the EPRV V conference in Santa Bárbara, California, PAPERS 4 USA, Ref. 2023\/052])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research fellowship]
  ],
  right-content: [
    Nov-Dec 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [field of Planetary Systems at Instituto de Astrofísica e Ciências do Espaço, Ref. IA2019-17-BIM])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Scientific Initiation Studenship]
  ],
  right-content: [
    Apr-Sep 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [field of Computacional Astrophysics at Instituto de Astrofísica e Ciências do Espaço, Ref. IA2019-04-BIC])], column-gutter: 0cm)
  ],
)



== Organization


#two-col-entry(
  left-content: [
    #strong[Co-organizer of PoET's Working Group 1 - Radial velocities]
  ],
  right-content: [
    2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SoC of Dias da Física 2025]
  ],
  right-content: [
    2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Part of the Local Organization committee of EPRV6]
  ],
  right-content: [
    2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Outreach


#two-col-entry(
  left-content: [
    #strong[Ignite sessions; '#link("https://divulgacao.iastro.pt/pt/evento/ignite-iastro-torres-vedras/")[Torres Vedras]; #link("https://divulgacao.iastro.pt/en/evento/ignite-iastro-ilhavo-en/")[Ílhavo]; Armamar']
  ],
  right-content: [
    2023-2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Outreach talks to highschool students: Espaço vai à Escola - Descoberta de outra Terra - deteção de planetas fora do sistema solar ]
  ],
  right-content: [
    2022-2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [2022 \(3 talks\); 2023 \(5 online; 5 in-person\); 2024 \(6 online; 4 in-person\)])], column-gutter: 0cm)
  ],
)



