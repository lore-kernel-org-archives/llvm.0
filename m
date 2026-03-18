Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247DD3F23AA
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851238; cv=none; b=jX14vFXDMd7JdnCKqa291LOg1b0xZAM14P52RosShHJ/HLbUs+I1M/k3bmam5IrkGNGxCrVR6d9P3Tzi7BHaxPop3tLsVl+CoWBFR7BW+0bUJiTO0KREw1w0Mo8wL6f+VrXv0ujaf3sjBfrUMWbVNrS0aNchb+DoC72JnVp4SOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851238; c=relaxed/simple;
	bh=/5iKMb3ycj7sI45IkWou/fRJrMIENtP9YU3ZYrOJJ2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3Ne62P1ioJu1pPZEUv4ipqik8mbvkra2CG7ESc6NUgtHmcQpFb2YC+88vUkZBSVe4Fd6VUYSttVftt4gcCGAzDoFX/j/2JqN0UzFbV4eam/ifuncVmY4wUdkYHbnkTaP0TuvyQ90Nxz6k4MFw8x94ahU+gUAL8F9kuCKsy8de0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QenO/v6R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QenO/v6R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852af55981so96005e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851231; x=1774456031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYXkU8zgzVWbz7gW/kc26lZQTOVhBoB0e4m0vdnJjs4=;
        b=QenO/v6RdgstNWU4UPvrbErPxg+Ujqv3Mk3d8cG5I4IF2Zgwnu+by7Pz7CT4Ts21D9
         XjGkH5soeFsIhL7E9uMCFIjqd9JdVTRJ73XY9gsV45x+g4b/J7KTmMnEoBzLCIYZA+3k
         w3qYE1SOGIq76N0wXjRO+/DlubIIq4REfZ7FiLHMzOPQ4EUy0AGtkFoWyKGiVmY3lPea
         xRodI0+pZ/Um1re4b6xfGIfQpE62W71s5tfoOl6qU6J03tvAs7QZydk8bwZoShsI4a9i
         bnXQ+aw7pSM5gFjijc0Mqan+mN5YgooLhdLPzfUmNprLAFFutMf46b3rP5CkntNDXDDb
         bVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851231; x=1774456031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mYXkU8zgzVWbz7gW/kc26lZQTOVhBoB0e4m0vdnJjs4=;
        b=Qt8UNrUx5dQJSIA32Yo/fceG3+VP3iOK/l+wWik0HICV94Z78bBPnAA7E7NH1cE6lL
         L8m+kU9TPZae8HCM4YPBQ3m44Hd3f6MKJyDjTTjiCUKyRY891ViC7y0sot7EM9Js2Luz
         ytHN+8P5jdT0UTFZdS6ckbXVWSra/z5Ilh1ZPiXqkJx2t8tLz8U7uQSTCl9a4BExj+eT
         NuTZI8V+H/BznoHOsDFGRErYY2NSeAfRGu44k2Hf3e8B3OXt0AkPyNFjppW0bwdKnBTn
         0zQ0fumtjXxr2/Q6NxhQ8OxuqQvmrd8CJM3I4AUUuC6V23qr3mKK0y2WSKW6tYfruAiH
         D+og==
X-Forwarded-Encrypted: i=1; AJvYcCUjIdQNsIsk5fv0KNCEr2nmU5y2mJNL1d2tOKjokEIjJMWk/r3T7AFM1rigC1ghDpC5Nbs8@lists.linux.dev
X-Gm-Message-State: AOJu0YzfbuMhBzfPbrjTEXNQGL0NUIoGqz0ujanu8W2qKzgBxcjKWRzt
	9UL76vKXRiopK6zkHKrq2d1FAIoHmRUhp0iUN8aT5D9+QWWZHNcig7OSmQMyShsWPA==
X-Gm-Gg: ATEYQzwvLs3xkdAUu/kfbF6ZJRlF2+z05Db5GhL7ZodXYM5bBXXlo+vdbMMdVJgixEh
	LgbO9EefWc7S0LLVQS21z1YFH/zcxtM99OtB8vFAtTKT5BQMUnNYzdFkLnAbex8HU+RN0VouZAg
	UxGTtIthYKBRK9qUHIPFonMO9X6/UAO5J8hKFxKXsMOtUYuUH9MmO8Bx+QkuLBRJaB1+CEm8aGj
	RHjCUfpWaPfN5dATjF4W+noe8+/EMOVO3XqszvBjn7fybcfpx9oKzs6bxZ6LjXn1G7/46bLuC4L
	c9mu1T/1uaNRNC2nbZpw3ygqdEC8izCN1w/FRJtJItIxrdJSuAzKTxBbIDnQTjkUJEWPYqSZMAl
	9gXiPdyge8u51ggfrAK7enFEMQsQNZlNDykpoPMzaRDUWIggTDLqCeHj47LXRwDnXSN4UZCtEBi
	wUfyP1VWZN+oqbPLYjLlfDP0wtX5BfREJH5u5Ud6iRGTWaR9OLvw==
X-Received: by 2002:a05:600c:5912:b0:486:f772:91c4 with SMTP id 5b1f17b1804b1-486f77292bemr489125e9.8.1773851230735;
        Wed, 18 Mar 2026 09:27:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c66d:1e51:595a:925])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b5184961csm9805144f8f.6.2026.03.18.09.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:27:10 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Mar 2026 17:26:59 +0100
Subject: [PATCH v2 2/4] kcov: wire up compiler instrumentation for
 CONFIG_KCOV_EXT_RECORDS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-kcov-extrecord-v2-2-2522da6fcd3f@google.com>
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
In-Reply-To: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773851224; l=5575;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=/5iKMb3ycj7sI45IkWou/fRJrMIENtP9YU3ZYrOJJ2E=;
 b=Pvlz50le1Rl6k4pchGWj+xOX1hDMosBffmKuAV4aHVkb4OKCez0m7tlYUJsGdHDNeLmsLo+rH
 gLx2i4q5CnICKzlmfIv0hpQoOCa0p9MHRul4gkWlLugTxFO0sx8iu52
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

Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
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
index 0143358874b0..e5502d674029 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -81,6 +81,8 @@ typedef unsigned long long kcov_u64;
 #endif
 
 void __sanitizer_cov_trace_pc(void);
+void __sanitizer_cov_trace_pc_entry(void);
+void __sanitizer_cov_trace_pc_exit(void);
 void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
 void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
 void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 0b369e88c7c9..86b681c7865c 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -202,15 +202,10 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
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
@@ -230,11 +225,36 @@ void notrace __sanitizer_cov_trace_pc(void)
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
index 93f356d2b3d9..58686a99c40a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2215,6 +2215,18 @@ config KCOV
 
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
index a30379e4ff97..ae3127227621 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1251,6 +1251,8 @@ static const char *uaccess_safe_builtin[] = {
 	"write_comp_data",
 	"check_kcov_mode",
 	"__sanitizer_cov_trace_pc",
+	"__sanitizer_cov_trace_pc_entry",
+	"__sanitizer_cov_trace_pc_exit",
 	"__sanitizer_cov_trace_const_cmp1",
 	"__sanitizer_cov_trace_const_cmp2",
 	"__sanitizer_cov_trace_const_cmp4",

-- 
2.53.0.851.ga537e3e6e9-goog

