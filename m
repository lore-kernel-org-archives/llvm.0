Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC32E0B44
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007473; cv=none; b=ZHf5AaTlkl/i4WXv0fM0an0gbHN048Mi8wwTKWk5VsXTphuMl2A9PD39Pv8frk+y9N848OIIxsEDyK9dyyV8nk5RGm9xNcJafr5KnxDMLauck8Zta8J/P0fwb/NZ6EZK2aAaGPYPPeL5kuqoJOlmFrsOhHfihU57ecUagvITqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007473; c=relaxed/simple;
	bh=zK4RWkz30MU/OH8jEOTvGZJj2/7wnecqVuCjoc5/aOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSSoz9Y7widBnpuvxGA0kqTFvXnaiue4794peSLPkiKDhPjnrL0Z0Vorgy6FbZy4AKSdxlrjC+pm1fHL+aKOwmE7Hbs8zuJRg8NAB0DEILMPrGZzFii89dzNOULj4ATSf5jIzqD+kprEn/apdRXm88XUO967jI5aCWbUXTNYRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k22vBaXS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k22vBaXS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso802992a91.0
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007471; x=1760612271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=k22vBaXSYP+ZcfytKWgNYzSqXOC9rgaLB4jPS0PHuTvkZxoeQWxr9j6Xf/SvAJH4fo
         tgzXGSnzwZxEfMAS3w4NhNPDI5WsPHIsoKdWGHkaQ7Ipw3OZatErcMAAiWJ9wIpfw648
         I1Y8TwmTKQqx+R3XiYuIbwOQNBc0NOltAFZU0lSngXqCunMpIlm/sV4q0B93eD63DDyY
         4ZTLzQHXUMzbKP44sRksWE0uWgKZ4omw9NCdL3j2kmk99PpKNvRe6sJRE6ME2P9A5MQC
         bb5bwcp/3ShL4Ej6eCdgfjTRmUjwJiqEi5wfSdWFqYcQ9E0ReZtsu+sErpFwDMiXHUli
         WpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007471; x=1760612271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=vFL6zVRqwWCxkBF13MxBTxiWAyjAo5+Tunv0WjetNgwHmlMbs28bLrkacpR1a/j+vc
         3fBLqKGe/tiUs6MLyxynFnsPiMv5u5o/ryN9zlHTv/pHj+wb4vHnrKpPMzpTWwTMhkrE
         ajDw7m7avU1ELfqv/3h0d/If39521m4soIggYmQ/AlbWjTTZs5O5f+CA7nWAvVqbzcTg
         ZEOZp5Dm3OW+ye4G6zwJ4rvbjfO6KM8YXpv5iQpBBpIm9vd9I/zUI+qdOOsRrlKIcQzY
         7i2ECht2DIAJPPPJAXTHrZMbTeMWs7QrI0KQvgAlhR0lF0263qBTwP/oR9VtqYdH76Sg
         +FcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3AVHEbUjhl6/17IRBj/JqR/yjViMwR53Y66Ymm7NkJs3BDtO1FNFTwOL76srcoRf0qpTo@lists.linux.dev
X-Gm-Message-State: AOJu0Yzetzze4tzzsY0xNN5vEF2O7Va70qI3rzyRRrFh0PBqGn8Bof7Q
	ewbQ8NJOq00WNSeYv9CD4OV65Z6GM9tneRg2AA+xAQWzluuvxBudo0tY
X-Gm-Gg: ASbGncujoR7rj3mU4itGsWRpLTqhwRJG/i/4B7vcnkzyjmkrG3jufFjjm/XTHOOS2zq
	94tdcCyEAjEfjbpW4vbzWpIMXTZkgvVwZ02nibCanhlCCl3adByov0jQXboKGWsvhaM8wIYiFhp
	6bDHE56fSHJxfuafjlKDVr1efY3VTs4qZWNRCNTyKMNCZS1snWfnYGdaJbesxAm52Yjbg/z8/aN
	UmMRLwrRJcVaCMrTQ2kM38RrtfqYbtnIc3yyf3CA+zQ20NW515sp3B+qK2pPtegU/8P0/GqMMo0
	KNO6nv9ih2rvYaoM0PUCXnSstM6XfvgAp+lGfBvWjXxYTEnMj09nyoG49/Z0jqBGzaksofDvHwi
	vmn6WXjBIeV3fUJQkW1XVKOuTuvsPvP8KYbCWIrBdggpEJ4OwMUeIwsM5mWGp
X-Google-Smtp-Source: AGHT+IGfoiP7FyJn6BgVbF1cW+pirt064OXDV5hiE6L+A4G5ft0+AYVVqaDAH6C+gBiZsXo7qM0L8w==
X-Received: by 2002:a17:90b:3ec1:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-33b5111491amr9148774a91.9.1760007470702;
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b513926fesm6702757a91.21.2025.10.09.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
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
Subject: [PATCH v7 11/23] sched: add per-task context
Date: Thu,  9 Oct 2025 18:55:47 +0800
Message-ID: <20251009105650.168917-12-wangjinchao600@gmail.com>
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

Introduce struct ksw_ctx to enable lockless per-task state
tracking. This is required because KStackWatch operates in NMI context
(via kprobe handler) where traditional locking is unsafe.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch_types.h | 14 ++++++++++++++
 include/linux/sched.h             |  5 +++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/linux/kstackwatch_types.h

diff --git a/include/linux/kstackwatch_types.h b/include/linux/kstackwatch_types.h
new file mode 100644
index 000000000000..2b515c06a918
--- /dev/null
+++ b/include/linux/kstackwatch_types.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KSTACK_WATCH_TYPES_H
+#define _LINUX_KSTACK_WATCH_TYPES_H
+#include <linux/types.h>
+
+struct ksw_watchpoint;
+struct ksw_ctx {
+	struct ksw_watchpoint *wp;
+	ulong sp;
+	u16 depth;
+	u16 generation;
+};
+
+#endif /* _LINUX_KSTACK_WATCH_TYPES_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cbb7340c5866..707b34f26264 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -22,6 +22,7 @@
 #include <linux/sem_types.h>
 #include <linux/shm.h>
 #include <linux/kmsan_types.h>
+#include <linux/kstackwatch_types.h>
 #include <linux/mutex_types.h>
 #include <linux/plist_types.h>
 #include <linux/hrtimer_types.h>
@@ -1487,6 +1488,10 @@ struct task_struct {
 	struct kmsan_ctx		kmsan_ctx;
 #endif
 
+#if IS_ENABLED(CONFIG_KSTACK_WATCH)
+	struct ksw_ctx		ksw_ctx;
+#endif
+
 #if IS_ENABLED(CONFIG_KUNIT)
 	struct kunit			*kunit_test;
 #endif
-- 
2.43.0

