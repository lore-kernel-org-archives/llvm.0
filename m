Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F9171BB
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 18:12:00 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d6412374defso181891276.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692295919; x=1692900719;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WDpEeeNNR0Nw6EuE4P52nYwvS2tr5AEnMgO9JS9l+5M=;
        b=TaGbMUFBJl9KSgciaIgpVCisyqbCRpB7YYBG8v79mOmaHpt1tQW4gawLupbCsjGmej
         z0M22Qkxwd6H5Xf9tezwcGzF2BEM0GiWrlMbrqI6y1DxAhLEHpA4LEFNbzzvaS5/USQK
         lnCy83pmJ5KTWktENc5P093oPYM0W7geImacqNCB5v+MvPhMCV3KLqFUNdtuwxAttkjP
         dtl8Pb8QNhuqq+jGhdU0UI1QD77M36OE/e70pTSQuPwf6Xf8AlWO0BYWDs6MfgyskmLc
         s0mENOVB8d4jdzMDABjzbc2Nrq6t54AzWyred9TY2rPT9nehfBlceHHhguFaNgrKcA0v
         avfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692295919; x=1692900719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDpEeeNNR0Nw6EuE4P52nYwvS2tr5AEnMgO9JS9l+5M=;
        b=Ar7IWiMvJVF9A6qi8BXxECjdAZYKeRzu1B7rT13sv+JL5UFXxbBVW2uhDEsUX8hDH/
         HE0VaD5ffZEWUW+ye5uEHuzaBsSi9ESA7b4pwEcKQkEJJ7cB6EvXi6cvIUjKTg/cU7KK
         4TefHudlHdmj2t+sYHpQjEaTDqJ4mt/VrNWynvB9rpd6O6YSIeagNsgkde5ReZ1PM3Gy
         FVktT67yoCTPlNqZ5AZLlK02O+Bq7sh1gNCNkEKi3+RDlJO5btS4bKnitNyJkSUHqfHW
         TVEoMfOQof4O0v3ERdW29zn0D/MzO3HWYO4CYKA3XQNNNcowVcjy3y7V2s9Ujk33bsSy
         Pu8g==
X-Gm-Message-State: AOJu0Yz0KdctSgwlOqOTmIoH30MNLuYvzApuBGQcuFewb86YuosQ0SS0
	BSw4+eNmlv8fzZzfyat2+5++MgvQD5r/NuxS+tM=
X-Google-Smtp-Source: AGHT+IHGCNqBSivcUqwjOFgkuqC7Ixw26kQNxulLbkpUGpA9QPWtOwJPpJ84qHhcCJciZbWLNwY8Ah3LFW97G3/jWMA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:ede8:d843:1818:cd60])
 (user=ndesaulniers job=sendgmr) by 2002:a25:e7ca:0:b0:d74:347:1e3 with SMTP
 id e193-20020a25e7ca000000b00d74034701e3mr4153ybh.9.1692295919476; Thu, 17
 Aug 2023 11:11:59 -0700 (PDT)
Date: Thu, 17 Aug 2023 11:11:56 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOti3mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0Nz3YKC5PiK3Pw83RQjC4sUCwNjM0ODVCWg8oKi1LTMCrBR0bG1tQA SG74bWgAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692295917; l=1306;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=KvMdBaUrJ04OP30COeFfEE9LlNaItBIz7QURy18B4Q4=; b=0evZ866zmAcV3WRRll2szvRKmqpke+TXcD3BeqNZENNAC0GzwFFUTYVL/l+EVlX7ETBXDWTYb
 1ikpSuCMENIDTDAuHTqXGGIONyo6p216JYBb88Z9dqYHLzGgZbHiDDV
X-Mailer: b4 0.12.3
Message-ID: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
Subject: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
From: ndesaulniers@google.com
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.

I have not been able to reproduce the reported -Wframe-larger-than=
warning (or disassembly) with clang-11 or clang-18.

I don't know precisely when this was fixed in llvm, but it may be time
to revert this.

Closes: https://github.com/ClangBuiltLinux/linux/issues/252
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/xmon/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index d334de392e6c..7705aa74a24d 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -10,12 +10,6 @@ KCSAN_SANITIZE := n
 # Disable ftrace for the entire directory
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
-ifdef CONFIG_CC_IS_CLANG
-# clang stores addresses on the stack causing the frame size to blow
-# out. See https://github.com/ClangBuiltLinux/linux/issues/252
-KBUILD_CFLAGS += -Wframe-larger-than=4096
-endif
-
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
 obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o

---
base-commit: 16931859a6500d360b90aeacab3b505a3560a3ed
change-id: 20230817-ppc_xmon-d288d803610e

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

