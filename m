Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF72E6CDF
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007466; cv=none; b=Ys0e1usLlakso3vD1RJ1V4Soy6w2qYNu/E2QJaX/oMWRimyXu2Ycb2+p9tqksFSeCJRn2vKMayxidtRM0gw8nUyYZmbZiM+QZnfWUNZvjHQNn57wnXalwl0N/JPnQzMI1ZyliujAuGHSY6Hf9c4hZv+CmwV6Hmb2LPS0VsItB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007466; c=relaxed/simple;
	bh=0RaB9b3mDxARpzNAU+b9+OM/53UguV9OX02ut00avNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBHYFfURQ9SrAH6gu5l1+PeiNsTgHXF2rPAKgfADKwrMOkH4RCYNvyaRsys9MPGsz0tfe+xrw7C65COBXzCBf4m7ZzYYi/zr/tCxosP4uYuhRGv6s6DXIhsO+7YaOmboKj68+3q5eDBowEkkgVGnCd2YCSdC3VZdR5qdEcaLaj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KULqgfql; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KULqgfql"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so508836a91.1
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007463; x=1760612263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=KULqgfqlXGPcvhuBOAO53CHtMoEFZ4ENPWLba9VWVpqS51jtWotmCx7M9dZJbgC1SU
         K+h4aQsQBNXgZiW/uoUPUKe/xVzCUmp6RgfcYWDKFDzFIWaGVoww+7ZjAzG6d1zQ70DX
         gUamtimbeAmdnt0g3Q8yDuV9kWfOa5i/uNHZrDv528m/jICFeeaDVyPaZ9ZfrBcpAzef
         Vx7gpOZLyszbOKtWO2nBc1zA6KC4c2yAcw4oygsrK64KcBUs4hKBYlNt64v23aVfnJA0
         /wfCyOk9WTkWLmNqac7n31mFVKZIdE9T+XIB9oCysvyUN8CVgo2GyXICNPsPHccMIDGx
         aRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007463; x=1760612263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=V9u6bDWPSwJo+tiESgzQlebvK1UPRjurDJx5dG2nFnfdlEDwBEpoiKiy7sEXI7tFpx
         4ZIAjkl0/8rZWRFbV8nmqfZFRoxYF3ZORg/APekBx0RpnpCJXamyYcC524XJ1UqPXqSt
         63CdCs3EQnqKXopFM7sBHn2+ANuTlRwnNxYcFgztihkzhN7/GhAgKJaK8pjFskBaKKgY
         Z3Kif1EkIQ0pe5gFYKvtT9KI7waHAtLST68Sy4HgTCqQV5oymRKNQeEEAiFg7Fs2UMf9
         TYtrDcpsEuqiu3ZrBeb6/MAVvN2hwQtJRRm6LxpnwUre77Q7behh691tT23P/GQUAVK4
         oSdw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyc0h2GwYS5VgDmpZzgX0YkJFOdgqlW6vq3vLPIRPmJmFa7xgxEF3rrs+5YV66qr524Y0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1t5gTRw1CtL12N0YDKuogfebhbve64oXjSURdPEyMSu+YdTyu
	Y9PPCVe3fpBnIT4l5yXgdDpsCMPhZr81yJgc8M99+8+v/9dGbq6lB3uE
X-Gm-Gg: ASbGncudWCq/W24RXP9ClOU8D9n5G6atBk/zABcbFZZvTsaiUfnGFjXoayME9GUgYii
	HDj8TW/CaWEHcXOYJdKcM1eS0O6sa8Yu4FgDrr5YVbsENzp4n7TY+7Bkb+0zfxzuvqOJBD/++xc
	RHUi5AMENODskPjzPr8ctWNIIx3QeWfFRMja1YVL538aInBuJWx2cENiLpK487QxuQoKi+pKGDj
	oEu3gwMiuQV9iebE2sP/4IZlfSvOtpGQb80XyJ2KXMwW5snLD2+u5lgz3Xgv+BCuTx5IXWZm/vg
	3HDUnI8oXzLlSWSHGSZU9LdQWqtn29GSvYdmhHnj+73EumyJgAyPlbxQGBPDHTwxzIjRcgg/lqB
	feGdd3nufWHyKT9+K+jfLB0mxqq5eRa7h5nPPLdeIrONoRvcBGdZbZhx4RUIA
X-Google-Smtp-Source: AGHT+IGh87PYrVHyXpdGI3lpiqctQ3hOQgwGz+QU0SKFptl527HtAxTN0ZxVB5GZOA/u2hsAdulJlA==
X-Received: by 2002:a17:90b:3e83:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-33b51676ef2mr8250254a91.5.1760007463200;
        Thu, 09 Oct 2025 03:57:43 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a4f8bfsm2196325a91.10.2025.10.09.03.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:42 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
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
Subject: [PATCH v7 09/23] mm/ksw: ignore false positives from exit trampolines
Date: Thu,  9 Oct 2025 18:55:45 +0800
Message-ID: <20251009105650.168917-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
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
index 887cc13292dc..722ffd9fda7c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/ftrace.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/mutex.h>
@@ -18,10 +19,46 @@ bool panic_on_catch;
 module_param(panic_on_catch, bool, 0644);
 MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
 
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
@@ -168,6 +205,7 @@ int ksw_watch_init(void)
 {
 	int ret;
 
+	ksw_watch_resolve_trampoline();
 	ret = ksw_watch_alloc();
 	if (ret <= 0)
 		return -EBUSY;
-- 
2.43.0

