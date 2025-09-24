Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548B2FE574
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714718; cv=none; b=GXq50AxnPhdrnLdRmvkcXvoX2o7JBFMZVs2+tb0k/i5iFKPdnUoIh9Of/D1izL2C2PMD5VL9cq0dwvrlG1v1FLBNQ33+Gu3euuL/qjpr7zAm1Hzyoy3dXCw5ugkV/GEzN167HkxVMnI9R5riTMMzedOIcMDUQW74lZkIPRtvYzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714718; c=relaxed/simple;
	bh=Feu6QMw0Ju5Y4dTxQ53cERWbV/8rWQzq92gPB2aNeXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWiGmb6uVjqOXcNfMF23UzozWK9ywWnHGd/cPnSguJTMEZ32sQFDSlf1YZsswxzWEpeeF/L29pXpzaPDutnjwkXoMR+ZsLAlrQf8Z+0vW+0Q7WeDVlKE9OWjGn3suY0VDg/8RooeF9sKoJgHs+3qdK+h7P8GVChxeIGeLMQFcgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EySnBhub; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EySnBhub"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24457f581aeso66194905ad.0
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714713; x=1759319513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGY4NXn9SYrwp2MIROIAsCXd8mHWC2w3iRZMJXUxzyw=;
        b=EySnBhubPtmZuRm/PrQ/5d2aivozWK/ih9UKOzRfcZtjXo00Empl58trzdhDpyAWyu
         ucoOyV2EA//jB21DPexMsSbKioUUcRNbXnZAtDfL+omHL/IqhO+jUZSyHGnkRKtHDFYq
         GVsi9aB/sCcgGS6Jv3NH01R4X6xzCMcJu7TO2yET3SYGM2QsHtM8V9wiDbtbHReSuSZT
         f/ICQ1hzNePFKI9oTaVMRMxQsjB/p91ksBrgc4sSV4FO/Despf7b7zOD3S3YtNWO8Suw
         u8f1TXY9amZXKjqX++N6Vw6c1KilBEx/0toJdXvaxegBNqUAmRxAhFbYe205lbdSB/xo
         zaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714713; x=1759319513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGY4NXn9SYrwp2MIROIAsCXd8mHWC2w3iRZMJXUxzyw=;
        b=nnndde/pEd0Ayq31IwnlruLzvFJw02ch5mbTg2wxfQVIH/81+GD4f/q/c/VDLxCtEt
         gVzvptVoN85U6/l1QRaEN0WLT38HBcITV9m9510grIqr8SN899Fp7Pt6dohvUYJ6cSN9
         VD0WItSeWlO25xTYlQP5QtlYyM71PL/vRhiuiE9Z8LlW7MV1cwUVTWpybWMkYjD+MmPg
         SYffR2D8M02rWeoPVm/mFlS2+Z4q1aUGH0v4EdqH7XAcu5aXJII3dl23Cx9RVvGp4B5P
         deYVtH5Yeic2+hcaxP2iDNTsvfrz3I9vvGODlMAGjV9VeKFX+EJyxipxc9yyC8j7kRo1
         hrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnllJd3nemEDKLArx3PYrJbuuzAXW6D24MmSqk5V4L0BenK6p16XpzirtG7TiGelT7LmZ+@lists.linux.dev
X-Gm-Message-State: AOJu0YyHX5pCgTUrf0LJdVjIhL8W5nHbBokMWy6D315snim4be2BUjHW
	qgazUHcwSep0hIWyAJ+oR3N6fwIZGzzHob9i8HtG+z8rg597YLykkfIm
X-Gm-Gg: ASbGncuQP7MOle9N2r3zA2skEo6oWCMV23WOKqsRecJOqyehdikxUfrm1RpK9eAOm94
	SquF3S8CduuZBRVxFWm3krOaeF8VGYxxez0NyEixKofJRuLdVX4C2+OSbKWwTjDM+I+6f9aemKT
	Q2FJtZjaYG7nblG16QVE9cOodLR5epgZMqqTZeGYm6kpwt6Sj4/0IxsaZtVB9+X+Y0x9kaW9psc
	GH2D7cM8uIyjMNwmftAuTH32sjw+pnD7DRjbVNS8lF0t7JUdZl4ybcmy9GXZTvWb7RVWGbnOoCM
	iJ4JmfAntyUqmaA9qjlRWi/SAb6+mSASSGlmRhLJxXGi9vb4sWmqDnmV7l0zMppYD5RuqIddGQW
	OjYrllJmJXh7X5XrztfIQ+hMgzBxWnlOxVjWc
X-Google-Smtp-Source: AGHT+IFMNctGW9Lc2RuLDimMt82FyjBUd6I48axMdmkX53huq+gu8b3I4mIDqyHLSeX7qGzL0isVyA==
X-Received: by 2002:a17:902:e885:b0:25e:5d83:2ddd with SMTP id d9443c01a7336-27cc678336emr76685615ad.45.1758714712744;
        Wed, 24 Sep 2025 04:51:52 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ec0a7f443sm19635565ad.105.2025.09.24.04.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:52 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v5 05/23] mm/ksw: add ksw_config struct and parser
Date: Wed, 24 Sep 2025 19:50:48 +0800
Message-ID: <20250924115124.194940-6-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
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
 mm/kstackwatch/kernel.c      | 112 +++++++++++++++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h |  27 +++++++++
 2 files changed, 139 insertions(+)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 78f1d019225f..3b7009033dd4 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,16 +1,128 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/string.h>
+
+#include "kstackwatch.h"
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
+	if (!config->func_name || !config->func_offset) {
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
 
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 0273ef478a26..a7bad207f863 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -2,4 +2,31 @@
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
+	/* save to show */
+	char *user_input;
+};
+
 #endif /* _KSTACKWATCH_H */
-- 
2.43.0

