Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9A612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:32:20 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33dbfb6d2a3so190480517b3.11
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=nLLyHDlqzsc75HWG24SP3SGpvgxZ9V3UrO9VtB9+qSI=;
        b=en0MzguAxkGbIecpah/2+Xtucf1JeujXbvoM8sjRtirhhrivHvxhOjjc8XjIzzeau8
         iqt1tYXFNwhoWt5JWeB4Qw2qlLDvMb/FnG5C3eS8G491X1vHXz0fHYMZX1mCaWmfqEYE
         agDpOC3DvDklQ/bhO9Poq/QtFeuzNG3cbZCXHMxiTbMs7SG2qxg6Kbqnwl9dno9zUMG2
         5VzNwoxM8xnkUvu34R3iEDgv5EmULHaDWzsDMefk0MmRNFil+hz5Zq7BNEzV9pCGj39X
         e1LMfsrVWFIodkOV3rtExT4NeR8FXBpwSdqVScplR/PL2lzHJurkhJNRjTTB2IFcWpJ3
         EKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=nLLyHDlqzsc75HWG24SP3SGpvgxZ9V3UrO9VtB9+qSI=;
        b=csx4ImppXlk4pJ/788CfRpiKUeB0jCO93DcjvV8FepOnQdhoy7eYREa8xVr/QTGMyS
         IlAadrRoxJ1WtBId25FhF4pizd8UDOLFWNV8+lBS0NSth8cfYcfm356JFVsNS/04AnKl
         vw9NMYnX/5jUjaqp82i74QY1mGSIfOxWUCZvfkxkuqjqudkQct8Aq9Oo9wLbRXKHVVBU
         DI2umvgcbGKaR6BHVoVvMOJ+hQ7rRHK50g9pLfl4ivfXB8yJrFagNF/CMHuFWEM2w3sW
         kdfArU5M+iReCCexeLrQ9fp8n7PQb1aQLZDY+8Gzx0su3pGw6FNFpJF3bQ7/l5PbQAGi
         ye9g==
X-Gm-Message-State: ACgBeo3Yfqhydp7GfV/Shmp7Ci+CzT0R02WcyTuNFABRmu6fj/kzDg9D
	XfVT6v3rMN6Ox9oeXZvrKwybVunIbrffu8rOzZg=
X-Google-Smtp-Source: AA6agR5h5efzqOVxmYbBIWgxJ1MECNbgPa7xGsG/CYzCNefyQ5w5lz2oa6+rUdM0FZqOdRsfe2EIRX/Bqx3hGl+nnMQ=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a25:be87:0:b0:67a:7054:c7bc with SMTP
 id i7-20020a25be87000000b0067a7054c7bcmr12511319ybk.601.1661902339549; Tue,
 30 Aug 2022 16:32:19 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:25 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=samitolvanen@google.com;
 h=from:subject; bh=qCBEQ292K21rpauKv4Q9PKWzetqPm8IIUDXN8zVxiiU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3OneDI8EsrD6700CYZ72DWnEF3yumMXVukuUYd
 6cc6WzSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzgAKCRBMtfaEi7xW7v1gDA
 CrSV1Wwh1iRkXrTLzRUVixDQymyEMNfAV5Asek7kdMhsjE05imH4BPAYNwaeaYeCR/FdZowXX2/dg9
 uEvPso2aCMbdLJGMwK6HCPU0doxBN9bJ1Aghq8QSlLsvALuOYSHp204OxDb0UgUSCEoR6QxsQjww7p
 CkqIcDUIxxhgbZeB9GMuN90ATOpI5Tt/TjewRuGkDuiU2wX05LdVmyaR7uBC86YUkzrjzuNFycLxXE
 NjRh/eHVQPO6JRX5WHJFfMPJe3lTKuueweypQevFID/GR98VcRSjCttni916V11TYs8EbLYPoFNKYq
 jZtDfTIy1xRp4DhVWxfZub7EQi+dScfRbD+lUUzdGEqL/LUxdBDfS1TfIn69wnuD5X7wcDu4gLAcZw
 I2kDiw8qMGqDQd2spFj2dU2XCRZPX7T1HOjUU3U34FxzhEpjzO/hNzpNcB1ZBgTU8btt4TEoN7mMlK
 Y3FIWCZ7I5c0LXttu3a5FcrhHHCxcpdQKHjz89NVuaF0Q=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 17/21] kallsyms: Drop CONFIG_CFI_CLANG workarounds
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

With -fsanitize=kcfi, the compiler no longer renames static
functions with CONFIG_CFI_CLANG + ThinLTO. Drop the code that cleans
up the ThinLTO hash from the function names.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 kernel/kallsyms.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 3e7e2c2ad2f7..b27e6ea31f8b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -159,7 +159,6 @@ static bool cleanup_symbol_name(char *s)
 	 * character in an identifier in C. Suffixes observed:
 	 * - foo.llvm.[0-9a-f]+
 	 * - foo.[0-9a-f]+
-	 * - foo.[0-9a-f]+.cfi_jt
 	 */
 	res = strchr(s, '.');
 	if (res) {
@@ -167,22 +166,6 @@ static bool cleanup_symbol_name(char *s)
 		return true;
 	}
 
-	if (!IS_ENABLED(CONFIG_CFI_CLANG) ||
-	    !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
-	    CONFIG_CLANG_VERSION >= 130000)
-		return false;
-
-	/*
-	 * Prior to LLVM 13, the following suffixes were observed when thinLTO
-	 * and CFI are both enabled:
-	 * - foo$[0-9]+
-	 */
-	res = strrchr(s, '$');
-	if (res) {
-		*res = '\0';
-		return true;
-	}
-
 	return false;
 }
 
-- 
2.37.2.672.g94769d06f0-goog

