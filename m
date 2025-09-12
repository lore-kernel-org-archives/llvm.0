Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4B2DFA28
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671920; cv=none; b=dEGB6e9iaNmeUP+IZ6d/wL1VlK1o9P7XIZgWzTnEc+slYyMdI3OTf7mYkf0V5CDXmhLWpyS6hV4fWVAUIWX0ex2Hwx/WPPwQL3juP//CYhgdl6ugn+xYBQMs4UbsimOiM/8/0Ejy1lxlslPl8gl61/eLxToyRak5wvjh3z5TEZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671920; c=relaxed/simple;
	bh=FHszHWwv+FXNM1rWp+0e1v1GXLl+e5k0dLTLr+1rTQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jpfMQOMXTuRu0ermf5Q9FWvvqdUWsAjhZ88CJ/qUC4RVMgDKZSCrVEj0CjWUz2KDjcUU3+45pGFWq610ki2uwCwX4diFsRsApKcwMk2XM/JrEUGKb3cEzjH0J2EJYMUIdfl258OVhuJm6LU1n1BnB7iL5O3BhbsEYp2vBIMUGa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJT/HjE5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJT/HjE5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7728815e639so1358677b3a.1
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671918; x=1758276718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0RAur8Marng0nhbSNOQRJYXrBS2GdOE60OklyU/Dxo=;
        b=bJT/HjE5vtGOIwM9zsJdB9WZ/Kdd7bcJE4idpM2x0OGNCyaNIpYzc4frSZfuASDCOn
         x4wzj83NxQLgEJaLs62Gnah3dEl2sL6Foa+GEHgymoLrruZ3jM5rfLk63AXMetHesSZc
         H1AymBovc16VH/Ek9YPOoWgraN8Fk1lzeq5XABjgkpWPMV0Hprf62NKohzH+tuEKUbl3
         Z5iDHiPFXqN6cVvvhOXEzLfcN3BoTmbMhcDyn7XOE9HYRh5z0rDQMRXT91A+D2i2MTDx
         RdrdJGFZ8F9824dmIwWALKLtsOckyW/UdmHxVYsVGWGSYhaI+AUJ0ss8PU9oodClRhvt
         yqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671918; x=1758276718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0RAur8Marng0nhbSNOQRJYXrBS2GdOE60OklyU/Dxo=;
        b=FHJLHRvG+yxjWN1Snudt2I/E8AAlRu2C2tut7kvat0QaS/i1tGBlv6qC+UdKAOnrNC
         EIZd17CA4S43iE3Iea0ZmZ0+qHMAoqGt8zN2GppftuHfpSf0zjTbhC4DF0jeJGRY/9ao
         hY8mRNiG6pq6uF9R5z8jL0LMPDRWWA/uGwIxP3+SFl0aF52+AWatmca2Vj7MiikKAXjI
         ydJn64S0mtyJfHcqHyHRCN32ypWcxrZbQJZShyFKEk/hRUbJmE4jIWti9MjRzxAPl7F9
         BvdgQgPA6TSXV8vAc+78lVUajw4t1FJoYhRaWKAb3457VKuNrau0M4LeHSCCsmKfo2Wb
         ktKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUSYaXi2bNRLMKi229KahgqlRIXZIe+KgPOBYdPzw46NBCnosctt2Orw3lTRbBzT9haKKp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+WVgAX/5pu/lO4Xk5RS8tHlPOaiehVACbhP1B03mr/e4+KO5x
	EBPA9028meBiQ72gR7MyajzZtjKXJpLvUKHU9bfDYgvOMYQMP4HWo2tsPMKI26F83ag=
X-Gm-Gg: ASbGncuykZ6ECqja3wVxTrvWoGJ/xgDYA6t5CXx16G2AGUyZixP+jCh8RlaKK5TwnLU
	Z8tRTjNnd8u+dMh3D8q2dA/05wk//wijXyyV29Y90APznwLVuCCJkveyi0aC4z4FUS4rr6MiuXe
	9QKpT6WIzyE4cKNPz7sRH+5F36w40PevPHZeKqMESPAlSxsUWJR+2L5OG4vAiwKZm5AzBR0+p9p
	orgTZnAHi+A71Ko+6XHfdysnGYyDjp9gH63EGIwM1MOt2y4TiRs9LfBv3t6/9NuZiiFgjDYbrYs
	fkuomXUUgE0bep6SGJa5Sk6PrSk+QJ0unKZy+MfHLfGNboL/6CCPJFpMLivMGGdwwNfo3SeuoFg
	wekM4e2+IzO03Z7nY9dBnyScuUrVBwWIpwyqjUvqMEoMxmatgMA==
X-Google-Smtp-Source: AGHT+IFPwbQYuxjB7a0ey4JvHITRQZqedavu3i0Y8Nu7EBQTFjbU8//ZN1py4iYXafr0IzmJIdbrVA==
X-Received: by 2002:a05:6a00:194b:b0:772:5271:d1ba with SMTP id d2e1a72fcca58-77612061e2emr3147992b3a.7.1757671917940;
        Fri, 12 Sep 2025 03:11:57 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b18371sm5059816b3a.49.2025.09.12.03.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:11:57 -0700 (PDT)
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
Subject: [PATCH v4 00/21] mm/ksw: Introduce real-time KStackWatch debugging tool
Date: Fri, 12 Sep 2025 18:11:10 +0800
Message-ID: <20250912101145.465708-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces KStackWatch, a lightweight kernel debugging tool
for detecting kernel stack corruption in real time.

The motivation comes from scenarios where corruption occurs silently in one function
but manifests later as a crash in another. Using other tools may not reproduce the
issue due to its heavy overhead. with no direct call trace linking the two. Such bugs
are often extremely hard to debug with existing tools.

I demonstrate this scenario in test2 (silent corruption test).

KStackWatch works by combining a hardware breakpoint with kprobe and fprobe.
It can watch a stack canary or a selected local variable and detects the moment the
corruption actually occurs. This allows developers to pinpoint the real source rather
than only observing the final crash.

Key features include:

  - Lightweight overhead with minimal impact on bug reproducibility
  - Real-time detection of stack corruption
  - Simple configuration through `/proc/kstackwatch`
  - Support for recursive depth filter

To validate the approach, the patch includes a test module and a test script.

---
Changelog

V4:
  * Solve the lockdep issues with:
    * per-task KStackWatch context to track depth
    * atomic flag to protect watched_addr
  * Use refactored version of arch_reinstall_hw_breakpoint

  Patches 1–3 of this series are also used in the wprobe work proposed by
  Masami Hiramatsu, so there may be some overlap between our patches.
  Patch 3 comes directly from Masami Hiramatsu (thanks).

V3:
  Main changes:
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

  Cleanups:
    * Reduce logging and comments
    * Format logs with KBUILD_MODNAME
    * Remove unused headers

  Documentation:
    * Add new document

V2:
  https://lore.kernel.org/all/20250904002126.1514566-1-wangjinchao600@gmail.com/
  * Make hardware breakpoint and stack operations architecture-independent.

V1:
  https://lore.kernel.org/all/20250828073311.1116593-1-wangjinchao600@gmail.com/
  Core Implementation
    *   Replaced kretprobe with fprobe for function exit hooking, as suggested
        by Masami Hiramatsu
    *   Introduced per-task depth logic to track recursion across scheduling
    *   Removed the use of workqueue for a more efficient corruption check
    *   Reordered patches for better logical flow
    *   Simplified and improved commit messages throughout the series
    *   Removed initial archcheck which should be improved later


  Testing and Architecture

    *   Replaced the multiple-thread test with silent corruption test
    *   Split self-tests into a separate patch to improve clarity.

  Maintenance
    *   Added a new entry for KStackWatch to the MAINTAINERS file.

RFC:
  https://lore.kernel.org/lkml/20250818122720.434981-1-wangjinchao600@gmail.com/
---

The series is structured as follows:

Jinchao Wang (20):
  x86/hw_breakpoint: Unify breakpoint install/uninstall
  x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
  mm/ksw: add build system support
  mm/ksw: add ksw_config struct and parser
  mm/ksw: add singleton /proc/kstackwatch interface
  mm/ksw: add HWBP pre-allocation
  mm/ksw: Add atomic ksw_watch_on() and ksw_watch_off()
  mm/ksw: support CPU hotplug
  sched: add per-task KStackWatch context
  mm/ksw: add probe management helpers
  mm/ksw: resolve stack watch addr and len
  mm/ksw: manage probe and HWBP lifecycle via procfs
  mm/ksw: add self-debug helpers
  mm/ksw: add test module
  mm/ksw: add stack overflow test
  mm/ksw: add silent corruption test case
  mm/ksw: add recursive stack corruption test
  tools/ksw: add test script
  docs: add KStackWatch document
  MAINTAINERS: add entry for KStackWatch

Masami Hiramatsu (Google) (1):
  HWBP: Add modify_wide_hw_breakpoint_local() API

 Documentation/dev-tools/kstackwatch.rst |  94 +++++++++
 MAINTAINERS                             |   8 +
 arch/Kconfig                            |  10 +
 arch/x86/Kconfig                        |   1 +
 arch/x86/include/asm/hw_breakpoint.h    |   8 +
 arch/x86/kernel/hw_breakpoint.c         | 148 +++++++------
 include/linux/hw_breakpoint.h           |   6 +
 include/linux/kstackwatch_types.h       |  13 ++
 include/linux/sched.h                   |   5 +
 kernel/events/hw_breakpoint.c           |  36 ++++
 mm/Kconfig.debug                        |  21 ++
 mm/Makefile                             |   1 +
 mm/kstackwatch/Makefile                 |   8 +
 mm/kstackwatch/kernel.c                 | 239 +++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h            |  53 +++++
 mm/kstackwatch/stack.c                  | 194 ++++++++++++++++++
 mm/kstackwatch/test.c                   | 262 ++++++++++++++++++++++++
 mm/kstackwatch/watch.c                  | 181 ++++++++++++++++
 tools/kstackwatch/kstackwatch_test.sh   |  40 ++++
 19 files changed, 1266 insertions(+), 62 deletions(-)
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

