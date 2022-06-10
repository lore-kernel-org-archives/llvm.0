Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72C7C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:36:00 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-310061f47faso6132207b3.9
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/YdoENWx/mAwIlav84XtzEM8pJp/ZShtiRERHwv8fgk=;
        b=oDVWPxm862LO41p5JQli72cL6SC3b8g0Trkuno7CCXFvcBjRxpXttKaI/pVSanC/Zl
         Vje4UGYZ39eBOwzo//aMXyNSEWxAdIsd1P0ZTOgqDoI1wod69+tNn1dzVJNB1Ulr8ImW
         scaT2s3l2QriiH4QWW05s8qCU1Amf9b1a4kUP8O73C2Ww55Bi05flppgfkva/QUCzPnm
         XEc6tpJQzpBgkiA+RbTJLVWbhLyu9Rp9sJlbSwJqOfE8hx6Z7Q357nFfHBjtH/1aBAVU
         vqiHQWv6nRu/E2+ZeBLDLh4K2Wxqql+k0neKAZAOZJbjQ2wkknvI39xE1fnHVVuSCaT5
         mMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/YdoENWx/mAwIlav84XtzEM8pJp/ZShtiRERHwv8fgk=;
        b=nGo21nfJ3xvEG2fy/inHAQViCS/AHLuaYxc4tcSaQFFdDvPg0FAc+luViLE9vSdBpp
         Q0EixNXH1MngZz7tfGqt8jzJTWzGquH+03Z9p4HeT77EMJtKFoVrltzZpp+ghD6jn9/g
         6/WKU5UdG6IP7NpI62DFA3RBVC3zJPi6++R9F5cNLKzOumxQ4h7WeL4MfpCEXidApVFH
         xOc4bIbmCsH7se6PLE+mavU/MxyxWN0FSgFuM8gQ1UnQMmQIS+UXNG3izzhmACl6WovK
         2xqbVji55DRSa+d0tcK4NBZKSvczZ9Z+jzzxSoe0rfKxLCdUkNZ6UDo+1TKK287QO2Yy
         TlOQ==
X-Gm-Message-State: AOAM5331uLj1XWqVy8G6lOZfHef2HAG2PPBjBhkWS0+qMhvqPcaHA1tn
	4VSmLCoxR5JfPc5ls9KajfXmsJXMQZWkVhjPPQM=
X-Google-Smtp-Source: ABdhPJwEb7zWbrSyMsHOqlXSAsGrBX3LLXlDk5EbuAiIe6Ma4s8JgFljIZZK1OIRXbt6vvnW+6MZxtlKUU6AP06ljoc=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a25:cb0e:0:b0:663:dc85:b07f with SMTP
 id b14-20020a25cb0e000000b00663dc85b07fmr21155170ybg.267.1654904159638; Fri,
 10 Jun 2022 16:35:59 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:11 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; h=from:subject;
 bh=c5fielqFYGYpvsKedyilc/H2Rr+1afjZ3wdMFUGQUCc=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Uv0/7/lO/mnIbFUgWSTs7dx39dQhfjXjGdMwcr
 RtG0qa+JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLwAKCRBMtfaEi7xW7gELC/
 44se8OEED7KHWmOg7kDWnbI0YjEa91XqAWcQPsSxThOl3wAQ+rAffK0THfILdMD6dkBgSBFpXTAApK
 t7Y288tyNG52SNBAQ1ZojqnPYABcqVapktuafJehAy+4dWnWQF5fJ5mr+OhqF2UQGlPBcLCkeic9Co
 a9ch7dW02t9qBoM5ibEjhg5/eAvsKCqTgfq2KoSgOqSfcVDWR7I96kD8gdggX+t4laYAEGwnWi6U1o
 TJqzhBuL6wQkvQKh1eIIMIhs64WqdcpKTslcYYGr3zmeIHcrRLqpTwaq1j+P1Z+L+8cfdshksjinj2
 ymXZnhbliJRm977/Yfz42UQqApQfFzcNbBCCHJ/w61KvC2piZoLWn8wW54wrVn0A6MLDb71hJ83Vbc
 4KX8y245LL9weyZHxmVHAn5sHims+Ewn1cNC6C1lndZQrRn+LfXrSEdYdUqOQofoinW/Q4ouN8C/UN
 5juOkNkQLy1RKp9knBH+fAn7C95Nlx+TFJbZHYwT1ank0=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 18/20] x86: Add types to indirectly called assembly functions
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
must be annotated with type identifiers to pass CFI checking. Add types
to indirectly called functions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
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
2.36.1.476.g0c4daa206d-goog

