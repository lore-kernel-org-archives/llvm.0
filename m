Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108F134BC
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 18:35:54 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-262e9468034so8053835a91.0
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014153; x=1691606153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zW43FbHuOlleSu+un6XWqUn1fn2QP5MnKtge68NZw=;
        b=2BvIE+7Cb5J6MVl7t68AQmPcTEFhZlWe+/b7KN/uzDN9+Ao94fJCMlNpxZlDgcGKeB
         m7Tl+0X9ccOfZ5iYWxiMFwYu8nN55HeVYr4+ygARqmsVCzleZFu1hQDTPf+6UsV5eCOl
         kLBmxXHq0U/yhc0QwEqq00hwEhv3CEZRvWM7eMi65KLJY6UXulbtXwlfFOOvNvw9zY1U
         yedqcc3skBZ6xL9hEdYz7sPiFHWBSANUiAkJAZOILfsY9K1OSZgWw3wcPdmj7Kt8fZcu
         ZjEHV76VEFbS5c51oWd9V7kbiPIXZgzl+hqRGNa3UlpuufenDyzzjDzQuQYbYuxS7VeN
         VuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014153; x=1691606153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9zW43FbHuOlleSu+un6XWqUn1fn2QP5MnKtge68NZw=;
        b=UYSv0f3ge6PskGa03mceSHcZ14lcHJ4xDwWjHtF7NS6BWUpLBfsMlHmV3uigTV1dXn
         1YLlU+SBbYVSJvgbc/azKRXVgyFaDY16qMlgjJ0CB/gZQYb4TJSkgAQq/tsV5bTHR1rN
         FWebG8Pgf63xzrn90MOigiPs54hq9y6qIuASlLlmyMTaCUop5pjIz4JCSwJC76r65FXr
         GR4XtyjkwNUvCN8Xg5cvG2Zevvfi3+5ZrxbGhR40NqS4+36Jms6wFEuvIXRsyMiDltDo
         +s1PW2rFng+DQv7USY+psbwFSJA/TAYMq3On3ekFv69rSAEd3wNCXBXFX3FY7iQC/Ne+
         d8xA==
X-Gm-Message-State: ABy/qLYmFYlAodRvKMexCp8fswFVdaTBaHZt/KqBMuc2j6p7K33kfmRF
	zv/kIM9xoOWR+Qsr/E4dFVBGBe82Kj5tF+hrxo8=
X-Google-Smtp-Source: APBJJlEHUxfZq7uWFQrz0VKHKSqMYGKtLRHE2eeMBabDYg36u9soDrUt3GcdQwg/5s00tNoVMufWeUuLPI80l6/+3Fc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:8912:b0:263:dcce:ca9a with
 SMTP id u18-20020a17090a891200b00263dcceca9amr10877384pjn.1.1689014153561;
 Mon, 10 Jul 2023 11:35:53 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:48 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=samitolvanen@google.com;
 h=from:subject; bh=SyYGssy02WwznPseKLFWBeRZamjspo0IenMK/78d1Tw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+AvhWQwKiqzsK7Notr2TR4pdX+nw6HsLRg3
 vakDRSEwnyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgAAKCRBMtfaEi7xW
 7m1tC/9kAC6G5E9nlSHjofInL/y8Zju/2BQWR+G6A2hA1YqzCT8IGkEC1AOGiEzHTcV3GCT/87U
 h87Ilj+zvqCqR/d+1E7J9h46MhhF+f91eFa3Q5kJ2dnf1eX0M4HYypa5V/CoQ7RZNtqr4I39GY8
 v5SyYiUxkMUMEemjvdfuawjqjnFuPAyWyWVdfZICe+4Sz3zISBhytRl/GX56rQnYFBa3M97kAq+
 AM8FE6CO1URei4DbbZk7iNcBStfCfgywRwJonIGhtU7ySqz56WP4VVchnPlMDd2/uFrWwVfnaOR
 gHgFbUIGyvvJRDS2ioIDNTWhYuiAwUzyqbpnysqXGWuSm4fshKMe2+HwhBVABEk2757Tq21sNoN
 jvxlF6Rf8fhicoFRZHmWrSpYAHFemEceYre4wE8AI9ZC1v6f1raY1lMDD5QEk9XE3mFHOQDjdU0 BmpHkd0OocbQjGmBzxP6u2W+S41FuvElG8m9BI30J7iGdiMFpjgsS9pXwLLwK75J6Z0PQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-11-samitolvanen@google.com>
Subject: [PATCH v2 3/6] riscv: Add ftrace_stub_graph
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 883bbbffa5a4 ("ftrace,kcfi: Separate ftrace_stub() and
ftrace_stub_graph()") added a separate ftrace_stub_graph function for
CFI_CLANG. Add the stub to fix FUNCTION_GRAPH_TRACER compatibility
with CFI.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 6c9469050f4c..8818a8fa9ff3 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -57,6 +57,10 @@ SYM_TYPED_FUNC_START(ftrace_stub)
 SYM_FUNC_END(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
+SYM_TYPED_FUNC_START(ftrace_stub_graph)
+	ret
+SYM_FUNC_END(ftrace_stub_graph)
+
 ENTRY(return_to_handler)
 /*
  * On implementing the frame point test, the ideal way is to compare the
-- 
2.41.0.255.g8b1d071c50-goog

