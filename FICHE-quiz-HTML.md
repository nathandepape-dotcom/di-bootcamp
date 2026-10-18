# 📘 Fiche de révision — HTML Quiz

> Résumé condensé pour le quiz (éléments, formulaires, sémantique, tableaux, média).
> Seuil : 70 % · 25 min.

---

## 1. Structure d'un document HTML

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Mon titre</title>
</head>
<body>
  ... tout le contenu visible ici ...
</body>
</html>
```

- `<!DOCTYPE html>` = **déclaration** (pas une balise HTML) → dit au navigateur que c'est du HTML5.
- `<head>` = infos **invisibles** (titre, encodage).
- `<body>` = contenu **visible**.

---

## 2. Éléments de texte (les bases)

| Balise | Rôle |
|---|---|
| `<h1>` … `<h6>` | Titres (h1 = le plus important, un seul h1 par page) |
| `<p>` | Paragraphe |
| `<br>` | Saut de ligne (⚠️ auto-fermante) |
| `<strong>` ou `<b>` | Gras |
| `<em>` ou `<i>` | Italique |
| `<ul>` / `<ol>` | Liste à puces / liste numérotée |
| `<li>` | Élément de liste |
| `<a href="url">` | Lien |
| `<img src="..." alt="...">` | Image (⚠️ auto-fermante, `alt` = texte alternatif) |

---

## 3. Les tableaux

**Règle d'or : on construit ligne par ligne.**

| Balise | Rôle |
|---|---|
| `<table>` | conteneur |
| `<tr>` | **une ligne** (table row) |
| `<th>` | cellule d'**en-tête** (gras, centré) |
| `<td>` | cellule de **donnée** |
| `<thead>` `<tbody>` `<tfoot>` | en-tête / corps / pied |

```html
<table>
  <tr><th>Col1</th><th>Col2</th></tr>
  <tr><td>A</td><td>B</td></tr>
</table>
```

---

## 4. Les formulaires ⭐ (le gros morceau)

```html
<form action="#" method="get">
  <label for="nom">Nom</label>
  <input type="text" id="nom" name="nom" required>
  <input type="submit" value="Envoyer">
</form>
```

### Attributs du `<form>`
- `action="#"` = où envoyer (`#` = nulle part).
- `method="get"` → données **visibles dans l'URL** (court, non-sensible).
- `method="post"` → données **invisibles** (long, sécurisé).

### Types d'`<input>` (⚠️ auto-fermante)
| Type | Rôle |
|---|---|
| `text` | texte simple |
| `password` | texte masqué |
| `email` | vérifie le `@` |
| `date` | sélecteur de date |
| `radio` | **un seul choix** par groupe |
| `checkbox` | **plusieurs choix** possibles |
| `submit` | bouton d'envoi (texte via `value`) |
| `reset` | vide le formulaire |

### ⚠️ Checkbox vs Radio (piège classique)
| | Checkbox | Radio |
|---|---|---|
| Choix | **plusieurs** | **un seul** |
| `name` | identique | identique |
| `value` | différent | différent |

→ C'est le **`type`** + le `name` identique qui fait la différence, PAS la value.

### Autres éléments
- `<select>` + `<option>` = **liste déroulante** (`<option selected>` = pré-sélectionné).
- `<textarea rows="5" cols="20">` = zone de texte multi-lignes.
- `<label for="id">` = étiquette liée au champ (doit correspondre à l'`id`).

### Attributs utiles
- `name` → **obligatoire** pour que la valeur soit envoyée.
- `value` → la valeur envoyée / le texte du bouton.
- `required` → champ obligatoire.
- `placeholder` → texte d'exemple grisé.

---

## 5. HTML sémantique (HTML5)

Des balises qui **décrivent leur contenu** (au lieu de `<div>` partout). Aucun effet visuel, mais aide SEO + accessibilité.

| Balise | Rôle |
|---|---|
| `<header>` | en-tête |
| `<nav>` | menu de navigation |
| `<section>` | section |
| `<article>` | contenu indépendant |
| `<aside>` | contenu à côté (barre latérale) |
| `<footer>` | pied de page |

**Non-sémantique** : `<div>` (bloc) et `<span>` (inline) — conteneurs génériques.

---

## 6. Média HTML5

```html
<video src="film.mp4" controls></video>
<audio src="son.mp3" controls></audio>
<iframe src="https://..."></iframe>
```

- Attributs : `controls`, `autoplay`, `loop`, `muted`, `width`, `height`.
- `<iframe>` = intègre **une autre page** dans la tienne.

---

## 7. Commentaires & entités

```html
<!-- ceci est un commentaire, invisible -->
```
- `&copy;` = © · `&amp;` = & · `&lt;` = < · `&gt;` = >

---

## 8. Les 7 points pièges à retenir

1. `<input>`, `<img>`, `<br>` sont **auto-fermantes** → pas de `</input>`.
2. **Radio** = un seul choix ; **checkbox** = plusieurs. Même `name`, `value` différente.
3. `get` = URL visible ; `post` = caché/sécurisé.
4. Un tableau se construit **ligne par ligne** (`<tr>`), pas colonne par colonne.
5. `<label for="x">` doit pointer vers un `id="x"` identique.
6. La sémantique n'a **aucun effet visuel** — c'est du sens, pas du style.
7. `&copy;` s'écrit en entité HTML, pas en caractère collé.
