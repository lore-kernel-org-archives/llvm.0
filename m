Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA616C861
	for <llvm@lists.linux.dev>; Wed, 24 Apr 2024 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713998435; cv=none; b=ine4r3IFPycWiqvxCf/62dePPwl4ZglsqB0uKjv3HwXccszaeKaPcjbWD9hMudoq/d4+kmLx7dGYegAv68UcRdDYtA7BS7pGXmOJQ656J488+5uLaLwLOSy6l1H3pNqxgSQ1OpETl+olREIc8eJenQHbWJsFXeSSCQElsHJemjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713998435; c=relaxed/simple;
	bh=S6pSKGU1vZkqsA6JyZACfXvcQXgSDSwKOAh1iNHOK7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UDVfwTUIYQx/I1ZI28ckfgd/6hdOLbZkCpu9TniPElJyS/DdCi9pyC7lreb9gnTCWlr5ZSVM2V6G1rrnnHTnj2yeWUf/4rP+QvgP9zRlhUebBjNDD4H8OVpQixKyjEft8kT8d2Mj23sKWDYtQjV+0qIqDv/LN9bnPinBmERgyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EvEIxpUQ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EvEIxpUQ"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c71c7e2d40so145155b6e.3
        for <llvm@lists.linux.dev>; Wed, 24 Apr 2024 15:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713998432; x=1714603232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTbZyDAE7D1exiHp1TgfWwHZGetvSM17QuiylPP4Ugo=;
        b=EvEIxpUQokCYYTe+ZYksTjoXyhex7nJHap9bIKtgc7cr0HjVzFmHOV9/GX3Oj/3xYM
         4yZXUHTcNVCTK+g2/EWUMCkZ02ZdhKAoqD+vn709cPtdFsv5hjq4rLI3uBFzqRPi0JzE
         K/i4rEiLWBeR7bTAK1NjWmNooc6yUSoPglnKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713998432; x=1714603232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTbZyDAE7D1exiHp1TgfWwHZGetvSM17QuiylPP4Ugo=;
        b=O6re6aBe4NK602tfy1voMRrdTudyaXSoOC9QJRoOFwOfg7du9fWAm3IEDXiHM5HoJG
         Bt/LEpTCmEf3xshstO45vh0aiQvnVk7j9bbR6MKaMuHczQEGRrn0V9sB+1bgLvok3rwO
         EIEdG6DFPsq6lDowpUJX8qY4DwRdcGJKTIlTn8e6ih3Ksm08sbZn51jY2xKI1+YupwpI
         lpg16c8jzVv2DS/tB7kCbuleHN+Ofnp0/Sm77ag5ZVRFYAFhcd8zQnVr+PTZKUGQigg2
         9vr59iC8+4JGZ0RSXlBnP89vyZuy0BQbZzz17mokMbzhLNfkQfZ7k5dpYNM3m1FFOKJ/
         2tOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkda9LV4EU0XQL8FYfJtH9romj98HPaiJHHVu3NiGKoiIDzCeGDGWU9OGpu7fn1C8TS65s/ZqZq6t2ThWCjP5bflU6/g==
X-Gm-Message-State: AOJu0Yx+aoewlS6y7EsyZlfdw8t5qAwZC/hiZUv2FKZ6u447OISZCSkl
	HSKrB1aAdhnQ75wp5Yxq9WD1I+SxZ/5ATqK4n7LW/nGiKaC0NPKm9AJr58XhYA==
X-Google-Smtp-Source: AGHT+IGFUXgAb57/n0ajo0YDZLiplfyraBU1xymIQJvWPzgD5RmxHj274JJqj/jUT26O6h41iVbSbg==
X-Received: by 2002:a05:6808:6146:b0:3c5:e81a:b5b6 with SMTP id dl6-20020a056808614600b003c5e81ab5b6mr3457731oib.59.1713998432715;
        Wed, 24 Apr 2024 15:40:32 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q24-20020a637518000000b005dc4b562f6csm11655715pgc.3.2024.04.24.15.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 15:40:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Erhard Furtner <erhard_f@mailbox.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ubsan: Avoid i386 UBSAN handler crashes with Clang
Date: Wed, 24 Apr 2024 15:40:29 -0700
Message-Id: <20240424224026.it.216-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3862; i=keescook@chromium.org;
 h=from:subject:message-id; bh=S6pSKGU1vZkqsA6JyZACfXvcQXgSDSwKOAh1iNHOK7k=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmKYpdOvL4ycJZMfmelPH56Xu+0zUCHN/li7yDD
 JlCQAIXtpKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZimKXQAKCRCJcvTf3G3A
 JsthD/4qvBqX1FE7+CepCN/bUSsdc70zA3IoR9J74pMA+cDoufvy18SuqrI0QlPCbAV5PeKztge
 gzibb8xd36rAisAJKA0utmRkVAydrRwbmjUFVD79yBBujbfyNlK8mqPsmCr12I9QlHdXgxxmzxE
 A5WfXC0Mbp3BegjRlKorI0bVF+zZWYjG97ThyMxlUrdcabHqXdWFd9SG1iQ97Ee0Za9QRRRyTbn
 YdM2Zslm2eF4PHkTiUJkeJphrHtXmEVaC14vmKIcjDJ2QneeeP+Pg84whwO6ACNLtMWA9Gd3/F4
 h2zrUXv0HRIS/0lxYFm9jJyRfUndtgLpAA5jHq8vVuwYFys9z0e/TRGt3HNdbXmZzqJLkd3lW7U
 A13vTr2W7Btz+q7N23001OYIcFSqsnNpu8njFOauxcB/Pc9iNywTi03uFpjYQUyy/mfTp1bgV7x
 Hk4rNT49RY+kiA3pt5TZ9+aT9n+raRjt80v/j8TD4x1zi6/p0nT/0EG6ObbiJv2GdzF9a/AcgDB
 3Um3HWzzyCD2aL/HebIwG30sZZ2gbPO8cGU7REXohAIk7OWKGavgZLd1ggwZoNGk5dhd0V03o0K
 zn98pxzl3fqDdXgn1zZXrpNUj7pk2e4a/s0FsZNdqV2jYJ1Khhu7Ncyqsjkelvd9ho56XocxX4e
 fljUYFZ Og7QZA1w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

When generating Runtime Calls, Clang doesn't respect the -mregparm=3
option used on i386. Hopefully this will be fixed correctly in Clang 19:
https://github.com/llvm/llvm-project/pull/89707
but we need to fix this for earlier Clang versions today. Force the
calling convention to use non-register arguments.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://github.com/KSPP/linux/issues/350
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev
Cc: kasan-dev@googlegroups.com
Cc: linux-hardening@vger.kernel.org
 v2:
   - use email address in Reported-by
   - link to upstream llvm bug in ubsan.h comment
   - drop needless /**/
   - explicitly test Clang version
 v1: https://lore.kernel.org/lkml/20240424162942.work.341-kees@kernel.org/
---
 lib/ubsan.h | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/lib/ubsan.h b/lib/ubsan.h
index 50ef50811b7c..07e37d4429b4 100644
--- a/lib/ubsan.h
+++ b/lib/ubsan.h
@@ -124,19 +124,32 @@ typedef s64 s_max;
 typedef u64 u_max;
 #endif
 
-void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
-void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
-void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
-void __ubsan_handle_negate_overflow(void *_data, void *old_val);
-void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
-void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
-void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
-void __ubsan_handle_out_of_bounds(void *_data, void *index);
-void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
-void __ubsan_handle_builtin_unreachable(void *_data);
-void __ubsan_handle_load_invalid_value(void *_data, void *val);
-void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
-					 unsigned long align,
-					 unsigned long offset);
+/*
+ * When generating Runtime Calls, Clang doesn't respect the -mregparm=3
+ * option used on i386: https://github.com/llvm/llvm-project/issues/89670
+ * Fix this for earlier Clang versions by forcing the calling convention
+ * to use non-register arguments.
+ */
+#if defined(CONFIG_X86_32) && \
+    defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 190000
+# define ubsan_linkage asmlinkage
+#else
+# define ubsan_linkage
+#endif
+
+void ubsan_linkage __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_negate_overflow(void *_data, void *old_val);
+void ubsan_linkage __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
+void ubsan_linkage __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
+void ubsan_linkage __ubsan_handle_out_of_bounds(void *_data, void *index);
+void ubsan_linkage __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_builtin_unreachable(void *_data);
+void ubsan_linkage __ubsan_handle_load_invalid_value(void *_data, void *val);
+void ubsan_linkage __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
+						       unsigned long align,
+						       unsigned long offset);
 
 #endif
-- 
2.34.1

