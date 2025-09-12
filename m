Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA542E7BD8
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671945; cv=none; b=hULpFKlpyVvsuT1LTksCCf+8Y0vZ9x/Wi0rAta9Q8tjvKhmTK5SS4fyBVtEQwMI6ZEUYXCyzcBvSV6eH/N3IVuevWWaeotKK+PMjVq/mmvWWnFSK/4DGyf9UmBzteet+JZpvfbx5XgRV4jHX1Jn4aCeP50iHD21CKWnAgiYH26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671945; c=relaxed/simple;
	bh=xhEgADxCH9HYuhwsYpDsUfcMELRNH4wMvbrMimvNP+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=McT6PscNp9K+JTfGpcNhk8ip9vrbEpRdgZVj2weYv5q6VS0bMLA1lv4wUij87YIrn6y67tphBwmqi8yc76fEpP2q4sLr5nM4FmTA0zjYLShXTse6zG+ucoB0eWqAX/jO/PwFeaU7/JTnignl1ieDkfa2n0kyWXb62lQz1BaGOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi4SkMM+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi4SkMM+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-772301f8a4cso2375762b3a.3
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671942; x=1758276742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWZ0kuFk/JGga2KckHsx8bbCMGd9rBXEdZWbqFyn8fw=;
        b=Mi4SkMM+dKkSn8boFYvvXbPRpMuT+QgHF08Lu4ZGeJAFY3A3pmFont6Z33aovluaXA
         RYR8ec/clMpRll84sBl+BMCJNW6vXb4DtfF+YqQ5h9QjlQIlF2KBrKdLTq/Dj4oZAmWX
         6RY1Q5PkruJsus1VNiO1M0nYITnu/xzzItqEYNGrDt1qUbYinFpC+rw/sLsVLClgNT2U
         B68JNXmOvDqS3Kr8TEBOa3aG35QjGUhgA25j6perWYcrmQkoJi7t9gzlXkleqiqWywcz
         ybFjQ4sJCOAMRTMPvaJRinnqBfPyLlXoYDAQePbhEZK3bqjVhHuHhSNhSCvwHnEAe7Kb
         wOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671942; x=1758276742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWZ0kuFk/JGga2KckHsx8bbCMGd9rBXEdZWbqFyn8fw=;
        b=OU8qVQj3PKFia+IOPJeOEWbH4WdLfVDFMqranh1vALXSeiRlHXR/khYLHUIKklSm1A
         Xx0sM2Z82BnVo2B1Xs+eIQDIOHfgbUZh8DQoMg84NWIQqCP0if10L89DqK04ntXlDcZ9
         Fx23zW0h6vLYte/O78et+Qjf9KJRMYj2VzE7VTL5xvhLLKGcly4al0YpeqjWpZQEdmGA
         nAGHsutRjxBvE54NjT8TR4Asn/hQT0tU5jmCH02v+GzRD4ssRMJ6X/kj4IcNdjAOw42Y
         rv0YtcS27a/WS3r52gOUKEdpKbVIZHTyFLOZAzoU3WBuhjokUBu9MPYoY0LdMQ3eRvJg
         PQdw==
X-Forwarded-Encrypted: i=1; AJvYcCX7faWxQ03VCmq3hamsorqo7tkTdrQZeKviSYK9X+xcsInzgXAVxh0AGv14p/ELtvfV84Uo@lists.linux.dev
X-Gm-Message-State: AOJu0YyYe+4I4uTz1O6azgy9rYbGnNclskJtg5KYb4UZphKi6ES5r6cA
	KmDVaUnQwrFDWT7bB+35CM76sBtFBXMcWHSTvzNXoQnllhLB4C/NGr91
X-Gm-Gg: ASbGncvfCH7nKsGzrVdSeBATwNpv226G58Lm5svz2aEFkUPTtyoQsBAUyNhbnCM5B94
	pLk+Bf0eGi19kYHuhwluniLsiOtpSbQF7lw8P08/XUXcFHREdvgZfBLLcLDDDgzl21OaNMVfKge
	sMQCpqD/6mWvtGRXDYzwY87xGSWYmKDya4pVg2UJogrwLdgxIdIsM+LyX8yPN6GsYQPicn5Lt81
	JW+rhd4pCaIcKGHTFHB6U9boMoDo/U1kJ74Z7e+4h5pEvXZQRLZdbGGxo1txhmiM14iTzr8+pp1
	L8aq1Dj0Nkn87tlcjb/9pZdIJnE2InqKKC+2FjlW8tJiF/OsvUlPNdj3Eu3+z+S3N7lD7L+vr9V
	N2uCUu4TJDs2nNs4pXwojFPU6wswtClcJmYYGTqN3QbGsxgL6Sw==
X-Google-Smtp-Source: AGHT+IE8+93TdDPnsE4atda/JWPbNWLLDtzQ/rRojiuKNJS4zwHA9ycGi7y7HjIuRi4Y0KG1ZDhRqQ==
X-Received: by 2002:a05:6a00:812:b0:772:5899:eae8 with SMTP id d2e1a72fcca58-77612189a24mr2770987b3a.27.1757671941982;
        Fri, 12 Sep 2025 03:12:21 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a46eedsm4969144b3a.30.2025.09.12.03.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:21 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 05/21] mm/ksw: add ksw_config struct and parser
Date: Fri, 12 Sep 2025 18:11:15 +0800
Message-ID: <20250912101145.465708-6-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
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
 mm/kstackwatch/kernel.c      | 91 ++++++++++++++++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h | 33 +++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 40aa7e9ff513..1502795e02af 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,20 +1,111 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/string.h>
+
+#include "kstackwatch.h"
 
 MODULE_AUTHOR("Jinchao Wang");
 MODULE_DESCRIPTION("Kernel Stack Watch");
 MODULE_LICENSE("GPL");
 
+static struct ksw_config *ksw_config;
+
+/*
+ * Format of the configuration string:
+ *    function+ip_offset[+depth] [local_var_offset:local_var_len]
+ *
+ * - function         : name of the target function
+ * - ip_offset        : instruction pointer offset within the function
+ * - depth            : recursion depth to watch
+ * - local_var_offset : offset from the stack pointer at function+ip_offset
+ * - local_var_len    : length of the local variable(1,2,4,8)
+ */
+static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+{
+	char *func_part, *local_var_part = NULL;
+	char *token;
+	u16 local_var_len;
+
+	memset(ksw_config, 0, sizeof(*ksw_config));
+
+	/* set the watch type to the default canary-based watching */
+	config->type = WATCH_CANARY;
+
+	func_part = strim(buf);
+	strscpy(config->config_str, func_part, MAX_CONFIG_STR_LEN);
+
+	local_var_part = strchr(func_part, ' ');
+	if (local_var_part) {
+		*local_var_part = '\0'; // terminate the function part
+		local_var_part = strim(local_var_part + 1);
+	}
+
+	/* parse the function part: function+ip_offset[+depth] */
+	token = strsep(&func_part, "+");
+	if (!token)
+		goto fail;
+
+	strscpy(config->function, token, MAX_FUNC_NAME_LEN - 1);
+
+	token = strsep(&func_part, "+");
+	if (!token || kstrtou16(token, 0, &config->ip_offset)) {
+		pr_err("failed to parse instruction offset\n");
+		goto fail;
+	}
+
+	token = strsep(&func_part, "+");
+	if (token && kstrtou16(token, 0, &config->depth)) {
+		pr_err("failed to parse depth\n");
+		goto fail;
+	}
+	if (!local_var_part || !(*local_var_part))
+		return 0;
+
+	/* parse the optional local var offset:len */
+	config->type = WATCH_LOCAL_VAR;
+	token = strsep(&local_var_part, ":");
+	if (!token || kstrtou16(token, 0, &config->local_var_offset)) {
+		pr_err("failed to parse local var offset\n");
+		goto fail;
+	}
+
+	if (!local_var_part || kstrtou16(local_var_part, 0, &local_var_len)) {
+		pr_err("failed to parse local var len\n");
+		goto fail;
+	}
+
+	if (local_var_len != 1 && local_var_len != 2 &&
+	    local_var_len != 4 && local_var_len != 8) {
+		pr_err("invalid local var len %u (must be 1,2,4,8)\n",
+		       local_var_len);
+		goto fail;
+	}
+	config->local_var_len = local_var_len;
+
+	return 0;
+fail:
+	pr_err("invalid input: %s\n", config->config_str);
+	config->config_str[0] = '\0';
+	return -EINVAL;
+}
+
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
index 0273ef478a26..7c595c5c24d1 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -2,4 +2,37 @@
 #ifndef _KSTACKWATCH_H
 #define _KSTACKWATCH_H
 
+#include <linux/types.h>
+
+#define MAX_FUNC_NAME_LEN 64
+#define MAX_CONFIG_STR_LEN 128
+
+enum watch_type {
+	WATCH_CANARY = 0,
+	WATCH_LOCAL_VAR,
+};
+
+struct ksw_config {
+	/* function part */
+	char function[MAX_FUNC_NAME_LEN];
+	u16 ip_offset;
+	u16 depth;
+
+	/* local var, useless for canary watch */
+	/* offset from rsp at function+ip_offset */
+	u16 local_var_offset;
+
+	/*
+	 * local var size (1,2,4,8 bytes)
+	 * it will be the watching len
+	 */
+	u16 local_var_len;
+
+	/* easy for understand*/
+	enum watch_type type;
+
+	/* save to show */
+	char config_str[MAX_CONFIG_STR_LEN];
+};
+
 #endif /* _KSTACKWATCH_H */
-- 
2.43.0

