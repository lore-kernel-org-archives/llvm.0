Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4672
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:47 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 207-20020a2503d8000000b005b6fc088578so4434336ybd.0
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+kIR6qTjG/q5eMITJU4my49cgyuaT1AvUzOJ+gtDnlg=;
        b=gkCn4CDHLNSjsTR7OqrAxG6q83amYoBjzRr52f4LFVrdFSlQ8WBZn3Kp+3hZbL0upx
         4QgBEhfGWRMKKAB/Rg5nkWRPHjKEkG/A1Q1qhUvrWVXvLGMuMuBA65OpsS/tfbRK1pcp
         eZTHr+xF/PKqk0va5Z1T6QCYSxxDDVLojGTe6x4KArjInUM6eej4hO0563SYOBLYvQxu
         yxWiLR/GGIF9MjLLQ4I9iznSEWKsa3Wm0AcgJ7EcWRtashf7JTUQz/Fz45R7wS4Xruin
         N84Os+Y9Bz4ZPFcIAj4+J/A0L0R7xfD7qZl7197i2pE3AEJLLWz5uVkY+0dbWWm5rWpY
         CXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+kIR6qTjG/q5eMITJU4my49cgyuaT1AvUzOJ+gtDnlg=;
        b=S20Ru3NGWbNI57LfGMTMVdmaUQSQvCj+MGaTKJxCcK876RSbkTQqyaDlywJY38mtSU
         p3kaqhV/13+MXIcd9lGLOQGOR7x3Z3nRpT25+/BQF0BSX34UemvO5NAs6N6Kh8m1rFTx
         t7MGAB0ml6Iso5hBnxGzJTV1OCX9DquyRmAqWXekBm6l1axvz3q7xA+mXrtjLjoTT1eL
         J3duqX7VYJ7bAB7g6RQ1XL8GOg3yAZY+P3B4SfOwc5HaiyoCVYrB06FNb/ALsURZxh1R
         d/vpjlUXGXeK9U4273QyM8Gx9uakpquQFqk2qfRiUWWFT4J0/MNYhN6m/xutUNwNgBbO
         6Lkw==
X-Gm-Message-State: AOAM5334saQHQlk9CS1ApkUYCSQTusynZijSYNyeBZ7zOOekoWQBSe/j
	2fgvXPAh//y6OX4MOe72MjFeJDa5zq8q+68ZFcw=
X-Google-Smtp-Source: ABdhPJzeouRFzQrqqzPBJAENZtj4Ib+N4rD5s05tDGC56V66KMQtSgvl9JGoFrlez4rsmfK0wargeV1Nvuyh26mOOio=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a25:45c6:: with SMTP id
 s189mr689329yba.290.1633025146834; Thu, 30 Sep 2021 11:05:46 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:21 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 05/15] tracepoint: Exclude tp_stub_func from CFI checking
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

If allocate_probes fails, func_remove replaces the old function
with a pointer to tp_stub_func, which is called using a mismatching
function pointer that will always trip indirect call checks with
CONFIG_CFI_CLANG. Use DEFINE_CFI_IMMEDATE_RETURN_STUB to define
tp_stub_func to allow it to pass CFI checking.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 kernel/tracepoint.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
index 64ea283f2f86..58acc7d86c3f 100644
--- a/kernel/tracepoint.c
+++ b/kernel/tracepoint.c
@@ -99,10 +99,7 @@ struct tp_probes {
 };
 
 /* Called in removal of a func but failed to allocate a new tp_funcs */
-static void tp_stub_func(void)
-{
-	return;
-}
+static DEFINE_CFI_IMMEDIATE_RETURN_STUB(tp_stub_func);
 
 static inline void *allocate_probes(int count)
 {
-- 
2.33.0.800.g4c38ced690-goog

