Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10FC610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:46 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-34577a9799dso84600517b3.6
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=P5XeXy2GIaSKYLkYAqglVvjH3kuWJ9tPWJSwe0Lo+wY=;
        b=hx62HzwiHzddRJHYtkXI4QajxL+odl+FO37dBOwfzxb8NNyzv4/yv9wyRADQYJHrDX
         JWYICnxQ4HQoyr+yvMUobWEYirWtQ3HKANeu1Y10LPfeC8jSnGodKUs0g3EtRQ4kT6Qd
         0D/oc6nRgHCzFZSC18Qkj01D2+egHql1wXi106mydKoVY9hY4FURlxCXXnmzShibH931
         phOl2Z0Pl+pvetz46HRs02jeeQFZkr5T3Ek1VjoeP/LjPvf1uU0rMP/1kLJXm6t+6ap/
         LclWruX1iYwlH8NynScn/a6VSNGCyHyGI3XOynkr7rwXG4AHts4qQprn8mhR8A+VZd33
         cRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=P5XeXy2GIaSKYLkYAqglVvjH3kuWJ9tPWJSwe0Lo+wY=;
        b=5kfQLPeBkphrDbzFfnlYyd7Cbx6VbsuaLgZsV9N5/zeHefX2Sq+GSlqH+uYg7lsZaW
         vjZQzNg6V33wsQ1jJ2VC9fqF4c1Rnj+F00Fc6GFotyazANFHjvUMhRM/RWzKPToBSUEz
         5xhBErk+1c01ndU/gZwyroIG58xZInhWv6Zb4L0r6zt1QBFNxOAAbl92qGQ8ncLIMNeX
         l/dsD6dy5XO62CVothcH20jUxwDnD8qaJ9IosmRWXzS+MN7W9Mlx8P4Yq/AzZ/7NXt88
         zKOLJp6dA+oGpI6sxNcFBDXWqYYUUexguuf8bFS7C7GTHYQCGPtXas8TXKsHZ0fxvxmh
         PSjg==
X-Gm-Message-State: ACgBeo1xqjTCs5Q5VR5k8K1id9yUwpKMvYAA1ebs1EFjg66UCuksNvRt
	XJ86DoV6VmuRjQ097a4d18wi20j6RzbgmRZqQoA=
X-Google-Smtp-Source: AA6agR4HGxS3+r7EWurz3pEdejYHxzCA4+e4KopmW1I2S8OfDWvRZ5OIQmq1djGZpkTpe4gyzuVYJnGHX359T2kom9w=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:10c2:b0:6ae:131a:eac3 with
 SMTP id w2-20020a05690210c200b006ae131aeac3mr6582686ybu.276.1662674146355;
 Thu, 08 Sep 2022 14:55:46 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:54:57 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=samitolvanen@google.com;
 h=from:subject; bh=mON8m7x3rUfa1D0nlNPBxEehMr1A/zDxXAQAEngsFEg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS1cVYdHINNLoBeCZ9uFVNyEFfBwFNRQPTvzufN
 DW569WSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktQAKCRBMtfaEi7xW7n1fC/
 9ntySdFzUO3oTsyY2vU09I6p+wIqQMm9FgTwxmaQG1446FzMM4pSm/SX4JhZE9j5JO8X+roj+rnp/z
 hoLKBrMvE4bR6IyFTxO7Mvy3qSC20smGCBNQEzlDovULvMTBcz9vOxRopVfnk1UYwSrW9ctflDk9nk
 4LAs9n5qb3YgtVh/R/Z8eYLffSUyid4RzFUP2hrOI9q4u8FDJmS4YcLXzXQXdrINqm1HCS+DuVZb2M
 cdX+RhevB8yVxZTIf7jZ/lUySTbyUOmjWUD8pHjbJcoo1ntxHci8Vmq1K4CjD6c3APzuxeX590QJkn
 KBYWzy/6MpMlQgqnqc+zSj9GPWNf3cOKfDlgR7zqw8OW/C1YzhnW9F1HGhVHZFo+7ezUBee0CAFSQI
 gcxtb0a8Df7ZA5bqq/2Fvw+mJSr2Po2uEi1HUVMcMh0t2DWkOSFxvudPDClnFcZve5BqD8NPpHJYmZ
 eVj3Qsqgk+JqnpMPVr/Oucx4m4puzPjSBwSLTyV7Uh0w4=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 15/22] treewide: Drop __cficanonical
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
Tested-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
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
2.37.2.789.g6183377224-goog

