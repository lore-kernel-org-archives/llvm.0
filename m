Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12E2CA1
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:30:36 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so5122012pju.2
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2O1a7UvShSC3gckKtrO0p2k1de7WSXmEEaGyfLWDtkQ=;
        b=DhNq62Nd1Lt0lyxcdXftZsAHEPJuhU74yO3KkKkhQSkGJgdYSUNMTRxYY5uwjRbOXB
         0KoYCLocVZukIPNWy3uhlLew+5AJ7zaqT0r1cAbvpkyfnrBTgai/iH8aynup4IRfkYwa
         e1RE9tl7lT28g6N4gU0nR/IuWDVFcOb3iYfGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2O1a7UvShSC3gckKtrO0p2k1de7WSXmEEaGyfLWDtkQ=;
        b=1bUeEu1/N6rXIGMLHCfjhSVJ0aK8PdTmpKNy9dFiEXRd24O7UJo1GFjjt1M8Lwr16+
         tsExMqXFS1LFPMc3CMlH8KJ0ygZ96D7bKFOHnrIYWEB5n2v1SAyivnbHyQWU3cbizcp3
         z+ST42ZOjYHOZBzqyE/qnVXat4kd2cbHHSg9/y9WUdb3Ta61o9k9ySNtnLj5VOofbJl+
         DhIb38y+4ZKNUInxTW9vJswjdSXokoev/e/y4rKy/mXIOs8UZQZpSMcIEhSBcgf7tD/i
         ELvMV8W2NCBDtIoauAnkMPelHidJ0dHXbnS+5Qs1lW4duP7Scy4DTz57tDv7FuyMPFZl
         I8ag==
X-Gm-Message-State: AOAM533N520v2G5DfKuUVSfeIANAK1xqcihJ81yGBoPkGEUpC/HFac3k
	1r1iSi1xiF+UZRv5DEMlHFcNJg==
X-Google-Smtp-Source: ABdhPJy4Ct5g0MqS0xgNdb9A3ATDvBTCJZs7Cundy1yyR6rX0KSc/3j5mjsPdWjDnsGn15z4kjkonA==
X-Received: by 2002:a17:90b:1e41:: with SMTP id pi1mr5192990pjb.62.1643761836157;
        Tue, 01 Feb 2022 16:30:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k5sm24652213pfc.85.2022.02.01.16.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 16:30:35 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 3/4] Compiler Attributes: Add __diagnose_as
Date: Tue,  1 Feb 2022 16:30:32 -0800
Message-Id: <20220202003033.704951-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202003033.704951-1-keescook@chromium.org>
References: <20220202003033.704951-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; h=from:subject; bh=i1fpN36antLyVBs1U1U1fSS2CEHxT+df0ZNPiHFG1jw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh+dCo/jbG9rFQBg8OANce/4aahaOqHs+lh9B2zqU8 116jf4uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfnQqAAKCRCJcvTf3G3AJvOwD/ sFAXq9aIInuKt669oChD+K7YlLbmjc+0Ev4yHmb/YOCrz7QXAyfTMQZpJqikdYEH3RFaxKnJDgwmzE mqc8G2OHkuxL5GyPhpv/O9LhhEfYBf63VDTQb8dWhG/SvsBPXM0q89OlkSDr/noi4du4zL9s+3534O kx6nfw288C24GCljYJLELUhi5IazVnMu90Eah73vJwhPj5ePPPV4W1YFVTws466TcQP232pmUTM+SN 0UGDJm7eowDUNz98idxmkAyF61U/Coi5a+Wd45R7Ieei11bgWmk972riSp9DRlY521GiRGRQ20zHp9 CAJP6EdVJc9VKK2h1idH4Lb6xwQOfbRRdUXJ1ePh2MMrt2hxWqRLwWpdpoM8hpGljgl70mtNxFSPDa q7FCYP3R+2xCQGjbWBftyNcQcsBlEqMLDJFzPfZ3UI/hMCkaW3ettYkIyEtQBwLy8Wq2YOoopQgGFw R/UZuVg8I2E6mTDYZU0ucXXYHn/6UkMntLq/F7dJfEqQKL3VPOsiDkdRFxsOpkyAsOS3fQxTmZIhb5 6GPjfb5mrzyRHCAGhWn+QNb1SQMuBdiSFQueS9KSs8nr9ApRKv6Hh9nnhWC29V7ki4CeKoInqseiEX j6AjgVKUE++SxwpcKHyfyy7/tCO16ohvH91YXRrutSLXYc7TxlBPaLRnu7nw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang will perform various compile-time diagnostics on uses of various
functions (e.g. simple bounds-checking on strcpy(), etc). These
diagnostics can be assigned to other functions (for example, new
implementations of the string functions under CONFIG_FORTIFY_SOURCE)
using the "diagnose_as_builtin" attribute. This allows those functions
to retain their compile-time diagnostic warnings.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_attributes.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 51e063347fd6..b4ae0d771302 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -100,6 +100,15 @@
 # define __copy(symbol)
 #endif
 
+/*
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#diagnose_as_builtin
+ */
+#if __has_attribute(__diagnose_as_builtin__)
+# define __diagnose_as(builtin...)	__attribute__((__diagnose_as_builtin__(builtin)))
+#else
+# define __diagnose_as(builtin...)
+#endif
+
 /*
  * Don't. Just don't. See commit 771c035372a0 ("deprecate the '__deprecated'
  * attribute warnings entirely and for good") for more information.
-- 
2.30.2

