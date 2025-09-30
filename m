Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1D26F2B2
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200365; cv=none; b=n2mGxauYGktUphjGNDw4oxD/iQYEZzma8TFIfxskLMS+M3D1Tr3p9e0FIYLajwDezWwTl7kRHBskgJRlxIbuXy9GCydSCLoHhB9y+fmQ6keJKF7oYNfdjhpJqget4pzCVGPuor7GV3WTtau0wFvNuKtqXBKoC97lwrh19ccWckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200365; c=relaxed/simple;
	bh=fx5MM9mgeadn4AlECL2EeIytilVmfLOb03DEtE9qwqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJmpvBxcx1ZKnCIyO2YBP6bV1gPpst4xDLQ1UsahI1R3uJ9vudhEUq4QMOqTh5juDvc0pjHRSwgo7khmxlh30sYKddYnN00djCAUBU1dDIvN5zxQ0aZ2V0yoXhw+JfIJkRq1WQ6Cjz7pbcxxZ4FSYTfNZHACd7w+E4cVP3NGFy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvKoui0h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvKoui0h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7811a5ec5b6so2801353b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200363; x=1759805163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PODRMG2Z8bUUhx/yC1VRhywhZMIHoJSOmQZCJHqYhJ8=;
        b=YvKoui0h8jYGhcOZBsgeZM+4Wnx99l7NhAjWkdXqxz/1m/ecxmv04d97WdQ24MiS5a
         4rt3nkWqOR0xI3QwWwA6CBv5kYr2tUjQZjOARWb3yy99ubRIaPaB5KDyCZuIlLCzqZ8W
         uXzQXLfW8YC+YXlfVV811GAVK2Chuc/glXh9A0jGpbRIkDIhZnBetMydGV6pl56ZmL0e
         N86mJuwNJzhrGh8qHk2gXcRZWJce/TiSdm6TokEyxWbnXFDuokGfUq/1ekFKnpIBQ+CQ
         Vi5wgNrTy2I63J/WhPNdnJUq1sBLVykmiaKweS0/Y0G5csEYFyuHxlwj1ubVktNKKl4V
         G02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200363; x=1759805163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PODRMG2Z8bUUhx/yC1VRhywhZMIHoJSOmQZCJHqYhJ8=;
        b=j6mR0FpYCQIHiEDNkScCktq9djzi9Lrx1WqEstfWHmd6vAW8lzpDzK7ciYY2p6fIL2
         34/caPQwLcI/cUhcxhF2Hv99xrEdrQoERZJe+d2b3ARTC/fDKRMrZQUePPng/g9/f8l0
         eADTnkMCLizUWauqz/JPLNmlKI7mrpi4XW8bYsERNhN2byle4I2oJrVCR7wtfKOQzZgX
         oBAeqfAF+Q7tZH+/1UpwW96zFrFZ3XQXbpZd2nQhHZmW9LPHecmm7tHGyOoWzK50llzs
         91sa1vrlCnBH1tuAl2/REAX9l1LryX2ptLfoCcp/fHNFp0kT9Asd9Fs1b+ASOHezrw7O
         rnLA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqjof65weNEbKkrR3XLOywh+WkjSOYmW1I/LI4wr76X2L3Ot0VFfDhVIfk0Qz5CU5HXiH@lists.linux.dev
X-Gm-Message-State: AOJu0YwPJTkl8jzeynh0RuXXKUAnFwc+2DeNHK8eZoLAZwiI5dfCXcVL
	M1NZp8a3Mh9bLuzlB+2jgbg7Y+aNkaO/K6T/cN2igaXaWpqJpovCrsb1
X-Gm-Gg: ASbGncuBUjUHxzjkUUCSJY1uZQ/YexnaZ63kjUorVYlUevT5kM48Jz2DdnFtvNzQ+jP
	0pV+ZWW9K6hhen5RQxNUeTWGS8g+hkH0Qu4+l23nd+wnaHazfzQQ0VIl1MvqSqrCetO5kg/tA8w
	9fejwo4rb2w/uUJ7mHUMiAqgGX93XjNx4bGN5qNDW9jz0ElSqTCiQL5gzAFRUNKZE3OkqyVUdDc
	et69u+QiA5pTaWK+sQKTHOAVli5Hsi+JArWHT92XU+latiyXr1GrVS081Go69n91Q+PC9x1IM1F
	VO/jLJa05OqveFZxku7z4cU+np8KKtlQ3rj0iA4aBKTqpnRzWxPEdeEyrdTFtyzdU8kI7+neO1n
	kH1gax9kmLV9i6L8njbr7mw6oJSxKW7bYGVAfB+MN5nqpGO6oU15gXSQ35gjjTQAGgtKwY/0HOW
	Zl
X-Google-Smtp-Source: AGHT+IHP7Td3KbhlqylvVUhjonZ8jqxOR18BBallTWQed6L2+fSp22hmPw3ChS33nbn+ktPyuhPsHw==
X-Received: by 2002:a17:90b:264a:b0:32e:64ed:c20a with SMTP id 98e67ed59e1d1-3383aa8b143mr3140082a91.0.1759200362962;
        Mon, 29 Sep 2025 19:46:02 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387099d6sm2786368a91.10.2025.09.29.19.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:46:02 -0700 (PDT)
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
Subject: [PATCH v6 21/23] tools/ksw: add test script
Date: Tue, 30 Sep 2025 10:43:42 +0800
Message-ID: <20250930024402.1043776-22-wangjinchao600@gmail.com>
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

Provide a shell script to trigger test cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 tools/kstackwatch/kstackwatch_test.sh | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 tools/kstackwatch/kstackwatch_test.sh

diff --git a/tools/kstackwatch/kstackwatch_test.sh b/tools/kstackwatch/kstackwatch_test.sh
new file mode 100755
index 000000000000..35cad036ecee
--- /dev/null
+++ b/tools/kstackwatch/kstackwatch_test.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+echo "IMPORTANT: Before running, make sure you have updated the config values!"
+
+usage() {
+	echo "Usage: $0 [0-5]"
+	echo "  0  - test watch fire"
+	echo "  1  - test canary overflow"
+	echo "  2  - test recursive depth"
+	echo "  3  - test silent corruption"
+	echo "  4  - test multi-threaded silent corruption"
+	echo "  5  - test multi-threaded overflow"
+}
+
+run_test() {
+	local test_num=$1
+	case "$test_num" in
+	0) echo fn=test_watch_fire fo=0x29 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test0 > /sys/kernel/debug/kstackwatch/test
+	   ;;
+	1) echo fn=test_canary_overflow fo=0x14 >/sys/kernel/debug/kstackwatch/config
+	   echo test1 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	2) echo fn=test_recursive_depth fo=0x2f dp=3 wl=8 so=0 >/sys/kernel/debug/kstackwatch/config
+	   echo test2 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	3) echo fn=test_mthread_victim fo=0x4c so=64 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test3 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	4) echo fn=test_mthread_victim fo=0x4c so=64 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test4 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	5) echo fn=test_mthread_buggy fo=0x16 so=0x100 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test5 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	*) usage
+	   exit 1 ;;
+	esac
+	# Reset watch after test
+	echo >/sys/kernel/debug/kstackwatch/config
+}
+
+# Check root and module
+[ "$EUID" -ne 0 ] && echo "Run as root" && exit 1
+for f in /sys/kernel/debug/kstackwatch/config /sys/kernel/debug/kstackwatch/test; do
+	[ ! -f "$f" ] && echo "$f not found" && exit 1
+done
+
+# Run
+[ -z "$1" ] && { usage; exit 0; }
+run_test "$1"
-- 
2.43.0

