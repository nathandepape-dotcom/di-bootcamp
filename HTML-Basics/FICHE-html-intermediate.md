# 📘 HTML Intermediate — Fiche de révision (Bootcamp Prep DI)

> Résumé de coach des 7 vidéos + 4 leçons écrites + 3 exercices + le quiz.
> Source : Octopus DI — course/358, section/931.

---

## 🎯 THÉORIE

### Bloc 1 : Les FORMULAIRES (`<form>`)

Un formulaire sert à **envoyer des données**. Structure de base :

```html
<form action="#" method="get">
  <label for="firstname">First Name:</label>
  <input type="text" id="firstname" name="firstname" required>
  <input type="submit" value="Register">
</form>
```

**L'attribut `action`** = où envoyer les données (`#` = nulle part).
**L'attribut `method`** :
- `get` (défaut) → données **visibles dans l'URL** (query string). Court, non-sensible.
- `post` → données **invisibles** (dans le corps de la requête). Long, sécurisé.

### Bloc 2 : Les types d'`<input>`

| Type | Rôle |
|---|---|
| `text` | Champ texte standard |
| `password` | Champ masqué (caractères cachés) |
| `email` | Valide automatiquement la présence d'un `@` |
| `date` | Sélecteur de date |
| `radio` | Bouton radio (un seul choix par **groupe de `name` identique**) |
| `checkbox` | Case à cocher (plusieurs choix possibles) |
| `submit` | Bouton d'envoi (texte via `value`) |
| `reset` | Bouton qui vide le formulaire |

**Attributs importants :**
- `name` → **obligatoire** pour que la valeur soit envoyée (c'est la « propriété »)
- `value` → la valeur envoyée / le texte du bouton
- `required` → champ obligatoire (pas besoin de valeur, `required` = true)
- `min` → minimum (ex. longueur de mot de passe)

⚠️ `<input>` est **auto-fermante**.

### Bloc 3 : Autres éléments de formulaire

```html
<!-- Menu déroulant -->
<select name="cars">
  <option value="volvo">Volvo</option>
  <option value="audi">Audi</option>
</select>

<!-- Zone de texte multi-lignes -->
<textarea rows="5" cols="20">Texte initial</textarea>

<!-- Étiquette liée à un champ -->
<label for="email">Email:</label>
```

- `<select>` + `<option>` = **liste déroulante**. L'attribut `multiple` autorise plusieurs choix.
- `<option selected>` = option pré-sélectionnée.
- `<textarea>` = grande zone de texte multi-lignes.

### Bloc 4 : Les TABLEAUX

```html
<table>
  <thead>
    <tr><th>Heading1</th><th>Heading2</th></tr>
  </thead>
  <tbody>
    <tr><td>Content1</td><td>Content2</td></tr>
  </tbody>
  <tfoot>
    <tr><td>Total</td><td>100</td></tr>
  </tfoot>
</table>
```

| Balise | Rôle |
|---|---|
| `<table>` | Englobe tout le tableau |
| `<tr>` | **Table row** — une ligne |
| `<th>` | **Table header** — cellule d'en-tête (gras, centré) |
| `<td>` | **Table data** — cellule de données |
| `<thead>` `<tbody>` `<tfoot>` | En-tête / corps / pied du tableau |

### Bloc 5 : HTML vs HTML5 & HTML sémantique

**HTML5** = dernière évolution d'HTML. Objectifs :
- **Rétrocompatibilité** (les vieux sites de 1991 marchent encore)
- Nouvelles fonctionnalités (média, inputs, sémantique)

**HTML sémantique** = utiliser des balises **qui décrivent leur contenu** (au lieu de `<div>` partout). Ça n'a **aucun effet visuel** — c'est pour les développeurs, les lecteurs d'écran et les **moteurs de recherche** (SEO).

| Balise sémantique | Rôle |
|---|---|
| `<header>` | En-tête de page |
| `<nav>` | Navigation (menu de liens) |
| `<section>` | Section de page |
| `<article>` | Contenu indépendant (un article de blog) |
| `<aside>` | Contenu à côté (barre latérale) |
| `<footer>` | Pied de page |

**Non-sémantique** : `<div>` (bloc) et `<span>` (inline) — conteneurs génériques, utiles surtout avec CSS.

### Bloc 6 : Média HTML5

```html
<video src="kitties.mp4" controls></video>
<audio src="meow.mp3" controls></audio>
<iframe src="https://youtube.com/embed/..."></iframe>
```

- Attributs `<video>`/`<audio>` : `controls`, `autoplay`, `loop`, `muted`, `width`, `height`, `poster` (image d'aperçu).
- `<iframe>` = intègre **une autre page** dans la tienne (ex. une vidéo YouTube).

### Bloc 7 : Les commentaires

```html
<!-- Ceci est un commentaire, invisible à l'écran -->
```
Raccourci éditeur : **Cmd + /** (Mac) ou **Ctrl + /** (Windows/Linux).

---

## 🔨 EXERCICES

### Exercice 1 — `programming-langages.html`

Dossier : `DI-Bootcamp-Stage1/HTML-Intermediate/`

**Contenu demandé** (avec les balises à déduire) :
- `<header>` avec une `<nav>` : liens *Home, About, Contact*
- `<article>` 1 : « 1995 was a pretty crazy year for programming languages! » + phrase « Don't believe me? Just check this table out: »
- Un **TABLEAU** avec colonnes `Language | Designed By | First Appeared` et 6 lignes :

| Language | Designed By | First Appeared |
|---|---|---|
| C++ | Bjarne Stroustrup | 1983 |
| Python | Guido van Rossum | 1991 |
| Ruby | Yukihiro Matsumoto ('Matz') | 1995 |
| JavaScript | Brendan Eich | 1995 |
| Java | James Gosling | 1995 |
| PHP | Rasmus Lerdorf | 1995 |

- `<article>` 2 : « Coming soon... »
- Un **FORMULAIRE** de contact :
  - « Contact us! » puis « General Information »
  - Champs : *First Name, Last Name, Email, Date Of Birth*
  - « Essential Questions » → « What kind of work do you need? » avec **cases à cocher** : Programming, Design, Singing, Comedy
  - « How interested are you in our design skills? » → champ avec options : Very Low, Low, Medium, High, Very High
  - Bouton « Submit me! »
- `<footer>` avec le copyright **`&copy;`**

### Exercice 2 — `media.html`

Même dossier. Créer une page qui affiche :
- Un **audio** (`<audio controls>`)
- Une **vidéo** (`<video controls>`)
- Télécharger tes propres fichiers média dans le dossier `HTML-Intermediate`

### 📝 HTML Quiz
- Durée : **25 min** — Seuil de réussite : **70 %**
- Couvre : éléments HTML, formulaires, sémantique HTML5

---

## ✅ Check-list Exercice 1
- [ ] Dossier `DI-Bootcamp-Stage1/HTML-Intermediate/` créé
- [ ] `programming-langages.html` créé
- [ ] `<header>` + `<nav>` avec 3 liens
- [ ] Tableau avec en-têtes (`<th>`) et 6 lignes de données
- [ ] Formulaire avec champs texte, cases à cocher, bouton
- [ ] `<footer>` avec `&copy;`
