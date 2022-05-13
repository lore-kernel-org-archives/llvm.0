Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2257A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:46 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2f16f3a7c34so80826237b3.17
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sN1MQIdlcLov8VgTjyWeulzGcdWJ7BEX/VgFu9sqEms=;
        b=NDN+pnJemIaCSxm+K2o9kM8xoxP4AQp7FKNhm67B5YN9f5EDBtjQNKeP31f39bv4/X
         u7Sta5zaVqNE8LpDfbgbrzZSc89IJTRdfylKuFMkp86I7w1oQQ7UKjoL47AzIJGV2wY4
         9LsNi1Ao6snjicLqufdQjigC9QuO4Lj+vJJw7hg8/6NkaOuIZDEnaS2id6So0DG0ta2C
         SvvhUKEOlmhey8NHV9HehLbFjkcnVEoZHby8OxicoYYxpFyzgd1HR0qIC2KTzvXjto4r
         dZJbPHQ/lkgGGEiIG2FhPu3ibzslDXp4HRuIKvuvNFZvOS/+/U8h2BmuRQ7EWpXo/BrE
         bNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sN1MQIdlcLov8VgTjyWeulzGcdWJ7BEX/VgFu9sqEms=;
        b=nw8l6OrxKm0+O5eLZoaWkNLOlBazyvEjGmZ3Vb+LxfhUHQ2VkRoS2R0yAPQOZ2pjY2
         k14/phx3QU3tAJ99anKGowehyheb+RQstDYRDge2duBB4Zpwjfg1DFHKQRxyf4CgbVvn
         d5cp6RkNohfCnNbD0Gm0HtkzeOFxskz0kAjF3W85lkG5hG25tYNDEx8oWA1/g/mKEJCp
         5JKIs8AR/+D7eQbeHBGooqxmedFYYGMWSrClmla/0fzdkFAA3A2ZbfxtDn7xOGTPMcYX
         1mz7Sw4dvULrwVKYyWA7W7e9+5+jJAryS9xPcmlxxj+WbLD79dxvwMPvJFLv6UOB/D7Z
         d2iw==
X-Gm-Message-State: AOAM533m9c+LhNIdm73UIS9aDxUEN4aGMCKq133fZuhuaTTbAoCEe4ha
	vJ5+79VwrU5ygE0UwDqSTQqhRQGvIUK5XUD7c3I=
X-Google-Smtp-Source: ABdhPJx5nJW+fLyEvpdIEtsWTO7Bccf8P7rQGyFfkNsIumtMA98HgpHClV78e0G6XQroqhr1CVABaVT70arCD7DKWJc=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:3c4:b0:64b:9947:ae0c with
 SMTP id g4-20020a05690203c400b0064b9947ae0cmr4277666ybs.139.1652473365524;
 Fri, 13 May 2022 13:22:45 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:57 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; h=from:subject;
 bh=57qcu+U/ESwPOD6Y+SONkBgb7Co02QyfDr74Uk03b6A=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3l0ipJhNE6eoVPfJVHE9QVfJa5ZOmTd70bEYHX
 Y/YEamOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695QAKCRBMtfaEi7xW7uSFC/
 0ZKCyQe27MbqBSzxoH/uHRZkF/mRGq3PzbQqycBC63gV53AhsNrxa68cqQI/p9ZTMUlHpbuqgxceYo
 GjOUCTNfeFJQjNAvcAtAQ4FVHmv7MHC5RaI6Zkv+hnIWlXizBxMSPe2QPGCU44v2xkUx2bDxbItGGX
 HU4Yj5bSd0gZIL0BsXOTeqEWlBel1tof7WIru7x5Cc63rAUVarAFiecr4J5owvzEya+9gnBPxYDcra
 ay5jeQ/kViL1zXdWuWv/c8lO2bshaKGI+7byXNTzIm1NyKM1Bc34y+t7X9RVLcTWX6+AalxYela27+
 Cs7ndV9QgHxu5DDVyrwFBg79BVA2y34witGsut8PgrYolzywRZxaAJKu9U5O3U8UX9U83Kk8iiPCg7
 lnvfvJ+JEZUT2MG1p2X4EhWueUL2cbGs3eL+XCeAouQAA4iV2dYhb+hVPp2BwiDIf9yLF5O+QaFQHu
 MWoGpc8TGw8nfWrniueaU8rSDQl15j0/F9fJPb4Z8u43c=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 19/21] x86/vdso: Disable CFI
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

CC_FLAGS_LTO no longer includes CC_FLAGS_CFI, so filter these flags
out as well.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/entry/vdso/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 693f8b9031fb..abf41ef0f89e 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -91,7 +91,7 @@ ifneq ($(RETPOLINE_VDSO_CFLAGS),)
 endif
 endif
 
-$(vobjs): KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO) $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
+$(vobjs): KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
@@ -151,6 +151,7 @@ KBUILD_CFLAGS_32 := $(filter-out -mfentry,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS_32))
+KBUILD_CFLAGS_32 := $(filter-out $(CC_FLAGS_CFI),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 += -m32 -msoft-float -mregparm=0 -fpic
 KBUILD_CFLAGS_32 += -fno-stack-protector
 KBUILD_CFLAGS_32 += $(call cc-option, -foptimize-sibling-calls)
-- 
2.36.0.550.gb090851708-goog

