Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640D2550B6
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953162; cv=none; b=oPEFSo/YMXy0HklrljR6/3Wo5LFZZroy/btVz4e8mUxPlQA8MxRghYikkRBgoQz29Of1h/QTubowZZVW7KnXlEkWvBI8vh6gS59xqhpIFMrqJGS2cJMgsZy1lfEl1fOKk4Qfvd1w/ufszowazs9B8K1j6pSpBxgIQKgDjHHqmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953162; c=relaxed/simple;
	bh=pLvxUdxndsr2wYkJQYg49ecez/cviTwRj3eN4nJwgxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=guKeXWqTiBxDD7MXJZV6c47uLhNF/SlJAey3kXtylNiNyOCYMh5rxRdlHW7k3eSkEvmty2d8EzQ7eFbsTisMLDqkk+ThWy/ccxioorZGE8+L4qhkFu5ik07i52VU5tO2WIIM24SprEUcbOnzFqfFg/n/My/AzJY24w7eupSuekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aP6UquRt; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aP6UquRt"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115383fcecso3608601a12.1
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953160; x=1746557960; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=aP6UquRtiQwNS/d/vOMoc8z2qpvj4/Z6hRrktkQXs4P1ALI1pACuFkAFUQ1FKCeCLo
         u7FdOfVOEY0j/gwe3KQMIxthSWRHg7fdEMQqiFhepN8bXnppkElsxPXnsJB2iDcZjFh2
         UK2bpSmBUWEJmWRCgnmp/98Npo4G3LSuixrOTj/JR2nveyFuNdPQmCKQIXC17x98sJMY
         VzoHAYJ7dfeqymWwDUe8bmoLpuUTPAuMQUqCJScTwHLBROBDh6e4O8XgAZHitIxjE0wQ
         KBliAjNPgTTxNaeaW1EQavVvjwM39lRCGAkKDuVjG83BlCu95TtYcBH1klE8uhDZ115R
         iCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953160; x=1746557960;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=nBpQss9ogL2zWp/RQkGVhbUUGiz/sz36cDy1KFN8A66yaqw7bqhf5F7iCpJFniLFej
         g8dGp2wbPFXS5yydbyvd8YshEM8/mahJ2zKpDUPqKK3Zpm9lf7IW7pr4iug9CtHQmCqA
         6cr3qlwRNTxwY/TD4M23qS7Z6gDrYZ6AiWFv76dNh72gMYG5eQwuJRtOXF9JH1AZ/7Vf
         cgj3wYd+ylp7YwxmSR3sY7s4GFtJk656zIsvfjS8Afh6yG/xv/O+S3H53K1uqbatL8CX
         W1uaOdfaBy+QfWMVU/PGu32N6shaPnSjyMM7xcg6jJq83qjVvxZRKWC9/gZTHjrEXHIb
         m8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4cWRsPooCfnlV4zaqzhKz44ByUGJHMmXf/G5xX1zHFcNO57KMs2lKySXmCQVKt9t7bCq2@lists.linux.dev
X-Gm-Message-State: AOJu0YzYSrmcyXcrrtRXLkOSsOGD9nb4ELvQ5AenYKOOOEJjLiCcTIeg
	H4jnwStBQjHgzl+Zh2DgetxGpmC8q/0kQn7K/qSm0EQvyewfHDAXHLuHuE5UnG5iqoX1Hjfm3Yh
	uwjxE7Q==
X-Google-Smtp-Source: AGHT+IE9GdSCCd1KtURt295JV/22SX3CPi6lw9sUTh1EaaTFjgWPJE0uM3WPfZxAJUze5crpoLd8uFNTRjF3
X-Received: from pfbkq4.prod.google.com ([2002:a05:6a00:4b04:b0:736:56a2:99ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d504:b0:1f5:7c6f:6c8a
 with SMTP id adf61e73a8af0-20a899fc238mr130852637.35.1745953160176; Tue, 29
 Apr 2025 11:59:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:38 -0700
In-Reply-To: <20250429185839.1807005-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-7-irogers@google.com>
Subject: [PATCH v1 6/6] perf test demangle-ocaml: Switch to using dso__demangle_sym
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

