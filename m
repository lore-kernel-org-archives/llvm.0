Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896B10F1
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973704; cv=none; b=TVvkIlKzUbxO3+/3SrkvLRfamv/klZwKPbzNImGNp+FTQLEK6yM0Ko0bE3Y5qPCpJP7J2N9X7PHRT6OFP68/aj3cNM20mkxU5dqNwA4p3GreJc4D7ArkY93X94u2sWve36m1kBDQyUms4XOVAele/F+2qipWRp1qhNDVnIhABew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973704; c=relaxed/simple;
	bh=aQ8Ixb2ii7TM17c5CxHc/kZsrUa4Me1nM9JR+KWLbRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gqqOmGWrEvYC4vwsSfP0UGtsfLnje2eHzZspnNWHNBfBNs2OiucZYzMFPUXJ/hlb/G9nZr6aeIq00HUok0A1cKPeiv1ov5a3IeqRmBEUEREkZpDW0l9VDLlzRvstzozKaqc0K7PNnANhDuX1x3RwJUw17D8PiJy5yWlRDwG1+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LjF37CS0; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LjF37CS0"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1f71ae2181so632047a12.1
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 17:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973702; x=1746578502; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1KMrryhTDqYQRcc+MhBf4Nju0O0E10cRTohQDGFkGY=;
        b=LjF37CS0509OOGWorMdbbh2GAc6SH47mnF/qH+SjYGHTKbVRgOPvupp095ekQRilod
         JSvEMGpY30rEUcA9f1ikQkVkFqpd2c28dj2UWA7XVVei1j4RM7X6LdJtgp86Zur4N5sK
         tn2az/6qi44EoKGL3Gm7wM5QiOxPTzBK0ym70jzSmhkT1Nzb+FODLKOm9lUQ1o+LTMiD
         LrNvCu63JOdq5IC/+R//mA2iWgunuUsG3CAw+EiCTRBFGWbrUSrB7o0HfjW86MGeZHG8
         vgPs8TjVTo7HsdXVuKBpL/h6GolyUTdA0nhRyERVsLtyRzgMrsI9yWMH1SRBkn0mmD5z
         Vq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973702; x=1746578502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1KMrryhTDqYQRcc+MhBf4Nju0O0E10cRTohQDGFkGY=;
        b=qWKKECol8199Cb1O+oY35rmNc7v6iApdHcuJ2b0q7+1nYQFrse8RL2/8NxLQct9+Sk
         5BC1vosHoevPDpdml4cjWHKPCxIqteFL2GpcJXXksXpfWGWiAbjMRokAonmZGCeLbKcF
         bS6CKjY+239vYtj2/pQ8ajEONC/BsQW7QsAcaQgO+dZMjqUSmTVRW0W2fKhePls2znVu
         2uwV2bX/ZjdjEG8zw6pwDVflgAh++sFg035DqRdyVxi9E2hcZF2kZycXk23lnLHGhWeV
         PYl3GpOp+KE6ayCzDlLCQqTOFZu6oqjurDVJaXu22ZfbZlK508Zt0RmE2uWC3J8M9+i2
         OH2A==
X-Forwarded-Encrypted: i=1; AJvYcCVwnLhVSb4gd4RB9/UPFPDereeHZIF3YHfZlmXOaCAGFykkZm7UAX883q/Hr+XrgFImmCFk@lists.linux.dev
X-Gm-Message-State: AOJu0YyNgvKI7Aj0oeuTpBpk+uKQp16OhcXparwF0V4K8/wlS+GNO2tm
	+mY0uV6SfX45kwwdnHTG8gNpoZjNxgNfdoAwiuJrZc6RIDv0BlgQsjiMcOnF73fnE3byIY/mMN1
	Gs3+iOw==
X-Google-Smtp-Source: AGHT+IH5AV8B/lmxOmO7bvKCtJ0Ps0gr6YLjC9VmSVrpHIqji0bGhb7vyMUNXXGmFCeguUAOJMfQk3WEI6qq
X-Received: from pfbfn23.prod.google.com ([2002:a05:6a00:2fd7:b0:740:555:f7af])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f09:b0:1f5:70af:a32a
 with SMTP id adf61e73a8af0-20a88e1c278mr1607808637.32.1745973701640; Tue, 29
 Apr 2025 17:41:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:24 -0700
In-Reply-To: <20250430004128.474388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-3-irogers@google.com>
Subject: [PATCH v2 2/6] perf symbol-elf: Integrate rust-v0 demangling
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

Use the demangle-rust-v0 APIs to see if symbol is Rust mangled and
demangle if so. The API requires a pre-allocated output buffer, some
estimation and retrying are added for this.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build        |  5 +++-
 tools/perf/util/symbol-elf.c | 47 ++++++++++++++++++++++++++----------
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4f7f072fa222..7910d908c814 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -241,9 +241,12 @@ perf-util-y += cap.o
 perf-util-$(CONFIG_CXX_DEMANGLE) += demangle-cxx.o
 perf-util-y += demangle-ocaml.o
 perf-util-y += demangle-java.o
-perf-util-y += demangle-rust.o
+perf-util-y += demangle-rust-v0.o
 perf-util-$(CONFIG_LIBLLVM) += llvm-c-helpers.o
 
+CFLAGS_demangle-rust-v0.o += -Wno-shadow -Wno-declaration-after-statement \
+    -Wno-switch-default -Wno-switch-enum -Wno-missing-field-initializers
+
 ifdef CONFIG_JITDUMP
 perf-util-$(CONFIG_LIBELF) += jitdump.o
 perf-util-$(CONFIG_LIBELF) += genelf.o
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index fbf6d0f73af9..3fc87309746f 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -16,13 +16,14 @@
 #include "demangle-cxx.h"
 #include "demangle-ocaml.h"
 #include "demangle-java.h"
-#include "demangle-rust.h"
+#include "demangle-rust-v0.h"
 #include "machine.h"
 #include "vdso.h"
 #include "debug.h"
 #include "util/copyfile.h"
 #include <linux/ctype.h>
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/zalloc.h>
 #include <linux/string.h>
 #include <symbol/kallsyms.h>
@@ -308,6 +309,9 @@ char *cxx_demangle_sym(const char *str __maybe_unused, bool params __maybe_unuse
 
 static char *demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 {
+	struct demangle rust_demangle = {
+		.style = DemangleStyleUnknown,
+	};
 	char *demangled = NULL;
 
 	/*
@@ -318,21 +322,38 @@ static char *demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 	if (!want_demangle(dso__kernel(dso) || kmodule))
 		return demangled;
 
-	demangled = cxx_demangle_sym(elf_name, verbose > 0, verbose > 0);
-	if (demangled == NULL) {
-		demangled = ocaml_demangle_sym(elf_name);
-		if (demangled == NULL) {
-			demangled = java_demangle_sym(elf_name, JAVA_DEMANGLE_NORET);
+	rust_demangle_demangle(elf_name, &rust_demangle);
+	if (rust_demangle_is_known(&rust_demangle)) {
+		/* A rust mangled name. */
+		if (rust_demangle.mangled_len == 0)
+			return demangled;
+
+		for (size_t buf_len = roundup_pow_of_two(rust_demangle.mangled_len * 2);
+		     buf_len < 1024 * 1024; buf_len += 32) {
+			char *tmp = realloc(demangled, buf_len);
+
+			if (!tmp) {
+				/* Failure to grow output buffer, return what is there. */
+				return demangled;
+			}
+			demangled = tmp;
+			if (rust_demangle_display_demangle(&rust_demangle, demangled, buf_len,
+							   /*alternate=*/true) == OverflowOk)
+				return demangled;
 		}
+		/* Buffer exceeded sensible bounds, return what is there. */
+		return demangled;
 	}
-	else if (rust_is_mangled(demangled))
-		/*
-		    * Input to Rust demangling is the BFD-demangled
-		    * name which it Rust-demangles in place.
-		    */
-		rust_demangle_sym(demangled);
 
-	return demangled;
+	demangled = cxx_demangle_sym(elf_name, verbose > 0, verbose > 0);
+	if (demangled)
+		return demangled;
+
+	demangled = ocaml_demangle_sym(elf_name);
+	if (demangled)
+		return demangled;
+
+	return java_demangle_sym(elf_name, JAVA_DEMANGLE_NORET);
 }
 
 struct rel_info {
-- 
2.49.0.901.g37484f566f-goog

