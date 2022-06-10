Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC797C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:33 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id k73-20020a25244c000000b0065ca88b381aso580036ybk.2
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Km+SEqSQafJfKP/QlrO+B8JhEJgvv7t8sRyDHP36l7I=;
        b=tKyaaswHCvlF0Vka4hqQ38TU6ilg+rrQ78ebLnM4FfuhwM9T62lwgPgbZGmqVEK4z3
         cppKegF45ke5Bs+5aNH1UKbxpiMYkuInpWbnpY7DO/3YzVl0pyC34AEvR3RqcqVH0ynn
         Lo39ZsRLQVWZBypDxoUefxGRbqHDhx7N4wCEphc1UNRG+7Vxt0GiDM2zX5iXiJkjUNJk
         8U2JfGkl0crXRWKcnjZbMI74tRgBQM2TEIxfNJjl1gZ/BO3uud2jZowx8aMylpnZBiNc
         ysGG0G7dDodOPTiJ9tOnE33FKvabqAXEvds55FrKwiHhWkwqN5YeIuDC/0b745I5UivI
         kuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Km+SEqSQafJfKP/QlrO+B8JhEJgvv7t8sRyDHP36l7I=;
        b=MNYZVkrcA1vbQvIzgstiD/t4xE7XOeC6FkL3zXs1TYMnT+g21vlt5q+MwIE+SNoMoJ
         z4MqaBqrJ/bOrOX79ASPn4Pm4aaQQE8Cvz3vBBeRVf/7EJFwpXjdqb8nwsQ/q/w2gCfD
         dnfI9+qveBURVo1B2+gu9Bdxbg1QzQlNgknXWsAoY8NGbnUHjd7NF2PdhxxzPWMhL/QU
         05t9yAspGa3gUmSzuUgiR7OJQf6BPRyPg3VGMgOyq5iD63nm/NLOahRzvslu5R+s8p1r
         ZL5Bjs672kK4pM0L/taVQ5T0r2lWqfGgmyJv4KTiAHMUqGuz6P2iUyLU/rdm2Ed095Jo
         f9aA==
X-Gm-Message-State: AOAM531/bXZc2tpgKmHOM7IhKaVItuOLz/phkxNxmiCWs8KBgI2Zcon5
	n1G8vaXokirpsXWkrTqa/q+i3SdqMxvtAVmc+bs=
X-Google-Smtp-Source: ABdhPJxTy6tFxXoRTEcHD2U7itiAk1UqgcbD+GIro5oZ65OOdagO9Y4G4JP7ObGMOyyys5QHvSTjQ2+w/U+BvS5EW7Q=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a25:b904:0:b0:663:e71e:1916 with SMTP
 id x4-20020a25b904000000b00663e71e1916mr19474561ybj.117.1654904132211; Fri,
 10 Jun 2022 16:35:32 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:00 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; h=from:subject;
 bh=jl9DoMc+4oRrqZLAq39OlbrQ/0d/T8NfhRiPohw7q0M=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Ut8FBG9LlQYcuQASRpKpCEiZFqDFuo2OISqNmD
 PZHD7ayJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLQAKCRBMtfaEi7xW7htGC/
 9S64HtVNUNx8wUV9jEnq0eOMIRwIfRD2KvOlklON0r7+HT+G3Pc3gUkJCk10zTrCdF9O6RvedaSLQ1
 /APpiaRGnwUDzGRmTSr52h8ENGvOZT91UiUJS4Yw2DGcde7NhGS1BuoTLxP4l7z6QKu5QRjQ6iMvbf
 NRG2A7T8qWteCX3yLVRGQqSwq3usqGFdb+pXAaSjumRGoRftE0xL3ac+4NC4xX+mH3548juVL43+Cw
 aHMxz7BmXUffA7onVHE1txP0Zgg0LFxpupHSuoUepfjBuWucPFc8S1ocJKoFoJSSV6pVwHkap5ABEO
 BWbEeGFkI/kwG2N6kjEIsvWU7SYxiBwkY6ZrU6SY0yr1QlEnSuIYgeihNeV/eezgPXpmEmLA3K2rOs
 k77a1zmGXN/DmKK0/SQ6tnXd8KBpEf1y+W+5D/S3Oxxc/2zfRRBUshgafKlNTufhcex9IWhrCQmgVo
 INo3nzmG8TKawDTcvMlv4YBLBK3gqIeVjCwmORqhDtl9Y=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 07/20] lkdtm: Emit an indirect call for CFI tests
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

Clang can convert the indirect calls in lkdtm_CFI_FORWARD_PROTO into
direct calls. Move the call into a noinline function that accepts the
target address as an argument to ensure the compiler actually emits an
indirect call instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/misc/lkdtm/cfi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index 666a7f4bc137..b6b375112a2a 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -20,6 +20,13 @@ static noinline int lkdtm_increment_int(int *counter)
 
 	return *counter;
 }
+
+/* Don't allow the compiler to inline the calls. */
+static noinline void lkdtm_indirect_call(void (*func)(int *))
+{
+	func(&called_count);
+}
+
 /*
  * This tries to call an indirect function with a mismatched prototype.
  */
@@ -29,15 +36,11 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 	 * Matches lkdtm_increment_void()'s prototype, but not
 	 * lkdtm_increment_int()'s prototype.
 	 */
-	void (*func)(int *);
-
 	pr_info("Calling matched prototype ...\n");
-	func = lkdtm_increment_void;
-	func(&called_count);
+	lkdtm_indirect_call(lkdtm_increment_void);
 
 	pr_info("Calling mismatched prototype ...\n");
-	func = (void *)lkdtm_increment_int;
-	func(&called_count);
+	lkdtm_indirect_call((void *)lkdtm_increment_int);
 
 	pr_err("FAIL: survived mismatched prototype function call!\n");
 	pr_expected_config(CONFIG_CFI_CLANG);
-- 
2.36.1.476.g0c4daa206d-goog

