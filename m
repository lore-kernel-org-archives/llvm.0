Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE068BE7
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 15:07:32 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5868992ddd4so1738277b3.0
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690988852; x=1691593652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvGboV0t8alUYsd0cddb1UrgSKN8k9GsOS0292grtRY=;
        b=GYpXHhyb51djbzUFEuGFZEroZZF3Dvb8cCqx1P0jJsczmAPHDexsCVHdASsbs/x7Jx
         keu22L3rwyjMwK0648nvVpSVK2uMvNELdai3ps7AmNO7EMR4Dfoc/3b8EMN7gRfAYkEb
         I84cnhcKToeQ+dUV+jqQgwNM1R9Q+EtB9FwZu7Nw8xFIIRQjVDGQwKOcVrtkRmn3rYHt
         eT6bdpbrI6PQSCGPEXiPiOwfVOzKnH6H0arou10oqq0ZaeqOyz56dIvYL7ADRA/4oKnJ
         chV5fqZcOs1jJU7BfKlWNdoeiyXZNKH4X59F1Y911DP4rfjhXRtAHf46t7M0Zt3NbLlo
         PINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988852; x=1691593652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvGboV0t8alUYsd0cddb1UrgSKN8k9GsOS0292grtRY=;
        b=Tv8rzn8/5Sl2hxx2qBqdCPruaCYFS+NlJQSRK2GJZDCh3DHNvwrmaE74EryDfsoslh
         P2a4ovHsTtL/r5K1qPuRlamt6bCKOFBTx6dekgrJRkH0ZzslFQu5njyOPMXoM3ZS/WkX
         ZZQ/NVTjV7bU2aftAcMjAdcbmJQANVmDPu8Om7q6u8nHZxKeyFyak6gftHBMGiuBo9Vi
         jv9vOah21jvRIDo7VJvuA02SEF5GBwTWmG0xSFxsRdLd8Nyg3i0Y2TCkascvQSTC+N9l
         N/8RBg/dsaqD6InKDEX3nQeTboeKc4+3gEsfPMZvzyeBwAwbYqSTN3MVPxRIBJ8vxs2u
         jypA==
X-Gm-Message-State: ABy/qLbIp9xkmQU6VNUeSojygHybizMKCOzmgXNX03zgcVnWHlFFjrvQ
	nRBi4gxP4kQX7oBkb6gmXedmUDBGqQ==
X-Google-Smtp-Source: APBJJlGl7coc7Y9Wjkd2tlsnTCLaJ9EQ+DV9HEDr83tchbeO/pNpIzRKN5owQrLr3Yo4s+6Z8oFpFbyHBA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:5f73:1fc0:c9fd:f203])
 (user=elver job=sendgmr) by 2002:a25:ab86:0:b0:d0d:a7bc:4040 with SMTP id
 v6-20020a25ab86000000b00d0da7bc4040mr122142ybi.0.1690988851982; Wed, 02 Aug
 2023 08:07:31 -0700 (PDT)
Date: Wed,  2 Aug 2023 17:06:38 +0200
In-Reply-To: <20230802150712.3583252-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230802150712.3583252-1-elver@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230802150712.3583252-2-elver@google.com>
Subject: [PATCH 2/3] list_debug: Introduce inline wrappers for debug checks
From: Marco Elver <elver@google.com>
To: elver@google.com, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Turn the list debug checking functions __list_*_valid() into inline
functions that wrap the out-of-line functions. Care is taken to ensure
the inline wrappers are always inlined, so that additional compiler
instrumentation (such as sanitizers) does not result in redundant
outlining.

This change is preparation for performing checks in the inline wrappers.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/kvm/hyp/nvhe/list_debug.c |  6 +++---
 include/linux/list.h                 | 15 +++++++++++++--
 lib/list_debug.c                     | 11 +++++------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/list_debug.c b/arch/arm64/kvm/hyp/nvhe/list_debug.c
index d68abd7ea124..589284496ac5 100644
--- a/arch/arm64/kvm/hyp/nvhe/list_debug.c
+++ b/arch/arm64/kvm/hyp/nvhe/list_debug.c
@@ -26,8 +26,8 @@ static inline __must_check bool nvhe_check_data_corruption(bool v)
 
 /* The predicates checked here are taken from lib/list_debug.c. */
 
-bool __list_add_valid(struct list_head *new, struct list_head *prev,
-		      struct list_head *next)
+bool ___list_add_valid(struct list_head *new, struct list_head *prev,
+		       struct list_head *next)
 {
 	if (NVHE_CHECK_DATA_CORRUPTION(next->prev != prev) ||
 	    NVHE_CHECK_DATA_CORRUPTION(prev->next != next) ||
@@ -37,7 +37,7 @@ bool __list_add_valid(struct list_head *new, struct list_head *prev,
 	return true;
 }
 
-bool __list_del_entry_valid(struct list_head *entry)
+bool ___list_del_entry_valid(struct list_head *entry)
 {
 	struct list_head *prev, *next;
 
diff --git a/include/linux/list.h b/include/linux/list.h
index f10344dbad4d..e0b2cf904409 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -39,10 +39,21 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
 }
 
 #ifdef CONFIG_DEBUG_LIST
-extern bool __list_add_valid(struct list_head *new,
+extern bool ___list_add_valid(struct list_head *new,
 			      struct list_head *prev,
 			      struct list_head *next);
-extern bool __list_del_entry_valid(struct list_head *entry);
+static __always_inline bool __list_add_valid(struct list_head *new,
+					     struct list_head *prev,
+					     struct list_head *next)
+{
+	return ___list_add_valid(new, prev, next);
+}
+
+extern bool ___list_del_entry_valid(struct list_head *entry);
+static __always_inline bool __list_del_entry_valid(struct list_head *entry)
+{
+	return ___list_del_entry_valid(entry);
+}
 #else
 static inline bool __list_add_valid(struct list_head *new,
 				struct list_head *prev,
diff --git a/lib/list_debug.c b/lib/list_debug.c
index d98d43f80958..fd69009cc696 100644
--- a/lib/list_debug.c
+++ b/lib/list_debug.c
@@ -17,8 +17,8 @@
  * attempt).
  */
 
-bool __list_add_valid(struct list_head *new, struct list_head *prev,
-		      struct list_head *next)
+bool ___list_add_valid(struct list_head *new, struct list_head *prev,
+		       struct list_head *next)
 {
 	if (CHECK_DATA_CORRUPTION(prev == NULL,
 			"list_add corruption. prev is NULL.\n") ||
@@ -37,9 +37,9 @@ bool __list_add_valid(struct list_head *new, struct list_head *prev,
 
 	return true;
 }
-EXPORT_SYMBOL(__list_add_valid);
+EXPORT_SYMBOL(___list_add_valid);
 
-bool __list_del_entry_valid(struct list_head *entry)
+bool ___list_del_entry_valid(struct list_head *entry)
 {
 	struct list_head *prev, *next;
 
@@ -65,6 +65,5 @@ bool __list_del_entry_valid(struct list_head *entry)
 		return false;
 
 	return true;
-
 }
-EXPORT_SYMBOL(__list_del_entry_valid);
+EXPORT_SYMBOL(___list_del_entry_valid);
-- 
2.41.0.585.gd2178a4bd4-goog

