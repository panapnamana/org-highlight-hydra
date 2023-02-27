# org-highlight-hydra
A pop-up menu for highlighting in org-mode.

![Screenshot from 2023-02-25 22-27-56](https://user-images.githubusercontent.com/60448228/221513856-919ca66f-7daf-48ae-970b-6532ccbd1be5.png)

Note: The colorful highlighting options are not made with exporting in mind! If anything works in exporting it is either due to the already present functionality in org-mode or org-extra-emphasis.

Thank you: The heavy lifting was done by both, org-extra-emphasis.el (see https://github.com/QiangF/org-extra-emphasis) and hydra.el (see https://github.com/abo-abo/hydra).

Installing:

General Steps:
Emacs has to load (1) the altered version of org-extra-emphasis.el, (2) hydra.el and (3) org-highlight-hydra.el.

(1) Go to my fork of org-extra emphasis: https://github.com/panapnamana/org-extra-emphasis-highlight-hydra
Grap (download/copy-paste/or whatever) org-extra-emphasis.el and put into /your-path/your-folder/

(2) Install hydra.el with the method of your choice

(3) Grap org-highlight-hydra.el and put it into the above folder (or not :D)


Load the code from org-extra-emphasis.el and org-highlight-hydra in your .emacs (or preferred config-file) with:

    (load-file "/your-path/your-folder/org-extra-emphasis.el")
    (load-file "/your-path/your-folder/org-highlight-hydra.el")
    
Also set the highlighting colors, either through the menu or quick and dirty by coying this:

    (custom-set-faces
     '(org-default ((t (:inherit default))))
     '(org-extra-emphasis ((t (:inherit default))))
     '(org-extra-emphasis-01 ((t (:foreground "black" :background "gold" :inherit org-extra-emphasis))))
     '(org-extra-emphasis-02 ((t (:foreground "black" :background "lightgreen" :inherit org-extra-emphasis))))
     '(org-extra-emphasis-03 ((t (:foreground "black" :background "SkyBlue2" :inherit org-extra-emphasis))))
     '(org-extra-emphasis-04 ((t (:foreground "black" :background "salmon" :inherit org-extra-emphasis))))
     '(org-extra-emphasis-05 ((t (:foreground "black" :background "red" :inherit org-extra-emphasis))))
     '(org-extra-emphasis-06 ((t (:foreground "black" :background "yellow" :inherit org-extra-emphasis)))))
    
Note that I set the key-binding for the hydra inside the org-highlight-hydra.el file to "C-c h".

I hope this works. I tested it with emacs -q, so it probably should. Enjoy!
