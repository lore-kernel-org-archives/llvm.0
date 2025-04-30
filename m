Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56835B652
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973717; cv=none; b=LWQU13DAAjFfRnn2ygwvB2O/6HmaaJ2QMDa1lp3LvzXWJ4seHB9NTY7hjhkkR349dkuGtay4vqEXBT1pl5+ej2oJ290U1A+ksMenF9M2+1+gEYBDxev5mw4WlvCBeg5hbkto6JYx/z2gUbhS2WoKHPJ4XbFszHSxRpax+jlTLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973717; c=relaxed/simple;
	bh=pLvxUdxndsr2wYkJQYg49ecez/cviTwRj3eN4nJwgxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ts9Ts26dCuC641vPkebi5KUWYN4cswrZL/EzQ5PSRF2GijrNDQb3L4MneT0PjeoAHgMPKu3chRNW5ioEyD4a+71HzTIBDKSG7urJheNNQya5Gfue37cljS/PalbGq1RRy/j58Mgya7DVLXlmg/hnOeiauKQ4IQdePjXMkfU4xPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IG4YBplB; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IG4YBplB"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c0306242so8786147b3a.1
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973715; x=1746578515; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=IG4YBplBqfku422qzl68gZvxz81grt3i6vs8H7f03VP8687hofUGcH3dlxLYFx5b2q
         /cF8F0P2GK86s7f+XfJS8SaavXnN45nNd3vcpMef8flGCKkXSjKbMQW+HTuz9bE4jLSD
         l15kTsTjdQx7x4x7UqPngqeRgH5v/tDWCE99Ftc2gWx/MGOemIW/0XlmzDAUbHsF4Z1A
         8dFb/H+/1dyFjlua/KJMW3alfYcg8B++D6NWHMnrSE0KBZRCddrzuVF3GccIbQZQZhr0
         mK+QaaROTWz9ClLexqbK2ekFHnhDyaWKoTjCHiJd0mYZ6vMOb7673wP9ocLo5jFAonqE
         fv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973715; x=1746578515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=Sa8ugHpAKqCHW6BMaHhZuPvVjVwMZ4Hq3x4nnxwimdkPD0xbU0v81udGvS14bgHH5e
         YmoKWavOR0T4ZXnZMqWZbFTLI/MaHGo3mnTn1oKa/qa0CUOTFmTQAcUtZjhignP6fTmc
         3L0i2TPbM+DtstIKFEwJjuOGjlqqF/7YBh0sAjZLfQmpBbWzr5jLmioWjMzvpum2wHKF
         UzUxGPD9J+l+rF1Gjt618T+5yu2v823LuyLksCbSOqDLkVWaBUNEuFc/sf29THqVcXen
         KrLj1jnROI2Oip3yE5M4yDuVqQwd/E7ceYGNGFRKRfZtaggqr37cxOKj22IuE0xfmGRI
         Ebpw==
X-Forwarded-Encrypted: i=1; AJvYcCWxbJRckqjfz6/SHVO4ZCx61IOH4Toc63H8ZmvojEP3V9yiSLzAodBapuKKmMnnIJlWu1xg@lists.linux.dev
X-Gm-Message-State: AOJu0YzAhzzvRoCbKelaG/CG7/7J52rl320uzUEAKhCkOVQl8CK+ws8y
	pGKoWsWCOPObwisVmOTTSl73/xrpfnLu9L4uY/T/RtXnBMwTmxdrkqfCdY4AioqCX62UzgZvxd3
	J487ufQ==
X-Google-Smtp-Source: AGHT+IGBKZmj0xcnx3IB64TcbS0pb/r17lmOgH8lxAqqhmr49CDFUH1EBNpi6iyWZc1C2ZsKErjB7VbqxAQl
X-Received: from pfbfn23.prod.google.com ([2002:a05:6a00:2fd7:b0:740:555:f7af])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3924:b0:736:34a2:8a18
 with SMTP id d2e1a72fcca58-7403a836556mr988402b3a.24.1745973715575; Tue, 29
 Apr 2025 17:41:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:28 -0700
In-Reply-To: <20250430004128.474388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-7-irogers@google.com>
Subject: [PATCH v2 6/6] perf test demangle-ocaml: Switch to using dso__demangle_sym
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

The use of the demangle-ocaml APIs means we don't detect if a different
demangler is used before the OCaml one for the case that matters to
perf.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-ocaml-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/demangle-ocaml-test.c b/tools/perf/tests/demangle-ocaml-test.c
index 90a4285e2ad5..612c788b7e0d 100644
--- a/tools/perf/tests/demangle-ocaml-test.c
+++ b/tools/perf/tests/demangle-ocaml-test.c
@@ -2,10 +2,9 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include "tests.h"
-#include "session.h"
 #include "debug.h"
-#include "demangle-ocaml.h"
+#include "symbol.h"
+#include "tests.h"
 
 static int test__demangle_ocaml(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
@@ -27,7 +26,7 @@ static int test__demangle_ocaml(struct test_suite *test __maybe_unused, int subt
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
-		buf = ocaml_demangle_sym(test_cases[i].mangled);
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
 		if ((buf == NULL && test_cases[i].demangled != NULL)
 				|| (buf != NULL && test_cases[i].demangled == NULL)
 				|| (buf != NULL && strcmp(buf, test_cases[i].demangled))) {
-- 
2.49.0.901.g37484f566f-goog

