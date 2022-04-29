Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D81869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:29 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 7-20020a250c07000000b0064137917a4eso8373778ybm.12
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pCRF8WxuKsJLhQegFtXAhQOgdkZIXxpUFMBNWofutJg=;
        b=rb5PJBXqZ7PDnTljG6ifIE8gyd72IC34q/VtcjXuyOJl6AMtdmAjmsfq0lfuEQekK+
         pMx1HTeDGFvMcB0zYoRjn8iodh+Cl+ug6t0NujoKdJdq5JfOpcm53hx9cYRc9czaoM6V
         wCCo8uZtcZNwjZnC3yaMKuANSRu6vyIDn4uQlpbz9pEsr0iVULxkNpsgUh09QxYqO+bt
         8ih8Yb01J1emTtSHlr8jVVrGUw/d4znoCzHf779F0LEMOL9mgrcOcmkCJcbSd2cORoDr
         xqfesnGB09orA1eomT3hmGVMGTGc6KccZjw7UoOwSyooZfLr+oU9LAzuLtNDPJOImR+j
         aHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pCRF8WxuKsJLhQegFtXAhQOgdkZIXxpUFMBNWofutJg=;
        b=NFJhmAE1S/XAOJqiPiuCzkE38mlSV/3VIR5kZRf616Rd6H+0thmg2jUFn3fqMM8Vl/
         rX+GRb3bz1fCBS54bMOZ6fE1PDz7pvYcsCRLt+cODB1G8ncRW4CglrW98TFgpoj+tSNX
         KxnkOh31OlY/ERzDeVbYdrL0efMbXXAenakFPIymb30GPrWJTzQKEqfh93uQnla8GXjL
         EI0sOYK6Q9Qvgb0Fdp92i2OZZVLrZXIrcSy+ZRunQjhOQSLy9Oyxd4rpczZlLy7XrK7a
         VOyaXcyLMCEiwC//zQfwQ3H8g7V/1rbWmq5i82VnFRVHHOr4NW7z7CQzbJ9MU+4dLunL
         vvmQ==
X-Gm-Message-State: AOAM532zmNcq71WTkXAlPZZSyIccwrV+gHYD3Sqgbn9sxjSzsOw3TM5F
	XVXt+l0izGll83i6EOg4UcQS4zOTjiRlSOBQ138=
X-Google-Smtp-Source: ABdhPJxW/4+AcaZSu3uuWyLU6uIyltSWFVdpdAXqDeDs5bikx77gj1C032JW2iKcFOB1vCKNvHaYzdWvZDktOIt6B6I=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a0d:ddcf:0:b0:2f7:dc0d:93e0 with SMTP
 id g198-20020a0dddcf000000b002f7dc0d93e0mr1144605ywe.9.1651264648287; Fri, 29
 Apr 2022 13:37:28 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:40 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=641; h=from:subject;
 bh=DxQc6EGDGB8zEXE4dDnKQIh2BeDsSr/ulqb1I/8a6/M=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExXdkK4E+eES2dE3iysIrEucJWLi1au+dxYyIiv
 PoIr2IqJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVwAKCRBMtfaEi7xW7jN+C/
 9NuHLivGVpdnQ5h09S1KucfK0dDYhnxeXvjJsVMWhnO+lQDVoYHCCl5XS5s1fIVTqbdKMprLkXjWt6
 pmEkoXNNEA9NLrUjE6YWmfUmUHDQ5qLnl1zZRAdfrDM+TwEdRrdk76z3O1H72HxKW2Fhdo0fp7rO/S
 AfFpWddva2zdjw6GUPJcbTB08W2/n/QuoReY4FJI2CiZ5dhhjeP9UA+yefvCFQNmyhaUX30cg8Jxm8
 H651xE0f2VrSPBcSVmrVMN29dgeghi1M0QnTu3SWABhA9Zq/sWAq4dmOhnHAjFfwPVr/B5TDzIadY0
 yt/QHe4RXgBdIpCeYc+nV8hl/cRLKQ+KtM1YfepHZV2Pn7EqOwnvmiMRpDIt8VWv/W5SqdpE4SNG4K
 wS1d/ZasQIzQxU+EC3z7E5RijhdSJh9X5+J0iYeI4YuT6IhQsCVsn3zqUwQLXusdt9Iu6hwIiOOJ/5
 V86zuETn5IGcbe1euGU6/Eo3BmgfEx8DHtnulobHhXn+A=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 17/21] x86/tools/relocs: Ignore __kcfi_typeid_ relocations
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

Ignore __kcfi_typeid_ symbols. These are compiler-generated constants
that contain CFI type identifiers.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/tools/relocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index e2c5b296120d..2925074b9a58 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -56,6 +56,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
 	"VDSO|"
+	"__kcfi_typeid_|"
 	"__crc_)",
 
 /*
-- 
2.36.0.464.gb9c8b46e94-goog

