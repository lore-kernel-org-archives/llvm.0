Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744252C85
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 22:36:57 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id t92-20020a25aae5000000b005be785abef0so2258780ybi.2
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=a45Ln1D7ZtUe/1bUcSj9pWfb4TeXSMsuqA08OUNsoW4=;
        b=C/DPg6WFYTFDt0YKudnJRZv5vE52p5pGFx+/sMVLqwD0LssuUyyGBJ3fde+wDbZRPZ
         xwTLlo3xgrX02h+KdBL5fgDs68VKSfWKbonXwRKp75pJaE2Fs2/dSZJXUYdWsYtWrovR
         JTkfgi9YKuZoSXnu/vpN2yBzHd40RVKM6ALN9x/YJLtuSdyOhc1nYR6yGsOcz1NoRoOt
         lIQoRmr/3YOoZ5dHhQY6BdxkWA9V7HFgvB2hu1IUhzs6BP/L/hbwOXETYV7KP03vjNBP
         WTaktCWsUCD36jEu2nbiNsN9UwCHj51jMSsbf0/5Jyc1wHcYpH+KSCe9FlPsJSA84vwW
         LfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=a45Ln1D7ZtUe/1bUcSj9pWfb4TeXSMsuqA08OUNsoW4=;
        b=Y43TSc+GCeQiJPW4Y9DBlhIrljARihozDZdgAEbqQHpJT9pgMLFYveE9wA83ACokM/
         6RLsHwGR0IbbuBc+GP9q7+7OIi86YwkFavWvcCyxD8LAKsdRCsY8D9yMgrTWzLb1e58p
         t6KDB0Oip5jv4BxOiRba+1izvqyU9dnqrxuAJ1bhsij+ocQnrW04KwfAHLEaM+ijyQyh
         snpfQ//025xgpXjwexSuKawsVzt6lOSfSIf2TBaklRHQ6n3RYaeDtlapNhooO7Cxkfq2
         b9WrVmLZ1c4Mg1NPsX/bXQIrA7NtjCUg7kDsOlVnuw8+I7z5/y+bi6n+gikQ8tTP7ePp
         h7aQ==
X-Gm-Message-State: AOAM531VJIaxpsrRGlq5OzBFy1UDsoTViytzL9K7IvsZBZa+xLISOhLt
	4qWOxnWSON18tw/1FDdgslGPol8vXmpD4rMiIPw=
X-Google-Smtp-Source: ABdhPJyXa/oHkLzXSjbRGWB4SvAFLikU2/e7o0757AHdoqspRbjhCNfLFsD1Qx0hu2ir4MF3GcgZRiwsvvvOQHF6YTE=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:de0:247b:5157:7c15])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1c86:: with SMTP id
 c128mr39976792ybc.83.1634683016574; Tue, 19 Oct 2021 15:36:56 -0700 (PDT)
Date: Tue, 19 Oct 2021 15:36:44 -0700
In-Reply-To: <20211019223646.1146945-1-ndesaulniers@google.com>
Message-Id: <20211019223646.1146945-3-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211019223646.1146945-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634683006; l=2182;
 s=20211004; h=from:subject; bh=jpMXqOpkcp5RnayWtEE83+1uBxJkTa7ynpwJrViYoAw=;
 b=qajt0gNdxEY2kp9cPSmK3GU6yiC5ml6CaoZHQWk8SysT+y/gX1h8ncSkCbc3LnKtUjBh+GDKxiPX
 QOoEOn45D9GObiCd0QkxIAnJhaSyyD8a/SFgguZpKzwFLe3+hHnS
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 2/4] arm64: vdso32: drop test for -march=armv8-a
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

As Arnd points out:
  gcc-4.8 already supported -march=armv8, and we require gcc-5.1 now, so
  both this #if/#else construct and the corresponding
  "cc32-option,-march=armv8-a" check should be obsolete now.

Link: https://lore.kernel.org/lkml/CAK8P3a3UBEJ0Py2ycz=rHfgog8g3mCOeQOwO0Gmp-iz6Uxkapg@mail.gmail.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm64/include/asm/vdso/compat_barrier.h | 7 -------
 arch/arm64/kernel/vdso32/Makefile            | 8 +-------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_barrier.h b/arch/arm64/include/asm/vdso/compat_barrier.h
index fb60a88b5ed4..3ac35f4a667c 100644
--- a/arch/arm64/include/asm/vdso/compat_barrier.h
+++ b/arch/arm64/include/asm/vdso/compat_barrier.h
@@ -20,16 +20,9 @@
 
 #define dmb(option) __asm__ __volatile__ ("dmb " #option : : : "memory")
 
-#if __LINUX_ARM_ARCH__ >= 8
 #define aarch32_smp_mb()	dmb(ish)
 #define aarch32_smp_rmb()	dmb(ishld)
 #define aarch32_smp_wmb()	dmb(ishst)
-#else
-#define aarch32_smp_mb()	dmb(ish)
-#define aarch32_smp_rmb()	aarch32_smp_mb()
-#define aarch32_smp_wmb()	dmb(ishst)
-#endif
-
 
 #undef smp_mb
 #undef smp_rmb
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 89299a26638b..1407516e041e 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -65,13 +65,7 @@ endif
 # From arm vDSO Makefile
 VDSO_CAFLAGS += -fPIC -fno-builtin -fno-stack-protector
 VDSO_CAFLAGS += -DDISABLE_BRANCH_PROFILING
-
-
-# Try to compile for ARMv8. If the compiler is too old and doesn't support it,
-# fall back to v7. There is no easy way to check for what architecture the code
-# is being compiled, so define a macro specifying that (see arch/arm/Makefile).
-VDSO_CAFLAGS += $(call cc32-option,-march=armv8-a -D__LINUX_ARM_ARCH__=8,\
-                                   -march=armv7-a -D__LINUX_ARM_ARCH__=7)
+VDSO_CAFLAGS += -march=armv8-a
 
 VDSO_CFLAGS := $(VDSO_CAFLAGS)
 VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
-- 
2.33.0.1079.g6e70778dc9-goog

