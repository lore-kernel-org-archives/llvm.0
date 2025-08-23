Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94521220F4F
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909188; cv=none; b=FALNOP/a6YuoxawS6Nb469i7hEOa0w0PGl2BiVdy08tlyLOWrxLiEZK8Z8Q4ZD7tx3DCyf+bHqoMnVEHvCeYkRCRfp0aZA/EzjlzkJW6aVy+PCBiMD0bN53vohpUlqko4lS6/DHbeawEIEq49Ktlupru+Z6wzjXTw48ePN5P4mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909188; c=relaxed/simple;
	bh=wLFpqbMmcTY/fllGJKa8e5RF+S6JWZUk148fLGz1+x4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Xy0RsCegzjI9Z66hVvjjjgJDQ1Rpo5bZXOlCEMaxdxr+shXS/fr59p3ilKlNcVcoTUiJjuAFcLlvD/NKHnerVMzlBy+//mjf/D0F36L0BrnU3esPj+e3fdTJb9VAU860b+UGpQnYRAcxCPqQsX2ekkti73TDZ5TAhb3kB3W0u40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dj/g46eL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dj/g46eL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b473910af91so3184445a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909186; x=1756513986; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZd+KViNkgPk6uGWtqta6gYv6vqzzqK5gvrF3dTKFc0=;
        b=dj/g46eLbNTCffPMy7OtDBwhOeLo1fV8qC3BrJIv51k64qRaW0FgRWAR0CQ6/4Td3e
         wwOlGFHbgK48J7jMWqEPdrFfj/deJIJhlTRSeQ/LfEcuaiXi54SV++cUJ0t/3hZqJoO0
         I1b+fHuxLqBcsk6+zGMl09Mu0NVP/nv0nfQcYx69WHGlmuRxvT83fsUfwKBAZYW+ddwS
         Pg5UQUC/0jjjAS2PbZ36To8XaAhhNs6RojiJzLmkKArRpDyKyKMfO0URYE7zTY0KaXMI
         liRiKdXq0owKQf6jq1n6k2PceAAVa77TtY96jhDhZchhRefplLyBZJ5SZ9+F7z1bujDo
         AfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909186; x=1756513986;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZd+KViNkgPk6uGWtqta6gYv6vqzzqK5gvrF3dTKFc0=;
        b=CBXOZnwnKU4+juWdWdiBzNEvyicUd0CxkCHbupY8TDFtKTUSCL9VOkG5cASOzoY/6A
         8rdAXAJX6KGWhcaZyHoeAJKb600vf3ygM20VKcGnGgFH8+/kvZ8x2KXYcbHaQc72Owsr
         Ls8Ip3+Pt37YrO0gRQi41Or66FRPbWY5rsm7sD7CyQho6Y/AtCX3riMUqncugcjONEfG
         EhnJ4/NvH1YxF+QDjnn3uOROhvdR0mMJyzqaKLV9BoA5wi0whl72fWoGx6e64heGfpF3
         eyBfC2B5YKeH3l9GUy2kS3/IJqlTQ/3ss1ANQIYr4eExV5Eo4HwIzaBP1eez8yc0Kuhf
         3Jig==
X-Forwarded-Encrypted: i=1; AJvYcCULv25tM5uNTrhZk2KHdqOgDIefi5k5VYVrXlSV0SbHN0VmojxfKv6G1QE7EziZBvPmbPv9@lists.linux.dev
X-Gm-Message-State: AOJu0YwgC7tlzQMmXEG1UCR7bpA0GBBUPFfOjWqal7rwfNY8w9oHYtdG
	BVFak4UkikyD8U11tKrL2t9RxBE9BzOxwITWJI3io8j1y8VYunH1JO/f/nCgVVeTscIPxhTyto7
	PSlgBXn0cGg==
X-Google-Smtp-Source: AGHT+IEo4i1Oh6GMUczyU8oICZtsLUiYPNm/BnhXDlA+3OjsdkTKGwRPj2wnAswxCKoDGQjOWgRa+76VTakc
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:325:23da:629b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a68:b0:233:d3e7:6fd6
 with SMTP id d9443c01a7336-2460248450emr103031885ad.19.1755909185922; Fri, 22
 Aug 2025 17:33:05 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:13 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-18-irogers@google.com>
Subject: [PATCH v5 17/19] perf disasm: Make ins__scnprintf and ins__is_nop static
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

Reduce the scope of ins__scnprintf and ins__is_nop that aren't used
outside of disasm.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c | 6 +++---
 tools/perf/util/disasm.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index f7bba5e1e15a..a5d06f63a59e 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -246,8 +246,8 @@ static int ins__raw_scnprintf(struct ins *ins, char *bf, size_t size,
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name, ops->raw);
 }
 
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name)
+static int ins__scnprintf(struct ins *ins, char *bf, size_t size,
+			  struct ins_operands *ops, int max_ins_name)
 {
 	if (ins->ops->scnprintf)
 		return ins->ops->scnprintf(ins, bf, size, ops, max_ins_name);
@@ -824,7 +824,7 @@ static struct ins_ops ret_ops = {
 	.scnprintf = ins__raw_scnprintf,
 };
 
-bool ins__is_nop(const struct ins *ins)
+static bool ins__is_nop(const struct ins *ins)
 {
 	return ins->ops == &nop_ops;
 }
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2cb4e1a6bd30..09c86f540f7f 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -110,13 +110,10 @@ struct arch *arch__find(const char *name);
 bool arch__is(struct arch *arch, const char *name);
 
 struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name);
 
 bool ins__is_call(const struct ins *ins);
 bool ins__is_jump(const struct ins *ins);
 bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2);
-bool ins__is_nop(const struct ins *ins);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

