Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F846365
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 00:05:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c1so6054126pgk.11
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 16:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=az8r203Fs/HRQxJrdejXVpXcpsHcpsDGL1pvtC30g1s=;
        b=GKwCaHCYdVrTz0URXS3gnBILCq7YOzQRYg8lCYsl9fXCt/5B7qobdzaSkAHk5sZlKh
         YToSeDdIwL0Ddh3QxcM0k/XrxLGUacbhhc3dO6I0E34PwurRwaZD2w385oFnN5LdMDhf
         QzRH24oGfJrRz/5QjN+3NGBNXwjsMPf9WM5ot+qNRfIi0JVB4N2FNEe/tGV70wFmQozG
         oFSEa1btzMNGAdyIsl/Cy5TrgAZYXokNFUpTDFkkipXLISnaAgTixddhVpRWeyoYiFVX
         2hSDNk0yx5GP0I/eFGEe+69kVN1ijG6BmoFbPeFU8zx9RGnqosGLe4fp5hwqtX00Da+s
         RN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=az8r203Fs/HRQxJrdejXVpXcpsHcpsDGL1pvtC30g1s=;
        b=0iFZc+qwVv+tp3+ysxlVgVG1FMYsEXqbh1N11VVMBrfw7UqLPhhmr6lsE4+EtmlmKP
         f8bCJ/EDqG4BCMB+2EJNcQlnfekKeeFeyxdFuTt1oHbw/Pjll59yRZV0EOWTOVa9BlVn
         94LK8LraNBk3Q+9z1WDyrixa+CK0iitBjfBcO/tH/Q0UjpvgSfTdHSQIup9PVjmmBkv0
         PRy0R7tjPnIaNQmCdMHqfQgcgtjPEJjEv7zEA+zy0FauXOGRJy07Hqas5GRtjsOJSJQS
         kSLnEcGyotMYCh7elSQYOIOYZTMfxHusf2GbyJ330w0/0v+R7uNFm3lDyysYnq7fNgHH
         V0hA==
X-Gm-Message-State: AOAM532U6/h8UnJCCrHYAdJ7yRG3et7y6E0qOZpfFu/4g/ZSfIWBekVm
	XSmWdwqzY3YL3y71wTr5rXD+oWODRKs=
X-Google-Smtp-Source: ABdhPJzf8u5NUd7oAWioDY011K9dQ2ayE6+WlVSSxikHqmEbVMIRxSXGSmhukpukSE0FyRfkPifaNg==
X-Received: by 2002:a05:6a02:18b:b0:362:c8e4:d8f4 with SMTP id bj11-20020a056a02018b00b00362c8e4d8f4mr32163376pgb.86.1646352327715;
        Thu, 03 Mar 2022 16:05:27 -0800 (PST)
Received: from localhost ([2405:201:6014:d0c0:6243:316e:a9e1:adda])
        by smtp.gmail.com with ESMTPSA id l13-20020a056a00140d00b004e13da93eaasm3611338pfu.62.2022.03.03.16.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 16:05:27 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 5/8] compiler-clang.h: Add __diag infrastructure for clang
Date: Fri,  4 Mar 2022 05:35:05 +0530
Message-Id: <20220304000508.2904128-6-memxor@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304000508.2904128-1-memxor@gmail.com>
References: <20220304000508.2904128-1-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=memxor@gmail.com; h=from:subject; bh=aH0ED4SzKuyH212aqcBoD3D1XZcCItBPNjdf9LMo6rc=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBiIVd/Hx0cZD3dUvc8pR06obNvztibdotsWFVvMITB JXAz2xSJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCYiFXfwAKCRBM4MiGSL8RyuS8EA CxJccq2Fhmg2JeuMCkSplQ4QOqoXvCcNihFMnE+HCPDSrnDoDSP1eyzCK/GwXTKAkEYhkCQh8saVDA fo7SSbCRIUmOQBBUtfZB/1p6Z/1uo5v8D/pA9AdlZQE7QZJSpKD9IV/6BeOIetCvVxh1q2p5xdwFBB X8riUh2CkujnwYq/2zkhE+5VMHnUO5qIrzStmpwZHywT1aGWZFZb4WFcdls6qvRVxZv63Y/pOm/I4v JpvDcs8tWEiEB1CO/C2521iXuiTaPP83ImtegC6VGKShWbTVVgFiOP8yauTXQbjIK4vTWvIns26om/ Jw5cQzOB+5S7tZtNQzPVjha42+ztsXyFrmdv4k1wiVOfx3lfxTdi0kbm534o0dPaXN8l/8OHGRUrhw A2Xi5RsNUQcA27CoqRwivaBVVpwm0BQPEVEORO+tUu2643LVWMezf6Zdq9JdzNQFeFAk+US8LYG68M mAEQbYE53ZBpq3S3baA9sgeJrOY8d6k6s1DKREkCiutitIatYGRaHYBqp0LSDl6IiTG8CdkVMGO21B u49+RNBgwQtR2Razw+8uCG/o77E7YUmfARlHGgERgHzjbtONHM9b8VUC2S9lruySAm9v3UVCNAyqsP sCyVuvyU03JBYq98eo7dmW91tUu2XKkDyrTQmtMFa+IdlVft9369tVjDD99g==
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

