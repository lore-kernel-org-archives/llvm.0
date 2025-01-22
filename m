Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501EB21C171
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567833; cv=none; b=MiX6vyeRf/etNCQDgj997s2lCVgCQDIf3l8dupYMVpJJI4BHa76LOakjlkyetp71j59TzUdNi1JSEQn3dQbmEVEkfNA1OpAq1m8kyNwQ7u1+646Ex3c87e/kWAdbxuxZTnOVIUl8uWkXCH7LSUNDlTVsRlxm9HsHv42IyjuV0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567833; c=relaxed/simple;
	bh=qYuXxLCF57TeMFaCU4NFh8p73KoL9Nl1rlMbdvZk9JQ=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=QpZ4r5h2oFrletPG3B7CuYmIi9aC7YZdqW2qKOFIW1ZcAEGhGIz1CTQTVsIMrGsu404bsjWC6lWwZqHk/Y59Ia2/rtc4I6cNvxVhol+1L7xTX7bJcrxg7KUl/uvTamhKC/1YNtRVmH6xvKvChiKEp4TSPgqFTp/FIJsHoNcG844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmTr892e; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmTr892e"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e572df6db3eso15720427276.3
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567830; x=1738172630; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haBR2TU+NQmXlaQPCGBZmJsdRZzJVYrdXgTgjxml9Fk=;
        b=RmTr892eRwOhG4zM/rm0HJOgpowdjtPz+uW7UfF/NWtQusRBiFcRoFv4XqCxxfY+gz
         MZGp60pkUS3VtpJL+RCuhEqoDQDXt5bXFIoQY2heUGgTFP+0RmBpp9tC/rJudZcZTI8g
         fZYAoLdXitHn36khyfadal9GxC+c2x7G08RdXqpZ+81qnVhz36ea/LMUKtBj0BoEX8wI
         bblxb2N9AUIv90dzlT0HjEJxxuPMUGoK3B/2fy8vu9XmS/AjYzJ1aOKmbPNkOmleJyCp
         nhwqpr7mPCJ9M+0flLTLTK4V8R+hCP/2u5sCXehmMkGSyp9UIxn8c93lh5hUPCb7zNHa
         uDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567830; x=1738172630;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haBR2TU+NQmXlaQPCGBZmJsdRZzJVYrdXgTgjxml9Fk=;
        b=tDEkanq7Q5Gv5OKGOczDKlBQizXw2VoCLCW6i5EUGr8qBc1PW0ZPvV0qdgsWekapH8
         IUYH64aKGMpAQS9UR8e8JCRDKrowrA9YuJCU6y30SYgsPpLvdt0bF2HOnVHD05Tjr3G/
         gBm+e9oairZSvj6x4N+f/EvjVoBetaQxWoyVYTDNF7T4HQW2DVe9w8sqSFHFlGRplWNP
         GBRIsT1KEVxVuuhf+XN3EpnUwVuinwNYWEp6C3D8qHz6lzcaPJ9izVk48/HqN1xnHYXT
         hTWrj1p0K+XCVNGFlhzAeDk0ikQe5HL9ETRXls7h62vNHH4+c3xMgALdFow6OUzIsIKu
         8i7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXscixSbxUjufsxqaMccCFK69KaqqGzbMfF+DGmGBUd0odoL4lDEjq7JhQ05NWpQfSGDEbn@lists.linux.dev
X-Gm-Message-State: AOJu0YyzPsKXicghqhuplFod6cxc194TpwqHVyCZNropeOmXMXT2y5aj
	Gade6xQ6iPt4Rnmx+nGIYl3OJ1xFTvr5ADPFaDNPNag8HN4LeEV+2hoS7jA7YzkqXko+ERfRoSL
	tsn7ZeA==
X-Google-Smtp-Source: AGHT+IGJo7x2rI9e2t2V70cyAApaxwGRFhvDYsMitvoXzM7aW44S+AkLYf5FsMhLoQfA3mdS9KyAD+5IoZFM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a25:d3c2:0:b0:e53:b976:cee7 with SMTP id
 3f1490d57ef6-e57b103080amr40168276.2.1737567830426; Wed, 22 Jan 2025 09:43:50
 -0800 (PST)
Date: Wed, 22 Jan 2025 09:43:07 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 17/18] perf disasm: Make ins__scnprintf and ins__is_nop static
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

Reduce the scope of ins__scnprintf and ins__is_nop that aren't used
outside of disasm.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c | 6 +++---
 tools/perf/util/disasm.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index ebd86691acf8..b2dfd40588ef 100644
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
2.48.1.262.g85cc9f2d1e-goog

