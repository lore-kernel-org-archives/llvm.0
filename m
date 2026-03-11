Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DFC348463
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263213; cv=none; b=TkTRtV4yCp9so2b1e5Z28Vakxc55YV3k4qVauuh7HfKTcujnQI1nEZDGp8oRWdbJnEf59NPuy6qIhJ2xdIRrqPIh3pjbUdjJ//wVjrLDtZDl1fsLkzdREWVEvc4Vd8QdRU3mhnwrgz5PEg+ZgRMKbbncdBc0/KAy9N7xeWI6daU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263213; c=relaxed/simple;
	bh=5DsfSgu+FPcywkrKjdBKgz/A0iooKEhY4/hZbp/L+BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxlYQ9JTXTASkiiF++4mgexRKxyIJezoo3hGKFtrLbdfQwi/gHsiYge3KPUhRCEtKxnYgJDQBZ6XR1u4XUTthMvTrHRtK9o/UYZcxZu/azXNpFIEMUHQwpkj9pmtnt+yumnuGEQlPdymRW0qE+90Xoc9UbPyvyM3eq3nbhox+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aqB2QkcZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aqB2QkcZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so8145e9.1
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773263211; x=1773868011; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzKnYN2/boQ9iOCZJ64ZuiUoSY4TlQ9bsFVP29RzfIo=;
        b=aqB2QkcZr1cL3OoLhLkJN5P/2hFldYOYSwsc+xxD2n7vCxr3iL/hNzWXf5RRjShBMz
         lnEFFk4Fl8cC800oauWOcRRJif6C04W4G20bmyqzoDUyhCV5ZeALc7mABlQrH/HiduHy
         x9Zt0Wb6Ax+zhz4KWNALIfmkgRc2OJxrm21vqx4rGZOpvQL5UEC+mDeZMUb2QKY2eIuz
         S2pgaeLsIAoI8K3lUXFxn17sa8oBgtUajVUGiuQig0YwIJKJ35fsjWoQb4KB27WP/Eme
         FpnKQvlMlGMGGUzJrkYsogXqvelAst/OfzUkJ1mOzMRyDSgngnrjPhKGmJfyoN2Mz4tT
         B9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773263211; x=1773868011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzKnYN2/boQ9iOCZJ64ZuiUoSY4TlQ9bsFVP29RzfIo=;
        b=EvUf7O6kr6cP+9p2y4VXWNy7SZ+eoOI8oIuBeGEd0Io9bHuFsI0HPq7DjoHN5r/IEi
         NK4dJlb5+nka4jpuxav57NzX68LhC7QkZcMTzrWerBvcOxf92jrWGWBZ0krKeyXNC6So
         X+h9QcXddo0D6AOES4p8kyadZC/fCHBs9syvyZQ0VHkNKjdahKdQPYxm/rRiMLtXKaMp
         K+4I7kPZj8GthNqGnG1eLN6XqWS3/NRG07O2DoZY1AvMGfHU4OT1/VlvaLhiC0oT7tDj
         E7H+e3jqx06co9FOOO4RgCaJMdUr4kKqeKduUK1gCZHQH+RtnHSP4Njadeoif4Q4PoqB
         Hh7w==
X-Forwarded-Encrypted: i=1; AJvYcCWugRpg82KZencWsAX3VxYDoH3m5bHrYo6KRbbrp8cDQdnO+xp5zyAHbxLOohMvjmPD3OyK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj6TjaDkIR/etwcWJk7A/WMlKeE6qLBQo0n+2dVTcFFmxpVWXr
	hFNJeZcA41+TICQfAHeCcDIf2kDQXEwf8fpeU62tGVcT460uTZYAgrQLzNmSWTdfcA==
X-Gm-Gg: ATEYQzx2WZ1v739rG57xY9cMpnHIyVy4nzvTwgg7Dg4ImAJh2rEAlX4t9Wbmy44Squ8
	tE/f1eJjq2+OXMIsElcMovBuvDm8UKoEs+E2Y2ICd5BFf+2WAEMsh5zxpeU8ZSy3qoAshMPjcM7
	AkIkAi+Qi8wnDR7P6oIm2epDoW7O/d+07naVxGwNU+eeN2xdsyZeA127ItbO5RUp2vHiMIXTuKE
	HklP0byYDzlAh/ICErOJrtQDjakTHEaMf2kEmAvzVSpffaS8213NqPjkIu1GVeahm5Dap9JRwr6
	V6nA8R3EYk2nV+kVXaoFr52dI1zkOQSXjIDYhW5l6hifVSUYwF7iWj9ZTkgAGvWc6FI/JckFTJw
	p0zz7z94dt7c9Cjvt9d4R4hl7BhK0oZjQmh7+snyM5OipvROu+HI/X+z2VI2crsP1rQ41iECLvD
	Mw648TyOXyU9eBYyjhyPgb4Tqo8T0AAk4g/mPTJDXTveJPtAck1nw=
X-Received: by 2002:a05:600c:1c09:b0:477:255c:bea8 with SMTP id 5b1f17b1804b1-48552297bdcmr92595e9.7.1773263210284;
        Wed, 11 Mar 2026 14:06:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c9d4:528c:7414:ba3a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4854b0fa98bsm30652335e9.30.2026.03.11.14.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:06:49 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Mar 2026 22:06:15 +0100
Subject: [PATCH 2/3] kcov: wire up compiler instrumentation for
 CONFIG_KCOV_EXT_RECORDS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com>
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
In-Reply-To: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773263202; l=5297;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=5DsfSgu+FPcywkrKjdBKgz/A0iooKEhY4/hZbp/L+BY=;
 b=K6AVC8ItMBgT1JQDBXviHQZ3H70ou6Q4xycc4VLgngTNhupShXHtef90BIuy7Ymek+6rnFAi2
 Y8bz3jas2jaCNDe7ONh2j6QP+E+fmvnj8kVvHN07gOFdeKaDUCFWjcu
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

Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kcov.h  |  2 ++
 kernel/kcov.c         | 30 +++++++++++++++++++++++-------
 lib/Kconfig.debug     | 14 ++++++++++++++
 scripts/Makefile.kcov |  2 ++
 tools/objtool/check.c |  2 ++
 5 files changed, 43 insertions(+), 7 deletions(-)

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
index 0b369e88c7c9..2cc48b65384b 100644
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
+static void notrace kcov_add_pc_record(unsigned long record)
 {
 	struct task_struct *t;
 	unsigned long *area;
-	unsigned long ip = canonicalize_ip(_RET_IP_);
 	unsigned long pos;
 
 	t = current;
@@ -230,11 +225,32 @@ void notrace __sanitizer_cov_trace_pc(void)
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
index 93f356d2b3d9..dddc330ad3ca 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2215,6 +2215,20 @@ config KCOV
 
 	  For more details, see Documentation/dev-tools/kcov.rst.
 
+config KCOV_EXT_RECORDS
+	bool "Support extended KCOV records with function entry/exit records"
+	depends on KCOV
+	depends on 64BIT
+	# TODO: check CLANG_VERSION instead once this has landed in an LLVM
+	# release
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
2.53.0.473.g4a7958ca14-goog

