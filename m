Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDF23373D
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200303; cv=none; b=r5GeRscSva9RPYIVlGKvkkQt5Tj/vjEpR8me6OPfSk1eMLjV4bkFrYQD6uAy9bmVh/biwQH/aCGgN7Jg4QOwMhY4UnnZn44RwGkehPWAJUttoqBg+TndEGUT9d6FZ3FovG5vwp/vIOQWI+T56I4wrVMcnYCS9E/aGOIJt/EV2E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200303; c=relaxed/simple;
	bh=9SDUPEZSlMV40T53tfVBMh3pQptZtl+KprWlK44Wx6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1GJ0LsJAdncpv6zW5/e0GIYak1mVvgAh4f5oY/6+h1oo+ECfkEPlb6z7ssRqLrgMx5iMxNc+fjKB57+s8UuA2a9IXhKk8PJ3Qg42/NairyVKZS/UDYcB+ZPJ40d5yREo1Iel1OwjhPxTEfHmRru5j+l/yNZDYI13+sPyvXCxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB74yvTS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB74yvTS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso4899736a91.2
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200300; x=1759805100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtGUQc6HOhuSXywhIDZ+AUqHUInlRCKup6JfN/4+ZEc=;
        b=lB74yvTS0NcQZe5rGia5A2O2kgTL8mt4ipKsHV+3owKZ0QZ0MCxaAviU6khYKCKYRd
         yw6GttKS4U+MoU1KhT3XsOkvZY7/lqNNfdwZ6e8yoP5hl1+4xW0lpTWniv9UQ3b9nE4d
         m2I+wEIpbYs1fhGu5gXmiuGFP4Kl5YZOR6GtLoTMkW7Lvz8//OZFnZZJW7LZwfZXB3/H
         2Ib9SGaXlG7yd1h2dzdu0JloydE9MjOdUwmhs49uCALRxCo38mI5K9wScH2eoAh4w7Yi
         1CZkrVxjpeo05xDH/3kJ3bOPmWSTU5rLTJZimGJrDwRzKHWeKdq+NEMQuDEzw70lo6c1
         ir8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200300; x=1759805100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtGUQc6HOhuSXywhIDZ+AUqHUInlRCKup6JfN/4+ZEc=;
        b=gL8HaRkkjZw0/1cX/r5JYQcIUwwbLHubX9tFeZKutQbJu4wGONcjpc4lRsA3l/8NCj
         eUDJYfG9HusUNPIXgFhY1vHv+zur3X35xBh0tX11TKCxkKZwE0bvmSIGGu9xy+XHm7lQ
         gbJCdaHKyuSRnr6X70UC7MCVXEiWDKQ3KD7U06S+qFrGCh+U9Y7PpuFSjCyvMpbm/Qlr
         FIRVi4j68NNFzsDzuawMkmXASNnCC5PxKZVQXi2/jANUzB/c7CXe0pn5mYesjIh5YtRR
         PlZw4e2csOo3Qwvid8EUzkV5sFWVWOB70SLKPXArBGgOJnoAw86QH8rwngkM54waXePb
         Gwgw==
X-Forwarded-Encrypted: i=1; AJvYcCVeRubZy03RIqeW5vWhk6SUpsHbLx0BcAc6o4zd0UBP8CYE9qejQu63q3wpcK69p5XzMd2i@lists.linux.dev
X-Gm-Message-State: AOJu0YzhmCIeYIyVibkHqUfhrwtnn/nJuo7onTQeguO2z0an967e3XDD
	qEejOe8369+/taSSq03cfHaMoM5jKNr7yioWzVP+G5yqoa8golji24Ds
X-Gm-Gg: ASbGncvUzvrznUf4b/15OJ6n7yB+sDeOvbriwdUlHzTks/nKoqhZ6VIYGzEsAExWfto
	g178zboI/ZNePcTltHfay3yt4DvTu8jQKfbB7IM+ovtwMMXlFxRwSwdCH0pPb9hVd0WpYrNhJc8
	DDnuX5eKtMViuQG2ffZ2IlBxZExng7FdWuWG19JuVwRdSy4S+FdS8pLLt22EEZ/Tw4rYCSA0wq7
	eXp9RQLBR2lWashWkxLUwHuLlJN+RjHQyRXSriRaViW++wiBqgwKJb93DHiKu/eXOJ11vMtDzad
	MNdqN1uK8hGJr78aI4D4+kt8qVuCiCTBH4xMKr10udJxu17dIvvNZKB32hK6RIJqZK1Aa1d3K8i
	Uig8cTOC4fkDezJqvyJwkelOvp3c4BgX5UPSy6GX28DQblEmob2jmD1JrepRJOmWsKA==
X-Google-Smtp-Source: AGHT+IE6QAYldFReTbNhwKklFYNdCEVJpgfxwTpvKILLxf8DP4CkMPu7V/vifWE/k6I2u8vpWc3E8w==
X-Received: by 2002:a17:90b:1b4d:b0:330:797a:f504 with SMTP id 98e67ed59e1d1-3342a215b70mr18813357a91.3.1759200300239;
        Mon, 29 Sep 2025 19:45:00 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387255adsm2766677a91.19.2025.09.29.19.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:59 -0700 (PDT)
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
Subject: [PATCH v6 08/23] mm/ksw: Add atomic watchpoint management api
Date: Tue, 30 Sep 2025 10:43:29 +0800
Message-ID: <20250930024402.1043776-9-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add three functions for atomic lifecycle management of watchpoints:
- ksw_watch_get(): Acquires a watchpoint from a llist.
- ksw_watch_on(): Enables the watchpoint on all online CPUs.
- ksw_watch_off(): Disables the watchpoint and returns it to the llist.

For cross-CPU synchronization, updates are propagated using direct
modification on the local CPU and asynchronous IPIs for remote CPUs.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  4 ++
 mm/kstackwatch/watch.c       | 85 +++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 4eac1be3b325..850fc2b18a9c 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -38,11 +38,15 @@ const struct ksw_config *ksw_get_config(void);
 /* watch management */
 struct ksw_watchpoint {
 	struct perf_event *__percpu *event;
+	call_single_data_t __percpu *csd;
 	struct perf_event_attr attr;
 	struct llist_node node; // for atomic watch_on and off
 	struct list_head list; // for cpu online and offline
 };
 int ksw_watch_init(void);
 void ksw_watch_exit(void);
+int ksw_watch_get(struct ksw_watchpoint **out_wp);
+int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len);
+int ksw_watch_off(struct ksw_watchpoint *wp);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 1d8e24fede54..887cc13292dc 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -31,11 +31,83 @@ static void ksw_watch_handler(struct perf_event *bp,
 		panic("Stack corruption detected");
 }
 
+static void ksw_watch_on_local_cpu(void *info)
+{
+	struct ksw_watchpoint *wp = info;
+	struct perf_event *bp;
+	ulong flags;
+	int cpu;
+	int ret;
+
+	local_irq_save(flags);
+	cpu = raw_smp_processor_id();
+	bp = per_cpu(*wp->event, cpu);
+	if (!bp) {
+		local_irq_restore(flags);
+		return;
+	}
+
+	ret = modify_wide_hw_breakpoint_local(bp, &wp->attr);
+	local_irq_restore(flags);
+	WARN(ret, "fail to reinstall HWBP on CPU%d ret %d", cpu, ret);
+}
+
+static void ksw_watch_update(struct ksw_watchpoint *wp, ulong addr, u16 len)
+{
+	call_single_data_t *csd;
+	int cur_cpu;
+	int cpu;
+
+	wp->attr.bp_addr = addr;
+	wp->attr.bp_len = len;
+
+	cur_cpu = raw_smp_processor_id();
+	for_each_online_cpu(cpu) {
+		/* remote cpu first */
+		if (cpu == cur_cpu)
+			continue;
+		csd = per_cpu_ptr(wp->csd, cpu);
+		smp_call_function_single_async(cpu, csd);
+	}
+	ksw_watch_on_local_cpu(wp);
+}
+
+int ksw_watch_get(struct ksw_watchpoint **out_wp)
+{
+	struct ksw_watchpoint *wp;
+	struct llist_node *node;
+
+	node = llist_del_first(&free_wp_list);
+	if (!node)
+		return -EBUSY;
+
+	wp = llist_entry(node, struct ksw_watchpoint, node);
+	WARN_ON_ONCE(wp->attr.bp_addr != (u64)&holder);
+
+	*out_wp = wp;
+	return 0;
+}
+int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len)
+{
+	ksw_watch_update(wp, watch_addr, watch_len);
+	return 0;
+}
+
+int ksw_watch_off(struct ksw_watchpoint *wp)
+{
+	WARN_ON_ONCE(wp->attr.bp_addr == (u64)&holder);
+	ksw_watch_update(wp, (ulong)&holder, sizeof(ulong));
+	llist_add(&wp->node, &free_wp_list);
+	return 0;
+}
+
 static int ksw_watch_alloc(void)
 {
 	int max_watch = ksw_get_config()->max_watch;
 	struct ksw_watchpoint *wp;
+	call_single_data_t *csd;
 	int success = 0;
+	int cpu;
 	int ret;
 
 	init_llist_head(&free_wp_list);
@@ -45,6 +117,16 @@ static int ksw_watch_alloc(void)
 		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
 		if (!wp)
 			return success > 0 ? success : -EINVAL;
+		wp->csd = alloc_percpu(call_single_data_t);
+		if (!wp->csd) {
+			kfree(wp);
+			return success > 0 ? success : -EINVAL;
+		}
+
+		for_each_possible_cpu(cpu) {
+			csd = per_cpu_ptr(wp->csd, cpu);
+			INIT_CSD(csd, ksw_watch_on_local_cpu, wp);
+		}
 
 		hw_breakpoint_init(&wp->attr);
 		wp->attr.bp_addr = (ulong)&holder;
@@ -54,6 +136,7 @@ static int ksw_watch_alloc(void)
 							ksw_watch_handler, wp);
 		if (IS_ERR((void *)wp->event)) {
 			ret = PTR_ERR((void *)wp->event);
+			free_percpu(wp->csd);
 			kfree(wp);
 			return success > 0 ? success : ret;
 		}
@@ -75,6 +158,7 @@ static void ksw_watch_free(void)
 	list_for_each_entry_safe(wp, tmp, &all_wp_list, list) {
 		list_del(&wp->list);
 		unregister_wide_hw_breakpoint(wp->event);
+		free_percpu(wp->csd);
 		kfree(wp);
 	}
 	mutex_unlock(&all_wp_mutex);
@@ -88,7 +172,6 @@ int ksw_watch_init(void)
 	if (ret <= 0)
 		return -EBUSY;
 
-
 	return 0;
 }
 
-- 
2.43.0

