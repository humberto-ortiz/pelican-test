title: Rendering mathematical equations with mathjax
date: 2013-11-23 19:43
slug: mathjax
category: Blog
tags: hacking, learning
---
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

   <a href="https://github.com/chrisrodz">Christian A. Rodriguez</a> showed me his MathJax enabled pages, and I just
   found out org-mode supports mathjax too. You just put latex
   equations in html, and load the javascript. It renders the equation
   in any browser.

   Here's an example from the <a href="http://www.mathjax.org/">MathJax home page</a>:

   The raw latex:
```
   $$ J_\alpha(x) = \sum\limits_{m=0}^\infty \frac{(-1)^m}{m! \,
   \Gamma(m + \alpha + 1)}{\left({\frac{x}{2}}\right)}^{2 m + \alpha} $$
```

Renders into:
   $$ J_\alpha(x) = \sum\limits_{m=0}^\infty \frac{(-1)^m}{m! \,
   \Gamma(m + \alpha + 1)}{\left({\frac{x}{2}}\right)}^{2 m + \alpha} $$
