Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101727C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:49 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id q9-20020a17090a1b0900b001e87ad1beadso2158410pjq.1
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BpFfLPfj9HB+nDPTA+ic1GSTJwOiZRxRXxANj94F+og=;
        b=VIU2E8VBEnuRL6J8kKKaBjD8BXhxK52WDkoibzeklJoaWsAsTBFYw0i7vQgUm7b/Rr
         CVcqs0MvSHUk2z1wQJmqYl6LRD9a7E6wR1Yiww5vjlBnbmzidFl4KduEMSd701kZbufQ
         Hh6DelVz1NQ6J0VlRD43p0xM7oA/p4+Yx6+B2LeVTU9d0AhKd6iKDiADWvarXpp+MCbo
         T4NH8wPtIoXO3e4155dGRYGkbTWdP4RXnQYt+eDydIia6wTuMsUKDrnafWkf40OpVFYY
         oWLQbQ+sCUG0yaRW5J3UHrRXATwL5WpwCbHR/7fz6cjuJd46ZeqwwSCsJJ82BGByu5ZD
         9Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BpFfLPfj9HB+nDPTA+ic1GSTJwOiZRxRXxANj94F+og=;
        b=JfXXbUpESO2AAMuIgMOk4EV0+fo9ysPAf2dXJDCWJvlGArPHZe8OpJwYo9Qgw7TFLB
         GtkwwdnjmnbJljr7q55wMdofd03mmGGPxn670TuMe04LyWHuINFxAi4cEPd1jMILdpMv
         1fnWak/fW3kZJj6MncVTfuFhs9HMdM/go7FuY09cBXyYeUP9Hgr8wZTMFCk5WkTxYv6t
         h2TxstIvK20vjuXlbn5rVQ5Y3ZVHwLWId6yD6rpBGuHXA8uZG55XRHa23YE6gUVdsvyG
         QOAABsbTWdRBZAptr/nLU8LXI8awO5MpbOgcwajF1Cz2FAwpewsLEgCnZfuH/qcCsxyG
         tZAQ==
X-Gm-Message-State: AOAM530F7clBDdZZYh0yetZbV+dA/qFkOD4I0qgspnw7ezsmRyv82/z9
	3j54F6tjg+a373scG8Yuonz5gZQHS43AmD1rFRA=
X-Google-Smtp-Source: ABdhPJzQj4Y8DD4Bqc8j25Xa6AUeKTnmqV8QeG2OCwDZhwNosr/6RBjo4qVYPKtN34nX09gCNWTcfEMVnXZ0DBxfwpI=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:4a8c:b0:1e2:f378:631d with
 SMTP id lp12-20020a17090b4a8c00b001e2f378631dmr2195230pjb.58.1654904149509;
 Fri, 10 Jun 2022 16:35:49 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:07 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-15-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; h=from:subject;
 bh=h/mWD/4PnVCDH1rjLuqLphSlmeevUzDBu9m4dTUTNtM=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Uu2/m+W1W7sfPCsrXSMcJKHxwY9rswgwh30C4e
 Ca56uB6JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLgAKCRBMtfaEi7xW7lZyC/
 9LLlNqKUqkKdC5hqQA9zDyOBQJJzzdZElwz4yG1TM7N8FBp01GGa8IX21msOvtY45pBbK9IcxQ6+A8
 Iggu25/NIDILzcNrfYsIg/KWP57X5PYBPPJnWz5OWGrfASn6jaqvKjum7FzyMLnkt715o3vSnZeW26
 KKCI7vgs2WMWrW9677XdM8fPvUdDColtKqMM/yvwiy8yOFjD12LDICUjN3KMG0rdBojzVYG9wa1u1d
 FIEgEHQ6kfLt+lfR4rilXSnWMkGEEZO8KyMpGeN7m77akc+rSAWGNEQRZu5KFYWFImKu+rtbP/BaPc
 ttVafKDvdQNCWUVzwvapTVbV4+6WPdbF9RG23M+omQIfUtn+VanK58JCAqh3hbadTb3nLyFquz9lnc
 AdsLelsSYkpSrCVG76d0NP7md/9zob+oXkWExKc4d4IAERbZ6cT17XWy5q5p7CFKdlw+eWans9qe0L
 byIHDyMZ4GBbUlvCoEexRHFhhnSH3Vz7i4RWXRK/+ilO4=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 14/20] treewide: Drop __cficanonical
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
index d08dfcb0ac68..2957edd29252 100644
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
index 81a57b498f22..c36c52933c8c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2029,8 +2029,8 @@ enum pci_fixup_pass {
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
2.36.1.476.g0c4daa206d-goog

