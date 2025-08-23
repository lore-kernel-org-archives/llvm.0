Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB3149DF0
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909175; cv=none; b=MXU/ksEowpG7dpDasMSYLaIZHGjsTksScmwm+1xUeuSp9bJ7OIv69GoTT0MwGStc5EumgZ9QaWseo1WtMc1wdIWhbJE45hd8VwCV68+5E0bHX3cgFH8fcMF0e3x5XD4my5/COF7VZmEzMD9y3pymb2Wj+vGjImXdSWve+y67i90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909175; c=relaxed/simple;
	bh=Fd29IYX/xpHAqMQkc8EyODPN9XEe5UxH0NFcKN/ROns=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=YJ0Q9+6lm2lciYZWzd8OPobz5gp4/ezUeSrc2xMaPpuAGT33JtUvzcDd6kqgPfQ9F8WmHYwz7xZh0jy6US4jdl4rw10PjvS+1q14wb4zTTSanquNo7KP2OOboa9IdizJPEztWjRboCb80RcrQ/ssW+wrKfs8vLu/XMsdy5yetpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fUZvARLI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fUZvARLI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-246164c4743so41305305ad.3
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909173; x=1756513973; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrnABPnhnjLPpde8R8ZKcXd7aM+wSVwyXCweNa59YQ0=;
        b=fUZvARLIJorVLYIlOi+YifMmNoCshF2ZhRSBKF6nZU813V6aB8lgDEkwZG25w47JpM
         H6zeO9ZESk6CCrNqCbYXh7+gLjyIYxqnHK0mkyqtH2AfIlNHDT/akWaawCYuKpQuFZ/g
         WdErQe1peycz3QLbxQbPYf1DZ+m4/huKrY4B0dzIyGF/kkdCTuSV0Jkt4ZIkSdyOUeVQ
         oBm4HoWk641DYNaNkhUYRrfsGmknuGQBI3CFepVXMKnL4kVOfrUPAJgUDaDlPAOzOwl/
         uuia/bkYrMwe89EC2C4/OdMs1PuKjYR4otrduX8m/jjk7I2LQr1Ost3hHJ1mfi4rt7Aw
         gGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909173; x=1756513973;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrnABPnhnjLPpde8R8ZKcXd7aM+wSVwyXCweNa59YQ0=;
        b=ngewmGo0ndQLDuExf57XxbUEdQYJd6uLPhNcZxY6SU7gnVc01dRTQj/DmiNJOm9NDK
         /2d+dkKOyLA8Z+W2/WmEn/YdsRcUgFX2MNhbl9HkWwjg+kjC7/Z4ejsWO72at5rVDGm6
         dUtQ5kWf96NifJfnESIXzEvaUV006K6IOocEfB1dAxDb3hqKRw7wFyezKUJEjtv+mkzZ
         v3zUc1+XsrFPLAwkus4Djg3Sxs8qrg8ic16sUT9qItD0/qnrR7TYgTdnj2bBeVuq/Qt+
         Q6VtcSoGrLzKtBFXXpzIo661aoO43ub9JnJiHzr4jn81w0ugjHObYLUSiY6r0WiALqIa
         E/zw==
X-Forwarded-Encrypted: i=1; AJvYcCWOW09t2w05raClYq8k7bN7hvhr7g45Z79kqal3YGlyTn9sjTdQ4usBsXSBJLlADertp8Gk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GrE+1tYPUpXvAy0rwPD8Dimu6Lm5AKihyzfVKnG/5lfA8Pjj
	SIjOencfEGvhWp+Rr28ZtNSHT1VHnaci6zKHZfNC9eQr8A5C7mLrH2ZYtblt33roStoSvQI6q99
	Si/o58Qgt6g==
X-Google-Smtp-Source: AGHT+IGAPuABV5wfdKDsaJ74CXJ2o+DPzp2QEHBI9R/mhtkFS1teUu4D5SJTofX9u3uOZBKi8+3TSgReDnK6
X-Received: from pljc15.prod.google.com ([2002:a17:903:3b8f:b0:243:31a:f8e2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecc6:b0:243:485:26a5
 with SMTP id d9443c01a7336-2462eeb70abmr66268945ad.34.1755909172541; Fri, 22
 Aug 2025 17:32:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:07 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-12-irogers@google.com>
Subject: [PATCH v5 11/19] perf llvm: Disassemble cleanup
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

Move the 3 LLVM initialization routines to be called in a single
init_llvm function that has its own bool to avoid repeated
initialization. Reduce the scope of triplet and avoid copying strings
for x86.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/llvm.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index a0774373f0d6..a28f130c8951 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -244,6 +244,17 @@ static void perf_LLVMDisasmDispose(LLVMDisasmContextRef context)
 #endif
 }
 
+static void init_llvm(void)
+{
+	static bool init;
+
+	if (!init) {
+		perf_LLVMInitializeAllTargetInfos();
+		perf_LLVMInitializeAllTargetMCs();
+		perf_LLVMInitializeAllDisassemblers();
+		init = true;
+	}
+}
 
 static void free_llvm_inline_frames(struct llvm_a2l_frame *inline_frames,
 				    int num_frames)
@@ -339,7 +350,6 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	u64 buf_len;
 	u64 pc;
 	bool is_64bit;
-	char triplet[64];
 	char disasm_buf[2048];
 	size_t disasm_len;
 	struct disasm_line *dl;
@@ -352,27 +362,25 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	if (args->options->objdump_path)
 		return -1;
 
-	perf_LLVMInitializeAllTargetInfos();
-	perf_LLVMInitializeAllTargetMCs();
-	perf_LLVMInitializeAllDisassemblers();
-
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
 		return -1;
 
+	init_llvm();
 	if (arch__is(args->arch, "x86")) {
-		if (is_64bit)
-			scnprintf(triplet, sizeof(triplet), "x86_64-pc-linux");
-		else
-			scnprintf(triplet, sizeof(triplet), "i686-pc-linux");
+		const char *triplet = is_64bit ? "x86_64-pc-linux" : "i686-pc-linux";
+
+		disasm = perf_LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					       /*get_op_info=*/NULL, symbol_lookup_callback);
 	} else {
+		char triplet[64];
+
 		scnprintf(triplet, sizeof(triplet), "%s-linux-gnu",
 			  args->arch->name);
+		disasm = perf_LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					       /*get_op_info=*/NULL, symbol_lookup_callback);
 	}
-
-	disasm = perf_LLVMCreateDisasm(triplet, &storage, 0, NULL,
-				       symbol_lookup_callback);
 	if (disasm == NULL)
 		goto err;
 
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

