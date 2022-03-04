Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E16AAC
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 22:47:04 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id v4so8485786pjh.2
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 14:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqFnAABLSo4gfXyFqfRrTRulE33S0+Zc+dKAaTlLF8U=;
        b=lLJjzv1+FYk1VdnbZKAIMIKB0cy6msdnIWuscqTuvOHV4PpX6zcqXxkTiKtRHMD4oj
         s3cvLWeh4G3JElUPat3+xGuwZP4p7Q/cC9b5JWTB+D2Cr756tKVkN+ndNrCHcPP0zOtV
         Fn/VBQhBVFBW8PQ1v26Ixy/1YYRM5z9PrpywHmPCfQAlC93OuAJUyocnPHq+ItFfkoSq
         F8+0BUBoiP3r80HX0WSD0GYIhc5tmXuHVPx6f2vatj5PZOQJH7YDp2xwtsVpn0l8Qsrh
         HNz6VxyQJPQ3gtletkVWJNwSb1sTwSAoxBrRD53hmNbxvvPkdnlanDME0I+IydMVhiJB
         mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqFnAABLSo4gfXyFqfRrTRulE33S0+Zc+dKAaTlLF8U=;
        b=Qg2po9aNYNSf0tFpNv9KvlpZGkoVl+vGoImmympF+YGxHJb0patuMB84qvYLLHvvGD
         VaFT2YcslpAM5M4AOlXHrfoh5tnycG1D0T6Gd89mjrNzok97i8bG1VndBBraSs28yc0C
         QIJnozvtifVEbBE0h5vnTAKsjHU2KOfg8rw9ZOQnH1Ev4Hmqxll4i5TEZIfCby3meGBH
         qFan7g1Qvte+cO8tbtQApQEDAz0babsYR1EEKGpxHrUsB+yRFI68j3lMMBFXdMiqMY6t
         kuFfTB2/asoVOmET1neitkIVemGFlyyRYjQZDPanCoR41k+4Dun+iUE8Li7oM+/VcxTX
         pKzw==
X-Gm-Message-State: AOAM530hepITIoK95oo7Zl7G1nofbpKsLrrwRo58hzr8QUK6mb6QVz/i
	dQNunM8ibnZ4aggErjBj1IM=
X-Google-Smtp-Source: ABdhPJz73/WMy+zgwFJkLyyXwHF7E3bL+m2EKEqOQym28gfI3VcXrgLKnIWKGdN2GInyd92w2mjEGA==
X-Received: by 2002:a17:90a:65c4:b0:1bd:2bcb:1f0c with SMTP id i4-20020a17090a65c400b001bd2bcb1f0cmr13045278pjs.114.1646434024417;
        Fri, 04 Mar 2022 14:47:04 -0800 (PST)
Received: from localhost ([2405:201:6014:d0c0:6243:316e:a9e1:adda])
        by smtp.gmail.com with ESMTPSA id e11-20020a63e00b000000b0037341d979b8sm5244760pgh.94.2022.03.04.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 14:47:04 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v4 5/8] compiler-clang.h: Add __diag infrastructure for clang
Date: Sat,  5 Mar 2022 04:16:42 +0530
Message-Id: <20220304224645.3677453-6-memxor@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304224645.3677453-1-memxor@gmail.com>
References: <20220304224645.3677453-1-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528; i=memxor@gmail.com; h=from:subject; bh=7uwK8ABZKnWenzz92bkM96adqDWIRLPqA7+NX3fqr7c=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBiIpasJj2xD950UpEJLjfy1eC9EWgGn5mvhwnzWnX4 Ex0bGAOJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCYiKWrAAKCRBM4MiGSL8RyjR5D/ 0SQSqGwX+xh6q4dgCpgzx8pkZO1uNRsbHpWc8D7crol/YKGU2E/Ya5swrFxD8vhTyChXWPomeoL0/u oGNhlB8RC7qK6rFaAyN4H7Le1B0Zhzo9+34QkK4E7cwlzWcS2qEs/iBNSWUIkErCak28pKgolBaug/ LDaumOcPt1njI3Iuv1v5g8gzRtFKVyZNrLvBQ17ONBu0L2DYbKStbgs99cIoco31i0ZbjXvffqEhj+ pBK0Y/RrnaNtWgmd6/mwtiqIP15joU7vQtc/dcdMt2t2H93ISLvQFSNmEyFrt55rZsvxEHE4ElMK+x lY7zlsXWNPAzNtl33RTS7WwYEjVJ87qYaOHYKKwzePF+nAwR+m2zv9dJUnC2Il2Uxw+D4QXqu9sX0X PyZl9ctpBOvMmFexp/aHlrJS5yDemqXKcXgdv4VJcoZBH1NlzLyVYsfiQYbi84FeMWM78mESeM4AwO L7mHR1YhY+AbmFZG9K0Nh+FGZFrlhS5fHdTPjI4qbem+yX4c0+8lS75M4PUogUwBqea5JlkgTu8un2 c0StSrwlhui4Z+dtI7PBPMGDzK9v9sxwQkAG0JB2BMKJRG+njkbm3Qtkzsc1UnWrLJv/7Npfi64tOm fNNhIKmuzHNqrVFq7tvhlxEoQq0pPVpROL+wJFY4RyOSc9MqNvn20Jh/t0Gw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

Add __diag macros similar to those in compiler-gcc.h, so that warnings
that need to be adjusted for specific cases but not globally can be
ignored when building with clang.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
[ Kartikeya: wrote commit message ]
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/linux/compiler-clang.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 3c4de9b6c6e3..f1aa41d520bd 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -68,3 +68,25 @@
 
 #define __nocfi		__attribute__((__no_sanitize__("cfi")))
 #define __cficanonical	__attribute__((__cfi_canonical_jump_table__))
+
+/*
+ * Turn individual warnings and errors on and off locally, depending
+ * on version.
+ */
+#define __diag_clang(version, severity, s) \
+	__diag_clang_ ## version(__diag_clang_ ## severity s)
+
+/* Severity used in pragma directives */
+#define __diag_clang_ignore	ignored
+#define __diag_clang_warn	warning
+#define __diag_clang_error	error
+
+#define __diag_str1(s)		#s
+#define __diag_str(s)		__diag_str1(s)
+#define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
+
+#if CONFIG_CLANG_VERSION >= 110000
+#define __diag_clang_11(s)	__diag(s)
+#else
+#define __diag_clang_11(s)
+#endif
-- 
2.35.1

