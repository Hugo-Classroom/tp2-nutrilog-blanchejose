import Foundation

struct MockData {
    // 🥩 Protéines
    static let proteinFood = Food(
        name: "Poitrine de poulet",
        calories: 165,
        protein: 31,
        carbs: 0,
        fat: 3.6,
        desc: "Viande maigre, riche en protéines."
    )
    static let boiledEgg = Food(
        name: "Oeuf (bouilli)",
        calories: 155,
        protein: 13,
        carbs: 1.1,
        fat: 11,
        desc: "Riche en protéines et en nutriments essentiels."
    )
    static let grilledSalmon = Food(
        name: "Saumon (grillé)",
        calories: 208,
        protein: 20,
        carbs: 0,
        fat: 13,
        desc: "Riche en oméga‑3 et protéines."
    )
    static let firmTofu = Food(
        name: "Tofu (ferme)",
        calories: 76,
        protein: 8,
        carbs: 1.9,
        fat: 4.8,
        desc: "Alternative végétale riche en protéines."
    )
    static let leanBeef = Food(
        name: "Boeuf haché maigre",
        calories: 250,
        protein: 26,
        carbs: 0,
        fat: 17,
        desc: "Source de protéines et de fer."
    )

    // 🍚 Féculents
    static let rice = Food(
        name: "Riz (cuit)",
        calories: 130,
        protein: 2.7,
        carbs: 28,
        fat: 0.3,
        desc: "Source d’énergie à digestion lente."
    )
    static let pasta = Food(
        name: "Pâtes (cuites)",
        calories: 131,
        protein: 5,
        carbs: 25,
        fat: 1.1,
        desc: "Féculent classique, riche en glucides."
    )
    static let wholeWheatBread = Food(
        name: "Pain de blé entier",
        calories: 247,
        protein: 13,
        carbs: 41,
        fat: 4.2,
        desc: "Fibre et énergie durable."
    )
    static let oatmeal = Food(
        name: "Gruau (cuit)",
        calories: 71,
        protein: 2.5,
        carbs: 12,
        fat: 1.4,
        desc: "Petit-déjeuner riche en fibres."
    )
    static let sweetPotato = Food(
        name: "Patate douce",
        calories: 86,
        protein: 1.6,
        carbs: 20,
        fat: 0.1,
        desc: "Riche en vitamines et fibres."
    )

    // 🍎 Fruits
    static let apple = Food(
        name: "Pomme",
        calories: 52,
        protein: 0.3,
        carbs: 14,
        fat: 0.2,
        desc: "Fruit frais, riche en fibres."
    )
    static let banana = Food(
        name: "Banane",
        calories: 89,
        protein: 1.1,
        carbs: 23,
        fat: 0.3,
        desc: "Riche en potassium et glucides rapides."
    )
    static let orange = Food(
        name: "Orange",
        calories: 47,
        protein: 0.9,
        carbs: 12,
        fat: 0.1,
        desc: "Source de vitamine C."
    )
    static let strawberries = Food(
        name: "Fraises",
        calories: 32,
        protein: 0.7,
        carbs: 7.7,
        fat: 0.3,
        desc: "Fruits rouges riches en antioxydants."
    )
    static let avocado = Food(
        name: "Avocat",
        calories: 160,
        protein: 2,
        carbs: 9,
        fat: 15,
        desc: "Riche en bons lipides et fibres."
    )

    // 🥦 Légumes
    static let broccoli = Food(
        name: "Brocoli",
        calories: 34,
        protein: 2.8,
        carbs: 7,
        fat: 0.4,
        desc: "Légume vert riche en vitamines et fibres."
    )
    static let carrots = Food(
        name: "Carottes",
        calories: 41,
        protein: 0.9,
        carbs: 10,
        fat: 0.2,
        desc: "Riche en bêta-carotène."
    )
    static let spinach = Food(
        name: "Épinards",
        calories: 23,
        protein: 2.9,
        carbs: 3.6,
        fat: 0.4,
        desc: "Légume vert riche en fer et vitamines."
    )
    static let tomato = Food(
        name: "Tomate",
        calories: 18,
        protein: 0.9,
        carbs: 3.9,
        fat: 0.2,
        desc: "Riche en antioxydants et vitamines."
    )

    // 🍫 Collations / Autres
    static let almonds = Food(
        name: "Amandes",
        calories: 579,
        protein: 21,
        carbs: 22,
        fat: 50,
        desc: "Noix riche en bons lipides et protéines."
    )
    static let peanutButter = Food(
        name: "Beurre d’arachide",
        calories: 588,
        protein: 25,
        carbs: 20,
        fat: 50,
        desc: "Riche en protéines et matières grasses."
    )
    static let greekYogurt = Food(
        name: "Yogourt grec (nature)",
        calories: 59,
        protein: 10,
        carbs: 3.6,
        fat: 0.4,
        desc: "Riche en protéines et faible en matières grasses."
    )
    static let cheddar = Food(
        name: "Fromage cheddar",
        calories: 403,
        protein: 25,
        carbs: 1.3,
        fat: 33,
        desc: "Riche en protéines et calcium."
    )
    static let darkChocolate = Food(
        name: "Chocolat noir (70%)",
        calories: 598,
        protein: 7.8,
        carbs: 46,
        fat: 42,
        desc: "Riche en antioxydants et matières grasses."
    )

    // Collection complète
    static let foods = [
        proteinFood, boiledEgg, grilledSalmon, firmTofu, leanBeef,
        rice, pasta, wholeWheatBread, oatmeal, sweetPotato,
        apple, banana, orange, strawberries, avocado,
        broccoli, carrots, spinach, tomato,
        almonds, peanutButter, greekYogurt, cheddar, darkChocolate
    ]
}

