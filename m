Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4172
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:42 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id u13-20020ad45aad000000b003829b9760b8so4154401qvg.18
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7QsELX2b4zYjlGgyKK6SovhZ4mE+qI9YjYk7qrPU0wo=;
        b=U3ToAP/4F0z7c/GCezlIqVZAyjDQl9Undff00n8rJGZDjq+07eqdViNINuCfWY1gAV
         unl0hcnz0BXbOBcy4UqMjtpy6qawy4EcwcORy+8OW1ACvyXXa6zNSchJ1AgtSuMiyhci
         A2Rb3gS4n1GsjAdz8QP0qRZXZlN7W5YcVoEHpCHtWmD7vAunZfgv5OLov4Y4ncEh1Feb
         8FI5yhThK1PcJDaedcnZ0vKjLy0BIpS4W/lszSEK1gEaPNiwNcDLMreQ6kvO28TkAnOW
         hUXG+aiWaZ407Veb2EEYZn3WXY1mJv3sZVnKlxe3E/7bfH5npygUexLcxyON5o7gD53g
         m+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7QsELX2b4zYjlGgyKK6SovhZ4mE+qI9YjYk7qrPU0wo=;
        b=bzoy7OdYBgsUIo8BeuM8xN7XNO3hRzZSjPGYzpaGad9Uh8nlgOPKwNGcv77e9IDzKA
         6kK7bE6dF1Ofc54jcQgPRrVv//No2NymdlG71t4UukBv5N3IaM6R0WXUxHnYDb4IOzZt
         O0vlc/qaBM/oiXutqGdfVG3wwLaB19HlnecwrvXWxRhRN4HkYlxngVoKFt5lOs5XJuux
         bLK9kxzbUsnyAgR7CVPX40o5l+Jm/RRArFOF5GULHSSDMVUlBLEc88DlpVSOZbdRjXHP
         llcu2KpWoVW4JCiQV0uOLAQj0j7LtTZtCkDS4DPnRIAONEBmj0TOqgl4GUX8MGJyDjTE
         Irxw==
X-Gm-Message-State: AOAM532icHt2hM/mmKpeYEPZEO2lONLVIQz1LoKi0ddV6tgxFOQgGKbX
	3VA2ByQI5heZHiah/NFb5U30J9ECqm5cRPd4+DE=
X-Google-Smtp-Source: ABdhPJx2qfURfbEwyFW4qktv+A5fIlkTLMCqBZahUPc77DrDAO6ToNYtooGeOAIl80LkI4WjSBoXazOHhIJ3TSe3qUs=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:1c8d:: with SMTP id
 ib13mr81485qvb.10.1633025141843; Thu, 30 Sep 2021 11:05:41 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:19 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 03/15] linkage: Add DECLARE_ASM_FUNC_SYMBOL
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The kernel has several assembly functions, which are not directly
callable from C but need to be referred to from C code. This change adds
the DECLARE_ASM_FUNC_SYMBOL macro, which allows us to declare these
symbols using an opaque type, which makes misuse harder, and avoids the
need to annotate references to the functions for Clang's Control-Flow
Integrity (CFI).

Suggested-by: Andy Lutomirski <luto@amacapital.net>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/linkage.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index dbf8506decca..f1eac26b2dd6 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -48,6 +48,19 @@
 #define __PAGE_ALIGNED_DATA	.section ".data..page_aligned", "aw"
 #define __PAGE_ALIGNED_BSS	.section ".bss..page_aligned", "aw"
 
+/*
+ * Declares a function not callable from C using an opaque type. Defined as
+ * an array to allow the address of the symbol to be taken without '&'.
+ */
+#ifndef DECLARE_ASM_FUNC_SYMBOL
+#define DECLARE_ASM_FUNC_SYMBOL(sym) \
+	extern const u8 sym[]
+#endif
+
+#ifndef __ASSEMBLY__
+typedef const u8 *asm_func_ptr;
+#endif
+
 /*
  * This is used by architectures to keep arguments on the stack
  * untouched by the compiler by keeping them live until the end.
-- 
2.33.0.800.g4c38ced690-goog

