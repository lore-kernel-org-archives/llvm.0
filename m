Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007FA921
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973699; cv=none; b=E5owCOCBQlDUJSJTpsz1jgn1kBY+QH1gaDFnrQP5HZu0jg1lmeyU6xIecyMgzGqTMthZ1b7saZtteBQW5Hx6LlXRp7R+9aUHPT5m06SjAv0fPzQZWZWdncoABafraAeCLbJdE+RoGy0q+BWtZcZqvFUmdINxFMixT2U00/F2UAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973699; c=relaxed/simple;
	bh=TOqGYGaZz9fvoejadFEUP6gpffSVdtLwcV7I+VdXHNY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kCuW3hO1wYwI5oTdP+zzaG3u5SOx0P709DZAfO97S2NsJtLdTE+229NxrVDB57mepU95Q1kzWzy9SPBkI/S0PwqyKJ4/s5Ih5JR1PnaC1TEgueivJslEJv6yFJK/Yb4ctTusJ1Weuim9UVfGZseAsRGAAQeFDbsYcz1g9cuNnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A639yOIA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A639yOIA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a2a2c99f6so1558631a91.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 17:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973697; x=1746578497; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nhesGxbQSaQBAbqhCwSPE3SFnfsQfgQz+PVunKpo4yY=;
        b=A639yOIAgpqfKYkx7HTfHEr54GiPwPHy1crk2AkCfRdpkU4SN+m0Ie6aQY2QQSbjh9
         10Q1sTMBiSox9LvWNTLU5R9L4L+B7NuWMv1A4qn3BTUh4lHSM3Qk0JMbHCWD8Sdn1H+y
         hWaYK8vS8MUwgF2qRzCeQsPab2LlSPBNaS2xy0TJgMDAuPsw95bD74g8+EmNnuTnqQT3
         m1hcR39mmsnjDKkIOdat+I1ATrL6XAmFJEOcEL8k937gio70DfzPCiCk9yjA2bwVlCgy
         WWA5jkbpCN00exh6X0PRdG3K6fv5/aixcPxiMbhi98eaHkb3kpDzJdCoJYLmb/xNRIJR
         sYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973697; x=1746578497;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhesGxbQSaQBAbqhCwSPE3SFnfsQfgQz+PVunKpo4yY=;
        b=UScBqmT2RL8STpBkxzPX7ZRTU/V2zfUZojN6jf8oPCb4KlNP4HEoMO8RhX5/SZn3MW
         pNQ3GP9udPcH/juR+yN8Lp334Zu4H8r9OwaWQQBGawXdDjbatbaMjTMGpnzdX2OL9rA1
         0Ny67H4ikn2O1FVquq61AGeTiHYpk7zvnm54loDRPH1jDTh2ZsUBsp8L4dPk4hApnhJa
         M/L10sh2VVlV7c7IWaMJyrUneM/jqlVjCGkUfr8VNuz0+XCCYX8QL5jkX8xuj5+ay/Mq
         8xHffwYs0rXk1A6QOv43ZGAIKE4Z5h8/cZhQqNxhYJTHGfKNrHAKEXaY4Ym8Ft7NJJ6R
         PJmw==
X-Forwarded-Encrypted: i=1; AJvYcCWrlGzQ/JEe1/KdZvoF6gh+oYUuldx3rHCwksqNwY41OR6gF9JM6xXJPdq2rMuzlnpm3bSd@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh/ZiC81RVH5tuW1szAwUGCEk36m/TVhiVmjzBDJq4J4JHdr/0
	NNqOkM6TS9E8Izn9kH0GyTZ+6cX9gDhG6AXsgyVoP8AoW/A2w4jZ7xHAhrxLFhiKo30kz+2zJJO
	HwWKkXA==
X-Google-Smtp-Source: AGHT+IHgctZQ0WCaEoa8Pxu0muUZeCA140D06nFHu0NZvmHnGRqOdyuKNhChOgWLSlk7PS9sR8xmBckQ5Ptv
X-Received: from pjbtd4.prod.google.com ([2002:a17:90b:5444:b0:2fa:1fac:2695])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5883:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-30a33300eb6mr1898732a91.17.1745973697119; Tue, 29
 Apr 2025 17:41:37 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:22 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-1-irogers@google.com>
Subject: [PATCH v2 0/6] Use rustc-demangle for Rust demangling
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Daniel Xu <dxu@dxuuu.xyz>, Ariel Ben-Yehuda <ariel.byd@gmail.com>
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Discussion of improved Rust demangling started with:
https://lore.kernel.org/lkml/jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhynd6wvrsu@fcz6vrvepybb/
that led to implementing a Rust v0 demangler:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
Discussion on that patch series led to the rust-lang issue:
https://github.com/rust-lang/rust/issues/60705
where the pre-existing Rust C demangler, authored by Ariel Ben-Yehuda
 <ariel.byd@gmail.com>, was mentioned. There wasn't progress on that
issue and so I've pulled that work into perf as discussed on the
issue.

v2: Changes to references from arielb1 to "Ariel Ben Yehuda
    <ariel.byd@gmail.com>", license tidying as suggested by Miguel
    Ojeda" <ojeda@kernel.org>. Don't change from alternate demangling
    flag from false to true in the test change, make it true from the
    beginning (patch 2).

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
 tools/perf/util/demangle-rust-v0.c       | 2042 ++++++++++++++++++++++
 tools/perf/util/demangle-rust-v0.h       |   88 +
 tools/perf/util/demangle-rust.c          |  269 ---
 tools/perf/util/demangle-rust.h          |    8 -
 tools/perf/util/symbol-elf.c             |   49 +-
 12 files changed, 2257 insertions(+), 305 deletions(-)
 create mode 100644 tools/perf/tests/demangle-rust-v0-test.c
 create mode 100644 tools/perf/util/demangle-rust-v0.c
 create mode 100644 tools/perf/util/demangle-rust-v0.h
 delete mode 100644 tools/perf/util/demangle-rust.c
 delete mode 100644 tools/perf/util/demangle-rust.h

-- 
2.49.0.901.g37484f566f-goog

