Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3437220687
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 18:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531912; cv=none; b=ACkQ8Y7bPxa70PlZQe61k9brNz+pQVz/wAq8nrdXviZsHAEAQjXbM0urAywWSa+Uhz6CHnmHFZFAjZFkMhiGPMBQJjIhs9XMw7bsTN/7O7kcC6kx4OXMBAetBANp0NJimT8Qdn77Tl+Ergl2IvkULwJUKYyiWKFby9eaDkqMrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531912; c=relaxed/simple;
	bh=qDrp7dk7UR2vIDZlNdoIiVlhsgl8sqEUeq30Rm4CVOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=sOhQdlAkmTUUThjjk8NL3ZEkHWu/baCPr+M/Cdi88rPviPS2CsLiqG78Beu6fuuPs7lHI+LQN3Uur3rW823HeTVRPFTcoq3JgjTNRIIU2RAUfENKW/QzEFn9z/N5YRzsMMphznnFf43dWKj6D/FXnhgjmcKSGz6sI6VoEs8nAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lrCm4+YM; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lrCm4+YM"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72c0050a956so4464989a34.2
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531905; x=1744136705; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/8NQLM9l0NGLIoAsEqb7s+pejmq1A+sdW/bucy2qKA=;
        b=lrCm4+YMRjXyNgmt0V3AZOSaqwASIWKjDYKviyRtMth9KJHzJQw2KwHgAE+YMg7URV
         AFSKDshnb9+/7hzpb2hwHT1QYfeW9cz08usXauAUDbnKWWvCpIP0VIxyNbvFEx998eyi
         iz4LryOcClXzqPveM8vHHb+BfHNjqYQV1SXvknglVODo9Mv/MnGk4bX3zzJvkDf5y2BU
         GannHajrMoB0h6sS6DFaVemIMOdIvJjDrDbyW43kPBU7bVAJaBW7CA/z47zbXUCrlVEW
         JADJIeGt5eMWC0s7stukcfO07P1VEZ+7L0jLtomoozKrlYP+N7HVEVC6ZgPxayDLZtQf
         tAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531905; x=1744136705;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/8NQLM9l0NGLIoAsEqb7s+pejmq1A+sdW/bucy2qKA=;
        b=xU/WEEHm9n+wys8fH8MGy7fON21uB/KDncdZc16IiGsW8SVR7nUsTtTyqLjEzGnhtu
         RTQY9BCkIahYDueHBvAo5A5SWmP+TmhwCXE+qrY0+aB+gkDs8Th3PAiDvOFhKbz3D+vS
         Zgg0Ufbi+Ak6uISDeZt04WphYVfFofGfoutf7nY735G5+AFBMuAxMh/QgSk1j4eqYAr6
         0fZX5kMxJseNImuRKCNNBWLP2VplEsOwj0AYkfORF0v679ZZ/xuAyfVLsLG70QsjvurJ
         /LAttjRWN2Gp65F/uOPwwBlUi6seYlVAdyWwk4nVqRDSPCXLfOp1/5uVfmBJ5wDKciuK
         qnpg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqRSmzTtFCksEd+9uBWjVV5hKnfd2+koI7ohmvRweGjxIDBzwpJum5uwGD2U6usYExon+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3NwfpO/EKbw3+h7PnRpXfCdkMFWUN1szFQ24HT1F4R8tUa3DX
	xSYn2OTF9Ub69NSzbiJgwGwchKi3Xy5BBo2JaO6nSVu+sY24JAvbWo+BYy7DvimLZbFMx3jO5Uq
	ujaqaaA==
X-Google-Smtp-Source: AGHT+IHwNaLSyfCZQ9yujF0xXANqRr9YjfymtsJ7oaqSCiXH/SKLc6pr1AzAS4LSQE5X0torr+Wm+aih3zPD
X-Received: from oabvr7.prod.google.com ([2002:a05:6871:a0c7:b0:289:2c09:4e10])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:388c:b0:72b:8274:7c09
 with SMTP id 46e09a7af769-72c6377e191mr9800632a34.4.1743531905060; Tue, 01
 Apr 2025 11:25:05 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:12 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-15-irogers@google.com>
Subject: [PATCH v1 14/48] perf jvmti: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
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
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
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
2.49.0.504.g3bcea36a83-goog

