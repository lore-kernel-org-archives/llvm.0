Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00F7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:35 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id d188-20020a25cdc5000000b00648429e5ab9so8233327ybf.13
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZCzpPwz0WdrY6BfkeL81XAsKV8wn1SlQoxjmwZ5/Gig=;
        b=HceXmTaEkp+ZKV12vL4SdGdkWcvgFkun09LtngiucUo4uOaqteWrC89nSX8n8KF4Mf
         zbFQUygsTyJ/9cwGEdvi8CB+UnSn1AFgPq0r43pT0ibJpLVodVsxquLgyGcsVsujaOSG
         H+4SDyFdBebZKV0i5cPpZFFV8XZbJ6ILCp6VFWVPxYYiTMv2PnZ7GkElEQEcxyCLaem2
         gHZ1kSHq2SaN8UpO6x3mbvHgvKrmQwvQnZQNCh89RrLMZptVGCOTgCtXmsjtL4HQ01M2
         wb+wm2+HBcRXx8kcsZslS2kTnasITkIwT25vPWYX5Bi9iZ7iAdVT+LYMv9R5Gw/JPljd
         d3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZCzpPwz0WdrY6BfkeL81XAsKV8wn1SlQoxjmwZ5/Gig=;
        b=gkmE6jF9/U3lI2ZtlxyIKhxCbyB5NB6021nuWmdHd3v00QxWjCURt9sr/gZUZQtYPS
         6Kmy85D+8T8kKvjTMkFam9kzE0zhplqJLjyL829QYV44N7gbfG5k7Q6n1sZbC5UYu1P9
         +mVMxw5io1Ca/1hLS66XoWSg1Mo2daReM1ajccuovP+icqEvns8ijnBunCijqdizcr40
         gbSrNbcr5/tPH6bDVUaMGq1RvLILIxEVuoDys+97OKjaJEHJbv/61IB1YxULb63WBHby
         xCUHc52EXIawkb9mzzguu+JAO9RmZJWUaT0THUKRpRgOjrL+pfGqRK+tAq+Mf/4Eb+Ox
         D4PA==
X-Gm-Message-State: AOAM532m0wrffJLkF1EU5NngOzbr/Cszau4FkmwaDAdEM9zT/qqTzUAt
	M1Bku9kWnQdALUV37LXN3+2x1EghDVxL0ExZdUs=
X-Google-Smtp-Source: ABdhPJwjkOWXgmy/JxzpSMehnJkSuFF0D3wmLwLqRyg1T3zp4KGNDNlpSVncsIY2Ja7kEm5CrMJ4V6Sh37EDs4qk3Tk=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a81:1545:0:b0:2f7:b6d6:c486 with SMTP
 id 66-20020a811545000000b002f7b6d6c486mr7693703ywv.261.1652473354343; Fri, 13
 May 2022 13:22:34 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:52 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-15-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; h=from:subject;
 bh=Btj3XbJhA+i2nr8WkfyzaSMc7F2qnUf9voEPafSbHsA=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3lBRhm69f1gMiDJ9ChWdlEwjDHcutOztiRSiWd
 fHu6Rt2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695QAKCRBMtfaEi7xW7khWC/
 9DJejYBF4x70seHry7Yoz1+q2B5Kox5SdltfPtwsecQsxFcy4h5MQApJMlXdNaqyRQBiMdZ+NZ6WZr
 FFeaM1NATYX1I2v40aekvK8Y3DrMLfLqHyeh6b/6Td2ThG0FVX9xox+sbvNNgdd4oB7QUKlQHTLGhJ
 KkhsGb1eHUM0BAJXuL8UFnaMmR5SKWnHGk5ddNXgO/M4Kgt70iZYY8QdjS2FNRE/fsBrBb2f4FSVso
 +V4Z9MavzM8TkF6i2a0maWtI1R9EJTWioq/ppno0q36dBGTx+KUHpGsc6Jb8QQ0i/kwc+MNzEacy7u
 b5gU0t6+N1QBu1zpBj/NwgNFSsfVWPPHVKnJrfZC0hXMWa9Dz4ShzwhdiNIYYhCo/7awGZfdfPk9j6
 mbCe5BZBHOMd5zXf5zDRGH/eV1z2P+dxCeUSlndkKrwKYfjIBXAJOaMBrrwszg6NzP0QCiYZDluLKX
 DFBRz/Brl+FE12I0FWpbGPaAYnZN0/uoF7o/8C7lAGqpw=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 14/21] treewide: Drop __cficanonical
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
2.36.0.550.gb090851708-goog

