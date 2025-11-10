Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CF3148D0
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792650; cv=none; b=jQeLGpwvGzbL6e0wXOXgdB9sGzBHHedEy5/CmKrvLGCzlt8tF+xI1QHiserU7a4khVyRUoGe75g2vAqy6ZIFu6foC2kYQ0hb6UWUEyYaNqqQQq6t49MQ8xpZ9aqpzD6KK7grTPtSDIsnnFrFnBdRjWB64oR2wvDnbfVxqvvrqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792650; c=relaxed/simple;
	bh=g1wEhkOGJQ86eJMHw7XszrU/CWcE9VZPoVm5H+XJaoM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN5FJJntPldXuzc1N+uyH7Iob72CN8FwWn0UHZoxXhfMXCfTMwEdaC/GO96GSdKTl4qvOVo5NH4Bs6OjJyEhrT6owLEbCmoMjqIcqjka9dVHpSwzwtINqjtV6fGuCmoSMK7cWaTdrx9/yT1iWVB0bNrK+e5+i2LDm045mvJsEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBaSTmVZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBaSTmVZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297dc3e299bso22252295ad.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792642; x=1763397442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLWfzYX4fFMPPLWMDyPb3KZEfyFxyFdWrCERfTSFQ90=;
        b=eBaSTmVZz28JYaPJoT9gJUyEBV4Q5z8xgE9cuQoT3vymUnMTkAn/6ZZ5ArNN1yLxGe
         z75QZSvMsWArSCxLzihCm2sy9pxTVKPU5SRdgsUKuMJWicw06vEMWm0RgFUCGe0Gcny9
         /1mQ25thEexyScwEEYqeH8Q2+D3FdijzbPHF9OLwhGKEPeWL+0KfS+gkfnRawplvZtGW
         5TBcB16tNe5YU1HbhDVOjyiGW4jvPdEhGhaoME0vEnDkeyDG5q9YK3c5wwyOZV2c8vRr
         ydaJIhKOcI7B5+yLaJY6wA6Xq1/9BYk89U10K24V46niMFpXEVYacAb0pnIxlKveCK+A
         ZQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792642; x=1763397442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pLWfzYX4fFMPPLWMDyPb3KZEfyFxyFdWrCERfTSFQ90=;
        b=M56m7Aw/F+CtMKxdbQRrKH1Tm0CZTYxsGuY0uyUVJG2dEp5ym2Y/uLho9vAhwYLE75
         xBaBR5OpVMqxHtrCRuwN0b6v8dF60/WKVkVxhJkH7NhR3ynsTGtxPwFMwFxte01GE+3R
         Sq5SV5wlCrj+05+SzfHmwLMeAw3PzSTiQZNxPvE8y74FcN0sVNbpnS2Dts+z5OBGIVc3
         i4ltYsgS98vVOQzbwIVFG9j4X72Gn1uGynkd7whNQ4ZvxBB/unRoGdvS38ewrquF1HMb
         7Pgz4iltMVOLnJjMmNllJkDrUGLP3ahmxr27Xo0T8ZkFosHSNZ2OCyFF3pdRFr6Hb6RQ
         YCag==
X-Forwarded-Encrypted: i=1; AJvYcCUxaFHi7zsYcx5pXTMrDYQf33MAdvrt9xSjLus8g0T/YQOAXnOgn4pcXZLfi7eNXh556uqL@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeg0mSIE4HnKHfrAjkpuYA09SsYLfd6bV/8+adlFQfvmbrU8c/
	hbmdEQC53OBO+EuHE9Ngcpwnfuco+QsdK+BxN0BhERtScLUEftP3PbFR
X-Gm-Gg: ASbGncs1FVDkJ6G6XXbEc3blFk+t8sw4TxYiVHAlZqqK3YXoP8P41tB5m6CVLPaF4tg
	spXvMvGKKQ2j3sUZm34VjQJgkwS83TEijUh9wB8tRv21Xe+kn3fY9ofLXPMmneIa8yCDqZBafHE
	qXeu+ECnADyv2Gkf2eRD0wViMkAxvlbJVoWLIC/l2noetTV7nnTNikFv6pXCKWSxHvg+VGbabkc
	hLNzKa3zFDf1YmnfZaqZ/bau6LDY44xaA5Acdc/XR4SKY7IDZm45QyyW9dxw8KqucX2iAlKypuP
	mkWZgK9pqZBMCMy4OSF/xe7WBN/V55GPkZ037JYEFMYUosUaugeMyzkQFDECxP9gKCdGPmPUnOO
	VEc9sXvavN9A7cnId8x8Vc/TDw3O85Qhgxxk9Y21GdJ/FgNn32QJjvwZIOSkgDNWNdBDtaN/1Co
	F2/XDzVE56apo=
X-Google-Smtp-Source: AGHT+IG/cFQI/lmXu5Y2kAApFRNeOGqv88LbladeQ9d14Tfk1RPsTiArc8xlLuvBlu4N/APLeeqQog==
X-Received: by 2002:a17:902:f791:b0:297:e267:c4c1 with SMTP id d9443c01a7336-297e5718125mr109122315ad.55.1762792641884;
        Mon, 10 Nov 2025 08:37:21 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740b5sm154589925ad.70.2025.11.10.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:21 -0800 (PST)
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
Subject: [PATCH v8 09/27] mm/ksw: ignore false positives from exit trampolines
Date: Tue, 11 Nov 2025 00:36:04 +0800
Message-ID: <20251110163634.3686676-10-wangjinchao600@gmail.com>
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

Because trampolines run after the watched function returns but before the
exit_handler is called, and in the original stack frame, so the trampoline
code may overwrite the watched stack address.

These false positives should be ignored. is_ftrace_trampoline() does
not cover all trampolines, so add a local check to handle the remaining
cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 3817a172dc25..f922b4164be5 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/ftrace.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/kstackwatch.h>
@@ -14,10 +15,46 @@ static DEFINE_MUTEX(all_wp_mutex);
 
 static ulong holder;
 
+#define TRAMPOLINE_NAME "return_to_handler"
+#define TRAMPOLINE_DEPTH 16
+
+/* Resolved once, then reused */
+static unsigned long tramp_start, tramp_end;
+
+static void ksw_watch_resolve_trampoline(void)
+{
+	unsigned long sz, off;
+
+	if (likely(tramp_start && tramp_end))
+		return;
+
+	tramp_start = kallsyms_lookup_name(TRAMPOLINE_NAME);
+	if (tramp_start && kallsyms_lookup_size_offset(tramp_start, &sz, &off))
+		tramp_end = tramp_start + sz;
+}
+
+static bool ksw_watch_in_trampoline(unsigned long ip)
+{
+	if (tramp_start && tramp_end && ip >= tramp_start && ip < tramp_end)
+		return true;
+	return false;
+}
 static void ksw_watch_handler(struct perf_event *bp,
 			      struct perf_sample_data *data,
 			      struct pt_regs *regs)
 {
+	unsigned long entries[TRAMPOLINE_DEPTH];
+	int i, nr = 0;
+
+	nr = stack_trace_save_regs(regs, entries, TRAMPOLINE_DEPTH, 0);
+	for (i = 0; i < nr; i++) {
+		//ignore trampoline
+		if (is_ftrace_trampoline(entries[i]))
+			return;
+		if (ksw_watch_in_trampoline(entries[i]))
+			return;
+	}
+
 	pr_err("========== KStackWatch: Caught stack corruption =======\n");
 	pr_err("config %s\n", ksw_get_config()->user_input);
 	dump_stack();
@@ -164,6 +201,7 @@ int ksw_watch_init(void)
 {
 	int ret;
 
+	ksw_watch_resolve_trampoline();
 	ret = ksw_watch_alloc();
 	if (ret <= 0)
 		return -EBUSY;
-- 
2.43.0

