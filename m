Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4AD253325
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953150; cv=none; b=WqRxb+oLw4twipxG6t+1gb7PMzZDKKWYe/PlNtz2rtzbIyQZnyKI+5MmrmtXCH/Z44Mtq/XaR/by/fhOgPc27zTzp7+wwwRREdN4ppq2LqXcvukJFLlGP1DPX2N0L4PX5G4mMsXICGmTOCIq7/6EhO+cXTRoVWmHp6hf8fGRP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953150; c=relaxed/simple;
	bh=JKuR2HnO4uDM9v+Z7llC/3uiDFowURfwK74QDWYhdv8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=TQ7XBwScdkNAUu3gdvEZOZYmS5dxcv3EpZTssW8/aCKYOu59X4jCPo2ofGUjOEM0sikBFmo2v7wlOYN8EtqUSoKGbGIi+DGo9vcKc37UBNjhj8Qes7TpgL4DFrMhWoVTqVC/NZUfDPtAoLm7DXa2wBp5Z5D8Q2gbKJbBKNgvSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LnUh2ZGB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LnUh2ZGB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso8633271a91.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953148; x=1746557948; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eXJ8J07H9GMYt3devST83hdUmEga5s87LMXmrPwfkrE=;
        b=LnUh2ZGB13WJKAvppcrVOA9rPoOBshAPHr1nxgzzH40ISmjxRdz4qk7BXo3LvTw1Fb
         te5jeSB0BdJJcOXGvUAFbgJJeIp9EI2MApr3YmkNoYKGnak17dk4Hlkg1Ic7h7uqb88M
         W2gpeBFq19PpkgsJg/nMRjDyxeBUAsKnbmj1JG4P+Y+CIoh4p8QFyiA5At4kbY9ZThRS
         Z6fI7t7OXNzdP5go7+Y3jxtIDMLbaTiQpbG9R7mnLXKq4abXJFdGImt/pAI5474p8Dc2
         BpuRq3osNadFOzcqPmXiNcyN97anhctdT8RTfG9tF5c4usEfowVFpEWJvzcGJOZYluNC
         dSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953148; x=1746557948;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eXJ8J07H9GMYt3devST83hdUmEga5s87LMXmrPwfkrE=;
        b=QU/4GEpeDFppUCVBTKjKESXzXqsXmnioSb+0oo/5fk/X6MxDL61TRUSluZN+xMaMJB
         nz6TPM1QCRIw9qyB9SoAlIsjp6QAC0DAvqdbJQmwi/6DqK1RN1aPzPgvEMXX29fNF8uV
         +BgVlZnuMvkc0QYkvtdVzGdlDxYlZmQgk1DbA3W4MnK76jm2RmthMHL9MX405XRKhFax
         1K1M/vC7gbNvNxy2dcj5wV0PNlzlTwC/hj27MCZ208IBPRgearbS8jW7RhTUwRDUoLH3
         OR6VhoSHusnAytVr0Dpq926oLEl87Ijc55fXDvIN9HLfy0tMIXUU5F0UKTNvC2GOa5Hm
         pgmw==
X-Forwarded-Encrypted: i=1; AJvYcCU3wOV3UPQ3pfHya6RWwCH2lPhf7yZvJGR9wOv8EFm/jvYAwAXsxhNL1y/+kKwD4WM2Mdqw@lists.linux.dev
X-Gm-Message-State: AOJu0YydJRHLro9DpnT6t47pDjOSDNybgwOOY5Di3K2Ef1rdF2ZI1/X/
	yRgf7I+ekYPBEdUH+wdiT6Vivmz2OjGQEple+bdt4GILlzoZ9nAa5hlI4TR7QiQ6TIQwb9Qguh4
	mH7OAoA==
X-Google-Smtp-Source: AGHT+IEwoN0N6+nJ6vqr/dgRzJLp6ISNYWD1HN7A2s+gg7YV9C0xR0d2OaoIaTgW058JKbZw1oATFTbdIpRF
X-Received: from pjbsm11.prod.google.com ([2002:a17:90b:2e4b:b0:301:2a0f:b03d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1346:b0:301:1c11:aa74
 with SMTP id 98e67ed59e1d1-30a333530c8mr307400a91.28.1745953148279; Tue, 29
 Apr 2025 11:59:08 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-1-irogers@google.com>
Subject: [PATCH v1 0/6] Use rustc-demangle for Rust demangling
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"

Discussion of improved Rust demangling started with:
https://lore.kernel.org/lkml/jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhynd6wvrsu@fcz6vrvepybb/
that led to implementing a Rust v0 demangler:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
Discussion on that patch series led to the rust-lang issue:
https://github.com/rust-lang/rust/issues/60705
where the pre-existing Rust C demangler, authored by
github.com/arielb1, was mentioned. There wasn't progress on that issue
and so I've pulled that work into perf as discussed on the issue.

Ian Rogers (6):
  perf demangle-rust: Add rustc-demangle C demangler
  perf symbol-elf: Integrate rust-v0 demangling
  perf demangle-rust: Remove previous legacy rust decoder
  perf test demangle-rust: Add Rust demangling test
  perf test demangle-java: Switch to using dso__demangle_sym
  perf test demangle-ocaml: Switch to using dso__demangle_sym

 tools/perf/tests/Build                   |    1 +
 tools/perf/tests/builtin-test.c          |    1 +
 tools/perf/tests/demangle-java-test.c    |   17 +-
 tools/perf/tests/demangle-ocaml-test.c   |    7 +-
 tools/perf/tests/demangle-rust-v0-test.c |   74 +
 tools/perf/tests/tests.h                 |    1 +
 tools/perf/util/Build                    |    5 +-
 tools/perf/util/demangle-rust-v0.c       | 2035 ++++++++++++++++++++++
 tools/perf/util/demangle-rust-v0.h       |   81 +
 tools/perf/util/demangle-rust.c          |  269 ---
 tools/perf/util/demangle-rust.h          |    8 -
 tools/perf/util/symbol-elf.c             |   49 +-
 12 files changed, 2243 insertions(+), 305 deletions(-)
 create mode 100644 tools/perf/tests/demangle-rust-v0-test.c
 create mode 100644 tools/perf/util/demangle-rust-v0.c
 create mode 100644 tools/perf/util/demangle-rust-v0.h
 delete mode 100644 tools/perf/util/demangle-rust.c
 delete mode 100644 tools/perf/util/demangle-rust.h

-- 
2.49.0.901.g37484f566f-goog

