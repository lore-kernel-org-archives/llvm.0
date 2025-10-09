Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2512DE715
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007430; cv=none; b=FhRpgU1mWcRzwO1ZOEL6HbR+vPQT9Gcn3R2O6kAJNYZ74p73yOcsnTurzW1vwnyIOIc5S8RuNsLm0BPlnQwU+dmJYyabe6lWLA02NF98/AT8pXqb7avSdN63kth7hO9/wH+GiPRpf2hxfJ75dKQH4g8tVjFEQAzs/L30EWU3ico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007430; c=relaxed/simple;
	bh=D/cb+JmAMPxI+tby9AeftLayL7EBPhafkToHtKd0f8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AKM+fv9P0n55yc4U1s3LbTtbkePGk1GnZnN3Ce/9u3ggSfvp9IlOVcEAfOknRar2YxcIoECZ9kQnBHZRUiL8bRfCfDj+0uEUlVV1uZgd7lfjZjhh10ilmB16ZuOgrVN6PtbdZC7yh8s05wAm/gm0Be5MdfZ1uftnHZ/qeY3nJ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asaOb8fh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asaOb8fh"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7841da939deso740680b3a.2
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007427; x=1760612227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/KVNrCgkP/CpH67njDEKsgcguKTfOKueucBYEp6ELs=;
        b=asaOb8fhfEWJN7BKEvJsi2W/9c9paE4DXhuTrV8roooxQMmV0wnzZPuEcCPXgPVqFk
         mupVbte6xxswcCzVeD8LDQNCwYMx8a/blz34Lj277rL49c3wjAryYJ3sYGXPhvGTX6RS
         YnEq2gfehP2dO5VYDEuzEY2J3wgNNZabPV53GDOO1T/lXrEgEQT+4su4w9fmxtICETsc
         YF5mz1LvXn+0H8Yjhz1RASv5bzolB5N7wuEFI8St8xb2bVAtUi2Q1zDslE5aizaCux6s
         pCsSCvYiqsDfskr1GOTIIkr6AToZEZhEKKYYlHOKJRSGBI0biqEe3RXcZarlWZvSbufe
         AzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007427; x=1760612227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/KVNrCgkP/CpH67njDEKsgcguKTfOKueucBYEp6ELs=;
        b=USo72ZE/Sj6+Kl3FS5cGoGjgcTRgHpeb2LzBwdSz2fuba97JQITdt/i12IwYoX9nDc
         JP1SXssfy1DwSbCCku20KMX7uyYTZWYEfEueXWC9Xo5LWzFPkPJUmrGt5oz4gy8JGSR+
         TC5+PRq6L5SeRvpoPU/Pr0VDvU2mH9IAYJWG17GslcfaCfWs3xBJ2/tsX3nGAYTD7jdF
         bJNPFZtBRppVYz0pnQ9AS2mAmi12+pHcHdjDQ4H4Hbz7/DZSnjuB7zpjUVPQ8Hcfjod7
         s6D93swDs2tmyrIUcsOdvGhWr2hwBaT5N3mQOo7Y77fX3OkR2WPYxY2f5teVW6c1tWNF
         XwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qqc73xSRPZWnASsoHhzi7dXo+d8deBiQU0Wbuo6iS0KVpOSOeIMg+kybOIRRoLcKlB5k@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0b80xVjVOWYVRm7IZM6u6ZyyhD1Cjy3Ej4OxBZRtW09NUALCM
	ncjwwkaVQ0DoktfC7fHieZJqrX9wISI5JlwUi3uJTDSQjBOA8zqFKnJe
X-Gm-Gg: ASbGncsiY5w152PqgnxT1hnwOZ4dLMsi1aD4ja1cvaStiC7S2RfFJ2da1Pc3K51Aeqa
	xBE14hL0Mdc82k5GbBMHrBoheEKCI7pG53eEIa3o8szmUTfhlTp02co0IGDf6g+AhDSPWS3Z7T2
	cPFOC9O0WdzUgIdPuKrdNmVlU7aL3zI0ZM6Rj+J4zC623Opu8kXTmX1WGVr3R5QZfyrg/4+Pm0K
	N/8mSNWSL+sL/aqtOslcXNZHUzyfHuiyK0/+x02rl7YUeFGuLCMIcT7yhDn5pVg87Jq0NehCbnK
	iaa0hNvp5JdCv6Wiu6YFaa3Tf16GD4k3f6wa0hXAbKGgHQKwdF8TNuOSOdKkdTy0BuKWU01ifRB
	tXDft6oawswq/Enp8HFjE7KBWXrDSKVbKkDRAJJXC995JxJLJeSsdlQzNlMyU
X-Google-Smtp-Source: AGHT+IHegRF+cDkS8n8iN1wDSqYkCY6Z+zS+A83OBf5JKqfA2hExCY0UD9dxNTVbTqOQx/6S6nxYew==
X-Received: by 2002:a05:6a20:914f:b0:2c4:c85a:7da5 with SMTP id adf61e73a8af0-32da81345e5mr10045407637.6.1760007426930;
        Thu, 09 Oct 2025 03:57:06 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e34e6f17sm2514275b3a.82.2025.10.09.03.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:06 -0700 (PDT)
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
Subject: [PATCH v7 00/23] mm/ksw: Introduce real-time KStackWatch debugging tool
Date: Thu,  9 Oct 2025 18:55:36 +0800
Message-ID: <20251009105650.168917-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces KStackWatch, a lightweight debugging tool to detect
kernel stack corruption in real time. It installs a hardware breakpoint
(watchpoint) at a function's specified offset using `kprobe.post_handler` and
removes it in `fprobe.exit_handler`. This covers the full execution window and
reports corruption immediately with time, location, and a call stack.

The motivation comes from scenarios where corruption occurs silently in one
function but manifests later in another, without a direct call trace linking
the two. Such bugs are often extremely hard to debug with existing tools.
These scenarios are demonstrated in test 3–5 (silent corruption test, patch 20).

Key features include:

* Immediate and precise corruption detection
* Support multiple watchpoints for concurrently called functions
* Lockless design, usable in any context
* Depth filter for recursive calls
* Minimal impact on reproducibility
* Flexible procfs configuration with key=val syntax

To validate the approach, the patch includes a test module and a test script.

There is a workflow example described in detail in the documentation (patch 22).
Please read the document first if you want an overview.

---
  Patches 1–3 of this series are also used in the wprobe work proposed by
  Masami Hiramatsu, so there may be some overlap between our patches.
  Patch 3 comes directly from Masami Hiramatsu (thanks).
---
Changelog

V7:
  * Fix maintainer entry to alphabetical position

V6:
  * Replace procfs with debugfs interface
  * Fix typos

V5:
  * Support key=value input format
  * Support multiple watchpoints
  * Support watching instruction inside loop
  * Support recursion depth tracking with generation
  * Ignore triggers from fprobe trampoline
  * Split watch_on into watch_get and watch_on to fail fast
  * Handle ksw_stack_prepare_watch error
  * Rewrite silent corruption test
  * Add multiple watchpoints test
  * Add an example in documentation

V4:
  https://lore.kernel.org/all/20250912101145.465708-1-wangjinchao600@gmail.com/
  * Solve the lockdep issues with:
    * per-task KStackWatch context to track depth
    * atomic flag to protect watched_addr
  * Use refactored version of arch_reinstall_hw_breakpoint

V3:
  https://lore.kernel.org/all/20250910052335.1151048-1-wangjinchao600@gmail.com/
  * Use modify_wide_hw_breakpoint_local() (from Masami)
  * Add atomic flag to restrict /proc/kstackwatch to a single opener
  * Protect stack probe with an atomic PID flag
  * Handle CPU hotplug for watchpoints
  * Add preempt_disable/enable in ksw_watch_on_local_cpu()
  * Introduce const struct ksw_config *ksw_get_config(void) and use it
  * Switch to global watch_attr, remove struct watch_info
  * Validate local_var_len in parser()
  * Handle case when canary is not found
  * Use dump_stack() instead of show_regs() to allow module build
  * Reduce logging and comments
  * Format logs with KBUILD_MODNAME
  * Remove unused headers
  * Add new document

V2:
  https://lore.kernel.org/all/20250904002126.1514566-1-wangjinchao600@gmail.com/
  * Make hardware breakpoint and stack operations architecture-independent.

V1:
  https://lore.kernel.org/all/20250828073311.1116593-1-wangjinchao600@gmail.com/
  * Replaced kretprobe with fprobe for function exit hooking, as suggested
    by Masami Hiramatsu
  * Introduced per-task depth logic to track recursion across scheduling
  * Removed the use of workqueue for a more efficient corruption check
  * Reordered patches for better logical flow
  * Simplified and improved commit messages throughout the series
  * Removed initial archcheck which should be improved later
  * Replaced the multiple-thread test with silent corruption test
  * Split self-tests into a separate patch to improve clarity.
  * Added a new entry for KStackWatch to the MAINTAINERS file.

RFC:
  https://lore.kernel.org/lkml/20250818122720.434981-1-wangjinchao600@gmail.com/

---

The series is structured as follows:

Jinchao Wang (22):
  x86/hw_breakpoint: Unify breakpoint install/uninstall
  x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
  mm/ksw: add build system support
  mm/ksw: add ksw_config struct and parser
  mm/ksw: add singleton debugfs interface
  mm/ksw: add HWBP pre-allocation
  mm/ksw: Add atomic watchpoint management api
  mm/ksw: ignore false positives from exit trampolines
  mm/ksw: support CPU hotplug
  sched: add per-task context
  mm/ksw: add entry kprobe and exit fprobe management
  mm/ksw: add per-task ctx tracking
  mm/ksw: resolve stack watch addr and len
  mm/ksw: manage probe and HWBP lifecycle via procfs
  mm/ksw: add self-debug helpers
  mm/ksw: add test module
  mm/ksw: add stack overflow test
  mm/ksw: add recursive depth test
  mm/ksw: add multi-thread corruption test cases
  tools/ksw: add test script
  docs: add KStackWatch document
  MAINTAINERS: add entry for KStackWatch

Masami Hiramatsu (Google) (1):
  HWBP: Add modify_wide_hw_breakpoint_local() API

 Documentation/dev-tools/index.rst       |   1 +
 Documentation/dev-tools/kstackwatch.rst | 314 ++++++++++++++++++++++
 MAINTAINERS                             |   8 +
 arch/Kconfig                            |  10 +
 arch/x86/Kconfig                        |   1 +
 arch/x86/include/asm/hw_breakpoint.h    |   8 +
 arch/x86/kernel/hw_breakpoint.c         | 148 +++++-----
 include/linux/hw_breakpoint.h           |   6 +
 include/linux/kstackwatch_types.h       |  14 +
 include/linux/sched.h                   |   5 +
 kernel/events/hw_breakpoint.c           |  37 +++
 mm/Kconfig.debug                        |  18 ++
 mm/Makefile                             |   1 +
 mm/kstackwatch/Makefile                 |   8 +
 mm/kstackwatch/kernel.c                 | 292 ++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h            |  60 +++++
 mm/kstackwatch/stack.c                  | 240 +++++++++++++++++
 mm/kstackwatch/test.c                   | 343 ++++++++++++++++++++++++
 mm/kstackwatch/watch.c                  | 305 +++++++++++++++++++++
 tools/kstackwatch/kstackwatch_test.sh   |  52 ++++
 20 files changed, 1809 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/dev-tools/kstackwatch.rst
 create mode 100644 include/linux/kstackwatch_types.h
 create mode 100644 mm/kstackwatch/Makefile
 create mode 100644 mm/kstackwatch/kernel.c
 create mode 100644 mm/kstackwatch/kstackwatch.h
 create mode 100644 mm/kstackwatch/stack.c
 create mode 100644 mm/kstackwatch/test.c
 create mode 100644 mm/kstackwatch/watch.c
 create mode 100755 tools/kstackwatch/kstackwatch_test.sh

-- 
2.43.0

