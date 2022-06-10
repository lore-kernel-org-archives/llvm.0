Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4258D7C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:55 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id 18-20020a621512000000b0051b90b3a793so291884pfv.8
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CWnNitbfOLhQnF7KkKjy4PcZy+klQjLs8QMKloYSIpw=;
        b=fOZfXeQdSLKswErXzMBZH9XsLCV42ds3eR5iT/7CIuVvEL2CCXe6ogNKHZycEH5fSc
         I9Mt77cwarZsc1g5kHXr1LrCXwmOn9rV8yo2E0BPZh+LfhtBGF0hCQprmFkhMsjFnBuF
         8clyclrxB9kyvIRLisF6NBatfOsNEBNuCs486j3/4U3o1he+Ok+oVmrK4i8jWnXTG5M2
         goqMX0mHSOAs0iPVG25etd8mGbAIjXNViN4Ote72KVzFfA78hpojPIUYojP1apOs9cDG
         e2BP0ff46laOy9l68gFg+J/nAhP3/QVByydQi72KFbVYp+oe9NAbTJrelf3wRnn+ccz+
         GMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CWnNitbfOLhQnF7KkKjy4PcZy+klQjLs8QMKloYSIpw=;
        b=T1qT9OTrTQEnDElvKoywvJv3++qp6K1p2wie87swDOFKUcGLmT3UUoT18yH6fO1il5
         4xgpf8Lt6smqGKOEtZqj8J6kbShjxzrB9ya+4nE+4ICT3MTOxIHy7FzdmNiAh15c0KnS
         OQ/c6i0DJcWa/cotF6LsUxR9rhmmPrGRz7eGsUM+1nxP/vm6geGc+qAvEdi43GpToBiP
         2FUEEvlm00DNo1qdkK2YzBSiylqJaFfUKp2xpsEVnG/hpaYTCXMr5L+5yVk9KurPboJl
         YF7an3LYwYgqVzCXIzf9l1KkelZZJjydcpUhGEbbtPY3buqBUbQ1elUZBKS0SS2R0eKA
         62fA==
X-Gm-Message-State: AOAM531soVM00CpYAr3jO21a4PKhj90E7ViIoMyDE0IjrfNXeN0W25Fj
	8Bd+c4xrf6XbTt78g1KNyaF9UZ4Z0eqsEmUgsh0=
X-Google-Smtp-Source: ABdhPJzJklmv83ib9dtumF3fDVXJ9/rnRX9l9AVErVMeN4n1H7BI0knzO6HKqP+CaB8vXHb9J3DEA6NWMza5OrCMQc8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with
 SMTP id t9-20020a17090a024900b001e0a8a33c6cmr5764pje.0.1654904154496; Fri, 10
 Jun 2022 16:35:54 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:09 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; h=from:subject;
 bh=9rYz65/wFLeb1wFYDqW9Deb8ZW7BFIBQKHutwryD6DM=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9UuSzS/L5UlnMGrcbfC1pmfBwffJXbgXfbB5jSx
 rV4Yi9yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLgAKCRBMtfaEi7xW7moiC/
 9XAXjotNlz2/1MUykpfa5HJDtB/UC1cKV1C2vbIvC8Nob+RP6JDzgeNg/n7iO4t2W7K8heycv4p+HA
 GaGtEc/SNKc408QLjeNjUCgOLdzu6ebxXXZ/fzYqK4QqVB6vSYs5vKf0XuNzy7eb/yx7BTbXYc2tn/
 NLvFCzQqcBWM63EUH8jlTwIUzbZINqxxcHlWIQLYYxN42fDyC5ujTdlDhDCRYxJIHQG62jM5UILFLI
 EyrkN5dLeWVUKb/8Xsbbzoveos+qFNW7lA8fp9WjcB0nueoMIeV5Ym3UO0P2FXahgiAlt5qyrl9z0D
 O8UnxBAbuy8SKLir3fZ3GonQo0d6y8V2cMyeee6EfaG1HcuYOtgbF2abSEiyjavNOSDullUCbDJE6Q
 9L9efkVBhKsjjjabk3WstXIdMtX+0mePBDqpPyIQgDv1m7hxCs4B/bLjt8d318b2rU8ZKSQ92REnWa
 Y+l/wx2h/+m6D4u624xHxXJlHdl3wqoJJ08s2A6ln2qqU=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 16/20] kallsyms: Drop CONFIG_CFI_CLANG workarounds
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
---
 kernel/kallsyms.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index fbdf8d3279ac..2fbb94817e02 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -179,7 +179,6 @@ static bool cleanup_symbol_name(char *s)
 	 * character in an identifier in C. Suffixes observed:
 	 * - foo.llvm.[0-9a-f]+
 	 * - foo.[0-9a-f]+
-	 * - foo.[0-9a-f]+.cfi_jt
 	 */
 	res = strchr(s, '.');
 	if (res) {
@@ -187,22 +186,6 @@ static bool cleanup_symbol_name(char *s)
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
2.36.1.476.g0c4daa206d-goog

