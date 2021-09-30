Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E972
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:50 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id u13-20020ad45aad000000b003829b9760b8so4154668qvg.18
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nyhBoKfxi6FxDeRTTSmIOiquDaJDbE0FRQCKwRagYzQ=;
        b=T2lq5gRHvw6HVmjDdKTKIU1Ifpl7jyOJEawY1hRX4vNGm2m2nzy1S8ESeA2a4KNaxe
         xhrDFVZgVoHH7n5+D6FzMG+ADaHIqQfT5a3maFMxqN1us5n6zUhDM/4ui2AjQ/KXJaQC
         fQPzA4TJyo2y4De2ZswfldLfkLbVcxP3yYMEWGBpEZwvQO9/SJLW1/LkkgeDWdzCVDpw
         nyKxKIEzcgDsh/sRCZh3QnyKYWkZOA6Wpc6V+uhnQTPw7D9cJoRvBYcUYu4QH/bAcm6z
         e7AswDeOL40y/jPDduTFcfYjw7Y59rNsNbWUUVP7n2+DL39rBCbsI1hqyvNLKT6ngpT7
         bsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nyhBoKfxi6FxDeRTTSmIOiquDaJDbE0FRQCKwRagYzQ=;
        b=LiVeMRiNydgLQiEuD3neDQMEomD+8X3AZQM7iWXb9nfXFF3WOn+HqQJN6iXX35d0lA
         XmXjbxBR4eubDiNIDhpgD7YLtJbOClEH2qe9yh8AlC8hfD81WGzydZDHGHvY+fu6lRlW
         xuaBBhI4jZJxIdVqthu/lTq9L+eBDfJ/ysJWYIFjGA0cEL2pRtQB9zYnhf7ZJ+MxAmOA
         /aWIm8bpKrp4OiEYhw7pCOiDyJm0lwQVDKF0QIsFCNcg3SehM4UwFHtScpYXaIIaOate
         rNqolD4HdTH42wf4fBKXZwTsoX8muVhbc+z8DG849pbL56nfSIND73HA/WhPmlWw0BEr
         p6Jw==
X-Gm-Message-State: AOAM533Xd9cS32TGsSBlRlfsfU8l4V4UCijAFY8jWaMsh4rPLKofOdLT
	xfz2DKbX70jecPxrEWMfvij54iA+BXQZGx7y/UE=
X-Google-Smtp-Source: ABdhPJww8bG0Sv/OFRh6ZYC4dDKnX2iWbaFo6aoQfxHbUGCC9B7YtHlIYDywb7k5TQZjobzIRlqWU7FhDhse/4Y7wIg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:5cf:: with SMTP id
 t15mr5253298qvz.25.1633025149389; Thu, 30 Sep 2021 11:05:49 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:22 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_CFI_CLANG, the compiler changes function references to point
to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/ftrace.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 832e65f06754..67de28464aeb 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -578,9 +578,10 @@ extern void ftrace_replace_code(int enable);
 extern int ftrace_update_ftrace_func(ftrace_func_t func);
 extern void ftrace_caller(void);
 extern void ftrace_regs_caller(void);
-extern void ftrace_call(void);
-extern void ftrace_regs_call(void);
-extern void mcount_call(void);
+
+DECLARE_ASM_FUNC_SYMBOL(ftrace_call);
+DECLARE_ASM_FUNC_SYMBOL(ftrace_regs_call);
+DECLARE_ASM_FUNC_SYMBOL(mcount_call);
 
 void ftrace_modify_all_code(int command);
 
-- 
2.33.0.800.g4c38ced690-goog

