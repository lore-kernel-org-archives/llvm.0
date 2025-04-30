Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BC817BA9
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973709; cv=none; b=BFDSG6Bhxd2TUOpLHWtWvEsHSGuaPl3YBYJ/Eg5VhWQA+PVagrn3ZS9/GUDyaSekRg5viVKM4kslI/ti9ZPwxURtTdu75X6KT+JMItHQxmmAYLWUs7GUgY18fdZohqNRdl7YXG2ICBIQpmtkZjfk1T8mpjT8DX+af40dIbb6aTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973709; c=relaxed/simple;
	bh=kRagKt4OqPImjkKD1oQH895FmmrMksgLNhCNLEEIoOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Px7D2Hb3cnXABxn8M7CIPvULp4GM1C02XVWw8ko/k4NOc5vXyNFUd1MprCsaUQL7pdRMCJI60kfqINJIILS8hVVEp+CXOT8+5U1nK2+fNTlPAYZ3u3eK8CdQidVJ10uEeMiMJ9e8gbDoI8yKm1//AAEFURqXFNGfSXE7oYMc9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZfPZFXr9; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZfPZFXr9"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394772635dso4371120b3a.0
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 17:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973706; x=1746578506; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DAYr6PusLm+/+Qz98aPjWyLm+UNylxUX3Sur2p0ihA=;
        b=ZfPZFXr99U/YW9I4VyoU2PdiNkWVd0J3hEltrc7hToQig1gBeLJshd5e5KbqP7RXr4
         U2Uo8GowdSVsgmzb3nymY5L43R2Jv33IHsbYH07UpQuNiCJXfxHkbMYnACSA/wzKOL34
         OrtinQNFhMltFwMIaBDVrXJoDX+HYKOVeQwJbQglmGhx7kZaxAPw2YKBSYDTFWc4+QJ3
         g0KbNJYDzdrLHF5PV5ZSD+LYSKGCCHX7RfywL/g4jh5UZhXRKNggmo1yZoGJuvpfzqA9
         961QbL+62OVpnCURSXAtVV9rOLjdmh098oNwzKaDisEquRG5zh+XsB+i2qwAlorwXKP5
         F9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973706; x=1746578506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DAYr6PusLm+/+Qz98aPjWyLm+UNylxUX3Sur2p0ihA=;
        b=C1sbv09Ao7t33Ms9QURf81BdHYXuS+7HXpdTqiHb8PQrvpBJIQF7+3tmMPgkoUPMcL
         LGxBUynCJfNF2V2pWbvWgsWH3KUnE9lMK/TUfvUOl2kI4gsSY2xkBRJvM5hVYH+/6og5
         VjCTuZtFjg10nr6sS+H+lzfIerh6C8Vq68pfogPc7BoqWjmUlQxlecd0U8iTS2hYez18
         1nnqtMaoowAYsBb1Kg9yIwYeYMY50NU1noRNvEtqNGM+reJqtb0a8L/ebH1nzH7dAMfg
         lB6qQX9fcd+u21uDW2LRqWgrUBTRhJuSX+TM0+7srwyGgg0OL5uG1VLpvIesOaEvC4/W
         CcfA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZRdnuBkW2sKi1J7aQCs13w3/ho+SXJ/aqHoRgq3gFjokwLMq5O/Gfrk6uoaguVJfHGef@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt+7zgqKQTiQCbQlJ34PsXNIseO669lnk3Mwop2Wj53G23gnBh
	CmGTuRV4vP73Ro/7M89o95236u/Mt6x2snUYtIikrMPRw6g5Mt5lf0hB4CE4BiVhlUxUDpqGC55
	dOmILkw==
X-Google-Smtp-Source: AGHT+IEO+ew6JL7Wqcne+i8I/KZRO0kBvB5Ye1PoPyHG4SG+gdGNhCGDl1UPMLXblvyoaO7J3mijbEI7HL1d
X-Received: from pgbfq21.prod.google.com ([2002:a05:6a02:2995:b0:af2:3b16:9767])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6681:b0:1f5:7873:304f
 with SMTP id adf61e73a8af0-20aa468608amr977493637.37.1745973706097; Tue, 29
 Apr 2025 17:41:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:26 -0700
In-Reply-To: <20250430004128.474388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-5-irogers@google.com>
Subject: [PATCH v2 4/6] perf test demangle-rust: Add Rust demangling test
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

The test cases are listed examples in:
https://doc.rust-lang.org/rustc/symbol-mangling/v0.html

This test was previously part of a different Rust v0 demangler:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/Build                   |  1 +
 tools/perf/tests/builtin-test.c          |  1 +
 tools/perf/tests/demangle-rust-v0-test.c | 74 ++++++++++++++++++++++++
 tools/perf/tests/tests.h                 |  1 +
 tools/perf/util/symbol-elf.c             |  2 +-
 5 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/tests/demangle-rust-v0-test.c

diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 934f32090553..2181f5a92148 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -56,6 +56,7 @@ perf-test-y += genelf.o
 perf-test-y += api-io.o
 perf-test-y += demangle-java-test.o
 perf-test-y += demangle-ocaml-test.o
+perf-test-y += demangle-rust-v0-test.o
 perf-test-y += pfm.o
 perf-test-y += parse-metric.o
 perf-test-y += pe-file-parsing.o
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 14d30a5053be..45d3d8b3317a 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -126,6 +126,7 @@ static struct test_suite *generic_tests[] = {
 	&suite__maps__merge_in,
 	&suite__demangle_java,
 	&suite__demangle_ocaml,
+	&suite__demangle_rust,
 	&suite__parse_metric,
 	&suite__pe_file_parsing,
 	&suite__expand_cgroup_events,
diff --git a/tools/perf/tests/demangle-rust-v0-test.c b/tools/perf/tests/demangle-rust-v0-test.c
new file mode 100644
index 000000000000..904f966c65d7
--- /dev/null
+++ b/tools/perf/tests/demangle-rust-v0-test.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+#include "tests.h"
+#include "debug.h"
+#include "symbol.h"
+#include <linux/kernel.h>
+#include <stdlib.h>
+#include <string.h>
+
+static int test__demangle_rust(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+{
+	int ret = TEST_OK;
+	char *buf = NULL;
+	size_t i;
+
+	struct {
+		const char *mangled, *demangled;
+	} test_cases[] = {
+		{ "_RNvMsr_NtCs3ssYzQotkvD_3std4pathNtB5_7PathBuf3newCs15kBYyAo9fc_7mycrate",
+		  "<std::path::PathBuf>::new" },
+		{ "_RNvCs15kBYyAo9fc_7mycrate7example",
+		  "mycrate::example" },
+		{ "_RNvMs_Cs4Cv8Wi1oAIB_7mycrateNtB4_7Example3foo",
+		  "<mycrate::Example>::foo" },
+		{ "_RNvXCs15kBYyAo9fc_7mycrateNtB2_7ExampleNtB2_5Trait3foo",
+		  "<mycrate::Example as mycrate::Trait>::foo" },
+		{ "_RNvMCs7qp2U7fqm6G_7mycrateNtB2_7Example3foo",
+		  "<mycrate::Example>::foo" },
+		{ "_RNvMs_Cs7qp2U7fqm6G_7mycrateNtB4_7Example3bar",
+		  "<mycrate::Example>::bar" },
+		{ "_RNvYNtCs15kBYyAo9fc_7mycrate7ExampleNtB4_5Trait7exampleB4_",
+		  "<mycrate::Example as mycrate::Trait>::example" },
+		{ "_RNCNvCsgStHSCytQ6I_7mycrate4main0B3_",
+		  "mycrate::main::{closure#0}" },
+		{ "_RNCNvCsgStHSCytQ6I_7mycrate4mains_0B3_",
+		  "mycrate::main::{closure#1}" },
+		{ "_RINvCsgStHSCytQ6I_7mycrate7examplelKj1_EB2_",
+		  "mycrate::example::<i32, 1>" },
+		{ "_RINvCs7qp2U7fqm6G_7mycrate7exampleFG0_RL1_hRL0_tEuEB2_",
+		  "mycrate::example::<for<'a, 'b> fn(&'a u8, &'b u16)>",
+		},
+		{ "_RINvCs7qp2U7fqm6G_7mycrate7exampleKy12345678_EB2_",
+		  "mycrate::example::<305419896>" },
+		{ "_RNvNvMCsd9PVOYlP1UU_7mycrateINtB4_7ExamplepKpE3foo14EXAMPLE_STATIC",
+		  "<mycrate::Example<_, _>>::foo::EXAMPLE_STATIC",
+		},
+		{ "_RINvCs7qp2U7fqm6G_7mycrate7exampleAtj8_EB2_",
+		  "mycrate::example::<[u16; 8]>" },
+		{ "_RINvCs7qp2U7fqm6G_7mycrate7exampleNtB2_7ExampleBw_EB2_",
+		  "mycrate::example::<mycrate::Example, mycrate::Example>" },
+		{ "_RINvMsY_NtCseXNvpPnDBDp_3std4pathNtB6_4Path3neweECs7qp2U7fqm6G_7mycrate",
+		  "<std::path::Path>::new::<str>" },
+		{ "_RNvNvNvCs7qp2U7fqm6G_7mycrate7EXAMPLE7___getit5___KEY",
+		  "mycrate::EXAMPLE::__getit::__KEY" },
+	};
+
+	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
+		if (!buf) {
+			pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n", test_cases[i].mangled,
+				 test_cases[i].demangled);
+			continue;
+		}
+		if (strcmp(buf, test_cases[i].demangled)) {
+			pr_debug("FAILED: %s: %s != %s\n", test_cases[i].mangled,
+				 buf, test_cases[i].demangled);
+			ret = TEST_FAIL;
+		}
+		free(buf);
+	}
+
+	return ret;
+}
+
+DEFINE_SUITE("Demangle Rust", demangle_rust);
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 8aea344536b8..bb7951c61971 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -157,6 +157,7 @@ DECLARE_SUITE(jit_write_elf);
 DECLARE_SUITE(api_io);
 DECLARE_SUITE(demangle_java);
 DECLARE_SUITE(demangle_ocaml);
+DECLARE_SUITE(demangle_rust);
 DECLARE_SUITE(pfm);
 DECLARE_SUITE(parse_metric);
 DECLARE_SUITE(pe_file_parsing);
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 3fc87309746f..8734e8b6cf84 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -319,7 +319,7 @@ static char *demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 	 * DWARF DW_compile_unit has this, but we don't always have access
 	 * to it...
 	 */
-	if (!want_demangle(dso__kernel(dso) || kmodule))
+	if (!want_demangle((dso && dso__kernel(dso)) || kmodule))
 		return demangled;
 
 	rust_demangle_demangle(elf_name, &rust_demangle);
-- 
2.49.0.901.g37484f566f-goog

