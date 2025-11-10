Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78B2FC866
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792627; cv=none; b=Skf3QNvv6vRaP23hJF9/69MexP1EkYOzVf2yTak63H9RKcBEI7KTdSCoVqDTLymPM29kQEgJpW7xkTvPSyPLavypdFd0hHHtNTGlQI5bgUt9qNLjv18LYingdobBRDvhy1r9zv3Y4CpMAVR7JX9/PEs77YPt2v37KbRC/Af0nPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792627; c=relaxed/simple;
	bh=J0fK6zHQukT5AAwp1WNQGcCty1gFWyGS7LkumBAy8ig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/H1eBRd6sadNYqwKfHkbEKSURx3QqSKTmcu2ONNKJK1j0uhdVTIUq14zTOqffhpyCBBl98blpBAQ7xyrHV7tocvlCBDpvlxtSlXYPzWHp9XwSNplZgMoW6BoTRER03yxEErlbkajm0f9YdXo9VEQeZ3S7mRpqKJjbgYZNdxwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeSETgHw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeSETgHw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aad4823079so2901787b3a.0
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792624; x=1763397424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouGNoGCEWNf78k//tY5pOloDk6SH5B0un9nqZ5MFRzI=;
        b=BeSETgHwqP8Z8OpuaUZR1ysAxXqe8Cvqg3iaiKRIlYejZvsZich3FJjD3lcwxFkwwV
         14Vx3ddAfZnd7fAOqY/hh9oGcxuKsH5YRBVvcxok2zimvyQCfD8t+GDjlodhgpm1DWDR
         YQ8TxtdEM6zCt48lWVqAp9yQltcqcMzUgUTDnYOdZJcWZDqYe4wTsS/WT+S2HIJFos6l
         5nVUvgLTalWrE3S2QofW02NeAxZi4v0pgxeJIoK5opcBZ3uYj7hvKKX2B46l/Ocntd8V
         fXJmPL0+q1Tfy43mbTVy+0YUN8Wp2TrB3SmgasSgMo7unfQm2sf2kRU0lIgihfZmeNIR
         SOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792624; x=1763397424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ouGNoGCEWNf78k//tY5pOloDk6SH5B0un9nqZ5MFRzI=;
        b=eMcZoDvBvXPQsZXYIXgwY7ZfNsCPW5X6HIVquRHPbWbZPDKo5if6/O2qTt3SptGG1T
         I2JhUf4kAIsT/siX/Kf4JKZDg+etZxRuPyPMXObcnbIwsJXxWwGh1bjdNt4uS3GaMkCW
         pfXzHhupF/ERRu6Rv7IzRzH8U4TO2dJxSg3WXqTN/Kj58Rg6KBS6VeGTyeSu5V2umjlo
         KzhLlJnTkq3QICieD1g0Uef6GQbJPBIWyZDRBx2knHTB5zXZkjpK6XHLG49aifV1Bq2T
         b0KNL9eUabMC9pcrKQsmv3MC4DtiOYLYaXcOP3OR4jut0YBmgz9KI2HJcQ/qVUBqs0aa
         ZnBw==
X-Forwarded-Encrypted: i=1; AJvYcCWIvBh7XQNsGsB+LATt/uo5b4Xl6MJv8UBLBKVrGMFY1IrznZDaOdaTCBTQAUCssFbMdDXy@lists.linux.dev
X-Gm-Message-State: AOJu0YwFzWhrEN6qcJE2XAxazE6l4oBcywcsSo5be25uQluuJeH+Pi1B
	GzxN5cNVJzgV8DFtBXs7mwxGYm17wYoY+Cp54J02nAhSECK9CrVpa2Y7
X-Gm-Gg: ASbGncvAUqUyAjLih+Cu3VlQKAjDyM9ph6rFzJqOXlCiRvXn/eDFs3n6NVTfETlYhmj
	V1kcOD+vvoaSn+ay3zGIvHYlq10TG92buZAgVX98iRmkssYgs9arKefzWe7tbvOlG/m/iefLk6t
	JDLU4eZO8QXB3i60xP0LCiQ2H/9mBiRCOPzAqNXrJls3rcNLvzoDZkMQzXpuIr77IRfOfPWuxYq
	AwVfg/gDEeUajGebYLoNXajpUeR6BVQUoJd/bFNhYVko1s4NXoQ08fEiBKEBs3MME0YyV5y2fub
	XrBS7nnlSCeX5QCvvI6YcyUIiLotiqCrqItMVA0op1+/SpHZKZDQ54nT1S+pwiETtXUx0st/Dr3
	moIW59J7KRBzswBWFTX8r/adDcujPyI+EKbsgmzLBj1ejq7EVUQ8c2V59IHo2PW39sQMpFixa5S
	YtBwm5F43U0hOTvuBnXX1a3Q==
X-Google-Smtp-Source: AGHT+IEv35u8inwf//3hNgNcTHKrbkmcMG/RxR47Sb7uiTU4vtvIQ3hgGu7aTHTaitcgX4VFQg+h0Q==
X-Received: by 2002:a17:902:ecc6:b0:294:f1fa:9097 with SMTP id d9443c01a7336-297e56d621cmr108081745ad.34.1762792623885;
        Mon, 10 Nov 2025 08:37:03 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297df996d31sm88101695ad.13.2025.11.10.08.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:03 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 05/27] mm/ksw: add ksw_config struct and parser
Date: Tue, 11 Nov 2025 00:36:00 +0800
Message-ID: <20251110163634.3686676-6-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct ksw_config and ksw_parse_config() to parse user string.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch.h |  33 +++++++++++
 mm/kstackwatch/kernel.c     | 114 ++++++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index 0273ef478a26..dd00c4c8922e 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -2,4 +2,37 @@
 #ifndef _KSTACKWATCH_H
 #define _KSTACKWATCH_H
 
+#include <linux/types.h>
+
+#define MAX_CONFIG_STR_LEN 128
+
+struct ksw_config {
+	char *func_name;
+	u16 depth;
+
+	/*
+	 * watched variable info:
+	 * - func_offset : instruction offset in the function, typically the
+	 *                 assignment of the watched variable, where ksw
+	 *                 registers a kprobe post-handler.
+	 * - sp_offset   : offset from stack pointer at func_offset. Usually 0.
+	 * - watch_len   : size of the watched variable (1, 2, 4, or 8 bytes).
+	 */
+	u16 func_offset;
+	u16 sp_offset;
+	u16 watch_len;
+
+	/* max number of hwbps that can be used */
+	u16 max_watch;
+
+	/* search canary as watch target automatically */
+	u16 auto_canary;
+
+	/* panic on watchpoint hit */
+	u16 panic_hit;
+
+	/* save to show */
+	char *user_input;
+};
+
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 78f1d019225f..50104e78cf3d 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,16 +1,130 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/kstackwatch.h>
+#include <linux/kstrtox.h>
+#include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/string.h>
+
+static struct ksw_config *ksw_config;
+
+struct param_map {
+	const char *name;       /* long name */
+	const char *short_name; /* short name (2 letters) */
+	size_t offset;          /* offsetof(struct ksw_config, field) */
+	bool is_string;         /* true for string */
+};
+
+/* macro generates both long and short name automatically */
+#define PMAP(field, short, is_str) \
+	{ #field, #short, offsetof(struct ksw_config, field), is_str }
+
+static const struct param_map ksw_params[] = {
+	PMAP(func_name,   fn, true),
+	PMAP(func_offset, fo, false),
+	PMAP(depth,       dp, false),
+	PMAP(max_watch,   mw, false),
+	PMAP(sp_offset,   so, false),
+	PMAP(watch_len,   wl, false),
+	PMAP(auto_canary, ac, false),
+	PMAP(panic_hit,   ph, false),
+};
+
+static int ksw_parse_param(struct ksw_config *config, const char *key,
+			   const char *val)
+{
+	const struct param_map *pm = NULL;
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(ksw_params); i++) {
+		if (strcmp(key, ksw_params[i].name) == 0 ||
+		    strcmp(key, ksw_params[i].short_name) == 0) {
+			pm = &ksw_params[i];
+			break;
+		}
+	}
+
+	if (!pm)
+		return -EINVAL;
+
+	if (pm->is_string) {
+		char **dst = (char **)((char *)config + pm->offset);
+		*dst = kstrdup(val, GFP_KERNEL);
+		if (!*dst)
+			return -ENOMEM;
+	} else {
+		ret = kstrtou16(val, 0, (u16 *)((char *)config + pm->offset));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Configuration string format:
+ *    param_name=<value> [param_name=<value> ...]
+ *
+ * Required parameters:
+ * - func_name  |fn (str) : target function name
+ * - func_offset|fo (u16) : instruction pointer offset
+ *
+ * Optional parameters:
+ * - depth      |dp (u16) : recursion depth
+ * - max_watch  |mw (u16) : maximum number of watchpoints
+ * - sp_offset  |so (u16) : offset from stack pointer at func_offset
+ * - watch_len  |wl (u16) : watch length (1,2,4,8)
+ */
+static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+{
+	char *part, *key, *val;
+	int ret;
+
+	kfree(config->func_name);
+	kfree(config->user_input);
+	memset(ksw_config, 0, sizeof(*ksw_config));
+
+	buf = strim(buf);
+	config->user_input = kstrdup(buf, GFP_KERNEL);
+	if (!config->user_input)
+		return -ENOMEM;
+
+	while ((part = strsep(&buf, " \t\n")) != NULL) {
+		if (*part == '\0')
+			continue;
+
+		key = strsep(&part, "=");
+		val = part;
+		if (!key || !val)
+			continue;
+		ret = ksw_parse_param(config, key, val);
+		if (ret)
+			pr_warn("unsupported param %s=%s", key, val);
+	}
+
+	if (!config->func_name) {
+		pr_err("Missing required parameters: function or func_offset\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static int __init kstackwatch_init(void)
 {
+	ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
+	if (!ksw_config)
+		return -ENOMEM;
+
 	pr_info("module loaded\n");
 	return 0;
 }
 
 static void __exit kstackwatch_exit(void)
 {
+	kfree(ksw_config);
+
 	pr_info("module unloaded\n");
 }
 
-- 
2.43.0

