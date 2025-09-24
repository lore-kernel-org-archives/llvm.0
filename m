Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC241301016
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714740; cv=none; b=cM3ObzDon/p7cU5QNm1H+zybUQXmMvP32B/icQWR1tQFth99+/lB6gBsZva/PHjZah3QgRAqInm/Mo4n/SAcFKZIm+dcisicbkLvArI4O9tBBCOZxThacZQN/RDka+GgpuU9Y2RnR/zBLtbnPqpSTVPP2FLt8mhLCLqBfG+vM70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714740; c=relaxed/simple;
	bh=wmwmRtcPH4ST6Dm0G2/AFHsMnlz3q9k9yRWhyo1wI/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIT1WiCmHVkF24X7V0Jd7IS1w/bsLNDFbQzGlEMIpZocMRVCqS377lWCCloY2W9A9oFtfNPB/tHpOrHf3+NpAFscKWHiKPgB6hTQtaEDo4O8yrX+8V6ro0QhYt67aSY1TM75hk944J0vBih/xe4mQlChAes7LN8eDDkI2LxtLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoxX8VGP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoxX8VGP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b55115148b4so4428989a12.3
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714735; x=1759319535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4BKEfc9ax2ksTKKBAwbjubQHvBiDjA54WMJGQTptLg=;
        b=YoxX8VGPB/8PDBeWRM7oalz6oeWaixEQaVMriryI8ls3Df3JpjgFjIqOIYO+Pd2Qb3
         i4+jejJZ+bxWwXIfYR67ESGu6okwOxbh9wHQTxUcSJvdYq8ajeQ6vJT/s/loh6OsCDfh
         TuQCq77vAnpC3E6oKJlrR99VzgqSa1q9Ul7YoTupHMHrtdozSHgDP1Dzm8N64MzDQiki
         6W2xd+kHjRtwgswp3NXXybzIxwmGDzUlHOPOr+jACriVkKX+a9lZJhird1o77EVkyrWa
         zEu/vYzXuieJmBB70lh6MPgK9ox/CpSzXUKvLItZG6o9gUK4UkwUbz4qps9s4N/O3BQ3
         zTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714735; x=1759319535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4BKEfc9ax2ksTKKBAwbjubQHvBiDjA54WMJGQTptLg=;
        b=nAGP7cqiC4BawmSrjzY4RhZhG6+6JoelyYpBHXRZoZnBhGUUgNyy2fqk3FoxP3GKtw
         aRKsEqfT6X4RVPoe//tG/ua2a+nHojcc/LlhGpmayweiiy9qQ+vRTNx4Z0QpovOtVYge
         5yUtV3pH0zcpB8Adnm4tHlRiD1sBOOV6UkCn+W8BPmXAuvNxqiRPWGjUjB+oaXMDF/n8
         zppD429fpMjJZcq7jRHPsvKjKYOKE1B96WJC+yZ0Af8QaM40dAnHYpDXVLNiN5sB1xDL
         lR7gKOmyJqDm0fM2q83KlsNPbp2Kg9tdOaaxwurbys/6SnUWuiPhMPW47L5ujZg5wItH
         UGMw==
X-Forwarded-Encrypted: i=1; AJvYcCURrbcRCbgHtVVMgZ69XawJbK44Z+1+Kt8oLCWJuIYhZM16pt82Du2PfpPqHq6u1pQ02pzK@lists.linux.dev
X-Gm-Message-State: AOJu0YycrmOTevj6JzysojFO/5RFJaz6o+S3QiZp8AIOX4tlznm/Ul9c
	5G/ICLzst/LtpoDrdUX0bhjz2JCs9xuIXd//0McYxpZK6VEz02yQdsYa
X-Gm-Gg: ASbGncvw4ImrvsTkAtro2roPtS7lwIWiE/+vOse86bvqvt4TtaqTWrPdVGhczqcTWYp
	IKdei4WicHLEtt84Cxk4HwnbmSiTkd79waVl4FF6/z2s9TQzWERJRaJgvM1umLu8gqi7LPM6/VV
	Yr3ltPnYUVTI9d49VRnVqrxuRK7C6Mr4+6RBGkLrO3hTv0psofUt5R6NW7zA3X0IhV7CZk71Jf1
	LNWRecOM+o+TJm4ewJnxbv7vc7GPezFM5rkN+cj6bYw6E24Ab/HHl7AQ9m0xTglPzgyZ8qOrkBG
	ajwMo1UVyEp5kfZkYVXqZYPj2z6Yf3D0ZCA1JrQSlcLJqKgwvOHRHOJ3Y3ntpVRmxJ3mzvB7v5S
	SKP25p43iHwbR+MvXJRYpKBixKQ==
X-Google-Smtp-Source: AGHT+IEIPde70G75F7g+aLuFunwEIX4ciWCOE5JEZlKnHsvKJ7fdAzkwZXDsNRxc7SsbnaPx5zSyIw==
X-Received: by 2002:a17:903:8ce:b0:266:2e6b:f592 with SMTP id d9443c01a7336-27cc325ea9emr75331615ad.25.1758714734961;
        Wed, 24 Sep 2025 04:52:14 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27cc8b251f7sm49110575ad.8.2025.09.24.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:52:14 -0700 (PDT)
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
Subject: [PATCH v5 11/23] sched: add per-task context
Date: Wed, 24 Sep 2025 19:50:54 +0800
Message-ID: <20250924115124.194940-12-wangjinchao600@gmail.com>
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
index f8188b833350..6935ee51f855 100644
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
@@ -1481,6 +1482,10 @@ struct task_struct {
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

