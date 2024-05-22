;;; early-init.el --- self-explanatory -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Just about every config out there sets this to a higher value than standard.
;; It is unclear to me which one is most appropriate, and on what factors this
;; depends ( i've seen values between 16 and 100 mb ), nor whether it should be
;; set in the early-init.
;; Nonetheless this is as good a place and value as any.
(setq gc-cons-threshold (* 24 1024 1024))

;;; early-init.el ends here
