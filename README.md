# Open issue from Emacs

Detect issue id at current point in Emacs buffer and open it with browse-url.

```
(require 'open-issue)
(global-set-key "\M-o" 'open-issue)
;; following setting is for Redmine
;(setq open-issue-issue-regexp "#\\([0-9]+\\)")
;(setq open-issue-issue-url-format "http://www.redmine.org/issues/%s")
```

# License

GPL
