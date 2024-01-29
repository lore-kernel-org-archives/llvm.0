Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB776050
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551254; cv=none; b=dduKVu9YBvy+YBi39/I4Bz24ngybKpg1niCTQ3ZsIEZGGC7YYEcP83t3w9C0oFPgCE0rdULdT879W+TniLXgYVsmbsA7XN1JWDIQkcgaA2b8Yei7i7GlRiIMiN2PL7/RVZTB9dT3jKaQkJASVkjP+7BP/6zm3oiy/VHkJOmx5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551254; c=relaxed/simple;
	bh=NkiEcsGlCZJdDWvQkJb/8yMO5oe0d2E5DUKWEGSWQdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lgatlY1tX/WD++gv0aVs7kXCXSxtcTUAhiLkMriE3v2C6qSk2j7USSEPsn5S5Toq6iV24DNCi18wa//o82oGW9WEY2vrtHI548Nn+6iPBuewpiLIyyTDB0anegLj6LyiEtNK0iIjQI911LHDGyTJRmcYWRgKXQimza5v/4aTh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q6iqLH58; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q6iqLH58"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2954b34ddd0so1260703a91.0
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706551251; x=1707156051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqHYD682nla/ZHS426F2Ic30I1reUytKpu6/CiCUuio=;
        b=Q6iqLH58oRm1Rr2KzAMeShMoMxPsEBtkt7Hnb5grr9hAiU0zz1Z32D5lthPrvq/t2/
         Y5wqwAVFypjD8OBOmkeSOpRFR2ff7KWOBgg070HquqE/OKQ0RiNfBRr/jyaZ8/QfrvNQ
         CDVik9f0TJtnkPdhr74Wte8B+PcUzDFO/0i5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551251; x=1707156051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqHYD682nla/ZHS426F2Ic30I1reUytKpu6/CiCUuio=;
        b=Ygurtqd5o7jSqJ15Od71K7A0+lohDcoYWJ3G0Kw9VsXE3tLdwJhdvYFoIK9SsZ2S8c
         v/LnkKoXjWWyxNG5WKTtyTQCR3N2v+cZcBEr/l59PqJCsf1UuY/fY+48m23hoCIjwk8L
         lds0vPVEZq1HnJhs4G7fIoWJBHBsu06r87wnU4lNh9G6NZz5vxk5eAar/7R0T3LFNrbS
         SuXgKYfobXRxmrQNJgRsSIuh6sa6t99VczQXw//+TKMfeCs05VJ5n0uhFWUWifuLWYuF
         fOkXNak2mwe21H8ORFOZsuuQ+tnZGqnTtckAfeiPph20b02h8geP1WO2sWBDBS1A8tf0
         WWcg==
X-Gm-Message-State: AOJu0YzGXN+h3zp4I3t8pRT+qgvl2Zed9SDsqY3o+n58S9uGECP53Thp
	x0k+4xu56xEgsBzfwy66+OkvabMIBXRPuZ2Ipchje20p6Hzarxhhxh/s2FZkhA==
X-Google-Smtp-Source: AGHT+IEmS3D7+uxif1kSrOchHotI7X7olNDn9qkR3GFvV6OW2XNaBGwJD6dN03DiSLhSLaQ7Q9YJ2g==
X-Received: by 2002:a17:90a:c7c3:b0:294:65c1:458b with SMTP id gf3-20020a17090ac7c300b0029465c1458bmr3840370pjb.40.1706551251130;
        Mon, 29 Jan 2024 10:00:51 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j19-20020a17090a841300b00294483f38dbsm6214172pjn.9.2024.01.29.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Fangrui Song <maskray@google.com>,
	Bill Wendling <morbo@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/6] ubsan: Introduce CONFIG_UBSAN_POINTER_WRAP
Date: Mon, 29 Jan 2024 10:00:40 -0800
Message-Id: <20240129180046.3774731-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129175033.work.813-kees@kernel.org>
References: <20240129175033.work.813-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6190; i=keescook@chromium.org;
 h=from:subject; bh=NkiEcsGlCZJdDWvQkJb/8yMO5oe0d2E5DUKWEGSWQdQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt+fK83ic3PPh75cmRopeu/CT8AfoDx9L/zyas
 Z3T4rMEfOyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfnygAKCRCJcvTf3G3A
 JrrwD/9A9nrqjXK5FQG9dvow0AN183koCCDwTn4ZD161OCEMrBwgR+CeBm/gtWLNWVKgvtLGuGs
 8pKG+FyhpdI6zS/3vjHymwD1sCFVqkJQFOUtcmBXA9goOMoS920ANwoq/w9AfNnl3a3wBlnz9Lg
 kuh/M92LMB87qeO9TUvAkrTPUXfcdUHMrjGprR6S/mJwgc8zKVOyY6vM9+PJ1z/nQHr+9m1aAPh
 UtlbvYWwoILjV9r8SpzU/30YT91l9WlVE7Co1YY5gBwBkSBdyJ4+i08RhHtMC5gzcg+N2jhbQXc
 BP96lmSl9Hc3GAY94rMsM9OhbTcfKbBHKyK9jWCaBlcl/ge2TtNp/UT7UBxHsQrI2+weSb+fJ46
 3hmdsBg+I5tPYMSelIyeBBU9YRCSlQMKPwr9iQwyL4s8iQ32+MOau9d98cM8y7ndTiy4VW2idmu
 /SL2lQ3blDgkOHCvWhVkkMRa1u0TJWm2w+OhHypkzOwYeLeeXeMcoUh9e0rkby/sceU1qvlH2r9
 VYmP+7ZDMl3kh9cbRKMwlYCuquzQkufW+sQ+soBxrRv3XzczvYffkIoERolZ0iCvMx3CBDzm9Ak
 xIUCQzh1YTh3pHbsslAmZObnmcBMa+xix+vN4Ja3Is9xc8FvPqeAjsWpPOJh3xkDdX3eXsth0B/ 1EVpfhieCRAosUQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Gain coverage for pointer wrap-around checking. Adds support for
-fsanitize=pointer-overflow, and introduces the __pointer_wrap function
attribute to match the signed and unsigned attributes. Also like the
others, it is currently disabled under CONFIG_COMPILE_TEST.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_types.h |  7 ++++++-
 lib/Kconfig.ubsan              |  8 ++++++++
 lib/test_ubsan.c               | 33 +++++++++++++++++++++++++++++++++
 lib/ubsan.c                    | 21 +++++++++++++++++++++
 lib/ubsan.h                    |  1 +
 scripts/Makefile.ubsan         |  1 +
 6 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index e585614f3152..e65ce55046fd 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -293,12 +293,17 @@ struct ftrace_likely_data {
 #else
 # define __unsigned_wrap
 #endif
+#ifdef CONFIG_UBSAN_POINTER_WRAP
+# define __pointer_wrap __attribute__((no_sanitize("pointer-overflow")))
+#else
+# define __pointer_wrap
+#endif
 
 /* Section for code which can't be instrumented at all */
 #define __noinstr_section(section)					\
 	noinline notrace __attribute((__section__(section)))		\
 	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
-	__no_sanitize_memory __signed_wrap __unsigned_wrap
+	__no_sanitize_memory __signed_wrap __unsigned_wrap __pointer_wrap
 
 #define noinstr __noinstr_section(".noinstr.text")
 
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index a7003e5bd2a1..04222a6d7fd9 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -135,6 +135,14 @@ config UBSAN_UNSIGNED_WRAP
 	  for wrap-around of any arithmetic operations with unsigned integers. This
 	  currently causes x86 to fail to boot.
 
+config UBSAN_POINTER_WRAP
+	bool "Perform checking for pointer arithmetic wrap-around"
+	depends on !COMPILE_TEST
+	depends on $(cc-option,-fsanitize=pointer-overflow)
+	help
+	  This option enables -fsanitize=pointer-overflow which checks
+	  for wrap-around of any arithmetic operations with pointers.
+
 config UBSAN_BOOL
 	bool "Perform checking for non-boolean values used as boolean"
 	default UBSAN
diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 84d8092d6c32..1cc049b3ef34 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -56,6 +56,36 @@ static void test_ubsan_negate_overflow(void)
 	val = -val;
 }
 
+static void test_ubsan_pointer_overflow_add(void)
+{
+	volatile void *top = (void *)ULONG_MAX;
+
+	UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
+	top += 2;
+}
+
+static void test_ubsan_pointer_overflow_sub(void)
+{
+	volatile void *bottom = (void *)1;
+
+	UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
+	bottom -= 3;
+}
+
+struct ptr_wrap {
+	int a;
+	int b;
+};
+
+static void test_ubsan_pointer_overflow_mul(void)
+{
+	volatile struct ptr_wrap *half = (void *)(ULONG_MAX - 128);
+	volatile int bump = 128;
+
+	UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
+	half += bump;
+}
+
 static void test_ubsan_divrem_overflow(void)
 {
 	volatile int val = 16;
@@ -139,6 +169,9 @@ static const test_ubsan_fp test_ubsan_array[] = {
 	test_ubsan_sub_overflow,
 	test_ubsan_mul_overflow,
 	test_ubsan_negate_overflow,
+	test_ubsan_pointer_overflow_add,
+	test_ubsan_pointer_overflow_sub,
+	test_ubsan_pointer_overflow_mul,
 	test_ubsan_shift_out_of_bounds,
 	test_ubsan_out_of_bounds,
 	test_ubsan_load_invalid_value,
diff --git a/lib/ubsan.c b/lib/ubsan.c
index 5fc107f61934..d49580ff6aea 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -289,6 +289,27 @@ void __ubsan_handle_negate_overflow(void *_data, void *old_val)
 }
 EXPORT_SYMBOL(__ubsan_handle_negate_overflow);
 
+void __ubsan_handle_pointer_overflow(void *_data, void *lhs, void *rhs)
+{
+	struct overflow_data *data = _data;
+	unsigned long before = (unsigned long)lhs;
+	unsigned long after  = (unsigned long)rhs;
+
+	if (suppress_report(&data->location))
+		return;
+
+	ubsan_prologue(&data->location, "pointer-overflow");
+
+	if (after == 0)
+		pr_err("overflow wrapped to NULL\n");
+	else if (after < before)
+		pr_err("overflow wrap-around\n");
+	else
+		pr_err("underflow wrap-around\n");
+
+	ubsan_epilogue();
+}
+EXPORT_SYMBOL(__ubsan_handle_pointer_overflow);
 
 void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
 {
diff --git a/lib/ubsan.h b/lib/ubsan.h
index 0abbbac8700d..5dd27923b78b 100644
--- a/lib/ubsan.h
+++ b/lib/ubsan.h
@@ -128,6 +128,7 @@ void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
 void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
 void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
 void __ubsan_handle_negate_overflow(void *_data, void *old_val);
+void __ubsan_handle_pointer_overflow(void *_data, void *lhs, void *rhs);
 void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
 void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
 void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 7b2f3d554c59..df4ccf063f67 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -10,6 +10,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
 ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
 ubsan-cflags-$(CONFIG_UBSAN_SIGNED_WRAP)	+= -fsanitize=signed-integer-overflow
 ubsan-cflags-$(CONFIG_UBSAN_UNSIGNED_WRAP)	+= -fsanitize=unsigned-integer-overflow
+ubsan-cflags-$(CONFIG_UBSAN_POINTER_WRAP)	+= -fsanitize=pointer-overflow
 ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
 ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
 ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
-- 
2.34.1

