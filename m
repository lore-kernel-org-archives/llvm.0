Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E52C85
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 22:36:59 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j193-20020a2523ca000000b005b789d71d9aso27112745ybj.21
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VYYzFbtg9v9uYxEoyPeKXiW1szMtPubg10b/PAxgSlo=;
        b=P/eAIE9t9qFsmOQDu4H456xxeFJ3Vkto2vyDtoqZjgvzOwZNlvZmPpM0Sh6JTLHncz
         CYalQVIr7MNV7ME6aicxY56kbBmtCNpLBLqSU7bDdG5t8Hh/K8cOgjDjLa41cS2Nucj/
         VTDTqMNWqbGlcGGUE0BfMB4kouEsOqF8BBpEAQKCMY8BnYZe86RWewujSOxolKk1vX/g
         UD2EJFVstgRFE/b1PYK68bSUvE7gZJCtpg+wanBc5kQTxv3bNIDNrIdpL7kJLBud7dGE
         6Dpq9f63a0mnKkV8d4VCuApFnjrG43JmEhp4N66+GrL+D1ASWMIm+c6sFd9hgWsEb/TH
         olMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VYYzFbtg9v9uYxEoyPeKXiW1szMtPubg10b/PAxgSlo=;
        b=bEszz190DIkFHv6D1xx/3GjxrYJHNlzb41zVm9+Qb3USIUSy7lVcNSJWW59x6MpHF7
         R894s7KWtSvddW3T48dCp3zdpqCB8kDfmAWbh7p19RKyrw7HWr4EiDAVrYJETPXWfNm+
         FU8wFPi0Qsg+1mMWoR7iKjtNUsi6JFo8fYSOmyLxHWRK8IL5t7kMmv5SJ/o1qf+NVmor
         NDi4xCrCPEBGWbRwEySMadPc3Qjj+5g8fkuHS7lxHAXCmgInHz4K08suvz7vo6H+ICvz
         LZ8ni5QzlBBA9M0a7WehLCz5nOzvFI4RUsKjy/e1fDYRSr0Yrchz74r4+8OH0rWj2nnG
         AJDQ==
X-Gm-Message-State: AOAM532fAdPmi0y6AeY5UP7iFfIZw/V8EBrfJiRAPvPOi8FwsDfdEEPd
	Ng4kXFiPr26O90Q7MFAQr11X6DG7H+w9t2LgPMY=
X-Google-Smtp-Source: ABdhPJwkCVKrRS6V2GiMRNX/DRIW3FAv4Tj5QWfrAeg45eqOecBgUJGLb6kiJ7Qveek+Eh5VMcpw/nfY1YtIB0nY/YM=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:de0:247b:5157:7c15])
 (user=ndesaulniers job=sendgmr) by 2002:a25:bd7:: with SMTP id
 206mr41112924ybl.408.1634683018922; Tue, 19 Oct 2021 15:36:58 -0700 (PDT)
Date: Tue, 19 Oct 2021 15:36:45 -0700
In-Reply-To: <20211019223646.1146945-1-ndesaulniers@google.com>
Message-Id: <20211019223646.1146945-4-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211019223646.1146945-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634683006; l=1704;
 s=20211004; h=from:subject; bh=74hCoLStsXal7EECTyeA4v4ANHbGr/aLrzSq59yc++w=;
 b=NMtRKTwXJOcg7HCEHcr4qlyA51nWYLdppfUbMlsepaH/P2iZVOh62wivzOpTO7DmNm1ywvKsULyi
 90vwOhN3CX+banOlQxJJQe/9xRZvNfnyvhmezJeuqNJ3aHFhGagP
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 3/4] arm64: vdso32: suppress error message for 'make mrproper'
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Lucas Henneman <henneman@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When running the following command without arm-linux-gnueabi-gcc in
one's $PATH, the following warning is observed:

$ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 mrproper
make[1]: arm-linux-gnueabi-gcc: No such file or directory

This is because KCONFIG is not run for mrproper, so CONFIG_CC_IS_CLANG
is not set, and we end up eagerly evaluating various variables that try
to invoke CC_COMPAT.

This is a similar problem to what was observed in
commit dc960bfeedb0 ("h8300: suppress error messages for 'make clean'")

Reported-by: Lucas Henneman <henneman@google.com>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Change to suppressing via redirecting stderr to /dev/null, as per
  Masahiro.
* Add Masahiro's SB tag.
* Cite dc960bfeedb0.

 arch/arm64/kernel/vdso32/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 1407516e041e..e478cebb9891 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -38,7 +38,8 @@ cc32-disable-warning = $(call try-run,\
 # As a result we set our own flags here.
 
 # KBUILD_CPPFLAGS and NOSTDINC_FLAGS from top-level Makefile
-VDSO_CPPFLAGS := -DBUILD_VDSO -D__KERNEL__ -nostdinc -isystem $(shell $(CC_COMPAT) -print-file-name=include)
+VDSO_CPPFLAGS := -DBUILD_VDSO -D__KERNEL__ -nostdinc
+VDSO_CPPFLAGS += -isystem $(shell $(CC_COMPAT) -print-file-name=include 2>/dev/null)
 VDSO_CPPFLAGS += $(LINUXINCLUDE)
 
 # Common C and assembly flags
-- 
2.33.0.1079.g6e70778dc9-goog

