Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE6299931
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754913; cv=none; b=Un/y0UXSi8n6vwt5L6KKMa1ca5kk3ZjVuMWyUVHjxhhYHFTXty/lwY6nZyqevwF8D+ar+wK/oEqAjMKp8Ww4TNAkQj8MuAQ92YmXKHC+ac+YsXW1IZA/CK/XzcrABTyEZ5eSF76p+NgsGhXlIbseUQdFq8oPbXF333EksN+L52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754913; c=relaxed/simple;
	bh=FeBc3mz9++WhInS5DCc3/yvwNzCoBHeGSj4Nx5UNqAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o3jmOEIQjomjxXNItj8aaawnFwKnj9X6ydWnJHI8+E7MfGkhCYUiPjoVGWaFLkSz0HJp1/RAnORxmS3cGh11ikoDWKweAahW/3od72X1T+ia7621nTmGaRtPEkEVzXq2Gd4NKHO3i/jcLOIaV8lc1xyaUrLXPwt1+AyOTOvYB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppUL19Lz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppUL19Lz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso2656160b3a.2
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763754911; x=1764359711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsLQEMyKEn/UE/LwUY0j1tuqWL3xiSmMEKB7wO01+Co=;
        b=ppUL19LzwjDWoSxqCFwxoIxGxjqTbzaD1LajrDB6NHBe5Fp+Q5ThspSiZ1nJm+Lf/y
         OwzkQN+igGZGQfNzLsRen3Vu3at8cN02W+BPfy0HxrE6M5ZzkwzE4WHovQuq74qraEHc
         ZD3R4OAXLvc9EMHtATkkctjW9BMzzYE2cOXZAXOOBwq5FLm0cMfGVwtIH4wKGt3XOj2X
         Pdvp/WyOeMbzq41OPaHt6ku3bYgJfc/mQWhqCAbdTxNweiWvpue71rr8UMh/kEONbuvs
         vGB6ZAhowKYnJcYjDix9INoa1G+yl1A/ON7A2xhg3bCL1WvqtUfxtA1Rf4RuOT4kTVDk
         3ZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763754911; x=1764359711;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OsLQEMyKEn/UE/LwUY0j1tuqWL3xiSmMEKB7wO01+Co=;
        b=IFkinjR6dUq+Dj3cFtx/B4stiyUkf8h1iNOFYFXiVmRX0N1MZkAkSWQxNYLXZYgZ7I
         PusOnjQL527PcPQT+dXVHSI3bGmvqdQEvbukACoe0+EIkemID+OMOmq7hMQ68+w4QlRz
         fgyK489/He8ZHgUdHYYdHGbdYSrUOYuia8cTZwhzslD+YC71H786NG+/1aUxtDIDyIGW
         /JDij7qCQpczJCbFjED3DgumhwBTti/1j0NPjjrMCve3xU/WB8OVAYBxB07ZNb06TvYp
         R+YR7quyVEuoU64EFTIlnAXnUlNqzpgE1l4cNgSxSYlcsAOZoFyg+DGAUHSw+2cojxLd
         Gg3A==
X-Forwarded-Encrypted: i=1; AJvYcCVyYFPGQp3XauGrqh/HWJsDYuNAkS9+/buRNIPZ2JYoynsHrS2Wcg/Q6sK4augBeU/fabqa@lists.linux.dev
X-Gm-Message-State: AOJu0YwTLkui7Y8idNE0RQnlsikCD59u/ATlXpEZnbw7RwR2lJtc5biJ
	WuwBIFhYN1VU1JAewEUTxjw86j6svvjMdKK9+ZjQD/EUd4Gp5QEFSaeLsNG5AVXoSWTbcBcozp0
	M
X-Google-Smtp-Source: AGHT+IGxGbZXuYRUV+1DBM1iC3d8Dgs2MaafPC2v4F8uQUYDIrUiNXJIpBlI3Tv92mLuGvfDyHJ2cMMikw==
X-Received: from pgn1.prod.google.com ([2002:a63:d41:0:b0:b6c:b8e0:6988])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9184:b0:34e:cc0a:40b2
 with SMTP id adf61e73a8af0-3614eddf63fmr4914029637.30.1763754911092; Fri, 21
 Nov 2025 11:55:11 -0800 (PST)
Date: Fri, 21 Nov 2025 19:54:33 +0000
In-Reply-To: <20251121193957.1655580-2-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121193957.1655580-2-morbo@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251121195504.1661783-1-morbo@google.com>
Subject: [PATCH v2 1/2] Compiler Attributes: Add __counted_by_ptr macro
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, Qing Zhao <qing.zhao@oracle.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, John Stultz <jstultz@google.com>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brian Gerst <brgerst@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Jan Hendrik Farr <kernel@jfarr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clang and GCC are expanding the '__counted_by' attribute to support
pointers in structs. Clang has support for it since version 21. This
requires defining a separate macro, '__counted_by_ptr', because, while
the attribute has the same name for both a pointer and a flexible array
member, minimal compiler versions need to catch up.

The effect of this feature is the same as for __counted_by on flexible
array members. It provides hardening the ability to perform run-time
bounds checking on otherwise unknown-size pointers.

Cc: Kees Cook <kees@kernel.org>
Cc: Qing Zhao <qing.zhao@oracle.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>
Cc: "Michal Koutn=C3=BD" <mkoutny@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
Cc: John Stultz <jstultz@google.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2 - Add support for GCC.
---
 include/linux/compiler_types.h | 11 +++++++++++
 init/Kconfig                   |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.=
h
index 0a1b9598940d..2b0251bb951c 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -351,6 +351,17 @@ struct ftrace_likely_data {
 # define __assume(expr)
 #endif
=20
+/*
+ * Optional: only supported since clang >=3D 21
+ *
+ * clang: https://github.com/llvm/llvm-project/pull/137250
+ */
+#ifdef CONFIG_CC_HAS_COUNTED_BY_FOR_POINTER
+#define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
+#else
+#define __counted_by_ptr(member)
+#endif
+
 /*
  * Optional: only supported since gcc >=3D 15
  * Optional: only supported since clang >=3D 18
diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..f947f242bca8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -139,6 +139,13 @@ config CC_HAS_COUNTED_BY
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
 	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
=20
+config CC_HAS_COUNTED_BY_ON_POINTERS
+	bool
+	# supported since clang 21.1.0
+	default y if CC_IS_CLANG && CLANG_VERSION >=3D 210100
+	# supported since gcc 16.0.0
+	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
+
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =3D=
 { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
=20
--=20
2.52.0.rc2.455.g230fcf2819-goog

