Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673629CA
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 22:36:55 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id c65-20020a251c44000000b005ba81fe4944so27220228ybc.14
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VaDhNNXFhhUWTkgSjDPcE9jIHDvc0J7EwPhGj9hqbDg=;
        b=U4r59HjWNUbmVDmiOoXYYqpVZHqKp4+rLZ02pdOyHxb2EHjipt3QcanrHfMBoa3rT5
         46DcFKiJRxQZrRbEhBFYXiTFuko4pQ5C5tx7WmOh3ox8ce6rI9/4yFHS+m/HOWpKlIrw
         7Z9onRNpOALMCnrVgSQ2ak3GUAPD/Rab/YKMyZJp8Fs+FnjqNiJ0TzTZcGl3K7WUvHUK
         vt8BxxNp4U19TJKZLBQgLCVUJHQAAn8GY5FXIlcasCpw6bD30t9rhDA5EDyoCjKH/eGL
         Cc/kBpiOTrJCT8bKggekiJ28PoyiEuvGfzlC3I/YJVcxIRRBp9whVGiMU2mocdYsgib0
         h6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VaDhNNXFhhUWTkgSjDPcE9jIHDvc0J7EwPhGj9hqbDg=;
        b=Y6RlLljTu3uea924GzE8f3aakEXIyjmUd9Dlmha0iJjfRP8DzOCUFWSTdLw1hRxN1f
         czbXp8sryP6xCmYpKr4r918KZzXR0w87XD3gC0TcemCGYRm4bW05F2PracddZ+u8vRqr
         vP1yBrVgNK608i1UCM8V6fiwer0JC/csYX0IjPCuZgKJ2ANSMn1X0Pex1ZaGiu/Tkn3Z
         crlvwhCdmhs0mbcjqhFBRrewuQCWCRxHrkdgibweXz8RrRQit0qDossh/oxkmLVqGfre
         pmVVR3kClxJbmtA5xck5uaoDZLGPlTlyqF3J/HT5PUim5UTPdeB3/1gNN9nA/mCV9+ll
         HKWA==
X-Gm-Message-State: AOAM532JmWZdJn1NSuTe1hdckY7C4hbLpeYiV6qg7AmJXjyJZBPB+sTK
	c7IfeRxbm1reDrViPE45dCXp71PFW1Wbr7jF1Os=
X-Google-Smtp-Source: ABdhPJyQWgh+9TAh7Tj9W4TPJjcbAfo42Zp7ylgyKKOUAS7vlg0nA6CmHikYeHsN7iDfd3+1B8gmJF9NLBykmaqmjNI=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:de0:247b:5157:7c15])
 (user=ndesaulniers job=sendgmr) by 2002:a25:b887:: with SMTP id
 w7mr6602581ybj.52.1634683014157; Tue, 19 Oct 2021 15:36:54 -0700 (PDT)
Date: Tue, 19 Oct 2021 15:36:43 -0700
In-Reply-To: <20211019223646.1146945-1-ndesaulniers@google.com>
Message-Id: <20211019223646.1146945-2-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211019223646.1146945-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634683006; l=2834;
 s=20211004; h=from:subject; bh=31zZKmnHrPsMeReQcK7MwmH2ZeeaRVf9+ZMpH9/QAhA=;
 b=g12/8wiwE9txkit7fKe98XPB6Jo5bZ5mba6BV0kO9dbn65pXWfDpCYkXcn2/HlAcmBW//4ogjGTH
 n0jVXAvFAXMo22BQYw6Wtm/FKDQlrvXziKgG73UymQWiS1njdv50
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 1/4] arm64: vdso32: drop the test for dmb ishld
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Christian Biesinger <cbiesinger@google.com>, 
	Simon Marchi <simon.marchi@polymtl.ca>
Content-Type: text/plain; charset="UTF-8"

Binutils added support for this instruction in commit
e797f7e0b2bedc9328d4a9a0ebc63ca7a2dbbebc which shipped in 2.24 (just
missing the 2.33 release) but was cherry-picked into 2.23 in commit
27a50d6755bae906bc73b4ec1a8b448467f0bea1. Thanks to Christian and Simon
for helping me with the patch archaeology.

According to Documentation/process/changes.rst, the minimum supported
version of binutils is 2.23. Since all supported versions of GAS support
this instruction, drop the assembler invocation, preprocessor
flags/guards, and the cross assembler macro that's now unused.

This also avoids a recursive self reference in a follow up cleanup
patch.

Cc: Christian Biesinger <cbiesinger@google.com>
Cc: Simon Marchi <simon.marchi@polymtl.ca>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Fix typos (2.33 -> 2.23, 2.34 -> 2.24) as per Christian.

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
2.33.0.1079.g6e70778dc9-goog

