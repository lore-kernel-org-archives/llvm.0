Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828501869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:19 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b6-20020a253406000000b006484c081280so8398153yba.5
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tv2NfEjyfprEjH/WagRqqCH1hQfxPpGMj5Z2HbEgkRA=;
        b=pB+2omq61Q3217AvI0rEZSjmyFqJ9NJ7YuTSaZYQdZKihILOoXitcHp4Aqk4DfNuJC
         Ii1imHx96bqsVsHF4LbRU0itbEjHrNgVdkQ3irES1Ih8mxUshYfbtfCT+TfHZ/oz1dtP
         NY0q6seVOURhumX36uwOxNHojZ45LOr10er9aVaKi/UiJRMGUW9RPY1W/crXdM6e/nzW
         jbvzkhILVLoFfcKOggaouemXiLcCzeXKkf/R9rS3XSJYuy1mUw5kXCtFqCb5OkWHmIae
         AVmKCEcuaeO8akCJpncoE0TcUuvyXfT1iSaAa7lBOHuy3YgYc6i8BTmI6s6WYnCNi+AU
         t24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tv2NfEjyfprEjH/WagRqqCH1hQfxPpGMj5Z2HbEgkRA=;
        b=qA6HQ/LZfo3+6K6bj7JfHEVFv9WWlSsfB7XHq+bv4fIL/uZhljdBJdn51oUEnhN2iw
         EXV9IMJ896E9s7/q/6qm104a8fZeLArRULYI/A+U8ZRLrRg4nGWx3c5QkggWrjNkoM/D
         zEvN0utIXykFZ4cwBd+CqMPJXYcJmX95RlInnWiIOq9bMILQgN5YyPFWxMQunix5f1M6
         496KxyA181qj8XlsUePAwByDBe9Wdq1y1TdEVMgiXQQtqdk0keISroQWvGpqmTQnHTWz
         6Xoe56NEnAE4z9s28S0MJ1xcN+x6TCeX/rn2dRhzeYTcQAYq1/WhIP+l5UFkgINsjD2T
         Ej8w==
X-Gm-Message-State: AOAM532Azrr5quTo+kMAeRpZ8Kf0DvdxpedgSmTKkKCWGodDmGv8N5z7
	qnTIunVzucDXcvGYrIC3bPZ0jCtc/i86lbXbd3U=
X-Google-Smtp-Source: ABdhPJzf8F6MhhQvERk6o6aC905EfQk7qKag0BcoEBBD0uWfioudMPTHJnGQUhT5pwFx9Z28Q9LGUrtznvm+L73jrDw=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a81:234b:0:b0:2f8:4082:bbd3 with SMTP
 id j72-20020a81234b000000b002f84082bbd3mr1122079ywj.47.1651264638553; Fri, 29
 Apr 2022 13:37:18 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:36 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; h=from:subject;
 bh=tehRW82jP0RyTtdlRN0VdoftCcUQiAtEwsyBl3tnXQM=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExXrPGtzBdwEr3WsUJMcTa5SnMpMUdhtG1ELjyr
 Yo4vk3yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVwAKCRBMtfaEi7xW7gG8C/
 4rBi6pp+EX2VhofKNrL5OB4Nbj0tmkbvch9On+rothI5RrjLElKTQ7rJKCbeCMf/fd9MhXmmy30ZDc
 0i6d/nQFbMUJNbP3YvHszFfVozL5oetNY0LKa1tEWLrl1PmBWiMM1Y0hzUx695EFNuB9Z/IgzAWJHc
 VyKoFSgqL/HZvX7mFYcG2EAsOE+icuxIZICSAVt8NfVenhy3oKckN6+QZSZVHFbTE8sAiAE8x4UgZ4
 nSjkqIrcznKGhg5HogEmdwZzCaAcGZxDqdA0V1aaU4kyfLHFp9XZzKmiiUwTYYSWwvCY9Tvo+xL+Vu
 0CTamYHWDP1HUePZ8CB/mw9CsUeTuhu6zkvuMYcG354jmx7ooV+gAhNyCiEi4fKTuxQ5a1mRQuNNRE
 8SsQdB8squmkfEfpsoDlQCt5QaUw4WeUghUIX9vTwT7ISqGIun7rYMiGMRNi2bz7Bl6AT0hPw82Lgr
 VbBurkClkSn9jw/pGy7ura6cWEncKA6ChV3483s2teTmc=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 13/21] cfi: Add the cfi_unchecked macro
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

The cfi_unchecked macro allows CFI checking to be disabled for a
specific indirect call expression, by passing the expression as an
argument to the macro. For example:

  static void call(void (*f)(void)) {
          cfi_unchecked(f());
  }

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/compiler-clang.h | 2 ++
 include/linux/compiler_types.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index c4ff42859077..0d6a0e7e36dc 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -94,4 +94,6 @@
 #if CONFIG_CFI_CLANG
 /* Disable CFI checking inside a function. */
 #define __nocfi		__attribute__((__no_sanitize__("kcfi")))
+/* Disable CFI checking for the indirect call expression. */
+#define cfi_unchecked(expr)	__builtin_kcfi_call_unchecked(expr)
 #endif
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index bdd2526af46a..41f547fe9724 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -263,6 +263,10 @@ struct ftrace_likely_data {
 # define __nocfi
 #endif
 
+#ifndef cfi_unchecked
+# define cfi_unchecked(expr)	expr
+#endif
+
 /*
  * Any place that could be marked with the "alloc_size" attribute is also
  * a place to be marked with the "malloc" attribute. Do this as part of the
-- 
2.36.0.464.gb9c8b46e94-goog

