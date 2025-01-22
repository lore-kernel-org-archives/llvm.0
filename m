Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D618CBFE
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 06:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527027; cv=none; b=Vxp7eVuqo4Edk8rXSxnVkRJ3cXrMfb+L2Ulb5BMfgJbWCk9VuQFqCnHRADPkL1B6tRcYTOPHTs/BRL7xgedAwvVqxSkFySAheWN3dLSjKR7ytr0IkAUQNsIwZhRz1WT54L5MnMf75OjsbCAPx2OMAuMHFZe67NowVXtJfWyB6oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527027; c=relaxed/simple;
	bh=csE5eO77txt/1tgULDwPBlUQn51ePKLm4FAc5Dc7JmA=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=GRb+ICbFm3j7ub9CfgYT0KmevM+1XSX6tUuP2bGI9lbPrSKqFhDjB8if0Y0JSrGDR3VEfrUmdZqnGwmVKoWjKRuzSFgddZkbfPLTy5IORbY0rVfv7KbC5MCraSyp2gpBBBbnwOBbZLYTXfhUjsUAStdbzDgrhGdT2lOBk4xArMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSYd4uxG; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSYd4uxG"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e575f472438so14403295276.1
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527024; x=1738131824; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMZxZB2QjSpIDp5wnSfQlTa2w8/qiOlFxFu++p/vc3s=;
        b=OSYd4uxGfJWoMaaxjEhiUFLZKr2PnqJNKTLv+3HYmyOEBX+4VEa/E2Kh2lYGMh0Aoy
         8E1eZJKgxEp7ErDQsSLk2fcm7xh5W45GK9CIo7kXYPSzg+N9tau+wpRloePSGmy5JVhO
         s9me7gsfNDq5LIrK2K/jNsJk2XLWy4rDBs0nM5/QhaOr+CXVgfIZc7G7XMJmmWpllKoR
         QDotbwATiS/DnA5Td3Lu49OFhRtf2YKmYkU0qhdIqCSDHjTMFchGvJi3Yuu+W428oGKM
         raB8lFquGENWQsgovoh1DIsCvPppnErSOLusQa6CYWFM4ZGO1hzxpbnVqhUPc/Jy1ptM
         xlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527024; x=1738131824;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMZxZB2QjSpIDp5wnSfQlTa2w8/qiOlFxFu++p/vc3s=;
        b=b77QNv+QZ1K4SKuLNC/rbkNyl0PhSjppJS1w557MH3LXN4Rt7onY1VFzSpCxX4LRto
         s4CPiQZN+5EXpBtFJb6NzO79/kZnSJ3kqLbTs3SOBpf+i0G/TLryN2jeTv8wyX0ZNKfx
         S30v2+Ky/0X4NIzycf5OlYbg0DPNTEmnV/0p++nbAa6awzSi+AdQjbtszJpXbIvVcZiO
         14Dkh1nVuQsys6KQJZpiFudIaL8OCXbIbXzOvOfz9TFMPggEkUqVrVPElGgXHF6+Kj2M
         u+psnjYnXuk7NtVcvTt9HxBjhjFDftksTKyfMC5VjwBssTPQ7MNcZ9FNM+iIeN+aVPQ/
         JJQw==
X-Forwarded-Encrypted: i=1; AJvYcCXitZ/fUY7Qx249lzudBLhwsuJHucIxLtcZusFajhtwZsCzyxuDcYoR1bo2RpWY2pGV6Jji@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm5uG5OYsENIXYNeGzJDwQaVGoqKOEvzW+gxXbLkKPJimjZnQ0
	ZNBk65mD3K6r8YXkBch3WMaZECPlc0qy4O4WkWLcpVl/STHaTOAfMqyCQcVwNHwaQCG897NB/eg
	5ktXNMg==
X-Google-Smtp-Source: AGHT+IFesCcSUy5QR6NwPlyI9//F17lW3wX3r/cz01SIvg7MVkFwQV5BfyGn58F73PrknjQthN5LEM/A3L1B
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a05:690c:6101:b0:6f6:d314:49c9 with SMTP
 id 00721157ae682-6f6eb949eefmr515577b3.8.1737527024453; Tue, 21 Jan 2025
 22:23:44 -0800 (PST)
Date: Tue, 21 Jan 2025 22:23:15 -0800
Message-Id: <20250122062332.577009-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v2 00/17] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Linking against libcapstone and libLLVM can be a significant increase
in dependencies and size of memory footprint. For something like `perf
record` the disassembler and addr2line functionality won't be
used. Support dynamically loading these libraries using dlopen and
then calling the appropriate functions found using dlsym.

BUILD_NONDISTRO is used to build perf against the license incompatible
libbfd and libiberty libraries. As this has been opt-in for nearly 2
years, commit dd317df07207 ("perf build: Make binutil libraries opt
in"), remove the code to simplify the code base.

The patch series:
1) does some initial clean up;
2) moves the capstone and LLVM code to their own C files,
3) simplifies a little the capstone code;
4) adds perf_ variants of the functions that will either directly call
   the function or use dlsym to discover it;
5) adds BPF JIT disassembly support to LLVM and capstone disassembly;
6) removes the BUILD_NONDISTRO code, reduces scope and removes what's possible.

The addr2line LLVM functionality is written in C++. To avoid linking
against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
the C++ code with the libLLVM dependency will be built into a
libperf-llvm.so and that dlsym-ed and called against. Ideally LLVM
would extend their C API to avoid this.

The libbfd BPF disassembly supported source lines, this wasn't ported
to the capstone and LLVM disassembly.

v2: Add mangling of the function names in libperf-llvm.so to avoid
    potential infinite recursion. Add BPF JIT disassembly support to
    LLVM and capstone. Add/rebase the BUILD_NONDISTRO cleanup onto the
    series from:
    https://lore.kernel.org/lkml/20250111202851.1075338-1-irogers@google.com/
    Some other minor additional clean up.

Ian Rogers (17):
  perf build: Remove libtracefs configuration
  perf map: Constify objdump offset/address conversion APIs
  perf capstone: Move capstone functionality into its own file
  perf llvm: Move llvm functionality into its own file
  perf capstone: Remove open_capstone_handle
  perf capstone: Support for dlopen-ing libcapstone.so
  perf llvm: Support for dlopen-ing libLLVM.so
  perf llvm: Mangle libperf-llvm.so function names
  perf dso: Move read_symbol from llvm/capstone to dso
  perf dso: Support BPF programs in dso__read_symbol
  perf llvm: Disassemble cleanup
  perf dso: Clean up read_symbol error handling
  perf build: Remove libbfd support
  perf build: Remove libiberty support
  perf build: Remove unused defines
  perf disasm: Remove disasm_bpf
  perf disasm: Make ins__scnprintf and ins__is_nop static

 tools/perf/Documentation/perf-check.txt |   1 -
 tools/perf/Makefile.config              |  90 +---
 tools/perf/Makefile.perf                |  35 +-
 tools/perf/builtin-check.c              |   1 -
 tools/perf/builtin-script.c             |   2 -
 tools/perf/tests/Build                  |   1 -
 tools/perf/tests/builtin-test.c         |   1 -
 tools/perf/tests/make                   |   4 +-
 tools/perf/tests/pe-file-parsing.c      | 101 ----
 tools/perf/tests/tests.h                |   1 -
 tools/perf/util/Build                   |   5 +-
 tools/perf/util/annotate.h              |   1 -
 tools/perf/util/capstone.c              | 682 ++++++++++++++++++++++++
 tools/perf/util/capstone.h              |  24 +
 tools/perf/util/demangle-cxx.cpp        |  22 +-
 tools/perf/util/disasm.c                | 632 +---------------------
 tools/perf/util/disasm.h                |   5 +-
 tools/perf/util/disasm_bpf.c            | 195 -------
 tools/perf/util/disasm_bpf.h            |  12 -
 tools/perf/util/dso.c                   |  98 ++++
 tools/perf/util/dso.h                   |   4 +
 tools/perf/util/llvm-c-helpers.cpp      | 120 ++++-
 tools/perf/util/llvm-c-helpers.h        |  24 +-
 tools/perf/util/llvm.c                  | 489 +++++++++++++++++
 tools/perf/util/llvm.h                  |  24 +
 tools/perf/util/map.c                   |  19 +-
 tools/perf/util/map.h                   |   6 +-
 tools/perf/util/print_insn.c            | 117 +---
 tools/perf/util/srcline.c               | 306 +----------
 tools/perf/util/srcline.h               |   6 +
 tools/perf/util/symbol-elf.c            |  95 ----
 tools/perf/util/symbol.c                | 135 -----
 tools/perf/util/symbol.h                |   4 -
 33 files changed, 1552 insertions(+), 1710 deletions(-)
 delete mode 100644 tools/perf/tests/pe-file-parsing.c
 create mode 100644 tools/perf/util/capstone.c
 create mode 100644 tools/perf/util/capstone.h
 delete mode 100644 tools/perf/util/disasm_bpf.c
 delete mode 100644 tools/perf/util/disasm_bpf.h
 create mode 100644 tools/perf/util/llvm.c
 create mode 100644 tools/perf/util/llvm.h

-- 
2.48.0.rc2.279.g1de40edade-goog

