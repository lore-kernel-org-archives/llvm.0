Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723272F49FE
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672022; cv=none; b=V8x1il/YyLhOgS2b09EOrvO+NQ5sogwXXWN/tHurL3ZYgfr4K337cU1Wsb5rrnY+oM3ZXDdie6TQLmwkSKsEIlLMaMOkFb429C9YtvGfODASTxdEIDrSIiVFuDGd7gyUl7wrsD8b/nRlWYZYWmXnVpSsa4zuNK6Uv/r7hkLXIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672022; c=relaxed/simple;
	bh=L9AjRhWN6K9GCJF/+6ZwgVizRNTCCmqDO7KY/KLz4NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNeh/opqQdmH9F7rPDHyU5Bk6nAExCM7QcJ1LknPEfW8EOLAB/ekNXiPeFgklTd1skQP5yJ9Z0FUS6DU0rufeNY/WuiH/ZZoojneC/XGchSMMOQQkxZHWghf2xD/gd6c1zVe87jo1ZdM6180MIDt2ZOFWLSlA0J5o8OUAaNd6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egKyqdtp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egKyqdtp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b52403c47b7so1170941a12.0
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672019; x=1758276819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn+/3FE5CmsLxOS0M5YahrLvDpar54OOYFHjkWGVE7o=;
        b=egKyqdtpA/FyeQQRDK+Lg+sDeRb3GTeXDRU9zTUmu98Sm8VmL00yiaACiqnqJKyDle
         vXzf79wsSdwbXCb9QAOc2ZfosQs0vzEXR9zn0R1f8zwFGjkD6K/XnfnJ0fxcYlNUB+rG
         Kp5rWL6ZpPnzZ+1MIuZhzCl4yMNVtm2C/bqr4l3Xoo+/JBRYwNVNRapWqqSkupeS9okD
         zsvoCH2LM+cjObTbf0QevB7srS4eWFJcfXzydQLyojjQsh6OYuYg4Qy6tGky8BR+3UIV
         Xj3NPE7iohSn2i1h0c8C4JaNORCiHK8THcF1VaAfTOANMFTQsktRYowcOEhu4hOSFMxe
         Ovdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672019; x=1758276819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn+/3FE5CmsLxOS0M5YahrLvDpar54OOYFHjkWGVE7o=;
        b=Hmq/TglJ8vTTBH5zQUMFOYq8AFM9Pz2FFkBA8Oc8AD/tMdvQepYT/Wv46dHMGg1rAH
         OH6jAnz/11SEQTLJe7pf7vFBpJDwB6H1PT2NjwBWWRTopiWJY4a2AuxLLG/XmPQ3OP4u
         xuCIFuA5pscF/SYTI5anYVnfJsY9uOLp+t+Q768y3h63mrwQtga67Sl0EO84v23owJGk
         U+3LyqgxxyBjZgNsSr1iS3CP0ICIacN/4hZJO5xUw74sXcDl3bGRRoJ0WwWC7pYPYBt4
         yEO3hTMaBTPyTdEPRGUIdhidQhFY+7bxenNG2uFEFIcO6lZ5PQtHzi8zvVQKjgLX3ycT
         hPbg==
X-Forwarded-Encrypted: i=1; AJvYcCU0gkMO9z3T7nFVSWx1OWCrhEp5Il1DD7tbmsiPdLd2F8ceyA/CYSs+3zSveWCDCvHrYc8Z@lists.linux.dev
X-Gm-Message-State: AOJu0YxJRvnLwNaLUzCqns6oKUuk8O8pFoVet+0YWrCst41l4bpYZ0B/
	Bkzf/3SlcfG9eU9JXnSt+YmR7wlq8QRzdNsUXmkL7i732JC2haeKCZEH
X-Gm-Gg: ASbGncvIVpQUFUkNyAtMRH4/ZIXE1ee25gy1fffcRtyyT5Ym4PC8WS3uUoafnXXL6zy
	0ih0Te4qMzlltFo+Z7lNHNwQYbOooKRLICYEnyPWfi3HWYck74MBt9BJkJxnbcs1oChIya41pK2
	CRSe22gOHbZUSKLMwuZAb27cEkluzL9puC2ET2oZTjKWWeluEsgi6P9+GbR5i7D3L+Jm9ChQCJN
	/PzQv4ivoYrvgIYHWBjisWySmlSiIkdLPKnFRDu7kwuNAzpLVhsF2j3efH3TnXjmt1+nATu6Wbh
	b/iqrkfDUTr5cAP+qdqs+HqolvDWGF9Ze3fsBSUCMVoeKnksKkp8b3Vv/wQh5RXoHhRD4FwvtzD
	98QtsNQ5HPz7oCv3JfA9oa+YaKGbyiskRg2deEYbPI7Tc4jLDSwrxccft
X-Google-Smtp-Source: AGHT+IE9hLw78GXki+Z9/2VgA5oux+LKfhhFZu5WvV1JUasShceVOJ3liaB3nQw7f//NCPosPLRn+w==
X-Received: by 2002:a17:902:ef46:b0:246:571:4b51 with SMTP id d9443c01a7336-25d2da1100dmr32684915ad.29.1757672018598;
        Fri, 12 Sep 2025 03:13:38 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37293f0asm45182095ad.43.2025.09.12.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:37 -0700 (PDT)
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
Subject: [PATCH v4 20/21] docs: add KStackWatch document
Date: Fri, 12 Sep 2025 18:11:30 +0800
Message-ID: <20250912101145.465708-21-wangjinchao600@gmail.com>
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

Add a new documentation file for KStackWatch, explaining its purpose,
motivation, key features, configuration format, module parameters,
implementation notes, limitations, and testing instructions.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 Documentation/dev-tools/kstackwatch.rst | 94 +++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/dev-tools/kstackwatch.rst

diff --git a/Documentation/dev-tools/kstackwatch.rst b/Documentation/dev-tools/kstackwatch.rst
new file mode 100644
index 000000000000..f741de08ca56
--- /dev/null
+++ b/Documentation/dev-tools/kstackwatch.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+KStackWatch: Kernel Stack Watch
+====================================
+
+Overview
+========
+KStackWatch is a lightweight debugging tool designed to detect
+kernel stack corruption in real time. It helps developers capture the
+moment corruption occurs, rather than only observing a later crash.
+
+Motivation
+==========
+Stack corruption may originate in one function but manifest much later
+with no direct call trace linking the two. This makes such issues
+extremely difficult to diagnose. KStackWatch addresses this by combining
+hardware breakpoints with kprobe and fprobe instrumentation, monitoring
+stack canaries or local variables at the point of corruption.
+
+Key Features
+============
+- Lightweight overhead:
+   Minimal runtime cost, preserving bug reproducibility.
+- Real-time detection:
+  Detect stack corruption immediately.
+- Flexible configuration:
+  Control via a procfs interface.
+- Depth filtering:
+  Optional recursion depth tracking per task.
+
+Configuration
+=============
+The control file is created at::
+
+  /proc/kstackwatch
+
+To configure, write a string in the following format::
+
+  function+ip_offset[+depth] [local_var_offset:local_var_len]
+    - function         : name of the target function
+    - ip_offset        : instruction pointer offset within the function
+    - depth            : recursion depth to watch, starting from 0
+    - local_var_offset : offset from the stack pointer at function+ip_offset
+    - local_var_len    : length of the local variable(1,2,4,8)
+
+Fields
+------
+- ``function``:
+  Name of the target function to watch.
+- ``ip_offset``:
+  Instruction pointer offset within the function.
+- ``depth`` (optional):
+  Maximum recursion depth for the watch.
+- ``local_var_offset:local_var_len`` (optional):
+  A region of a local variable to monitor, relative to the stack pointer.
+  If not given, KStackWatch monitors the stack canary by default.
+
+Examples
+--------
+1. Watch the canary at the entry of ``canary_test_write``::
+
+     echo 'canary_test_write+0x12' > /proc/kstackwatch
+
+2. Watch a local variable of 8 bytes at offset 0 in
+   ``silent_corruption_victim``::
+
+     echo 'silent_corruption_victim+0x7f 0:8' > /proc/kstackwatch
+
+Module Parameters
+=================
+``panic_on_catch`` (bool)
+  - If true, trigger a kernel panic immediately on detecting stack
+    corruption.
+  - Default is false (log a message only).
+
+Implementation Notes
+====================
+- Hardware breakpoints are preallocated at watch start.
+- Function exit is monitored using ``fprobe``.
+- Per-task depth tracking is used to handle recursion across scheduling.
+- The procfs interface allows dynamic reconfiguration at runtime.
+- Active state is cleared before applying new settings.
+
+Limitations
+===========
+- Only one active watch can be configured at a time (singleton).
+- Local variable offset and size must be known in advance.
+
+Testing
+=======
+KStackWatch includes a companion test module (`kstackwatch_test`) and
+a helper script (`kstackwatch_test.sh`) to exercise different stack
+corruption scenarios:
-- 
2.43.0

