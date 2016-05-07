# Open issue from Emacs

Detect issue id at current point in Emacs buffer and open it with browse-url.
You can use it to open issue in JIRA, Redmine, etc from issue id in your commit messages.

```
(require 'open-issue)
(global-set-key "\M-o" 'open-issue)
;; for JIRA (use default value of open-issue-issue-regexp)
;(setq open-issue-issue-url-format "https://jira.atlassian.com/browse/%s")
;; for Redmine
;(setq open-issue-issue-regexp "#\\([0-9]+\\)")
;(setq open-issue-issue-url-format "http://www.redmine.org/issues/%s")
```

# License

GPL
