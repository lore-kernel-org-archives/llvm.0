Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392049;
	b=eYCa0w1pQo+e2wG3Ou0/YXeiwCsmn03A6TE7/yuBglhyY1RrhS5WaeTQBYopCfEmfpjq
	 SkuTYUk3JgnDlQntp0UL3jQUiYZ6GsfYzcgLtBoUlxDZgxmoW61M9lo+o6TAXP8huSDMj
	 7QIYe3SU42Zq+HYngfOVaBCe1K4TcXRKr9PNlQK2ZwJRxkLonah5KLKK0Pm6T0kpZJ+KW
	 t0JSrz2LMlwDecvzOEzLXH5cOx6AC6rLSLfhB5Nn388ATz3grLMsqdOb+4iiFSAkZ7yps
	 GgihSXnR5Oz9tBfm6ybErPoflzFD5IeJjMQJo72peRiMo3CBgFhVdFN1JftxD8v8hJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
	b=fOQGN6kXshrqtbxAEJfacY4m87td1Bh91oz6BU8OxEp/VPk8q2uwZGFg1qhcHXNpNzgW
	 ezFczFiNRc7Exi5GixhVIeSSyvzvkhaj13E60V3D+C0f+1C8CUBOhjUiyFciFssp8ncvq
	 Mo5crHiqJmXMjxFa1xkzrXxJvAOP0Co4x4O9z+embeZoPDuZojjFPJ7pkaawEY8HxS1kD
	 sLabI+zJAHNvAtPUwuU60vNORA/YTHFBify3Egb1AXHCj1Kcp8lUVY3c4qLu+vq1QoiQD
	 G86LDSJENpOPtTpkRIhWRo9qUpELnwPanMbr36+9meMT7GJpgvGaA6pVZCTlNQUFNRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BtF/ZK1I";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC04606A320
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 20:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC04606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BtF/ZK1I
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1731095eec.1
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392047; x=1793996847; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
        b=BtF/ZK1INo0m35fIb2SmTKX8TUXJyYAlS+BqgHJrCQiXGbUl5ZAZfBR7YBFwWrR7a+
         LrPmGfRk9xGYg5oni+MC5BgOdP4vjdywRSQphdBlY32ZVtEbaIqmgoAxs0fW57TmvXIH
         CImePksyICuzSD54VGcBVamCaXIQjZLVpv+S4eL68ouKEfaz2nYeACGepSd/MHKS7HZV
         /VMt/Uos1LOpSOatSbIou2wQFMKtUZ0/PlBCm9aYxBcdhFv2BDHQlwcMiLFRZuzFVmuM
         KTGrcCjhg9dCTGTM3jkr8cQcLGVt/lZnxS9STd5csYr9JWRWzaZnhXX5dWvH0XgrqG2j
         lZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392047; x=1793996847;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
        b=wFCq4NA25oOnVoT/fOjzEjk8Ggahtd4vZPhGJw99xp3ob0fBSYbcONQ0jSOKFML88y
         UXkwQ5p7s3Vb4u4vYXtkT4OTSlenaLfRDW5OGiewD3RWfFsi6Z5LSgqsX5ZoWe9qte20
         tku6SSpzGYUFOCodbbPy/ZczL7eWMaqI7AwKZaGUeGCrk4sTewdjKY/NeM7ocQEdKBnb
         rfXfUl58p5GEozHuMCGMTkonhc+p/+zJoJghxdZVFtBYQlP59evnEXA4h/pD1i2a/nqR
         8uMcxrxLhpTF1vLXD45ljCQBiowilnS4bvTvL2PSTehdUy1PxVoVdQt5y9j2jrZt60vN
         eNFw==
X-Forwarded-Encrypted: i=1; AKwUvBywm0UCCIA8vvNU0iPVguGgNRpQHRl964OtFJwlEjOyxVTR0QcbpKDeMVsgEmuK38R9/0al@lists.linux.dev
X-Gm-Message-State: AFq9FYLOsa/UpPb6WNQsc7HPP2eXXdTHEejqFL9kNM3L1Mbef/LoR476
	U89b03wW7+DYOjoQ4vjJ4yCy3SPNZxid5RZxlG8kx4WygiXvxOMpwWa3AkVwcm8YZBbKZJ5k5fU
	eLEc3Wj1T9g==
X-Received: from dlbtp7.prod.google.com ([2002:a05:7022:3b87:b0:15f:5ef4:b896])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1602:b0:1a8:4997:65f6
 with SMTP id a92af1059eb24-1ac5d88c579mr6176377c88.20.1793392046539; Fri, 30
 Oct 2026 13:27:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:27:07 -0700
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
Message-ID: <20261030202710.3863806-1-irogers@google.com>
Subject: [RFC PATCH v2 0/3] tools: Add Rust library build infrastructure and
 prefer zlib-rs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Quentin Monnet <qmo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The zlib-rs project (https://github.com/trifectatechfoundation/zlib-rs)
provides a memory-safe, high-performance Rust implementation of the zlib
compression specification along with a C ABI layer (libz-rs-sys) that is a
drop-in replacement for the standard C zlib library. Transitioning
decompression of kernel configuration files (/proc/config.gz), compressed
ELF/BTF sections, and perf data from C zlib to zlib-rs improves both memory
safety and decompression performance.

On many Linux distributions (such as Debian, Ubuntu, and Fedora), Rust
crates like zlib-rs and libz-rs-sys are packaged as Cargo registry sources
under /usr/share/cargo/registry/ (e.g. librust-libz-rs-sys-dev or
rust-libz-rs-sys-devel) rather than as prebuilt C shared libraries, while
other environments may install prebuilt libz_rs libraries via pkg-config or
a custom prefix (LIBZ_RS_DIR).

This RFC series lays the groundwork for building and linking Rust crate
libraries in tools/ offline from the system Cargo registry and integrates
zlib-rs support into perf and bpftool, preferring zlib-rs over C zlib when
available:

1. **tools build: Add Rust library build infrastructure and zlib-rs feature test**:
   - Adds `tools/build/Makefile.rust` with helpers to resolve C compiler and
     linker flags for Rust libraries via `%-cflags` and `%-libs` targets.
   - Resolves `zlib-rs` compiler and linker flags via `LIBZ_RS_DIR`,
     `pkg-config` (`libz-rs-sys-cdylib`, `zlib-rs`, `z_rs`), or building
     `libz_rs.a` (with the `export-symbols`, `c-allocator`, `std`, and `gz`
     features) into `$(OUTPUT)libz_rs/` from `/usr/share/cargo/registry`
     using offline Cargo (`cargo metadata --offline` and
     `cargo build --offline`).
   - Adds `tools/build/feature/test-zlib-rs.c` checking
     `ZLIB_VER_SUBREVISION == 15` (`0xf`, which distinguishes
     `libz-rs-sys`'s `zlib.h` from standard C `zlib.h`) and linking against
     `inflateInit()`.
   - Extends `tools/scripts/Makefile.include` with cross-compilation target
     triples (`RUST_TARGET_FLAGS_<arch>`) and the `feature_rust_lib` macro.

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

Changes in v2:
- Use offline Cargo (`cargo metadata --offline` and `cargo build --offline`
  configured against `CARGO_REGISTRY_DIR` = `/usr/share/cargo/registry` and
  isolated from `~/.cargo`) to resolve crate versions, dependency graphs,
  features, and build scripts instead of manually globbing crate directory
  names and invoking `rustc` on hardcoded `.rlib` edges (Miguel Ojeda).
- Avoid including `../../scripts/Makefile.arch` in `tools/bpf/bpftool/Makefile`
  (to keep the standalone bpftool mirror self-contained) by placing
  `RUST_TARGET_FLAGS_<arch>` in `tools/scripts/Makefile.include`, and expand
  the bpftool commit message on the security and performance motivation for
  preferring `zlib-rs` (Quentin Monnet).
- Drop unused `.rlib` pattern rules and helpers from `tools/build/Build.include`
  and `tools/build/Makefile.build` (Sashiko).
- Address Sashiko review feedback on `PKG_CONFIG` handling when unset or with
  `-static`, `test-all.bin` re-checking `zlib-rs` and `rust`, preserving
  `EXTRA_CFLAGS` optimization defaults when building `libbpf.a`, and
  honoring `NO_ZLIB_RS=1` in `bpftool` when `FEATURES_DUMP` is used.

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Antigravity coding assistant and Sashiko automated patch
  review using Gemini 4 LLMs.
- Summary of prompts and assistance: Interactive pair-programming session to
  identify distro packaging for zlib-rs/libz-rs-sys, implement the zlib-rs
  feature test and offline Cargo build rules in Makefile.rust, integrate
  zlib-rs detection into perf and bpftool, separate Rust library outputs
  into $(OUTPUT)libz_rs/, and address reviewer and automated Sashiko
  feedback.
- Testing performed: Built and tested perf and bpftool with zlib-rs
  (default), NO_ZLIB_RS=1 (fallback to C zlib), NO_ZLIB=1, and MINIMAL=1;
  verified `perf version --build-options`, `perf check feature`, and the
  `make_no_zlib` / `make_no_zlib_rs` tests in `tools/perf/tests/make`; and
  checked all commits with `scripts/checkpatch.pl`.

Ian Rogers (3):
  tools build: Add Rust library build infrastructure and zlib-rs feature
    test
  perf build: Prefer zlib-rs over zlib when available
  bpftool: Prefer zlib-rs over zlib when available

 tools/bpf/bpftool/.gitignore             |   1 +
 tools/bpf/bpftool/Makefile               |  57 +++++++++-
 tools/build/Makefile.feature             |  12 +-
 tools/build/Makefile.rust                | 160 +++++++++++++++++++++++
 tools/build/feature/.gitignore           |   1 +
 tools/build/feature/Makefile             |  11 +-
 tools/build/feature/test-zlib-rs.c       |  19 +++
 tools/perf/.gitignore                    |   1 +
 tools/perf/Documentation/perf-check.txt  |   1 +
 tools/perf/Makefile.config               |  88 +++++++------
 tools/perf/Makefile.perf                 |  32 ++++-
 tools/perf/bpf_skel.mak                  |   8 +-
 tools/perf/builtin-check.c               |   1 +
 tools/perf/scripts/install-build-deps.sh |   6 +
 tools/perf/tests/make                    |   9 ++
 tools/scripts/Makefile.include           |  25 ++++
 16 files changed, 382 insertions(+), 50 deletions(-)
 create mode 100644 tools/build/Makefile.rust
 create mode 100644 tools/build/feature/test-zlib-rs.c

-- 
2.56.0.317.g454f8302e1-goog

