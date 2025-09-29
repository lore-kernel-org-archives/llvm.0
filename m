Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E42BCF46
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759172966; cv=none; b=LxXqc9BtzAhUYFa4ur7Oti+QcfcxcdTi96jrwaStYruoh0THDx1TTIpgR7fRfhnxzySR9PGwZN4sgIR5QR8NCf/1Gwe251uTMAeOQyATrJbIenT33yCBAyZiPEO/6w5WtzqAGbZnAcBiBVTv9p+Rzcxt6ZimUlIKqiPAnnJ7COY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759172966; c=relaxed/simple;
	bh=AdUfJ3+HbRhbK7PtlXvfEfALYxdhT7u77r7aSN4uwZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=J13YBJZriCfO96nhCUCDB084qud11lmmNyl+JU6ymlFfEgnYATHjZNsiSE0JLd3QUfKTDJKR+qy8OCy6Onag3TZc+6Bixv1y42LUbukKW45euoglXSqi2ZOwne6MFvMEYCoeJt+APdECfN+WPW1wGR+4NAyNj2a8Oaoc5fBFx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=urrCszNb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="urrCszNb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b5533921eb2so3496152a12.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 12:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759172964; x=1759777764; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4971M/0zABDO+i83fcQEQWVemuah1MT0Et0WsfrEZzk=;
        b=urrCszNb7YmsRB4Pl0LSrREb5SPYtuIvU7dBhITUbU4GFnoxe9zOqiyZi69jHBQn7+
         Wtr4R8DRKidC8/d1Z+iwK11yX42F9kjtLX0AjktxvA8tiqlSDUC0epe98roUFmsyd6+l
         GXSBqPN6JSmmFH+cFnEyp9C2sTnkNMfzlZiAKQD2xxwsthvnvXOPwGq32MIv1qJLL1ST
         HD1mzatdOI2kGqL9AxZ5uIh1yUP0j/8yB4ityJk6gxi3Qw2KXKJ71dhl5RuHVOiMzxzL
         AUNVrqYJo65Q1O9l9Lwylf8ou0XSfzav9xtEc1WI4atracKSSMnGCUJzsuSoLuWDwI4b
         SqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172964; x=1759777764;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4971M/0zABDO+i83fcQEQWVemuah1MT0Et0WsfrEZzk=;
        b=FO7k5LrdTmEvEyFeLCXULyfr7+jyO4YtWJno/FbNPzZOIb06W/Xv4HQ9SXMvTbd6xl
         nXz875qcu/HXSBCZ/M36H3p4mQYJRqecGSFDHmtkuw5INDOdsoLOyzyypNa/WO4JVjsR
         /Rp/t5Lu0IL5dnI+I0rGQBjLQ7xh5b4CUhgswwAb0iuS2NwK65q9VXRC8uz8QqWSlvX9
         ipbqi9owbalY+WQJieFNXitluhxupfWwLjpSGUQczijMhzD9Guasv040h270WtfS5ehI
         BLDKbzlCSXvOy+a76aJqg8NzQWoBQsYbC4oaLiuc8GLFZmPOv+w24oZBvMEkOKi1/dxu
         NgYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCcam6mewJBk14Jxbwta2RLUk0Xzj6fIYEt2KeKPD9iSu0V+BBt1eHEHvmcNjXnWrVPOsS@lists.linux.dev
X-Gm-Message-State: AOJu0YysGd6FI1Eb4H3ULXn43ngxRAnyjjToz0HBGRoXWopEoqVaqwXX
	+qV0fX2LTDHe0p1aKR0QwjXlDNyR2mUCu6MBAab2KG+jC8awDDa8+rdiS7Gwe4utA5/HA6n8vPs
	XbszXHFsCPg==
X-Google-Smtp-Source: AGHT+IGSCDVx0cLNNfPAO34F5NCMZLpRD91/a9vLPfmnYqOXMggPFusn25YIXzpM5IEFpb7ikaAU0IUITXOR
X-Received: from pgar25.prod.google.com ([2002:a05:6a02:2e99:b0:b58:4e62:6f3d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:acf:b0:274:5030:2906
 with SMTP id d9443c01a7336-27ed4ab8df8mr196816435ad.46.1759172963586; Mon, 29
 Sep 2025 12:09:23 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:08:05 -0700
In-Reply-To: <20250929190805.201446-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250929190805.201446-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250929190805.201446-16-irogers@google.com>
Subject: [PATCH v6 15/15] perf disasm: Remove unused evsel from annotate_args
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Set in symbol__annotate but never used.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c | 1 -
 tools/perf/util/disasm.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index c9b220d9f924..a2e34f149a07 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -1015,7 +1015,6 @@ int symbol__annotate(struct map_symbol *ms, struct evsel *evsel,
 	struct symbol *sym = ms->sym;
 	struct annotation *notes = symbol__annotation(sym);
 	struct annotate_args args = {
-		.evsel		= evsel,
 		.options	= &annotate_opts,
 	};
 	struct arch *arch = NULL;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 09c86f540f7f..d2cb555e4a3b 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -98,7 +98,6 @@ struct ins_ops {
 struct annotate_args {
 	struct arch		  *arch;
 	struct map_symbol	  ms;
-	struct evsel		  *evsel;
 	struct annotation_options *options;
 	s64			  offset;
 	char			  *line;
-- 
2.51.0.570.gb178f27e6d-goog

