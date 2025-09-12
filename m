Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5D52E92D6
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671959; cv=none; b=p4F4YL4zw1VnfdWzLY3Hwm1UNnuYL7OL80j7uKtgKW+xdDWcLL+iO3s4WmCQSjsH4oKlEEoIpQMhoYuzAqlZkCZni/QdFVxgYgjYfhocF0fKd3zXvytM+HWWCaoCUwoowF1bxxdiPcii+iL8BNsTekuVrnMJBeV+mOthK30hlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671959; c=relaxed/simple;
	bh=i3v51fD9Nx/GpVeSYWAguecpXuWplCvYwMF4XBy55cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWtFLSIbn06yKFW3qe7GlzyeAz7jCrOWI7XkwYkXZX7JiittWSk6JsEBfTibmZ86MwCrhKJ/PXbTd+rQrHeVx18M91p2im7w4CiZoCoFXRWp0h/faAdfzUlafSGSSeKAPpewo5bBuNEeEZmUUGSSKgrsp43BGAh+m4ZuaO1dr2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F25Pgm/Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F25Pgm/Y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77287fb79d3so1483098b3a.1
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671956; x=1758276756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBWUZGT7AQZjVN5sSaCPPhxiXndvcDbF8VJhhLu7a/o=;
        b=F25Pgm/YQcsbgDpolZPKJPdA+6fSqU3qLzoSis8Sh7EyUgoehNmYz1chHpqh0YLRZ+
         QAM7kdMRBtWS+u6AAZC0uo4S4RIajraSQSrV1VsfQxZoSWvHZ7CTIOLRg4W5cunFDdOu
         ql8qgENXz0TruCm13xSwUGtbfOojO/gTQdkIp+YEK0768IBktqWVN/vnZmE+xj/sPAnu
         FiJ4UxIXDcsw9flAC8bcfBhLZVQH8SnXzdbe1A6Ha5EfLXa7mzZ/BhpgfEToSlWbyEeE
         iAdjNNj/uoYzJz4VF1aHeJ+sVOXJS6BcMMmiEVHMJL4bMaP/vOJW8Qxg8S7MIhLnZRk3
         hIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671956; x=1758276756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBWUZGT7AQZjVN5sSaCPPhxiXndvcDbF8VJhhLu7a/o=;
        b=xIpVao9yyAk3fAdB/0Lh6IUhNV7p3Q110ze+yE/kQUSn7n7xI57V1mI4bu9dvte7W+
         2fxYvVorsJWEOC0FO1omjOP8sdiBfHCf9YhHcwrw6xDy7pljLona9f72Uxn4haYunb5y
         Eptz9j1MDhuxno06/QCq4p/773ntxy+rcoDh6Zm5zAo+Jb3tFeE1y0uve9KFj/nC9HOU
         R8fiB/T0Z5vtI5zwgl+joUyCPeUE+Zl0Q39b91VBl0jARo4CZ99oCABjFc/XGn4RqRLr
         +vZWFsNF4fO172OjePbtbREUv0Znh7dknzSW/tVTCBpzBc9BXO6wZtUeP+4p0gwo+8mO
         C31g==
X-Forwarded-Encrypted: i=1; AJvYcCWwO0U67MaTBXIcpWSgyyMUIWOHoBBEKBB9AWjqrh4LoMP2F29zo0I93hffWjoLo+CkqXxK@lists.linux.dev
X-Gm-Message-State: AOJu0YxjRMKzXAXAHv0nImnKoAKWB8/mDdUuseNrXkUr62aQpiXOXBRC
	OwyhSbR5ozGvf1M/UQY3GVMKpZ0AerAxkG2/i0mI1ciwEQlo7JtDrEht
X-Gm-Gg: ASbGncuTDnFhSqfHJcPVuqV5lMGPum7zS/uN3aJXcb4yNxeW3v8MyL0X2GUtppeYOCf
	gcke5OMjGl7Ywj3o8px1yZNhAIMPr9/WY2EGEf1PGa1nWMcZ7pqJIG0AaU6Is57dup7Rn3FSFfP
	+qDN52GNdB/VuCb6TUaThr93a5jzL+lLkQNBnY+2y8p/C8uTt8zmg9NT3W6LJf/W100R0nmZWWP
	R6frFLnxZLKj6YjNGpkc8JMGC+wqBp4Wc3z4tIfAMZGnZnJeVNCfn0pVdgGBi8OXXfd5lOWv6ar
	ZmDGzTBIiltNRRcL4GGQrDKW/DwXZ3MzpJTv5FJ06hmoM4r/jXAisKLmJDFmbmyL6Nc34XF2Dx3
	D2JK7+fcdi/Hp0IoWKL7o0GdiQhz4uyJFXM8q+v0Z+Fob5m8dsQ==
X-Google-Smtp-Source: AGHT+IE0smHKx/fxxESUMD26AxoS7YeR+pzOUZ9t8bbqYrL6zePDghHY9Bjvt2Dlrnb+iBu56FBUDg==
X-Received: by 2002:a17:903:3c4d:b0:24c:cc2c:9da9 with SMTP id d9443c01a7336-25d24bb3201mr28288785ad.14.1757671956234;
        Fri, 12 Sep 2025 03:12:36 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b307073sm44099805ad.144.2025.09.12.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:35 -0700 (PDT)
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
Subject: [PATCH v4 08/21] mm/ksw: Add atomic ksw_watch_on() and ksw_watch_off()
Date: Fri, 12 Sep 2025 18:11:18 +0800
Message-ID: <20250912101145.465708-9-wangjinchao600@gmail.com>
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

The atomic_long_cmpxchg() ensures at most one active watchpoint exists at
any time, with ksw_watch_on() succeeding only when no watch is active
(current address is placeholder) and ksw_watch_off() succeeding only when
the caller knows the active watch address.

For cross-CPU synchronization, updates are propagated using direct
modification on the local CPU and asynchronous IPIs for remote CPUs.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  2 +
 mm/kstackwatch/watch.c       | 73 +++++++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 3ea191370970..0786fa961011 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -41,5 +41,7 @@ const struct ksw_config *ksw_get_config(void);
 /* watch management */
 int ksw_watch_init(void);
 void ksw_watch_exit(void);
+int ksw_watch_on(ulong watch_addr, u16 watch_len);
+int ksw_watch_off(ulong watch_addr, u16 watch_len);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index d3399ac840b2..14549e02faf1 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/hw_breakpoint.h>
+#include <linux/irqflags.h>
 #include <linux/perf_event.h>
 #include <linux/printk.h>
 
@@ -9,10 +10,16 @@
 
 static struct perf_event *__percpu *watch_events;
 
-static unsigned long watch_holder;
+static ulong watch_holder;
+static atomic_long_t watched_addr = ATOMIC_LONG_INIT((ulong)&watch_holder);
 
 static struct perf_event_attr watch_attr;
 
+static void ksw_watch_on_local_cpu(void *info);
+
+static DEFINE_PER_CPU(call_single_data_t,
+		      watch_csd) = CSD_INIT(ksw_watch_on_local_cpu, NULL);
+
 bool panic_on_catch;
 module_param(panic_on_catch, bool, 0644);
 MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
@@ -29,6 +36,70 @@ static void ksw_watch_handler(struct perf_event *bp,
 		panic("Stack corruption detected");
 }
 
+static void ksw_watch_on_local_cpu(void *data)
+{
+	struct perf_event *bp;
+	ulong flags;
+	int cpu;
+	int ret;
+
+	local_irq_save(flags);
+	cpu = raw_smp_processor_id();
+	bp = *per_cpu_ptr(watch_events, cpu);
+	if (!bp) {
+		local_irq_restore(flags);
+		return;
+	}
+
+	ret = modify_wide_hw_breakpoint_local(bp, &watch_attr);
+	local_irq_restore(flags);
+
+	if (ret) {
+		pr_err("failed to reinstall HWBP on CPU %d ret %d\n", cpu,
+		       ret);
+		return;
+	}
+}
+
+static void __ksw_watch_target(ulong addr, u16 len)
+{
+	int cpu;
+	call_single_data_t *csd;
+
+	watch_attr.bp_addr = addr;
+	watch_attr.bp_len = len;
+
+	/* ensure watchpoint update is visible to other CPUs before IPI */
+	smp_wmb();
+
+	for_each_online_cpu(cpu) {
+		if (cpu == raw_smp_processor_id()) {
+			ksw_watch_on_local_cpu(NULL);
+		} else {
+			csd = &per_cpu(watch_csd, cpu);
+			smp_call_function_single_async(cpu, csd);
+		}
+	}
+}
+
+static int ksw_watch_target(ulong old_addr, ulong new_addr, u16 watch_len)
+{
+	if (atomic_long_cmpxchg(&watched_addr, old_addr, new_addr) != old_addr)
+		return -EINVAL;
+	__ksw_watch_target(new_addr, watch_len);
+	return 0;
+}
+
+int ksw_watch_on(ulong watch_addr, u16 watch_len)
+{
+	return ksw_watch_target((ulong)&watch_holder, watch_addr, watch_len);
+}
+
+int ksw_watch_off(ulong watch_addr, u16 watch_len)
+{
+	return ksw_watch_target(watch_addr, (ulong)&watch_holder, watch_len);
+}
+
 int ksw_watch_init(void)
 {
 	int ret;
-- 
2.43.0

