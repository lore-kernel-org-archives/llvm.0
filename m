Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4221C9FD
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931276; cv=none; b=QiYDoy0p8oU3TAGm4uUIhIA5n9OrvxwvbpQ6QXep7bMPD1vCvNT7CBz7IZpEqxj9Byqh8dDkuENqYi9A5y9sUi6wJEtO6tI2IrB/5Yjwd2kULwZ4Ho9HQgHq1iWekqCx25jaW0Iawf3DmA0yeYpSAjewvOgHqwCuBmL2KP2KPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931276; c=relaxed/simple;
	bh=eW+pVPNq6pUpwn/R+30APLTaXgT/SOPjE0za0HesyJU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=A8axP3AmnkVinUozNIxL/6SAH9FBN/vovxAZvUFsdIHn4f4dBnZJMdpY0yaZbAl6F6eIGp2AJWfQ87ThKZxfJHZNfsB7PU4EBeFlDJBUfN/V+5ZZoimPZM6PK+qAp7fIxCYvPCQ1RAvycR69KNnQuSoRSJuIDEc1KZjoJYf/N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6BV1gnx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6BV1gnx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3087a703066so241084a91.0
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931274; x=1745536074; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z/2zlq2Tj6tj35k6ZfjHuLZ56orcGGKn/8U/e3f/O4Q=;
        b=e6BV1gnxBE99fYE6xb93AQ3U7YmZcYoBQ9mm4NFNeQi+G6lAEzwswZU8U9k5jxWI07
         w96jrAlIQ0h+aF50RmyPKUNxRgAHjDAngPtrz2FCdK6rnTpqMZasPYcobLZfviocR7lo
         22m4XmnUCcZGOUOa85617BPPIUSj2bkrJOmK6+7ZF13ASVtB/2qUvdyNsq76Pz8eZH2R
         O6ivJQIQTK0vzW2mZ/1UQbkO0eaDwXLTxtKC3Gsi3NH3LP9feuoM8m2n5CuKmD3um8Ox
         YkDDVzzTOCxK8pWVRTanzD9CE63oWC7BB4lx/Ct0SrL0mgNFgJ6d8dQi+MXIOPcgBTN6
         noKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931274; x=1745536074;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/2zlq2Tj6tj35k6ZfjHuLZ56orcGGKn/8U/e3f/O4Q=;
        b=POEHPmHE8j8p8/AFVNvZKfSQMTFWxXVgUJ3NZZ0my/+PkpXW1MwUftcnzBIRZkJEIG
         yGFAyeN+ow7zwyg5D2qnsGmqSyxBuVaIBKOi5idb0Wn4DYEWFU7fzZWsG5HVzE+ERxpq
         F7RPwXP1HVsJuIjdYchGfHBnpNfLAvUrgPFo8/Vd1c/J1/j5hnN/zJ2rvwF+mufTFxSD
         xRiTLD2SsTJ9a84DPFfxztO4N8QMEnkmlSiAfLJRY/K8P8FKViOWWpUBvohsVYScbfKm
         nMFzfDgH5WhHqPrIveGyKXNB73XAW9FVtTgoKF1tiy40nWQV6/ndXf8UWKqmaZVmr75z
         sSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Rq736Z7rIVYMLet57wD/B1yQhr2wbyQuIEWw+MYlCWLXuVksq8/PFWkqPrH3YE1KZPo3@lists.linux.dev
X-Gm-Message-State: AOJu0YxIKm5lg+9x1htILZtI2P9UoONP6696FDne3TAtTaAygapVGV/z
	ukVRvMj2aNjAdHkOp+bMK9Q9VnR3tdaXTCvuiNVArkhbDln0nYc47t3GnXV1qR7sacGn9jkY9kt
	WKCuKtw==
X-Google-Smtp-Source: AGHT+IEme5uVtpReSBx4abFiN+jJPl/IKgYONZ9vbXWEHG+mWi3mIf7Qt5/n0zi1ykh4AU2sL9xoZ6I/RVCW
X-Received: from pjbsj11.prod.google.com ([2002:a17:90b:2d8b:b0:2e0:915d:d594])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5184:b0:301:1d03:93cd
 with SMTP id 98e67ed59e1d1-3087bbbcd83mr1170053a91.24.1744931274238; Thu, 17
 Apr 2025 16:07:54 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:21 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-1-irogers@google.com>
Subject: [PATCH v4 00/19] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
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
in dependencies and file size if building statically. For something
like `perf record` the disassembler and addr2line functionality won't
be used. Support dynamically loading these libraries using dlopen and
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
6) removes the BUILD_NONDISTRO code, reduces scope and removes what's possible;
7) adds fallback to srcline's addr2line so that llvm_addr2line is
   tried first and then the forked command tried next, moving the code
   for forking out of the main srcline.c file in the process.

The addr2line LLVM functionality is written in C++. To avoid linking
against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
the C++ code with the libLLVM dependency will be built into a
libperf-llvm.so and that dlsym-ed and called against. Ideally LLVM
would extend their C API to avoid this.

The libbfd BPF disassembly supported source lines, this wasn't ported
to the capstone and LLVM disassembly.

v4: Rebase and addition of a  patch removing an unused struct variable.
v3: Add srcline addr2line fallback trying LLVM first then forking a
    process. This came up in conversation with Steinar Gunderson
    <sesse@google.com>.
    Tweak the cover letter message to try to address Andi Kleen's
    <ak@linux.intel.com> feedback that the series doesn't really
    achieve anything.
v2: Add mangling of the function names in libperf-llvm.so to avoid
    potential infinite recursion. Add BPF JIT disassembly support to
    LLVM and capstone. Add/rebase the BUILD_NONDISTRO cleanup onto the
    series from:
    https://lore.kernel.org/lkml/20250111202851.1075338-1-irogers@google.com/
    Some other minor additional clean up.

Ian Rogers (19):
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
  perf srcline: Fallback between addr2line implementations
  perf disasm: Remove unused evsel from annotate_args

 tools/perf/Documentation/perf-check.txt |   1 -
 tools/perf/Makefile.config              |  90 +--
 tools/perf/Makefile.perf                |  35 +-
 tools/perf/builtin-check.c              |   1 -
 tools/perf/builtin-script.c             |   2 -
 tools/perf/tests/Build                  |   1 -
 tools/perf/tests/builtin-test.c         |   1 -
 tools/perf/tests/make                   |   4 +-
 tools/perf/tests/pe-file-parsing.c      | 101 ----
 tools/perf/tests/tests.h                |   1 -
 tools/perf/util/Build                   |   6 +-
 tools/perf/util/addr2line.c             | 439 ++++++++++++++
 tools/perf/util/addr2line.h             |  20 +
 tools/perf/util/annotate.c              |   1 -
 tools/perf/util/annotate.h              |   1 -
 tools/perf/util/capstone.c              | 682 +++++++++++++++++++++
 tools/perf/util/capstone.h              |  24 +
 tools/perf/util/config.c                |   2 +-
 tools/perf/util/demangle-cxx.cpp        |  22 +-
 tools/perf/util/disasm.c                | 628 +------------------
 tools/perf/util/disasm.h                |   6 +-
 tools/perf/util/disasm_bpf.c            | 195 ------
 tools/perf/util/disasm_bpf.h            |  12 -
 tools/perf/util/dso.c                   |  98 +++
 tools/perf/util/dso.h                   |   4 +
 tools/perf/util/llvm-c-helpers.cpp      | 120 +++-
 tools/perf/util/llvm-c-helpers.h        |  24 +-
 tools/perf/util/llvm.c                  | 484 +++++++++++++++
 tools/perf/util/llvm.h                  |  21 +
 tools/perf/util/map.c                   |  19 +-
 tools/perf/util/map.h                   |   6 +-
 tools/perf/util/print_insn.c            | 117 +---
 tools/perf/util/srcline.c               | 772 +-----------------------
 tools/perf/util/srcline.h               |   7 +-
 tools/perf/util/symbol-elf.c            |  95 ---
 tools/perf/util/symbol.c                | 135 -----
 tools/perf/util/symbol.h                |   4 -
 37 files changed, 2020 insertions(+), 2161 deletions(-)
 delete mode 100644 tools/perf/tests/pe-file-parsing.c
 create mode 100644 tools/perf/util/addr2line.c
 create mode 100644 tools/perf/util/addr2line.h
 create mode 100644 tools/perf/util/capstone.c
 create mode 100644 tools/perf/util/capstone.h
 delete mode 100644 tools/perf/util/disasm_bpf.c
 delete mode 100644 tools/perf/util/disasm_bpf.h
 create mode 100644 tools/perf/util/llvm.c
 create mode 100644 tools/perf/util/llvm.h

-- 
2.49.0.805.g082f7c87e0-goog

