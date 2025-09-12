Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893D2E8E01
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671953; cv=none; b=M6bC2WFpnOLEMD+uvYrJwKMb2hO5WebHNgV7CKZZzZi/yUIlQwtOps4n5exBnj5Ox/H66L5kkNQUSWqPQqepDV0qaDnu/quh9B86rzeUJtR+d0TjbAXhXRQ6g0UPjcUJfbbaMxHhjrKxLdYa0F5Ej4QhFzAPFe1irVxpTbIhhWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671953; c=relaxed/simple;
	bh=0LDaB0nCUJks9qfGHQUupDX5ghXvVPG655pHEUpPv0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONk+xPDp03W6uruXMbXYRKOGTjCsWZZtgfOcWQNtPaymn9pTmUq0bbKNLgp+YR8R53SvOYdp4tkvuI/LoJPdlN4/dFY4fBBGf7cFkbHCy2Qg6OtRPutwXzhFRi50QTY/FKMmyykHp4gnSkfiUWKoxHoVqs608SSIUsNf0gm0G8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOC6KGzz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOC6KGzz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-25669596921so16096665ad.1
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671951; x=1758276751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0CmyIyII1+MjAJi7HJRtv0YVAXaAwAF3MNYXoEmi5A=;
        b=BOC6KGzzuTwl9gscrNbDOKj+uXoJmqAPMaD24NIzHXE1mU7Y78Uxylwc7w8ULZaywR
         Ig/vY+XOF9D/yUElSEVao7ehQQKzz6jt4N6KDuojwDEf8tABPUuMtiOUIQarfpDhZNv7
         ow7JT7/o6rjTlR5ZT28cQXfOIfOraRZXQc/JsvtoMCqqOjBogM1EdCOCaLmJ1y6VoDNv
         YnQBG5RcP+MyESu7GBMFp5h71lPPA2weroI0DEYW0Ljz34gTtPyyMlCQFsJp4XqLsqyv
         L4AYhUnEHCQCfaB6PzVl2L2xvbg76QVj/sb+h7N3JziO/OV2BGP6ZnN4S3krNYCr+LFC
         QefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671951; x=1758276751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0CmyIyII1+MjAJi7HJRtv0YVAXaAwAF3MNYXoEmi5A=;
        b=JwA+bYjjwXJlVyyTsUELNJtdI7chN0zY4wzfMrU9hpb94/bRkL8Yekk267BPGD4Aky
         K0llh+hgPJ5v/5IopVswbmpFNsRlQb6rHS8uVlrDB6CgxoXFf8a2i7JV562ye2C7Sg64
         oNrMkND8CsoHLFyWvoo1dGw2dY+LjvY74xbcrbnm5Zwvzv/rkgcUq4m8LYni7e/Td3qR
         3cZoOmDMoVGy8F3XS8Nlm4R2lQJC3QWYvMcsf+gC/N6NGI3CAbObMpBOKSVdxWjHVAt4
         WDZBNyf7+mf6YVSodp6DGgOoT/LDyPKa/PXflxvwlpF6zGL1wJPx7zTzY+kZ7Sqf0xnx
         EhAw==
X-Forwarded-Encrypted: i=1; AJvYcCUiJtAj1HrmdsApa3g+kRpMPDaqz/zxKc6toPVOFlEk1ekL6gtbaN4XUblryK2Mnb/LAFDj@lists.linux.dev
X-Gm-Message-State: AOJu0YxEmWc7AamC1eewm5M1idzy1eM8Vzoc/yLUpQBve224z+0C5dRR
	S5widYHGc2DWMVYgL6EqVi5CoqU4ioJfcOCowDLszbYXpPTFD/akMpqZ
X-Gm-Gg: ASbGnculG1prqzjAsXQTcL5zRImsZ2evIVntp6Snlotiaa/vDS008LlP9LUi0XHVBng
	0YEf14Wn+NYfd6VdpkpuHCJm6sq4N4ESQc+eqaa0GVwS/qLFkWaeTrTVc61AZNBTKvb7PkZuBbr
	p0tQ5L3yWhtxzPaaPkjvc8lL3qRCkWpcU5eqmJctLiVn4KUfGWrATl/sgHx80h5JAF95lPWb7U8
	Vt3DZUkIkH/1AN3Hm4d0+ewAa8FzzDekOQxxPC09gZqXhpXtg1ahhcXXlUS35sJrz7Bj+shCEv9
	OPUqpYos5mkNc6vaz3zMkXq6xNk8yvqjPx/q8IeGOQ+gH6R5mBjT6CEXdx4LQXH7capL5rmsw2U
	7G8XJSloYwloTkmWyckmw7YuPIUKnXJmu8JfSE90=
X-Google-Smtp-Source: AGHT+IF00yk89VG+lmEZt4lMLX0bbsabe7ZkX4XQg7tfyuz6vAWZHryAYuUydwk9sktzZqpEFk926w==
X-Received: by 2002:a17:903:3c2c:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25d26663dcamr29087525ad.29.1757671951122;
        Fri, 12 Sep 2025 03:12:31 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b4f1127sm44400285ad.147.2025.09.12.03.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:30 -0700 (PDT)
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
Subject: [PATCH v4 07/21] mm/ksw: add HWBP pre-allocation
Date: Fri, 12 Sep 2025 18:11:17 +0800
Message-ID: <20250912101145.465708-8-wangjinchao600@gmail.com>
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

Pre-allocate per-CPU hardware breakpoints at init with a place holder
address, which will be retargeted dynamically in kprobe handler.
This avoids allocation in atomic context.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  4 +++
 mm/kstackwatch/watch.c       | 55 ++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 277b192f80fa..3ea191370970 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -38,4 +38,8 @@ struct ksw_config {
 // singleton, only modified in kernel.c
 const struct ksw_config *ksw_get_config(void);
 
+/* watch management */
+int ksw_watch_init(void);
+void ksw_watch_exit(void);
+
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index cec594032515..d3399ac840b2 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -1 +1,56 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/printk.h>
+
+#include "kstackwatch.h"
+
+static struct perf_event *__percpu *watch_events;
+
+static unsigned long watch_holder;
+
+static struct perf_event_attr watch_attr;
+
+bool panic_on_catch;
+module_param(panic_on_catch, bool, 0644);
+MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
+static void ksw_watch_handler(struct perf_event *bp,
+			      struct perf_sample_data *data,
+			      struct pt_regs *regs)
+{
+	pr_err("========== KStackWatch: Caught stack corruption =======\n");
+	pr_err("config %s\n", ksw_get_config()->config_str);
+	dump_stack();
+	pr_err("=================== KStackWatch End ===================\n");
+
+	if (panic_on_catch)
+		panic("Stack corruption detected");
+}
+
+int ksw_watch_init(void)
+{
+	int ret;
+
+	hw_breakpoint_init(&watch_attr);
+	watch_attr.bp_addr = (unsigned long)&watch_holder;
+	watch_attr.bp_len = sizeof(watch_holder);
+	watch_attr.bp_type = HW_BREAKPOINT_W;
+	watch_events = register_wide_hw_breakpoint(&watch_attr,
+						   ksw_watch_handler,
+						   NULL);
+	if (IS_ERR(watch_events)) {
+		ret = PTR_ERR(watch_events);
+		pr_err("failed to register wide hw breakpoint: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void ksw_watch_exit(void)
+{
+	unregister_wide_hw_breakpoint(watch_events);
+	watch_events = NULL;
+}
-- 
2.43.0

