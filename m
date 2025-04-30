Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1F327E7EC
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035492; cv=none; b=KaXoluce/mN6ziB9ybg8gm1ncY1x41xgt0TT2VpjcQ+EYAzrLvz67p2d/KIny1bKbCv4hC4d7hSGoSPNjn2TH1OTg/BIz32dWZBnw+59f8Ed4by/TDzQXpVupExc6sluX2kUBbRxMELlP8Q3/IVYD7D1MOvUr80amRYbYkgyrG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035492; c=relaxed/simple;
	bh=PSiOgG7bWFRhRJGZr4xrC9dwLgvQlvIMtzHTDPuKezI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lJZ1vDdRvOG87j6gA8iovgnpayJ1uZ0eYe7BG91D6TyqQeQ3kOmPUUXk2wiWHgbRciO3AISzfzHjsKqkFEaF3KkubXeFJ6cHSkrPG/YcQV2LNvhrTTvrih4ZaU1a5oeYSxNvZsbL72FXejzUIlMleRgq8qbjJlWhJ/XKb6mgH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyQ4a1tz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyQ4a1tz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3085f5855c4so144764a91.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035486; x=1746640286; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffqnGj+pBhQ6TrUOmeMPrDQngLLfEb3NGF58IKymfSU=;
        b=vyQ4a1tzw1oVYdg9VcyvBGv1Tp//hf/iADpl8Qp+DGK7Xfi093Xo9qpcvNSPPTsIf+
         7Eu3NPGGTSbte/urJkOgvfjxvm8rbGL2D6shfnALn6HyPmatezV5Lqcb16m0ZARkDO+F
         mHEWTfm3V3XkjFGrsN6Z74VFBCCRYhMR2O/OAEIgRoznAJlXfeGtDF2bANeKjgSGBQq4
         W6O70UV9gH5O8IgLQ9bvqB45l9vkLOUqP7RxcfEQteeAPCQO1Opz3A9FVIiNN5EweJhS
         i+9+Z3WAdzDp/CGbpsgLZmjIJM7lcyUMXm1HOQ9bOu/ugP7zP4vn2mS7wrcqwfy8o/se
         09eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035486; x=1746640286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffqnGj+pBhQ6TrUOmeMPrDQngLLfEb3NGF58IKymfSU=;
        b=BCsA7h2CsGzYIa/Tg33FMJVcHEJD6AQ8l1WZOwLa07Hib8SJk5rgfkQ0Zru7hzlsOt
         nDEjEDehTI7hdOLzcXzsAnvYiplnsFPzgenqKdwrsDBw+OApJ3H+YTS7ci5KM/pPn1uN
         xdChfpw7FgKNTu+1Kyf4VLJnPdM0RyYozfGtC7154h3Ssq/DQpRLzZsiB4J1R5Y3OvzH
         Zusiahb1mv2pUARdB8F6Cq3TQeB5Ued4vdIb/x2vIpc9uABC11qCM50EmLm6MNZv9mHD
         G6K2zF0M7AP3nDKLFwUcT+qNhHaCeSOOR4ccUMj3ZHxI0daxMcItXDb2rAve6vSKtGx1
         bsxw==
X-Forwarded-Encrypted: i=1; AJvYcCW3D03ledBYgvawuNKUeDRyTj1SUpCbrsr8NHEnZSFnDJDM3mrB7Sw+al7xAm060bCFNnBY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+6HiF1siIRmTxG431k0zgscYIXJHUcHRqlIVCvqoFUoevTF0S
	2wRF8aC4FrQ6DHEVf2RkDLHmrYpZRrFWinYV/c9HnCL3qltpN4qnkm+9iigiQm65MVLxoOG3G0m
	53e9QUg==
X-Google-Smtp-Source: AGHT+IFoFY/yppOPHW+0sW6SMr0S9TXM/T2GiOtYKIfeG6NYAA5w/aaMGtekGErA65y8/28Sygemm2DdYeVj
X-Received: from pjbrr12.prod.google.com ([2002:a17:90b:2b4c:b0:2ff:4be0:c675])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da8f:b0:2ff:6bd0:ff26
 with SMTP id 98e67ed59e1d1-30a3336fea3mr4760497a91.34.1746035485584; Wed, 30
 Apr 2025 10:51:25 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:02 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-15-irogers@google.com>
Subject: [PATCH v2 14/47] perf jvmti: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/jvmti/jvmti_agent.c |  6 +++---
 tools/perf/util/genelf.c       |  2 +-
 tools/perf/util/jitdump.c      | 24 +++++++++++++-----------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 526dcaf9f079..2e2be9d8a118 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -377,7 +377,7 @@ jvmti_write_code(void *agent, char const *sym,
 	sym_len = strlen(sym) + 1;
 
 	rec.p.id           = JIT_CODE_LOAD;
-	rec.p.total_size   = sizeof(rec) + sym_len;
+	rec.p.total_size   = (uint32_t)(sizeof(rec) + sym_len);
 	rec.p.timestamp    = perf_get_timestamp();
 
 	rec.code_size  = size;
@@ -400,7 +400,7 @@ jvmti_write_code(void *agent, char const *sym,
 	 */
 	rec.code_index = code_generation++;
 
-	ret = fwrite_unlocked(&rec, sizeof(rec), 1, fp);
+	ret = (int)fwrite_unlocked(&rec, sizeof(rec), 1, fp);
 	fwrite_unlocked(sym, sym_len, 1, fp);
 
 	if (code)
@@ -454,7 +454,7 @@ jvmti_write_debug_info(void *agent, uint64_t code,
 	 */
 	size += nr_lines * sizeof(struct debug_entry);
 	size += flen;
-	rec.p.total_size = size;
+	rec.p.total_size = (uint32_t)size;
 
 	/*
 	 * If JVM is multi-threaded, multiple concurrent calls to agent
diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index cdce7f173d00..6da8f3c53f7d 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -252,7 +252,7 @@ jit_write_elf(int fd, uint64_t load_addr, const char *sym,
 	Elf_Shdr *shdr;
 	uint64_t eh_frame_base_offset;
 	char *strsym = NULL;
-	int symlen;
+	size_t symlen;
 	int retval = -1;
 
 	if (elf_version(EV_CURRENT) == EV_NONE) {
diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 624964f01b5f..874ced77d0a4 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -160,7 +160,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 	 */
 	flockfile(jd->in);
 
-	ret = fread(buf, sizeof(header), 1, jd->in);
+	ret = (int)fread(buf, sizeof(header), 1, jd->in);
 	if (ret != 1)
 		goto error;
 
@@ -226,7 +226,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 		bsz = bs;
 		buf = n;
 		/* read extra we do not know about */
-		ret = fread(buf, bs - bsz, 1, jd->in);
+		ret = (int)fread(buf, bs - bsz, 1, jd->in);
 		if (ret != 1)
 			goto error;
 	}
@@ -274,7 +274,7 @@ jit_get_next_entry(struct jit_buf_desc *jd)
 	/*
 	 * file is still locked at this point
 	 */
-	ret = fread(prefix, sizeof(*prefix), 1, jd->in);
+	ret = (int)fread(prefix, sizeof(*prefix), 1, jd->in);
 	if (ret  != 1)
 		return NULL;
 
@@ -304,7 +304,7 @@ jit_get_next_entry(struct jit_buf_desc *jd)
 
 	addr = ((void *)jd->buf) + sizeof(*prefix);
 
-	ret = fread(addr, bs - sizeof(*prefix), 1, jd->in);
+	ret = (int)fread(addr, bs - sizeof(*prefix), 1, jd->in);
 	if (ret != 1)
 		return NULL;
 
@@ -398,7 +398,7 @@ static uint64_t convert_timestamp(struct jit_buf_desc *jd, uint64_t timestamp)
 		return timestamp;
 
 	tc.time_shift = time_conv->time_shift;
-	tc.time_mult  = time_conv->time_mult;
+	tc.time_mult  = (unsigned int)time_conv->time_mult;
 	tc.time_zero  = time_conv->time_zero;
 
 	/*
@@ -443,8 +443,8 @@ static int jit_repipe_code_load(struct jit_buf_desc *jd, union jr_entry *jr)
 	nspid = jr->load.pid;
 	pid   = jr_entry_pid(jd, jr);
 	tid   = jr_entry_tid(jd, jr);
-	csize = jr->load.code_size;
-	usize = jd->unwinding_mapped_size;
+	csize = (int)jr->load.code_size;
+	usize = (int)jd->unwinding_mapped_size;
 	addr  = jr->load.code_addr;
 	sym   = (void *)((unsigned long)jr + sizeof(jr->load));
 	code  = (unsigned long)jr + jr->load.p.total_size - csize;
@@ -465,8 +465,10 @@ static int jit_repipe_code_load(struct jit_buf_desc *jd, union jr_entry *jr)
 
 	size = PERF_ALIGN(size, sizeof(u64));
 	uaddr = (uintptr_t)code;
-	ret = jit_emit_elf(jd, filename, sym, addr, (const void *)uaddr, csize, jd->debug_data, jd->nr_debug_entries,
-			   jd->unwinding_data, jd->eh_frame_hdr_size, jd->unwinding_size);
+	ret = jit_emit_elf(jd, filename, sym, addr, (const void *)uaddr, csize, jd->debug_data,
+			   (int)jd->nr_debug_entries, jd->unwinding_data,
+			   (uint32_t)jd->eh_frame_hdr_size,
+			   (uint32_t)jd->unwinding_size);
 
 	if (jd->debug_data && jd->nr_debug_entries) {
 		zfree(&jd->debug_data);
@@ -559,8 +561,8 @@ static int jit_repipe_code_move(struct jit_buf_desc *jd, union jr_entry *jr)
 
 	nspid = jr->load.pid;
 	pid   = jr_entry_pid(jd, jr);
-	tid   = jr_entry_tid(jd, jr);
-	usize = jd->unwinding_mapped_size;
+	tid   = (int)jr_entry_tid(jd, jr);
+	usize = (int)jd->unwinding_mapped_size;
 	idr_size = jd->machine->id_hdr_size;
 
 	/*
-- 
2.49.0.906.g1f30a19c02-goog

