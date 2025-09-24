Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82912FE574
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714701; cv=none; b=ANF8ca4XLLqvm4mkSs9W1NOVDDflddBBsnQIzQ6fuRv5VO5DiqvnlmGo/zYpAb+Gx0uTjOczclg1IaT7I25ZDcrtr2Nvihl0WnuthSbHxAK81afJIbXeJN/QSGFbfki4Pqrn4E4MhSsKu5Ld/hNzGSHpE5InseOhKs8k+FSfElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714701; c=relaxed/simple;
	bh=UNpz5dM5lO613H1u9Fi56G2SPcRkZnRAbeW6JwAQp0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XKa2z0B4sy1D7F3R90KHA7v9iGi5hnweHYN+mkUk01759DUtoMHR1eoghV79W36rHWDEgBvzy17K9znvJpMZJURgFsXZmk7zqiGs7eyigveB3iMnyhMwDK7eUhQpEcFCkygD2aV91WDV2HCia0UCYNscfu8F99AL3m1KmYJ7YW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8rmZPVG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8rmZPVG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b557367479eso820199a12.0
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714695; x=1759319495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkFW7ZSlDKq/LZM+zK73rBzgP1/UKF25L/8hqnEAXa4=;
        b=L8rmZPVGjXt2myNkB0RJr6CIl7DtCrLTLR+1rDX5h1xvI2cG7XMb0a9BB0WkvP0LD1
         4tou+6GwStWb3Ba/L6KNYtjDK7QcxkKZh0hI5Ijhyrjdw+qbE/tYlkCrOxYpWW0vzAjF
         Iebimp/e9QaOBODCXISey3NIgBaSVq2mc4+yHm/+/Gd0PnJhwadyPSFjPMTfT+cYgDyG
         NA2tsMSvYqHKnaTEeTNfzUrDYaM9GiUREX15joRHeTmCNkjHWkFVCyxYcBKgOc3ILalJ
         izMX8CVDqaGNd7lhcjI1JRXYWEf1LmjaHx8hrKxKT8Fm4WG04K7EymyEHNwhbjlbDCTD
         Xdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714695; x=1759319495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkFW7ZSlDKq/LZM+zK73rBzgP1/UKF25L/8hqnEAXa4=;
        b=JDvE788IUGra8NYTdRUoGjNqIveqqCqy4i1+vbU/Qt9CNuoD39Le0I6Sdmg/UMF4TB
         h5gBphi0c0XCjOCcxAjKUa9nR3PxZlJfZQiANMSVYVSiZjaBsqtJTy1gZuJi0HVycIwA
         iyVQpqAoB+2qHMFkiDV6+pKstwWWwnXeliGz+xeICf1f0zDqnr0tH/FlyB05fyyA53Og
         fjfd7RsVQ6UmkVCnVjh1ysZZrjOLGI35BAJL0ZEF10JnUUqSjpXXF+FoJbMCWEse8kCf
         51daopmV/t1bNkSlGcQafcwkfHE4Nl4+U3NpZ8/WtGkzzVK8+w4ER3cvoUUiLTbLDh5Y
         ixUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8oVvQfNGJ24XZB45S0ZFoIcwxR+8+2pcpTph2yWTCaMnKgNuVGNSd4OHzvmh5M+2c/A5o@lists.linux.dev
X-Gm-Message-State: AOJu0YyeF5vgNi14QRgX41fwbayyKGvkebJZmHLQZD39UYj5Y9ywJLeo
	epsTEer5sy28LUi/pw95rUskSpQAWPo3qogCHRkYJJrRWPqiT7wWHboT
X-Gm-Gg: ASbGncvhIHR0Wakosk8snoWpf2JDtPRHZf/q5T4m1/WX6AMcdUF7o4NKBNYRe5x2uMe
	Yw+CmafwjBdYZ5bYOrvY/QRRGVKIoToZYR2eqOqCyKIG0V3/WJkIWjxq1g6RgbtQ+5wsWmlrp9k
	eeIe3Zy/4sYNwot/ndhgSX2C7zySpgJCXHhYQWox9IaHp2aHY6InZTZZYRB12PjCrgBoYwoTSNF
	kUTd1Ovnlh39qgxQ+5agcg3P4wV6Xd7LyxU1BXo/qpXr7d7+2mgNoEbzi+d2YkSNFcQmcISNfby
	jX/uapmovZtgJL8cTblgHXjCOZ02EJYq8kO6Q7+uk3biQZFKUyhTEDh+5Wt27AAsYBo02RqSk1E
	/B3+Io9gqMnnyEyUKGu14c9CC2Q==
X-Google-Smtp-Source: AGHT+IFpw5g/nyg0mjoFnafm0OORRDCd2mc5ondqV3KNE7Z5tP/VaQRZBOA+j3BmtPgUBBTfxZ4Mhg==
X-Received: by 2002:a17:903:3586:b0:240:9dd8:219b with SMTP id d9443c01a7336-27cc61bd32dmr78200575ad.49.1758714694622;
        Wed, 24 Sep 2025 04:51:34 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802fe096sm189570425ad.104.2025.09.24.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:34 -0700 (PDT)
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
Subject: [PATCH v5 00/23] mm/ksw: Introduce real-time KStackWatch debugging tool
Date: Wed, 24 Sep 2025 19:50:43 +0800
Message-ID: <20250924115124.194940-1-wangjinchao600@gmail.com>
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
  mm/ksw: add singleton /proc/kstackwatch interface
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
 Documentation/dev-tools/kstackwatch.rst | 316 ++++++++++++++++++++++
 MAINTAINERS                             |   8 +
 arch/Kconfig                            |  10 +
 arch/x86/Kconfig                        |   1 +
 arch/x86/include/asm/hw_breakpoint.h    |   8 +
 arch/x86/kernel/hw_breakpoint.c         | 148 ++++++-----
 include/linux/hw_breakpoint.h           |   6 +
 include/linux/kstackwatch_types.h       |  14 +
 include/linux/sched.h                   |   5 +
 kernel/events/hw_breakpoint.c           |  37 +++
 mm/Kconfig.debug                        |  18 ++
 mm/Makefile                             |   1 +
 mm/kstackwatch/Makefile                 |   8 +
 mm/kstackwatch/kernel.c                 | 263 +++++++++++++++++++
 mm/kstackwatch/kstackwatch.h            |  58 +++++
 mm/kstackwatch/stack.c                  | 240 +++++++++++++++++
 mm/kstackwatch/test.c                   | 332 ++++++++++++++++++++++++
 mm/kstackwatch/watch.c                  | 305 ++++++++++++++++++++++
 tools/kstackwatch/kstackwatch_test.sh   |  52 ++++
 20 files changed, 1769 insertions(+), 62 deletions(-)
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

