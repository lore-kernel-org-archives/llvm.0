Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093637A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:41 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id t42-20020a25aaad000000b00649d5b19ee3so8224963ybi.4
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nUpPaqC0eYL5Nt1oJAx9xMuIXQVPdTCitfDNswclMOQ=;
        b=NGUyzaEgTOzOQLTvGRKxy+h20499lPJi5/bsMfRsZPY50ZEZqUY00bPfA5hyNxQu4L
         vN8+OSPtEHMBxroLCTwKi1OSx4Vzz3fhx04vGmzP5a0PBrWxie/lCPWbhCj/liIjolRo
         NqTebXuV+en7aRSF+p/b93gOcmPVRpVzC7/GH3X/tKBVpb8qIKWEQT/gKhb+CzKbbYo4
         +kCZheZew6tKW+x89Ktx1lasOXVEVag1VVYCJlE2snyDQ7WQcJEZnsYNaVnJjuzTop5H
         Nl4yioYKQ958oMvcKEMiiZhY/HU3opeNEd5zKqAeoqbQ4OqqG+TCsRg8h1wnkzkZ9mcJ
         9zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nUpPaqC0eYL5Nt1oJAx9xMuIXQVPdTCitfDNswclMOQ=;
        b=oZ5JJov0I/hlmNdOnqT/yEvowZAc+6IsuPQi5T34QicHkszwXDxv4RcG1/vMjbZRtX
         qz3UC2OcvRGByMePvA02gpZXVBjIoxJGHu3sdPXjKJ4h6kCaNoLuYXlqpDtSRGRufxYc
         PFtYxAkToSs2LnNV1edo0W7f8P+dzLDZPbSu/yZTi7/ZLZGCa+WPsnRfXdzbAwjkTocV
         sBhvHk/xrN3OhAO0akCrMMn1ypizouC0f0sGlhDAv6E7G0CT+rnc8ED+HFk4nlUxFhox
         HGb2qr2GeEyHsmhu2mlo4i2BB4qUjMWwFrwX0+xrU9EVM+pg60IeLrwDR7OZ1TZhnm5/
         H4AQ==
X-Gm-Message-State: AOAM532zsy9JBGqO7bxQstNuv9XBHT2VVxYIuEJg0w90gpltRIdQ0AMO
	aAJd2y7AnsKuyD5HX8El0SKYSu63p7rDzF2Ccak=
X-Google-Smtp-Source: ABdhPJym3cBdFsDpIM2tmSGXzSDbcw5wm3NKeWj4wDNkpC1RXx4qZwbZndlBzE2vMNk03H9K3mFgotzJMVnS9Ymc5Zo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:526:b0:648:506b:1a0c with
 SMTP id y6-20020a056902052600b00648506b1a0cmr6623042ybs.254.1652473361076;
 Fri, 13 May 2022 13:22:41 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:55 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; h=from:subject;
 bh=Tzngjb8MoymH2ioVLVXdJdgOCZQILE66fWSMpHjt6pE=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3lsRq/H1xovX9N/KUFK0NOk3o/nIT8tQQsdWEf
 Ofbm6FyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695QAKCRBMtfaEi7xW7sS1C/
 9gij0HCI9i3xZiRVcPO0F8xuDwz3inbEGwbWsTKqlXSy5gWjfweTKMJXIgkYcouSrgbOjhl8nzwPxL
 81nocm/AhRTr3/yte0jvexKghAR3TJlP4Qu3fjMwdAN97zxjt9+LTucDd54iBkvR9iDd23FMge6C7j
 YPIYFUshdjCb3rqxtJyoMrTauMj1hPnhMANlj4WDN13X+Ay16VtB9w0JPAwwAy6A/uB5M3QACY2XJR
 pjpKA3O+1HU1Ojf7QN7z4DR63l/wHh3+xSKudUS0njUm7mZc617Z6n10l2nuxvfVFQVyvlFBS0hDPK
 +kj+tWdbgwuqRgr4/HwxWx0s5ssxvIn4V12RFbkaNEPiI78ESoVO5vyvelqxDjzRlWKId+HB9a6i8D
 92WpY30bsvj+a1djwv5hmFiTsICSpLsIXFCeMZa5lwzBY2u/7GEdUcwnwzqyYUfLIYiqjbhnvExzYD
 95XvQRRTCdT2ULBXckH5XIp+S2pLb8o2bqHbgUcKAJwDs=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 17/21] x86: Add types to indirectly called assembly functions
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

With CONFIG_CFI_CLANG, assembly functions indirectly called from C code
must be annotated with type identifiers to pass CFI checking.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/crypto/blowfish-x86_64-asm_64.S | 5 +++--
 arch/x86/lib/memcpy_64.S                 | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/blowfish-x86_64-asm_64.S b/arch/x86/crypto/blowfish-x86_64-asm_64.S
index 802d71582689..4a43e072d2d1 100644
--- a/arch/x86/crypto/blowfish-x86_64-asm_64.S
+++ b/arch/x86/crypto/blowfish-x86_64-asm_64.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 
 .file "blowfish-x86_64-asm.S"
 .text
@@ -141,7 +142,7 @@ SYM_FUNC_START(__blowfish_enc_blk)
 	RET;
 SYM_FUNC_END(__blowfish_enc_blk)
 
-SYM_FUNC_START(blowfish_dec_blk)
+SYM_TYPED_FUNC_START(blowfish_dec_blk)
 	/* input:
 	 *	%rdi: ctx
 	 *	%rsi: dst
@@ -332,7 +333,7 @@ SYM_FUNC_START(__blowfish_enc_blk_4way)
 	RET;
 SYM_FUNC_END(__blowfish_enc_blk_4way)
 
-SYM_FUNC_START(blowfish_dec_blk_4way)
+SYM_TYPED_FUNC_START(blowfish_dec_blk_4way)
 	/* input:
 	 *	%rdi: ctx
 	 *	%rsi: dst
diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index d0d7b9bc6cad..e5d9b299577f 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -2,6 +2,7 @@
 /* Copyright 2002 Andi Kleen */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/errno.h>
 #include <asm/cpufeatures.h>
 #include <asm/alternative.h>
@@ -27,7 +28,7 @@
  * Output:
  * rax original destination
  */
-SYM_FUNC_START(__memcpy)
+__SYM_TYPED_FUNC_START(__memcpy, memcpy)
 	ALTERNATIVE_2 "jmp memcpy_orig", "", X86_FEATURE_REP_GOOD, \
 		      "jmp memcpy_erms", X86_FEATURE_ERMS
 
-- 
2.36.0.550.gb090851708-goog

