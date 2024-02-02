Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6E7C0A7
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706869009; cv=none; b=euAbBMWT1uHHZfwWUbRgzg/AYMFbrXm7wu2vk6BL0yDWAk5Ygy1M4am7uFNb6ex84hePA3SxHt8142RNIkXtA+yAoZjpJ3WwvTHRX8DQW/DwrcEyVM/0Z1sKk21KRoUUdaghyRo91oJal7VPb3xfTJC/VeFx8yj3g78DHChI4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706869009; c=relaxed/simple;
	bh=NkiEcsGlCZJdDWvQkJb/8yMO5oe0d2E5DUKWEGSWQdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gC+KQTIEQBVj30jgmgO4DnxgrT5wuD9wXr8JJ/CNr0i2dfAGs/tZWHNvIG5b525h3ouqHzuS9SLeK5/L8ZCrSeVfHctKN2QWlF7cdpHagZcfbIieFnzEBM6MaCOHGbzlF89/XZV6jrT51ZccJNmzcRAEyTZ75ZMSAR6Jl9rLbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cN1hsXk3; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cN1hsXk3"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b276979aso1467557a12.2
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706869006; x=1707473806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqHYD682nla/ZHS426F2Ic30I1reUytKpu6/CiCUuio=;
        b=cN1hsXk3ESlzmm8UU+m2AMP8B59nf9RHuG7UGdXGZgCMIgHi1YzymPWroubj7jsRLQ
         LqKaj44kKUpX8AjZOiZEUk0oiBcd0OJsrHViGWc1VHYYoRwnvTFtOc+zJqCBPW0hc6v2
         S+hYwlHlZbH7+mt+sSCTeOl9VVQMnX/b/SaWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706869006; x=1707473806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqHYD682nla/ZHS426F2Ic30I1reUytKpu6/CiCUuio=;
        b=XuPh4oMCb82uhQ8WIIf4Ae+SRnBeJpXOkTfIyrYugw/QYM5IKzD55v86sX6/LSw7Il
         47qpYuZyOSl8ByHO6lKfFtJg2Z6EeqNainW/kpM9P0UwQ+bDWDnJvRYgGQ8zD3yHBKRL
         yritvhl00lpzjKG8I/LCu6c8t2fjcxeutb2CV4RVgI8Li2844fB5RX+AXecydhLPu8o/
         MCYeHTVD44JPs61z2H4Z8klTPaDm/rFFPADazHfMX9XcgSivCr2OeuXefn6v4JPaOcau
         qHI6qj+/IiSiBwmt6K8vqzKMfIkh6Ws/VSKZgVs2bon40v30L8UK2GzniSEZpUPOu84o
         dwjA==
X-Gm-Message-State: AOJu0Yxoy1pL8SjnO0JDBNcF/Tv0lqaonhUTEmKOK3On0o7oezk4O165
	bxPwLQ8wmR4SPmLL17wYyD80jykIeKRMMc67BokPUtPq7DUHYu0KAWtP7vwUyg==
X-Google-Smtp-Source: AGHT+IE7ogykgf3CPrTOSXlSel4NEbU94GfRuJmB0+7OM5pNDVN34K6iuL7kVwgRSVwhmcApqEEY9Q==
X-Received: by 2002:a05:6a20:c70e:b0:19e:4eb9:ef71 with SMTP id hi14-20020a056a20c70e00b0019e4eb9ef71mr1120171pzb.30.1706869005816;
        Fri, 02 Feb 2024 02:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUCIEC55517ryfx43oBGCFPd8+5dFYouZiV+CV5D+1pxdT6zQmvhdO5M7/v+v/0+oZ2ZKP7VrQbUgL/+VtcBvzZ9rochjM8ars8Ug9esO0kT5v54cAWR0SHeW4ire1WrcpFdFbQ7SfADox8Xxuh1jWS9wKjvP1bnnGlurfrPhqFs9QRBElWuWefb3AEu1hNKBjI2XxtHG4piQidM2SA6fjrWTt7uKR80kZSYBnGt/pWqyBNpyMmyOT/5d2v62lhhMyJrS7pUdeoQynMwhnOc8nOrPbqdyl4MRtTlrrtDCTufoYgPLWVMS0QmnBG2k+X/GobQNKpih7jbb/I55VHYapZPs3oS7wqBoFtthOQggR6Wr+lxoN4x8xKKwIGyfs3JdsCis24f9SYLTTCP9azwT4ogrQdvnFzfa8+iy3SPzY4RDWbCAFghuVydn2Y33c4hZl+THJ9JDrTaEd4ANQWc6gqumPJ3fQKU/fSJH9aykK/aQ+AenQA63NHiGImFoI9oWyPnzAjr7y7kXVTN7aDJ0nQMth/WEFtVDO7RMZUzMoA982f8aJ0qXSavU4KPEQx75+c+RK1oy3Z8IF94lIN9ED1UJszMvSRYvzaryIPixZ9wmONfyzrZVVHYE39Ac8Zq5CfYfgk8Pg=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g18-20020aa78192000000b006d9a7a48bbesm1233974pfi.116.2024.02.02.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 02:16:42 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Fangrui Song <maskray@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Bill Wendling <morbo@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 3/6] ubsan: Introduce CONFIG_UBSAN_POINTER_WRAP
Date: Fri,  2 Feb 2024 02:16:36 -0800
Message-Id: <20240202101642.156588-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202101311.it.893-kees@kernel.org>
References: <20240202101311.it.893-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6190; i=keescook@chromium.org;
 h=from:subject; bh=NkiEcsGlCZJdDWvQkJb/8yMO5oe0d2E5DUKWEGSWQdQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlvMEH83ic3PPh75cmRopeu/CT8AfoDx9L/zyas
 Z3T4rMEfOyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbzBBwAKCRCJcvTf3G3A
 JoHiD/wK4/yqji7UFxhFl81jgo6lzacdRREgM+v/EzDzSlWEk4v/ikFRWbpa91WiN0Qak9XbAnz
 t+Iy1CRNEXFaG0DC2B+fN12n5kGnacf0wuU3362+aaDsSeb7D31lpNZevbRP23nPQs7nce8hyuT
 YNNkhojvoHIcOgH7cK/PtEch2tgM/Rc9uzc/DqE+gcTJY3DgLHfU+T+0O1fh2/Y5t3ZKd10kNZi
 8RfnqVuqRo9MCZ+F0lz/AksQ4rZ0O6GunQ3g1dVnvurEwqGqbhEpH1xL/kfrpQdXcSkB6bWeQ4d
 kaFqttOn7Yxorvdm9nGSsCJTfzsxpS7t0eIxnYmgGyNkTN/pqqGTGM8+1IRjOaDJ1669sBKPq9W
 /VqiRbRr40Yx0b31xtNjMMrbyEL8VjOBBHFwN+gV3PV1uKwk2HBthmmRfpXCn2FU2xjlPWF0+xb
 MP9Rrv3tHCr1rv7aAeUao8KooIiVoWkxUgQC0616IP7k9Hm3LUDvdS5VTxzyXoymxcT9xrkNp8D
 kADO5HIwv09ScgEvVsI++iIGf3x4n/QQO9sY85utNvEGE9KAb5yta4SHxnYjcmYE/7c+YbOp3q3
 nl+gU8NALxVPOeuFNxZeCdqRg2Hc/0QGVjbuQCXLG3yWgDVonUKve5mSxOsioydG3jiIsFLRJFi uVGyAk/WJ7pksww==
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

