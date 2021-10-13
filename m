Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852372
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:09 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id i83-20020a256d56000000b005b706d1417bso4088161ybc.6
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FoXd8A5yBl5zTK4n74qRXb6mrob4ulbtJd9Mt05Vdgo=;
        b=KiscXSO4k4IYnMTbuXNW10nY08Qehib8Dg3+aXDD4VrMmp0EHge8/M//AQJadMNjpt
         kqrRb3i483KcY0hAzMYuKZZXlOfaow85GbRWRia5bXakYv1MkbVO5LQGPDTd4a0AbAmb
         y/Dhjek/tHDXR6IUO94R7Wf9bnV+iUj9R3b2qVwYCw7wqcRDhID+VdVsdDM5y4oiK2wQ
         24zvPYKL7fGOp69C7wdWwArvNXgrHReV4925g6BncfFMPVhUebt/Mx0MHRfOuKyYlWFO
         TDfoIrLjIBQjk3hPvZratn/i8kHf0ebSvgR1GWJZmPlzlobS0mouniV2WZUXT5Zy5EuJ
         BrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FoXd8A5yBl5zTK4n74qRXb6mrob4ulbtJd9Mt05Vdgo=;
        b=2ApBNGtY70LbREg29WjpDxquHEvEUimx+FFBlojmTbWwgodcUy/1yvIoFBQbSKGKDc
         rVwFltlv8HeUP8jAQHpz8GoC0bbHZbN3A4zHfnXSfBmcMi4pC3WTp0bOzykm00NLm10A
         Vol8b5ovmW82VEEt988dWsjN5RrTUlVoAhrz48HZcFKQZwO5MX7P6B4AAIvjKrCq41lM
         QidmH+GdVWdbtXVncZ8Bxpvz+HKXId/5hyUfIYDg/kZD4GLmgNlIJKaoVywk+TaPBnZ8
         ymnCDaXb66zg2Nq+pDOS194ZkxwZ81j0VnOP8k12v/xtVbJR+H+nrB/bkEaICimu5oJl
         Fo8g==
X-Gm-Message-State: AOAM533CUWSYmNxfZ2Fk3D5sXLeWYTOB9DvN7tg5rvZavSbj4GJYxL0P
	bF1dQSkPF0eUSKaCJdMnK7Tb24GlFMBNismoRsY=
X-Google-Smtp-Source: ABdhPJwEBv6OWKYR60C1enDw/WfBP4Jd0wflLwl/UqP7LiwqgaJ2XY67Os7aW5OuVY7MCGFxvnDaSEF7AvB+2FYUcnM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:9cc4:: with SMTP id
 z4mr996366ybo.438.1634149028156; Wed, 13 Oct 2021 11:17:08 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:46 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; h=from:subject;
 bh=9TaYbW6mmsL4TERvjvklbWb1rsI1HLNkbQv0+8k6eF8=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKYk3d0zoveLU3yO/ysp6D7/qX5kCsV8mZRDQAS
 JQ6JgCmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimAAKCRBMtfaEi7xW7v4VC/
 wLeecHklbE1u2GdiD+6gORRwE54gDbkRU7gp135RHtkvGGmUbCVML1bRrDxnoU6z8Tkx+CjUh68lcN
 lMnkynHrYrJDCS1xiW+26RnB2xH0dWx9sqgKLec3QlRwnT8nD3dfabLSzT7IQVYaXhwkdH4WBVLPI5
 OZgr4JW+/XxoOOkMJqXSklHIqoaL05hpaAuq9HMP4tyQqmFdKAcSye1ObdWd8dioM5vvhDS7vWPASe
 kjG4dBMun5lUlSWU8c/v4ZluGGkqJoGSV14m4CDrSF6LBvny3ewoBYnW2ed+iASMFIRo3dPEdHiwr8
 jkMmAv50r+KSxkHdGXi6I/5FRcP4A/zs4LEOYVFntCNq1dZZVcJqmMA8FivAmTOVX0FL8NzjX+P51x
 9ERwEDELBbhW3Jg2aA7n22kwHjNAgoII4ONUmp+TR8ENGnig/dx0B5ncbfs1iUpJ6qbWQT6ahP2p8B
 spRc8RS6OjkzGuIpEGJTYQO7VxCzwbOL3UNGPb3N5JSVo=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 03/15] linkage: Add DECLARE_NOT_CALLED_FROM_C
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The kernel has several assembly functions, which are not directly
callable from C but need to be referred to from C code. This change adds
the DECLARE_NOT_CALLED_FROM_C macro, which allows us to declare these
symbols using an opaque type, which makes misuse harder, and avoids the
need to annotate references to the functions for Clang's Control-Flow
Integrity (CFI).

Suggested-by: Andy Lutomirski <luto@amacapital.net>
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 include/linux/linkage.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index dbf8506decca..f982d5f550ac 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -48,6 +48,19 @@
 #define __PAGE_ALIGNED_DATA	.section ".data..page_aligned", "aw"
 #define __PAGE_ALIGNED_BSS	.section ".bss..page_aligned", "aw"
 
+/*
+ * Declares a function not callable from C using an opaque type. Defined as
+ * an array to allow the address of the symbol to be taken without '&'.
+ */
+#ifndef DECLARE_NOT_CALLED_FROM_C
+#define DECLARE_NOT_CALLED_FROM_C(sym) \
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
2.33.0.1079.g6e70778dc9-goog

