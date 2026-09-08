Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF958E2DF
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886505; cv=none; b=P7fYpaM21pfXb9moa7O/rbgbUDNhNRjgZ1T6vOf8y9duh1lK+oBS3TEmyjZIvuKmS71A/Ae/GT5V98UiCQCpRiKyrcUDZl0Copp99LoMhicgNkLrgc3Nv5JMRDJuwj84/NfE5VZSZqogB4LXJX3qFMQv2Z6mla9gA5ZDD/BQvlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886505; c=relaxed/simple;
	bh=fbhmEJLe+fv6wmnOQ+SkOQQ7U1O9RdjLzXOBxFO1BRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRDF62WqOg4xmGUILlu0zm1l2Ir717ZlyszwOwYbjf8X8Q0jy7Lsi+Dj966jB2m9sIWoNwkB8e07JOSu1e8DQHkWpDgT+dRK/2yvqH63aqnRfvbhJVv65zplVUSlRRkx6P5x6JAOuYsmmb+Y54wE2geADU3/7KGrqoLtCW9Abhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m45G7cBN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m45G7cBN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso145325e9.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886501; x=1789491301; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FysVnPArrErIx2WaY61CSIH8v7xlwTnQSJCtiIE9LJg=;
        b=m45G7cBNSeFo5W9Gf89i++vcG7VOy2wm2gnFquZynf0HJ1qn54/f/grnMJqRM+hkUJ
         dcbjFTrgH23BMe+ZvxZTwi3dAM5+6FP6ScKRa1cw9wq3bVYpq+JK/cALBJpTN0rXSgtV
         EV366LVclcFAM5mM86/agWJBixk5w1RK1c8RMpRkuS8BxTb5peZFH6PsWNdvu328Rwvk
         icG9TYLRlaom1Bbln7cJToRAPcevXnHS4hgjlNN5KjjGQ6KnpCsJSIMM4rrxOIdO9RwK
         qkYuw1vjUIm0N1q3M5kdUYo662sd7uPMLiIKyXD2n/7YHW12Q+iul+x+I+gWPLzBkKNT
         7D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886501; x=1789491301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FysVnPArrErIx2WaY61CSIH8v7xlwTnQSJCtiIE9LJg=;
        b=e+bdzinjrMr0zH5PryHbxmK3Xtew4kDdWW0eWxFD89rpf/qXwuJ+LFSSCSROjL71jL
         xcQwdjIy5MH7PLX+oDxdvxukmnsqjmGR745lwK8Cty1bDwrC/pO1ZwxIVLzH36BrEhJ7
         g15IDdzkS+7do4ekKD4CgLAhm/q4OXh4mdjxlMhGlheccUJriCsHRsJGHKuFPsyjRqzh
         xTBhHmZWzermD5iL8DuEyJkGg5lOHoBsKJGdgON//gAKvg+KgTzXcvRd2tgzYYDUXU7G
         UxYsBx8Gb85oh/Ubq2exKmlXvlIoTMu5dqZf81jlTAiuVPNWJdOwxHm39woO2xeHtP28
         3Mbw==
X-Forwarded-Encrypted: i=1; AKwUvBzphw1pUC+eQJ3CrxBVs3n3He013QhsX6psy3pRjsEGTCSXa1O6MJbJJ5wypGCp68EUuRhV@lists.linux.dev
X-Gm-Message-State: AFuF++nDlSuBWBwKUAUdVWa3YQ2U7P8I0vwUKsKckCAyFfXx/HEZLk/h
	OPPJRq6wOe2BkhVY4PAwXWyt3xvqsdkpevKNfrlWEKcYt2yEZAnZ9IpznstnRhu7RQ==
X-Gm-Gg: AYBFou37EXUi9EV1/fYGwLDUBzpg83z9ZDtEecyAac1bxGEQQpmOS3i8DG+DIaIdUsB
	MHK9JtHA+w2o6vyBNK0FrjJ/pPrN+P0j3EHMQdGDoAExBLf3WSg5WjOcIfYkm0IgS+cWjyEXSXQ
	nE5e0aqbi4Uc24lFvdk0BZslV9zGtF+S9gIkDOwzV2SYLwjT1F/S38JdRd57Epia4wHFGvBvZIU
	QXvDZORgFjjEKWuWzxenSl1Akg/9GLRdgFusXGrr1QXe4GUnwbh+JuM/9AjiunW//8WfFKn6UVh
	IZBq3j+G+zDruo03yY8Yh4q/w+h2g1MhPHoteNNUaC2adwgDWZVzFgEBz+L+bB9zvJwoyHtX5Xc
	G6GXBFGRUeAn3S2hgVvlAY8z0f+0oXhnApkR4O62dEf6y9wPbJJ9wUBvTFZBgxgMlPvavLi/d0j
	8iXAl8M9Rw6fTQ5z/lD9tRrzex+mkL+pj8HbHF9YocqFH7XxgYxFlpaHmnsFmGJ4CsCRKCdEyOk
	b8ES51u14egl+huXNZvpDten3XES6ppz91Wfrtu/9zdhm9lbQ==
X-Received: by 2002:a05:600c:321a:b0:499:c5f8:6773 with SMTP id 5b1f17b1804b1-49d1f3c671cmr43385e9.1.1788886501174;
        Tue, 08 Sep 2026 09:55:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm32881768f8f.2.2026.09.08.09.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:00 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:41 +0200
Subject: [PATCH RFC v3 01/12] kcov: wire up compiler instrumentation for
 CONFIG_KCOV_EXT_RECORDS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-1-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=5490;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fbhmEJLe+fv6wmnOQ+SkOQQ7U1O9RdjLzXOBxFO1BRs=;
 b=xC0J7K86WvjhjpkFg4np6v4fDVR4B9bGKONZpAv7YX+g0Q4BMzsypH3bF+lvko3zB+SJG4naq
 0QBEJWkWnhcAUTR7X5fNCJbZg5/mVmI9SSPppgASzA+IrR+Ibrh4ll5
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This is the first half of CONFIG_KCOV_EXT_RECORDS.

Set the appropriate compiler flags to call separate hooks for function
entry/exit, and provide these hooks, but don't make it visible in the KCOV
UAPI yet.

With -fsanitize-coverage=trace-pc-entry-exit, the compiler behavior changes
as follows:

- The __sanitizer_cov_trace_pc() call on function entry is replaced with a
  call to __sanitizer_cov_trace_pc_entry(); so for now,
  __sanitizer_cov_trace_pc_entry() must be treated the same way as
  __sanitizer_cov_trace_pc().
 - On function exit, an extra call to __sanitizer_cov_trace_pc_exit()
   happens; since function exit produced no coverage in the old UAPI,
   __sanitizer_cov_trace_pc_exit() should do nothing for now.

This feature was added to LLVM in commit:
https://github.com/llvm/llvm-project/commit/dc5c6d008f487eea8f5d646011f9b3dca6caebd7

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kcov.h  |  2 ++
 kernel/kcov.c         | 34 +++++++++++++++++++++++++++-------
 lib/Kconfig.debug     | 12 ++++++++++++
 scripts/Makefile.kcov |  2 ++
 tools/objtool/check.c |  2 ++
 5 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 895b761b2db1..cd79715db241 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -79,6 +79,8 @@ typedef unsigned long long kcov_u64;
 #endif
 
 void __sanitizer_cov_trace_pc(void);
+void __sanitizer_cov_trace_pc_entry(void);
+void __sanitizer_cov_trace_pc_exit(void);
 void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
 void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
 void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..5d9686c8b3ec 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -198,15 +198,10 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-/*
- * Entry point from instrumented code.
- * This is called once per basic-block/edge.
- */
-void notrace __sanitizer_cov_trace_pc(void)
+static __always_inline void notrace kcov_add_pc_record(unsigned long record)
 {
 	struct task_struct *t;
 	unsigned long *area;
-	unsigned long ip = canonicalize_ip(_RET_IP_);
 	unsigned long pos;
 
 	t = current;
@@ -226,11 +221,36 @@ void notrace __sanitizer_cov_trace_pc(void)
 		 */
 		WRITE_ONCE(area[0], pos);
 		barrier();
-		area[pos] = ip;
+		area[pos] = record;
 	}
 }
+
+/*
+ * Entry point from instrumented code.
+ * This is called once per basic-block/edge.
+ */
+void notrace __sanitizer_cov_trace_pc(void)
+{
+	kcov_add_pc_record(canonicalize_ip(_RET_IP_));
+}
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
+#ifdef CONFIG_KCOV_EXT_RECORDS
+void notrace __sanitizer_cov_trace_pc_entry(void)
+{
+	unsigned long record = canonicalize_ip(_RET_IP_);
+
+	/*
+	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
+	 * basic block; it should still emit a record even in classic kcov mode.
+	 */
+	kcov_add_pc_record(record);
+}
+void notrace __sanitizer_cov_trace_pc_exit(void)
+{
+}
+#endif
+
 #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
 static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 {
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a2f0d3e97889..6ddf58692b09 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2195,6 +2195,18 @@ config KCOV
 
 	  For more details, see Documentation/dev-tools/kcov.rst.
 
+config KCOV_EXT_RECORDS
+	bool "Support extended KCOV records with function entry/exit records"
+	depends on KCOV
+	depends on 64BIT
+	depends on $(cc-option,-fsanitize-coverage=trace-pc-entry-exit)
+	help
+	  Extended KCOV records allow distinguishing between multiple types of
+	  records: Normal edge coverage, function entry, and function exit.
+
+	  This will likely cause a small additional slowdown compared to normal
+	  KCOV.
+
 config KCOV_ENABLE_COMPARISONS
 	bool "Enable comparison operands collection by KCOV"
 	depends on KCOV
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 78305a84ba9d..aa0be904268f 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 kcov-flags-y					+= -fsanitize-coverage=trace-pc
+kcov-flags-$(CONFIG_KCOV_EXT_RECORDS)		+= -fsanitize-coverage=trace-pc-entry-exit
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 
 kcov-rflags-y					+= -Cpasses=sancov-module
 kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-level=3
 kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-trace-pc
+kcov-rflags-$(CONFIG_KCOV_EXT_RECORDS)		+= -Cllvm-args=-sanitizer-coverage-trace-pc-entry-exit
 kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -Cllvm-args=-sanitizer-coverage-trace-compares
 
 export CFLAGS_KCOV := $(kcov-flags-y)
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index df04e6be2f66..d70cb640e2ec 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1220,6 +1220,8 @@ static const char *uaccess_safe_builtin[] = {
 	"write_comp_data",
 	"check_kcov_mode",
 	"__sanitizer_cov_trace_pc",
+	"__sanitizer_cov_trace_pc_entry",
+	"__sanitizer_cov_trace_pc_exit",
 	"__sanitizer_cov_trace_const_cmp1",
 	"__sanitizer_cov_trace_const_cmp2",
 	"__sanitizer_cov_trace_const_cmp4",

-- 
2.55.0.979.g7e5102b832-goog

