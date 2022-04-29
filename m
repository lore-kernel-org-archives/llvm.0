Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE551869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:17 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2d11b6259adso84561627b3.19
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RZXa52/+Ccn/FZBSGLGkE2FGb19e6hj/BpUe4CISMqY=;
        b=josmFUY6sljvn74nbHLbhRTJAUNE7yBBD98Qcf7w5EQ59pm5LnY3aEdiKslS4uyUdq
         QWXZZukalNl6IxfYG+j3MTT6SVuufgTk6h/3imVwbyFtypJ6Eb+5iu3zX7OiWNC9ee2D
         gU1FQ1Soj99CCEaCdQg9uDLpFiUCbqfluZmHnaRKKZ3ArEv1Sx4V24aJ+iEs8lBrJR7M
         C4OFl191/L8Z6I8Mod4iBF6Zpbj90sePJz8AFJfeAilDgco+WL483HO8WXxphkwVe9u+
         C2/ErRnmGzDy4hQ6Ef1n8xa1Ppzw8CJfQ/J9CE6NwUZfHasM7w1iM2pyCxDImgTQLavS
         PgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RZXa52/+Ccn/FZBSGLGkE2FGb19e6hj/BpUe4CISMqY=;
        b=3VimBZGSAOn2iiz29Q8O51EaA9jkBzcHELnBmA31Hzosbx0hqxFspX5/XPT/aCymSV
         nu/URf7e43g7j2tVgUvVOqz2U335QmAcC+OW3pm0g/W1O+BRSie1WUEgcX/TBmcOYfTM
         CLLtOsMnRWs4fTaKFFQDVSxDyrToE+ydmq4rizv1+QDFuapimz7Olx8EAYdJk5zUpBH1
         oq3NqhRDi7Go2KvqL9UlvFBHgcEfdsN2tYkB9vzRvMawcnsmiStFPSh94FS5g7l/VjTi
         RJHuXD67jGFKSNbAl6Hw4dDezXXuj7T7/ny6g3CaR0NXGiMZ6F7GV8WYgfnqkO12C8a4
         QBvg==
X-Gm-Message-State: AOAM532t/uU5y8FDMMJmputYaZyq96wZ/r3GW9AhyGwGZwGoKy+yi6o3
	XUKqhs6yqqeYQZVskeynxDVmHx9+a3HlrpJTn9M=
X-Google-Smtp-Source: ABdhPJzYWDvyPKIoG6j4qeVpD8eaxo3WYBiOn2SGRCv1SlZnlvNloHm83UTXxElMZg7DUXgIBs568v8KMUh01iV6d8E=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:187:b0:63d:9c95:edca with
 SMTP id t7-20020a056902018700b0063d9c95edcamr1205951ybh.81.1651264636219;
 Fri, 29 Apr 2022 13:37:16 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:35 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; h=from:subject;
 bh=EW4LD0wCU9ODc4AbUHEIgMCEO+Bkbwf1AVkfBUZqjt0=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExXM3pFXxbECykde0/DaTjsNNDc6R96rQVSD0FL
 7MXUJzOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVwAKCRBMtfaEi7xW7u7RC/
 4mjffA2OiXywm1kgxwD0ET4V0DIkVj3mDteDH4c0+AAADiJNYraamuovVFmW7kqZD95ZrDQ0DtWzBN
 De7f5Z9BRZNMX6MVRoo9GZ+vvVTpybMWnZxExbIai3lN4abSxarO4qyBYYddytuOn7gyGtnzCK/9T6
 fz+QovIirBiumarGHSecOncP1veI4GDHBeWLjZLhj+f+visgFFCKO3BZd+O3yCUjY79lkYmAJnKXOF
 q4s8uzinImXbHIZaD63mvPzR2dr8R/gU36JxBAIE4D84O9KH2YyUpSl7DUuDJo+y3ty8PQ61/7hh3n
 GVilTp+N13t+4iSU/hLKu3hczF8y7OLaIjw+//vL/DV9uKs4+sgDgrob11gvGDZHpUd/4udw+ihg7k
 IwIiS0ak6/a21tSjs4EolviB/Au3/qiKjXvicRjakYv6pd9r5zR2TpEWYQ9HMxDaDTl52r3Y56gYVX
 6Q07g4a5BTbZvyMK4W4T30XQuWwzx6kapZdydxqypIsT0=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 12/21] treewide: Drop __cficanonical
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

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/compiler_types.h | 4 ----
 include/linux/init.h           | 4 ++--
 include/linux/pci.h            | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 1c2c33ae1b37..bdd2526af46a 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -263,10 +263,6 @@ struct ftrace_likely_data {
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
index baf0b29a7010..76058c9e0399 100644
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
index 60adf42460ab..3cc50c4e3c64 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2021,8 +2021,8 @@ enum pci_fixup_pass {
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
2.36.0.464.gb9c8b46e94-goog

