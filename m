Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937943FC2
	for <llvm@lists.linux.dev>; Thu, 26 Aug 2021 18:58:46 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id e137-20020a25698f000000b0059b84c50006so4010120ybc.11
        for <llvm@lists.linux.dev>; Thu, 26 Aug 2021 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ViiFU95KoTSobvcFkVPuRN1El/Eu374C5RgTnO412cQ=;
        b=jTZHLx6W+kz9z/WI6uBPj4MWz5OMrQbE+r6SyGzXSq0PN3gcFJRFysbxOVBCYeDN9K
         bYCOJyI/iJSyYCPyPAS6apfvPZfgSmFTovS0UdWt6qttKd+dQqpP+fag4KPOpzVfpYxC
         weuZKVyUpeCbT1BhQtEYybFudT8onXbiHfVmAKsUpBhqkYvlhtHwLg10bmNPP/VkFdEr
         4ZtH5jZhiIKJGUoM0TPF9X2mvV+KqR+irm8C2aTHFnpArcgIInh7t96+P/w5KhYgDY/D
         gct4OUqOq10DpgaJZ6nIxoLLUwOZGg75AAovB3l+ZXB2qbmrOaiWRoesoBVTrg97aXPz
         51ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ViiFU95KoTSobvcFkVPuRN1El/Eu374C5RgTnO412cQ=;
        b=Mfll7aMxyZHCGAADI5ALs9LpKTBlvBgDFujAGV5J/1AGKl1a4D7sRb3fq+6VJJhIp1
         lQLIHDGId0XDthtkT9G7X2bPR2gnU6OybO3OecFplYC/wqw70UzFR84lmahg1Yp5zAIs
         sj4nRebsRFgA5IIxNoG00RJADwfnb+YT4ccooS9R3DoRXR7WQ3BN/LoajzeH+x1ZpJYb
         KwScXTxu/SgU/2fGI8CsvJbr3iQRWuIVwcTX7njK6k+rSSbMUInwWGNdFzTuhOZhiMb+
         QVWdcO468uRwcIAJaZZ/S6KK6/LsD0MFmkQVUbIFtZ45khiUoZrmdMZht76EnrjQWlHe
         C78A==
X-Gm-Message-State: AOAM532esfEM4OjHIPo4UXdryVZ19jbCJMct1xf1+XIzQzk55aJTuUP+
	kX0sQnt+Z5YcjXOeNiMi1Kg1C0zlEUfbR9ZbXLI=
X-Google-Smtp-Source: ABdhPJz4jhB0w3DUKkroOtMsJHJfDf3OBGTK3SYqm+qoFrGnQVdPe3RtkEXvXoqPFnplUJhVFhjLSiztB4XSEqnotqA=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:cbc9:2aed:6fce:b9e8])
 (user=ndesaulniers job=sendgmr) by 2002:a25:5e8a:: with SMTP id
 s132mr261813ybb.510.1630004325605; Thu, 26 Aug 2021 11:58:45 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:58:33 -0700
In-Reply-To: <CAKwvOd=ML1ytp8Q10oiz8q1ERAHcGnjjCSMOHj=tq6E2vHAkQw@mail.gmail.com>
Message-Id: <20210826185833.174862-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAKwvOd=ML1ytp8Q10oiz8q1ERAHcGnjjCSMOHj=tq6E2vHAkQw@mail.gmail.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH] x86/build: Refresh stale cc-option check for stack alignment
From: Nick Desaulniers <ndesaulniers@google.com>
To: Ingo Molnar <mingo@redhat.com>
Cc: llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

GCC did not support values for -mpreferred-stack-boundary= outside the
range [4, 12] for -m64 until GCC 7+. Modify the cc-option tests to check
for support for a value of 3, and only when using GCC.

GCC has long supported values in the range [2, 12] for -m16 and -m32
targets, so there's no need to test for support for
-mpreferred-stack-boundary=2, since cc_stack_align4 is only used for
-m16 and -m32 targets.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index d82d01490dd3..2744c4f60b63 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -14,10 +14,11 @@ endif
 
 # For gcc stack alignment is specified with -mpreferred-stack-boundary,
 # clang has the option -mstack-alignment for that purpose.
-ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
+ifdef CONFIG_CC_IS_GCC
       cc_stack_align4 := -mpreferred-stack-boundary=2
-      cc_stack_align8 := -mpreferred-stack-boundary=3
-else ifneq ($(call cc-option, -mstack-alignment=16),)
+      cc_stack_align8 := $(call cc-option,-mpreferred-stack-boundary=3)
+endif
+ifdef CONFIG_CC_IS_CLANG
       cc_stack_align4 := -mstack-alignment=4
       cc_stack_align8 := -mstack-alignment=8
 endif

base-commit: 2e98d9bede666aa8f2137047043bfba9c2c2edc0
-- 
2.33.0.259.gc128427fd7-goog

