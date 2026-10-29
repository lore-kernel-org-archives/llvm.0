Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291409;
	b=mQPHnWl2y8M36oZgMekGXxZ+HgEqQl70dZsUSaCpOmhvCbelU6mpqmKM3sRVCuqJ2LAx
	 Rlc3qIul+CpEdbmQn0TVb/H6JhsngSUo2lRYGX6ByKkae9GJKdU+Fn6EdjUx0PTjDQe0K
	 WKEHDnx4PYSo83r6YIAOZVsw5PixBC9eUYZ8Fe9OD0Ijdp+7WuuEiHV7wASLidAWGfQuh
	 xDVbcK4JX1B3Zc2znSr8zgutYUZlSh0W7A+otC/Q0l8LsIBcAi4x/SPYRZP73m4BpIiDK
	 EsSRD1f+xW83BXp2JWTqkMgYKajxCgCbTDFTi9TxXuk+f3v642vaZfCH/ggc/g6Muqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
	b=QR9sm3wU8kjTJhqg0IJUp5ptDE5kJXBLhAa8QKjfejLZsY5A316JkeO9Z3n+awWXstBM
	 aDDCM/BRHB+44NKZpRDqnIxp7szYhpVZgsGGSDOru08gfRlXq5OudaU+zdqwUmn8O0nb1
	 P/nC7/5hi4Pqqq4rb3QSeH3NGG95qrzXsBzIeXVFX55LofB2q89I5+MBBf8YwaIvdQZUo
	 kAfTOBeNCanw17+yvpvWRVYmtiCZhyofE9WzVxD4fp0ru4ELMCQstYg7YhhGMYdV6M9CH
	 51CgD0o+XZVxYVa4CtWNwq5vluwNWNgAT41+Ekqx+EapRopyUgBoU3Ia6WX2bFbqmdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OnbzuRQY;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FA606A324
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 16:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A57FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OnbzuRQY
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so3067738eec.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793291408; x=1793896208; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
        b=OnbzuRQYsuAhI+A8y/Q76gXgXpQllsBHHitgBXmHri+5S27bguv9sqMQVdg5XQ0fXY
         RMTrnN8eBC+3kITkDeD/YDafaQHcT3pHHAorWhwKact6injidrsWz4JrLkEED+IyGBoD
         ukE//xA/zCN7hPNli07sIEzpKkz33Q0f9cS5ZZTrUhnYFxSvU64JzhDrsAPlWi4vBsLB
         RC09h+zneAxvua+ZDhSbYN7LozxuXI40xI2vCnN/kfwF8M1PT67aCh9l3dqxzxmlbW+W
         +B/oYTVazuVObMV9vdq1xNyLPoapzaALxWunx6A+Cej50+VlL7t/veOFuOpkcdbOqhSL
         Lkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291408; x=1793896208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
        b=BsPi9B/2jvlb5YIk6ZVkCjl3IUar+hzXzGnJglb31rBmqLQZ2fxdsYhXT2ZMDbUvHg
         7XHvh3gdIXHY9SjQ74b33qUcSi5mJUWkGgdueE7CUufi6fTyvyEK5tRKaIYyH0NT9TdV
         aZF/OjCD7h1QmR15TxjwAMUHbu7SSXTPNIRtRPgJcDvwq6WDQQvftJ3AIKFSK2uCDWHf
         aitVvU93YRunOa+pB62ajiswXhrV0i2howcTX9a6ImGAI3UUtoep1671T55j/r+ilu2j
         TfFFy/gKvARCOlyNHcDS2JjqlmVN/QORtTbn0Q3MssJ+6VQky4/G9c8iCdJ872CSHJUG
         0eSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhwoqUCBjBpHR7YiBzqGCVR/20w4DCvfE+oKEW1fSTzvp48his31qOEKEkSodMqs5hmpXw@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ2g1r7BTVi08YGf9Ey2YLiE0RVo6cbvA4AdjjjgY+YI8+ordV
	czEcwkBg3t2ia3Zml5vBthXMoZP20koNyB5q2R6vnsvm6ZlxQz2lOejSrWKyLO79DJ/E7tr0CPj
	a5a8gbDCT5Q==
X-Received: from dlbsv1.prod.google.com ([2002:a05:7022:3a01:b0:1a1:3ce6:560b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4513:10b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-1a6ce209ce7mr7204887c88.24.1793291407265; Thu, 29
 Oct 2026 09:30:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:29:55 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029162958.3224280-1-irogers@google.com>
Subject: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure and
 prefer zlib-rs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Quentin Monnet <qmo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The zlib-rs project (https://github.com/trifectatechfoundation/zlib-rs)
provides a memory-safe, high-performance Rust implementation of the zlib
compression specification along with a C ABI layer (libz-rs-sys) that is a
drop-in replacement for the standard C zlib library.

On many Linux distributions (such as Debian and Ubuntu), Rust crates like
zlib-rs and libz-rs-sys are packaged as Cargo registry sources under
/usr/share/cargo/registry/ (e.g. librust-libz-rs-sys-dev) rather than as
prebuilt C shared libraries, while other environments may install prebuilt
libz_rs libraries via pkg-config or a custom prefix (LIBZ_RS_DIR).

This RFC series lays the groundwork for building and linking Rust crate
libraries in tools/ (without requiring network access or invoking cargo) and
integrates zlib-rs support into perf and bpftool, preferring zlib-rs over C
zlib when available:

1. **tools build: Add Rust library build infrastructure and zlib-rs feature test**:
   - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crate
     sources in distro (`/usr/share/cargo/registry`) or local Cargo
     registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites to
     explicit `--extern <crate>=<path>` flags, and compile `.rlib` and `.a`
     targets directly with `rustc`.
   - Resolves `zlib-rs` compiler and linker flags via `LIBZ_RS_DIR`,
     `pkg-config` (`libz-rs-sys-cdylib`, `zlib-rs`, `z_rs`), or compiling
     `liblibc.rlib`, `libzlib_rs.rlib`, and `libz_rs.a` (with the
     `export-symbols`, `c-allocator`, `std`, and `gz` features) into
     `$(OUTPUT)libz_rs/`.
   - Adds `tools/build/feature/test-zlib-rs.c` checking
     `ZLIB_VER_SUBREVISION == 15` (`0xf`, which distinguishes
     `libz-rs-sys`'s `zlib.h` from standard C `zlib.h`) and linking against
     `inflateInit()`.
   - Extends `tools/build/Build.include`, `tools/build/Makefile.build`,
     `tools/scripts/Makefile.arch`, and `tools/scripts/Makefile.include`
     with reusable Rust build rules, cross-compilation target triples
     (`RUST_TARGET_FLAGS_<arch>`), and the `feature_rust_lib` macro.

2. **perf build: Prefer zlib-rs over zlib when available**:
   - Moves Rust detection ahead of zlib detection in
     `tools/perf/Makefile.config` and prefers `zlib-rs` over C `zlib` unless
     `NO_ZLIB_RS=1` (or `NO_ZLIB=1` / `NO_RUST=1`) is set.
   - Defines both `HAVE_ZLIB_SUPPORT` and `HAVE_ZLIB_RS_SUPPORT` when
     `zlib-rs` is used so existing zlib call sites in `perf` work unchanged
     while `perf version --build-options` and `perf check feature zlib-rs`
     report whether `zlib-rs` is active.
   - Shares `$(OUTPUT)libz_rs/` with the host bootstrap `bpftool` build in
     `tools/perf/bpf_skel.mak` and adds `NO_ZLIB` / `NO_ZLIB_RS` tests to
     `tools/perf/tests/make`.

3. **bpftool: Prefer zlib-rs over zlib when available**:
   - Adds `zlib-rs` and `zlib` to `FEATURE_TESTS` and `FEATURE_DISPLAY` in
     `tools/bpf/bpftool/Makefile` and configures `ZLIB_CFLAGS` and
     `ZLIB_LIBS` via `feature_rust_lib` when `zlib-rs` is detected.

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Antigravity coding assistant and Sashiko automated patch
  review using Gemini 4 LLMs.
- Summary of prompts and assistance: Interactive pair-programming session to
  identify distro packaging for zlib-rs/libz-rs-sys, implement the zlib-rs
  feature test and Makefile.rust crate build rules, integrate zlib-rs
  detection into perf and bpftool, separate Rust library outputs into
  $(OUTPUT)libz_rs/, and address automated review feedback on crate version
  sorting, cross-compilation flags, and libbpf EXTRA_CFLAGS handling.
- Testing performed: Built and tested perf and bpftool with zlib-rs
  (default), NO_ZLIB_RS=1 (fallback to C zlib), NO_ZLIB=1, and MINIMAL=1;
  verified `perf version --build-options`, `perf check feature`, and the
  `make_no_zlib` / `make_no_zlib_rs` tests in `tools/perf/tests/make`; and
  checked all commits with `scripts/checkpatch.pl`.

Assisted-by: Antigravity:gemini-4

Ian Rogers (3):
  tools build: Add Rust library build infrastructure and zlib-rs feature
    test
  perf build: Prefer zlib-rs over zlib when available
  bpftool: Prefer zlib-rs over zlib when available

 tools/bpf/bpftool/.gitignore             |   1 +
 tools/bpf/bpftool/Makefile               |  56 ++++++++-
 tools/build/Build.include                |  14 ++-
 tools/build/Makefile.build               |  13 +-
 tools/build/Makefile.feature             |   9 +-
 tools/build/Makefile.rust                | 149 +++++++++++++++++++++++
 tools/build/feature/.gitignore           |   1 +
 tools/build/feature/Makefile             |   9 +-
 tools/build/feature/test-zlib-rs.c       |  19 +++
 tools/perf/.gitignore                    |   1 +
 tools/perf/Documentation/perf-check.txt  |   1 +
 tools/perf/Makefile.config               |  89 ++++++++------
 tools/perf/Makefile.perf                 |  32 ++++-
 tools/perf/bpf_skel.mak                  |   8 +-
 tools/perf/builtin-check.c               |   1 +
 tools/perf/scripts/install-build-deps.sh |   6 +
 tools/perf/tests/make                    |   9 ++
 tools/scripts/Makefile.arch              |  14 +++
 tools/scripts/Makefile.include           |  10 ++
 19 files changed, 385 insertions(+), 57 deletions(-)
 create mode 100644 tools/build/Makefile.rust
 create mode 100644 tools/build/feature/test-zlib-rs.c

-- 
2.56.0.313.g2479322e68-goog

