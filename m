Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD11869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:36 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2f4dee8688cso83775967b3.16
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=c3P0Hz4r3G9OpLG/quSc8J3HkB5RqmI/gpWW3ubqRHw=;
        b=L3b4tsGo9U6EKhT1enH+lnwRGBAriMT04pxJOWGmkTh/LOTTSEf7+ZnnodamgedxF/
         0cwAbqdA5BTRqaVaWO9cIk3CrgrGdAh+jueAcHfV8Bg8TTAZ+khVx+B8eXyacA4mY4Xx
         K3TQUEqnaXw1lY5l03iwoFMiQRQsJmRAKWpBy5VlbUJzdl8A2l7wvJu19Rol8flqku9I
         WNZ/yUORvsGxlp+SHTywXjv/cQ3+dFZB9Bv+ISu7Xf8nMdBe2LwKPup9v4pkWEFDDPFS
         kaimPMTLgDV3p2dFB9fsB4bsR6Vkc62TMrM/JjgmNdYT0fQUUEBM5oeL8rAQdxi3N/ib
         ZNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=c3P0Hz4r3G9OpLG/quSc8J3HkB5RqmI/gpWW3ubqRHw=;
        b=on9G6bwyX1mgYaPtQi8tOSEKhEI+E8pNa2OjXso81GBu1/YjfDGRxpwLJmNO/TgAtT
         9Vrrgs4JHI878qWuyzQhzxdvK0iphAhx2fkjs2WUA1rHJ2E/oZwS67Dz+O5mi6vSotjW
         Zckl4LcCZz/joGmKZ60q8ZqPvUVRgNoHJDfhb9oJuryob7KpkKva9GjAdNpiHSt5yIg9
         rpwfvJdam7AO3WG7MA8Fuzz6TUdQWbb13IuTLVCQIGRGjKkEmiHuaVoFJ0b4tbaZv0Y6
         51dfmMpDksu+tFy3Avdr/ta1UwzEMlQBgcVZCXiQYstcsFU2QAhsQSJCRaWe689EA1W4
         3Q/w==
X-Gm-Message-State: AOAM531cnVm8FISbAqE79rRfD63Y+RCzIZWniRinM8lF+fmsvbxOCizf
	2Hz8HaTPpJTHEFVY/UHCzh96RsVUpUsBPWfQsRk=
X-Google-Smtp-Source: ABdhPJy48Ta9ddvMIF4e+65DRSdxotM1XKnrKu3boCyUAK2XttelwSr/WCmbVBiS9zrXdXlk0V9aV262+2v6W6Pe/+Y=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a81:8493:0:b0:2f7:d7c3:15f8 with SMTP
 id u141-20020a818493000000b002f7d7c315f8mr1216311ywf.196.1651264655480; Fri,
 29 Apr 2022 13:37:35 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:43 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; h=from:subject;
 bh=qwzizA85BcxzgY6DCPbuVyLVCg+lMcvwRT1NDXtCdLs=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExYM8ehL1/+o0aCrhRJzqnXsps5M4p21c1LQlC3
 sSVsl4WJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMWAAKCRBMtfaEi7xW7tTEDA
 CIw6jCzNraux3uPsdGgkoAmjqy1E308ymvORumKcO9YZjpCWgxUG+wrt+QoMZR3WsGxUe2zWhOF83/
 GBMcbJoiHwlX4DbEEk02ZUts9xuqk851PS5XPj4XupWl8F+kbRnXqWj7hSkLGOAkDS71i8n4fC9xr0
 6Ez6wHIz/0fvbvzjy2pHl3vX2S1oouofjPnfB6+NNmsyEb/K8pceL8f2CcR6jIzAd/J0QmzZTj76WT
 O4AwX/0ZNLkWjMQpGtuKzzGFHozskjUdwKRyIsCMnHGCm2py2s1oLV/ZY9mk7yD4IoRB3MrC0v0FDM
 Fl8hcWy38RiLdiG2OvGkUee959W0eF+qPDLNNpHfpiSB1J1t43APoJLX+iPYsGLObYHe9DGTllVo0x
 kt56P/u268sda8zQK7JrAuU3qLye5d96mt/FiDL13+rXzBZuloXyNLx7trQLbxVhiAQkGYOvGEGt2D
 lY6u8L5nEHbyCOCMu0kfKXPQzqa6gVH7sa1innsuiCfcA=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 20/21] x86/vdso: Disable CFI
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
2.36.0.464.gb9c8b46e94-goog

