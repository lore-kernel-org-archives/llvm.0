Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27941255250
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953160; cv=none; b=QHHKD76Z3TgApL2WhOqNj7VYOpVk4spJUvVj5fAxslS7eCz3AgqoiVZ9xmL8qpwaOG7nJv+ZPhwGd0eD5PK+1AT0guxlVFfErOge9G9BRipVnOkUjJoVT/nj/3ob/lpkknWstyuj5ycHrTpSN7R3NkGrDeujuQAO60EEaiGXyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953160; c=relaxed/simple;
	bh=YsSJK+JBgrMChothMITffQgSKnUI35D9iUSvUi32+oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ASqxYOKMKurg45ayTGaLJK3eaIwnYqwYG2yvqu++9dVTrv91DdgVzrHankXONXn3azGND3MrpMlwQhtml+qVMQpBNdT+dbbAbK0YYIlcKw7Wgvb292IAEVO3IfEi4TakKnvLTCvVRa0n6U4Xcg52BcGOxc5UKjBP5sw4jaxB+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2kkMkhr; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2kkMkhr"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736bf7eb149so4246918b3a.0
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953158; x=1746557958; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=c2kkMkhrqbSn2BpnoLU7buZNe8XI1Z2lWT2AVhp1FPX6ccGNMDRd67PHFO2142TjrT
         jY/Gx+Jg7kg46QoH3Nbqwl6H1DcTDYLhlLFewRcYj0y9Xg/rWn5w4pUA7V8TNWcirJ1T
         Gn3RFytbpa7A5M1eu8rR0nHnmqJ+X2xtDSw5codoxWqPjEHFOQ4mZFFIrbvqzEL/cKz0
         R/hicwAHp4zzYdzkPPhKprfUsqjkjEUpQEnfDe4qXdWr5+WU5ZXyX03WOoYFR82rWypC
         6nNvg/SBjKPG+R9jS+thjVH3oqTumcZQmnGrLkHVbDB1Hz2CuqHLuh5Jw8fQ2SmhU7Vs
         lGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953158; x=1746557958;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=SWXWcDohB/jMA6dsPisWDaJl2AWiMvwSCS4TLLk68qwJer90pq45HkCdZEfXs+IvHO
         TG68x8DFTurNgSmjF3aCRMtO9fhl7CsrnUXA3Lfz1A0iVAFHkyQoGAspxIG+AfwQiQm9
         h/rLQUiIIeX6zxl6FGPHbKripxv3CWU31DVEJSeotX3CUU1MsS4kAN5f+kdhwFA+dnay
         IqGtG2QcSVhoD5FB1E17ftf8o5LAJN1rgIs2o/qhWgEvd4JqA5Szntew8VomWtK8bL/T
         DjtO+Rxy0tTThXqjdgNeuEu0QZTeJ+M2b+Vd7jv8ad8lWFEgCBHBr1gUk6nH1ulF2Cci
         NABw==
X-Forwarded-Encrypted: i=1; AJvYcCX16/70szi/9ohRUDn3xCURv8MTPLS+B6JTztxyKjihzlNU3ZHV1KQYXA90bReFiT8dOHKt@lists.linux.dev
X-Gm-Message-State: AOJu0YzrJWz6MPbxpoM5NMRDTv0NtjLR0lQnUHrx/DIk3FzNhwdyf13s
	HCMzk+Nz/adNsU3SmeYIn0mBLwECwiWhYZ1jT1CoDi9sz7ojdBKmin/L/49ekqM6q1Z0QP+oUQg
	/SIMf/Q==
X-Google-Smtp-Source: AGHT+IHLURQcORFZUyCUqj8vJLBwbANzxkfzIIQ8cSeqkoyYPkmTVhIgayBTFK2Pn7ZLE0MZ25TyzB0tZWfm
X-Received: from pgac2.prod.google.com ([2002:a05:6a02:2942:b0:af3:30b9:99a4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:1f5:6c94:2cd7
 with SMTP id adf61e73a8af0-20a899fc1ddmr96977637.42.1745953158400; Tue, 29
 Apr 2025 11:59:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:37 -0700
In-Reply-To: <20250429185839.1807005-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-6-irogers@google.com>
Subject: [PATCH v1 5/6] perf test demangle-java: Switch to using dso__demangle_sym
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

The use of the demangle-java APIs means we don't detect if a different
demangler is used before the Java one for the case that matters to
perf. Remove the return types from the demangled names as
dso__demangle_sym removes those.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-java-test.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/demangle-java-test.c
index 93c94408bdc8..ebaf60cdfa99 100644
--- a/tools/perf/tests/demangle-java-test.c
+++ b/tools/perf/tests/demangle-java-test.c
@@ -3,10 +3,9 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <linux/kernel.h>
-#include "tests.h"
-#include "session.h"
 #include "debug.h"
-#include "demangle-java.h"
+#include "symbol.h"
+#include "tests.h"
 
 static int test__demangle_java(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
@@ -18,19 +17,19 @@ static int test__demangle_java(struct test_suite *test __maybe_unused, int subte
 		const char *mangled, *demangled;
 	} test_cases[] = {
 		{ "Ljava/lang/StringLatin1;equals([B[B)Z",
-		  "boolean java.lang.StringLatin1.equals(byte[], byte[])" },
+		  "java.lang.StringLatin1.equals(byte[], byte[])" },
 		{ "Ljava/util/zip/ZipUtils;CENSIZ([BI)J",
-		  "long java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
+		  "java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
 		{ "Ljava/util/regex/Pattern$BmpCharProperty;match(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Z",
-		  "boolean java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
+		  "java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
 		{ "Ljava/lang/AbstractStringBuilder;appendChars(Ljava/lang/String;II)V",
-		  "void java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
+		  "java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
 		{ "Ljava/lang/Object;<init>()V",
-		  "void java.lang.Object<init>()" },
+		  "java.lang.Object<init>()" },
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
-		buf = java_demangle_sym(test_cases[i].mangled, 0);
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
 		if (strcmp(buf, test_cases[i].demangled)) {
 			pr_debug("FAILED: %s: %s != %s\n", test_cases[i].mangled,
 				 buf, test_cases[i].demangled);
-- 
2.49.0.901.g37484f566f-goog

