Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213D612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:32:14 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31f5960500bso190104197b3.14
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=n40/u3GLqmsxu4IE85pNJcP9++K4Useg8HbhXBojdL4=;
        b=Ejy4dcy+n+UiG1ME3stkb7GVIWkvAfPkX7yICgdYp6uo4aZPhzpruBJmaLzw+Ih5mH
         ORZm19of0JsfD2WIvephfVDHAeQDrCvPsHIsIorJXIkkhxLw8ljqYzZGMEBJNQpWCUIj
         nmtn2QwPeE+4USK26c7e4Pk6NUrAh2dhoZ8UFwiOhK6nfzDHl7fBy1gEROY8XU6835BX
         5A7cmK9l0/4/F/E1lc+PYknPzcn6UL6+uFnjEU48ins4A/f0FqKFYOifqDjykTdi7DpO
         RIyIJwe5rSpqMAO8DvB9PYljp6BwnsBCu/2a3CMDtzd8CYhGo3Fu8DE2G1mB7kSkvh5O
         RSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=n40/u3GLqmsxu4IE85pNJcP9++K4Useg8HbhXBojdL4=;
        b=kpIfMJn8bxuPclsFL4dxCdKZw073mj/57l05VU/YtcIr5udIAvJ37BeBpWNKOzjsyG
         riisOvyocVq7qLKR4yAKDXLit13tp8V3ArBEMRkJTOagi/u1xZwOufTSZs0ANi7F+cu8
         0czfqI5ibox9Kp5RP0/o5Wh41KDN++WSzu8iygFjVDsFKI8jdf+yGohFRhsLBNxzztpz
         OZfgESTcNLPbghZBvT4kM0sB/vrdcL49aF4oJhAUol/Ywy4ZBZ+jdEX8R/+gspFSIL4D
         nIxxLCLjWJA1XFpoZKPZBNqRp8hytiV6+ZfTzFqgJzHIvHAAE6wGfh6nLzh24bw5y5Og
         4DYA==
X-Gm-Message-State: ACgBeo1GMJOohKz2SKGdKLkw6tzjD+v4F2OX5UOm+pF+bvDmYCLqYj5D
	r3LBivx6rJKZD5vLwOIxtC4ekTPLbY61VXjkfyI=
X-Google-Smtp-Source: AA6agR4camlluRPyZn2mYh6ojH4Kd762rIUBn8UhUxj55dLf86lAaZW81nPVpp2G3nwrBRNBrndWfDsPVUijetdSaSM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a81:4e85:0:b0:33d:bff0:61d5 with SMTP
 id c127-20020a814e85000000b0033dbff061d5mr16016322ywb.111.1661902334023; Tue,
 30 Aug 2022 16:32:14 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:23 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; i=samitolvanen@google.com;
 h=from:subject; bh=le96GTO4ksz7OY+3iMudMCU1VtGoneioq6LRMofQQsk=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3O0oITmtI7+jpJD3uvEuxE/Vb20bnTEv995FKo
 30paGN+JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzgAKCRBMtfaEi7xW7vNlC/
 94mSA0DBHq+0v4mw+5uuo0Y2ojxJ/zL+w9Rh5alJcipeHeM4yHjFlM74aNV+de9n68C0gxd1RJmXtJ
 MSAtJ07toyQNsNCjTTUsoq+FoB8wmgYDpgXZanEKV8vvHFCzxBbGR5NJO6v9SeMx7pB0K47C+x8TUO
 8wHz4ISsl/GIHWwJCBXxr8QZYt7fgeRIyLsWXNmZnaoEdnegtolpq0oajuzrNqGIlMJZsd1pqd94Nj
 miHCDcFPYWWxFy4PzVkQkpSNKZiA2RvqzBFkB4ezsqNwDwpCU53ym2OKUBAcHODJs31eAN8zOQstM6
 UjqOEOj6ELOVfHte/hH4ZDtdlsYQDyw1rMOaO/5AHb3GxATMEm/KUtGS9qp6URexOEVLOKkKV+yEcl
 cXgb11U3ipEfZc8vYbIL9CjdKTrpOrVBrBskDD4tdV5DeUuOuwtxF16X2eL/p3dXp2f+5lEmuOpy6Z
 Gz3Ro7Q2ufa4cH7EShPSDMhdZgvDixQ/g+XVwcph8lCnc=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 15/21] treewide: Drop __cficanonical
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

CONFIG_CFI_CLANG doesn't use a jump table anymore and therefore,
won't change function references to point elsewhere. Remove the
__cficanonical attribute and all uses of it.

Note that the Clang definition of the attribute was removed earlier,
just clean up the no-op definition and users.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_types.h | 4 ----
 include/linux/init.h           | 4 ++--
 include/linux/pci.h            | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4f2a819fd60a..6f2ec0976e2d 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -265,10 +265,6 @@ struct ftrace_likely_data {
 # define __nocfi
 #endif
 
-#ifndef __cficanonical
-# define __cficanonical
-#endif
-
 /*
  * Any place that could be marked with the "alloc_size" attribute is also
  * a place to be marked with the "malloc" attribute. Do this as part of the
diff --git a/include/linux/init.h b/include/linux/init.h
index 88f2964097f5..a0a90cd73ebe 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -220,8 +220,8 @@ extern bool initcall_debug;
 	__initcall_name(initstub, __iid, id)
 
 #define __define_initcall_stub(__stub, fn)			\
-	int __init __cficanonical __stub(void);			\
-	int __init __cficanonical __stub(void)			\
+	int __init __stub(void);				\
+	int __init __stub(void)					\
 	{ 							\
 		return fn();					\
 	}							\
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 060af91bafcd..5da0846aa3c1 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2019,8 +2019,8 @@ enum pci_fixup_pass {
 #ifdef CONFIG_LTO_CLANG
 #define __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
 				  class_shift, hook, stub)		\
-	void __cficanonical stub(struct pci_dev *dev);			\
-	void __cficanonical stub(struct pci_dev *dev)			\
+	void stub(struct pci_dev *dev);					\
+	void stub(struct pci_dev *dev)					\
 	{ 								\
 		hook(dev); 						\
 	}								\
-- 
2.37.2.672.g94769d06f0-goog

