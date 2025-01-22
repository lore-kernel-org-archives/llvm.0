Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F13218E9F
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567819; cv=none; b=rK5DZ2R5tTrb+kFQTGWc/cQloqbvgG2vqZikRacQUP4pvrqnZczHeRW9lhXJW4y4oKtMngW/Mbm64tiiyr9hsBqQNrHrzQTPVXjGgZAVrtt8hU6m27ktSp3PWbAJSaeIj9wqsTN30pHiM6B7JZVmJJ0Bm5H9YbhfO/jfZIpWaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567819; c=relaxed/simple;
	bh=kDPZieV753RfxEW3g95h7KoixXzw6FB20XkbY1RgS+g=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=n5+A/IBEaTb9pmcfSnXzDLUUElieQhZzm26l16c8s2eaj4vSM8kmGnZmBxSmtWoOLfoqSER/M6p1Lzc5ep8EEFJ0tip0nrtwevS8IB0elnsMWST39wYy/GfPpSf9jmwKb/+KiMKUq9NSAqho3fbuPzbyYG7VXkXZ9rptXNghw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KX2Xxt26; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KX2Xxt26"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e399d4ef55cso18461197276.2
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567817; x=1738172617; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBnZLegK4hXXWUBGagpTjqGV+Qxsfz86HdVgb3CS2Ho=;
        b=KX2Xxt266Z4bIX9Tvegx5vepCmV6JG4O8I2B7TwWiZH2X0ceUdVDhVhKTkua3f0pYo
         mNVegBzW8PT/Yhf2CG+5FFAuOvEKAqmKKSxeQ7mdRlnsRRzyXdMF/7a4R+md/aHqHujk
         +Z/VdrxKzZ4eAjEqrrDPiU9T3cJOpyF1XpcMlA2j8yDLGVxddQCk1QRcxuq8RzgCV6Vt
         YdwhhnD3kkXojMbBy3qfplI8RFWjlfnFBO2TMtN6Hn2oNxfGIcnlIYd+8L4c4mkkqG0M
         8yZCIxEJ8tg5AI8djXbMkIe7JUMjX+Sp0m/KoyyvYhwnMElgmOsaBk9Qmv74kGpccR5i
         ygyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567817; x=1738172617;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBnZLegK4hXXWUBGagpTjqGV+Qxsfz86HdVgb3CS2Ho=;
        b=qSUpqYgitNUypBp9POmbxWlIhiz5Vk9I1Dr3OnDkVzqhESL6UTuSRYQVtC/WNccX8l
         rL6Vp9maWrpYhE4mwyt0ccmQboZjmyYL7c4SmLJX1ew2XkTziyAop4qmfMPzp5CNaNFy
         1UG1ghTYVSDi46rmEnrgiE1oAfJlEDB85dj7Wb9Fv7KpoiWHQzJUBAAIA30cancmDLn9
         pagg//7jMrtPwBSXbFrC6EpWHTxyp5n81iJoRb+eiD73VYmfyN7WqmWcy/hOOZ46hU8c
         b4G+DK5aP+B2E4Ymfj3RfsYjiM+dkYs3ncxUTmKJ8wiIf7WO1wG3o71Wo6Nkiomy55Hg
         jbAA==
X-Forwarded-Encrypted: i=1; AJvYcCWDO84E8WTgESCLSjY14hNdXJtAo4qmWIW6p5MUnp9NypeKEULqOzsqdl1vzi2+Y27dn/En@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfm+DdZRaAAo1dn5TF2D6s0R7QACXb6qeKAWJdHS+23R1tyma3
	1mSJQzPSMGuDUTYYQ7YGsKBQaMpin8U2lUlgjnlUCA/drV7Tne9QLqxQcrZNtddIku/5VWdFbmd
	dz/ZKxg==
X-Google-Smtp-Source: AGHT+IGB7+rABtqUapFzM6mMVzt4bJxTdpznrcrdqGaG2ny6jkrW7YnxkjJRMXuW4bZ/it4hQr5mIhsy3+Go
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a25:b21e:0:b0:e39:95ea:f37 with SMTP id
 3f1490d57ef6-e57b138d496mr40794276.8.1737567817021; Wed, 22 Jan 2025 09:43:37
 -0800 (PST)
Date: Wed, 22 Jan 2025 09:43:01 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 11/18] perf llvm: Disassemble cleanup
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
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
2.48.1.262.g85cc9f2d1e-goog

