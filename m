Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2385369
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 04:50:53 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id 9so3106773ily.11
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 20:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3JY0CiN7R1hjdSkgGD+nD1R0XsVkna0O56cVY6irWDA=;
        b=KLfzBDg82mDVzdyUr2vih4N4I2S+mibWK61x7MTe3E4EKogbxPxe6AZMPc+u0q/fX7
         7k4gZQrFo4R1rqD7na+IS9rNRRMlGBhOv8Z/HIDFAEESXIb/sFA/DyO+RRsHnRIvfLpk
         51S/pR/lITmgRkJqI729MdsrYIlLpYmdsm0u3D7+b8a2grGV3wueG97iE8C5hdLQtS/f
         Ex7Ez8IJMUJuetlqAHrTfPzJB44XzExQ/RVqnKE9wvTCCnOKAP23qfTBfUCP/35PtiN1
         WhuTvXrSFQyCz8WLd4z453m18UpUNMdcsohgDgYlpmUsjOUTULQdY1LD2GrXIPT91dYd
         qHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3JY0CiN7R1hjdSkgGD+nD1R0XsVkna0O56cVY6irWDA=;
        b=l0DXidzLOPOa08cerUMgUCLFxyhi1swr0rgeiPkmVcWiJ2gszJuN9pLKaUZSYguTH7
         C59Dthy+Rha2kgqNW8ghR9Xv1/H4SrvwDr+T/H70+GuZ72LR0Yg6ps2ZjoMFrxxyfjLB
         QRsuD3Lbz0HoMWJsnT74+pXi2jyjls4HoJ7Na2B2oYGT2m83uNNdqixRc84DCfTkLGMF
         b7UikrMhaIr/yrnNoxe+pTuDoeiYa923S87VVHe2VcglkL0xooOKoaNVruZbDxqTXNc6
         q2LOKv7B9SK1Odu5NHBVGkg682SsnVMFkGbn+uc5sdLGIfuaz64aMCLSKK8irg2I3sJb
         cDyQ==
X-Gm-Message-State: AOAM532QFZWmvYYtmPi+35NTykn61fvi6hxd+PDU+7UH+CWxZ/1TaOyq
	LK0FHhL1uCFoj7Yqb2BaTyc=
X-Google-Smtp-Source: ABdhPJx31U+XRCTOiJaXKpxAIDjjLsarfoqPy7hDOauI7P3eIckR/wniOEjNe73rJTRSj1bR1KXBQw==
X-Received: by 2002:a05:6e02:1aab:b0:2c2:60ba:b21f with SMTP id l11-20020a056e021aab00b002c260bab21fmr30996513ilv.133.1646283052693;
        Wed, 02 Mar 2022 20:50:52 -0800 (PST)
Received: from localhost ([2405:201:6014:d0c0:6243:316e:a9e1:adda])
        by smtp.gmail.com with ESMTPSA id n7-20020a056602340700b006409737fa99sm696525ioz.27.2022.03.02.20.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 20:50:52 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v2 5/8] compiler-clang.h: Add __diag infrastructure for clang
Date: Thu,  3 Mar 2022 10:20:26 +0530
Message-Id: <20220303045029.2645297-6-memxor@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303045029.2645297-1-memxor@gmail.com>
References: <20220303045029.2645297-1-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=memxor@gmail.com; h=from:subject; bh=peGyBKzfC1dDYXb1+KuztQMkZMDgg3j2AwxoL1PPC70=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBiIEj/tn1LqkPnefI77maK9lVgtxXBCE+KLM981Ap+ 0mBbmu6JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCYiBI/wAKCRBM4MiGSL8RylaAD/ 4tp0nrd35nK4EAI5fZF2usm7UOYLN7C8rTY4196i31M4ZqhleJV29sraSfnO9zo+EXb6zfFC6umWya jx2x56GF8+FaWR5sUtx2tRkAwqQFwPZib05/Bt7954gut/YD95aXNbhvzlfPwQIheVzlHxK6Tuc+2K WlcveQD0wKwySxp7e8wL8rSHCcwu3sj3PIwaobgZMm87OPQ59P/pUAO2bTQpA2mWGBBecAZhhryeiV t3zS2z4eWSEwxptbxTvLDhrEl1DY11BMnFzID8k6pHkPXb7yLYml+tCfcko7lYED5trn6eM+4KBmMt SGFIYvIFrddqWskndpaySVOo758X7LEJ7ypwdS/8Vn/J11I1Vp0yZgcj2QBZ7tHjLqwOAWfyBKz14Z Ikw3yXS0NhEqAQq4SVZ9tE4qCZnmrqvWhtnThRf2Pvze8AXDlFRctieXE63pUWYbQSeuLjPwGygvQM I5rl1PXN/9bEqERnmDdxvkHMRhSdBBg1sAx5oFsTNDF1xzu+C+FzqU+FpdhXJnX4OLD9/2Y/hK1SX/ W3tgkC73B3W02OGEvSY3U1+2yW875cC4LlvH5HOz9mWzfkBO9Vb1Tp3kccO5EFVne+L6gT1c0r4K5p hMNpx/+L4QPQr7JnL8rkvZ4skWzJ2zM49kLBKeVsWP2Q+yysGzVEYbznVvJQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

Add __diag macros similar to those in compiler-gcc.h, so that warnings
that need to be adjusted for specific cases but not globally can be
ignored for LLVM compilation mode as well.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
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

