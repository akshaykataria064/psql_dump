function convertMarkdown() {
  let html = document.getElementById('markdown-input').value;
  html = html.replace(/^\s*#\s(.+)$/gm, "<h1>$1</h1>");
  html = html.replace(/^\s*#{2}\s(.+)$/gm, "<h2>$1</h2>");
  html = html.replace(/^\s*#{3}\s(.+)$/gm, "<h3>$1</h3>");
  html = html.replace(/\*\*(.+)\*\*/gm, "<strong>$1</strong>");
  html = html.replace(/__(.+)__/gm, "<strong>$1</strong>");
  html = html.replace(/\*(.+)\*/gm, "<em>$1</em>");
  html = html.replace(/_(.+)_/gm, "<em>$1</em>");
  html = html.replace(/!\[(.+)\]\((.+)\)/gm, '<img alt="$1" src="$2">');
  html = html.replace(/\[(.+)\]\((.+)\)/gm, '<a href="$2">$1</a>');
  html = html.replace(/^\s*>\s(.+)$/gm, '<blockquote>$1</blockquote>');

  const htmlOutput = document.getElementById("html-output");
  const preview = document.getElementById("preview");

  htmlOutput.textContent = html;
  preview.innerHTML = html;

  return html
}

const markdownInput = document.getElementById('markdown-input');
markdownInput.addEventListener("input", convertMarkdown);