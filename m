Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E610EA
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 06:49:44 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso754767966b.3
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689662983; x=1692254983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLpmGeRaDQBl8qxI7Y4Doy3kTGyIF9ZNcl4co9sfTGs=;
        b=JG2OL2KwBaymaZCVTNQcf4pNH9xfdew3b3uMLYO8wGEUiBLUgAZL1ER94s1hZhItxW
         GtQ7EuniOmYIYp9/zKUpRhm7xgrmA79xejwbKiseQBjToa8v8H5dwb89/+2INKD2S0Q7
         bAr2Xs8M99e+GD01kX7+4nTsXwN5yuxtd81Hi+AHjtrhlyoxxsXeW9bNAW997hqJmeec
         mB7NuqhG9ZRnXGILpPeC8UEdPnMAy6WjfTAw5Cifd2CJLW9K0ItNEhN6vwbp1/NhRtfq
         OTV14FungxVoI2iMWV47anrvYSL023W91MAq6PRKuq/xGzpfrj8x87IFfZB2rSHhw74o
         Q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662983; x=1692254983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLpmGeRaDQBl8qxI7Y4Doy3kTGyIF9ZNcl4co9sfTGs=;
        b=PouMXHw3L28TPp+MWyca/5YcLUrXGe5W7RXX/Pv/ksz1Zj9Rjy7tXmliZGPWeVeugY
         Iax/KqrSozfJybcxhlGsIUoLtboVwHOn/wgVuD7G0OZwSiDXeFBRKCJ1c2Ofx3Xl7kmF
         8jYA9X9szEgvvYhfByWi8TQGYwHk4s9KbSEpVcsPNwB8OBH8tT0TOvMO7VxPIKMReIYV
         BXJSAtuYxmkVIYQxp7kHC9U84boZgi7gstP/+5LmmcyA/c4Aoh43gEg+WS5DXbtJosxq
         TQXQgIs3MLbHxprctTdeMeS1FiZyj+TEu+TXU+gPm+LfZWaintDfnPuvfJWdjWtJeWeh
         mFng==
X-Gm-Message-State: ABy/qLa/BE48aREVkFAqcwGkgqqhVAxuYOjL+gBzz+vcH04db9rgtZkv
	ma8raSXMj6//HTnQcWfL6Xc=
X-Google-Smtp-Source: APBJJlFd0gWalCAiJNzdqmlFBZeiEjvFzWjAs7b37qnis35EvYycfqO1lHFqFeOWt2iRBk7fhbOh9A==
X-Received: by 2002:a17:906:3582:b0:993:eef2:5d61 with SMTP id o2-20020a170906358200b00993eef25d61mr11397321ejb.27.1689662982680;
        Mon, 17 Jul 2023 23:49:42 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id lf15-20020a170906ae4f00b00992ab0262c9sm602847ejb.147.2023.07.17.23.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:49:42 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Tue, 18 Jul 2023 08:49:30 +0200
Subject: [PATCH v2] arch: enable HAS_LTO_CLANG with KASAN and KCOV
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-enable-kasan-lto1-v2-1-d47bf182f5c6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPk1tmQC/32NQQ6CMBBFr0Jm7RimljZx5T0Mi6GO0AitaQnRE
 O5u4QAu3/95eStkSV4yXKsVkiw++xgKqFMFbuDQC/pHYVC1utSWLErgbhR8ceaA4xwJTWNso50
 1ShMUr+Ms2CUObtjNifMsaT/eSZ7+c8TubeHB5zmm79FeaF//ZRZCQm1JbG24cVpu/cR+PLs4Q
 btt2w9CGeyyywAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Jakob Koschel <jkl820.git@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689662981; l=1798;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=Dohu6jKRdMVeWKuTy3f7ZO/Sj/IWuFsMY7JdDRjB+kQ=;
 b=2IjBS8NMOdk9usUx+yh9qhqO132764KqfuRTk4sx3RVnxTsrpw6XdL9jM/Nvpv2NTYfq8NUdoyxS
 QNYN5QvtDG5JxKge6JEp1NgwaON1nGQjPrSPJUj6n0zu3mEcl9Wr
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=

Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
With LTO inlinable function calls are required to have debug info if
they are inlined into a function that has debug info.

Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.

Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade862ba42f27cb68ca9
Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320abdeadf0c215a00400
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
Changes in v2:
- Added correct To:/Cc:
- Added comment about required LLVM 17 version dependency
- Link to v1: https://lore.kernel.org/r/20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com
---
 arch/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..d722bcfcc870 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -745,7 +745,10 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	depends on !KASAN || KASAN_HW_TAGS
+	# KASAN & KCOV were missing necessary debug information prior to LLVM 17
+	# which are required with LTO.
+	depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
+	depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
 	depends on !GCOV_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230717-enable-kasan-lto1-656754c76241

Best regards,
-- 
Jakob Koschel <jkl820.git@gmail.com>

