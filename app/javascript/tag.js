document.addEventListener("DOMContentLoaded", () => {
  const tagNameInput = document.querySelector("#product_form_tag_name");
  if (tagNameInput){
    const inputElement = document.getElementById("product_form_tag_name");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("product_form_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/products/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("product_form_tag_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  };
});