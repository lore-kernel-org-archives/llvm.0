Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8C2C80
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 23:46:33 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id t7-20020a258387000000b005b6d7220c79so1173649ybk.16
        for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 16:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=453jnyDh5+St7IVUodDCbgLxZ13MiKlNZ2J3hqUdcvM=;
        b=GiQnyCyCbpwY9yiy0ekI90qBi524flhldE7LmLeUFKKWm8lctHKu1bsmytldY+TUxY
         WMA98mLcf0kJRjamikFx99dWxHiXdDQLUsWaBbPirwJP5+eAXKVU6FDo57sKENYlyzdO
         31bd6OFulXpLt3bpfK93NK4yL0spwCACKTB+vrKQ7GCPXzLILOSFqFt9AeYBJ3ciZwlv
         YXwZM2deyztIXu8I1fxaflF94jcNJufrpRf4U9azIBZ2hfFutsdTt1NAvQ48d9Dg3wcF
         sT+Wl1DFt+Wlq7oF10x8A5XCORu2v+sT0dd7XEmbKggavRr1+GKEW5K5OKOGZYlPpuhb
         7kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=453jnyDh5+St7IVUodDCbgLxZ13MiKlNZ2J3hqUdcvM=;
        b=eFA9xf2dc9/5Hp0z7SjyYTJ9kS/FqzE0cdmSYdIJ5cMhkpif2XpChCI69RcC74hqH1
         x/TvS0ovTR0PcoiMAXmofwu3YtQPHa/hmCMFxPzV6RzGDAJyPxwvnG6xx4VcFyXyMVjv
         yL1qid8Nmiy1Wd7OaOoseMW8btxVjs1kcCuq8/+2z2vJW7stFmB8wEAQY9fvE04ZCpas
         JYljpcf1Nq+8fJQpwRnSeGJSoTgbaOqIvfYO6itU3Otai/886uXO58yS+YFpapM4fTeL
         BuAsMjxRCELQOdMXwiJwcJV1xJmROJ2Tg1cv09izLRTvlnIyuwbwT4kLXr4LzqdAHu0+
         +BBg==
X-Gm-Message-State: AOAM530jl1u3O7nUF3lKjZdScfDiy37+pq23FycSYrB/lnOS0VYEKRdc
	dY/2XXF8P6LQrudoeIKZ4rxXLaCAwusju8ut0Zw=
X-Google-Smtp-Source: ABdhPJzDpvjNkv+aSz66oQo+gO0Q3iFyt0KqnBrqcpv1ZIS3EYj2e1x+fBZ2NNF1cqaK6s2XL2w7RMeIIcdjpCl0gRg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9b44:962:5897:17c0])
 (user=ndesaulniers job=sendgmr) by 2002:a25:5ed6:: with SMTP id
 s205mr34338891ybb.31.1634082392753; Tue, 12 Oct 2021 16:46:32 -0700 (PDT)
Date: Tue, 12 Oct 2021 16:46:04 -0700
In-Reply-To: <20211012234606.91717-1-ndesaulniers@google.com>
Message-Id: <20211012234606.91717-2-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211012234606.91717-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634082366; l=2752;
 s=20211004; h=from:subject; bh=F9HRxccJOmwhcZZiuHrzsbCihhzYYcSweRituqKRuSc=;
 b=eZ+y9VuclQWGHxZZCUU0M238NP4YS16hxLmrZFuG4syjxneIbvLJ1p9XCrFVIvsJox33KLDaEcmw
 cJtLdaZODfd7SymUzuS2rZgM0tbdGiSw/dZCb+obsqKfSgQzt0Es
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH 1/3] arm64: vdso32: drop the test for dmb ishld
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Christian Biesinger <cbiesinger@google.com>, Simon Marchi <simon.marchi@polymtl.ca>
Content-Type: text/plain; charset="UTF-8"

Binutils added support for this instruction in commit
e797f7e0b2bedc9328d4a9a0ebc63ca7a2dbbebc which shipped in 2.34 (just
missing the 2.33 release) but was cherry-picked into 2.33 in commit
27a50d6755bae906bc73b4ec1a8b448467f0bea1. Thanks to Christian and Simon
for helping me with the patch archaeology.

According to Documentation/process/changes.rst, the minimum supported
version of binutils is 2.33. Since all supported versions of GAS support
this instruction, drop the assembler invocation, preprocessor
flags/guards, and the cross assembler macro that's now unused.

This also avoids a recursive self reference in a follow up cleanup
patch.

Cc: Christian Biesinger <cbiesinger@google.com>
Cc: Simon Marchi <simon.marchi@polymtl.ca>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm64/include/asm/vdso/compat_barrier.h | 2 +-
 arch/arm64/kernel/vdso32/Makefile            | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_barrier.h b/arch/arm64/include/asm/vdso/compat_barrier.h
index 3fd8fd6d8fc2..fb60a88b5ed4 100644
--- a/arch/arm64/include/asm/vdso/compat_barrier.h
+++ b/arch/arm64/include/asm/vdso/compat_barrier.h
@@ -20,7 +20,7 @@
 
 #define dmb(option) __asm__ __volatile__ ("dmb " #option : : : "memory")
 
-#if __LINUX_ARM_ARCH__ >= 8 && defined(CONFIG_AS_DMB_ISHLD)
+#if __LINUX_ARM_ARCH__ >= 8
 #define aarch32_smp_mb()	dmb(ish)
 #define aarch32_smp_rmb()	dmb(ishld)
 #define aarch32_smp_wmb()	dmb(ishst)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 3dba0c4f8f42..89299a26638b 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -29,8 +29,6 @@ cc32-option = $(call try-run,\
         $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
 cc32-disable-warning = $(call try-run,\
 	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
-cc32-as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
 # We cannot use the global flags to compile the vDSO files, the main reason
 # being that the 32-bit compiler may be older than the main (64-bit) compiler
@@ -113,12 +111,6 @@ endif
 VDSO_AFLAGS := $(VDSO_CAFLAGS)
 VDSO_AFLAGS += -D__ASSEMBLY__
 
-# Check for binutils support for dmb ishld
-dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
-
-VDSO_CFLAGS += $(dmbinstr)
-VDSO_AFLAGS += $(dmbinstr)
-
 # From arm vDSO Makefile
 VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
 VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
-- 
2.33.0.882.g93a45727a2-goog

