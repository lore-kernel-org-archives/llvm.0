Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A5358AE
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O7J8dXqn"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d9a3a98b34dso694309276.3
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876780; x=1697481580; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTpWBQgPQVQy0TAZXLEWpBVQQ2YTPMy6ZmoyjFN0GGE=;
        b=O7J8dXqn7l7m/4FZkCnh+ddY7F7rYe7Q7sLW7cPK6WsgOVPRi8QmThk3OFdOAYjwqA
         EMjYne8a83D1wOmkO2XlrRC4AK1cDjx9goTmg+WV/qzeKBsqpMA9q/Q/jmRNF4N03Mca
         NfncnZJuJqWeHXOcf4eJQJlTLK2LNAsF7TtzILM4lpE+o1iC1oQ7kVbjEHogYAVFPMcb
         leEmJFLjmkUho699eGwp+Lyx2zHia/dmYG4plDmW7pIQTfnMOd+cs5rtFm2VIe7mkwVy
         //X10WJMlLhgAAkqMhJ8XExjkOSbybP6xzEMxm0WylaiMYwxNwmDTaMph/QqcULXVMMs
         xn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876780; x=1697481580;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTpWBQgPQVQy0TAZXLEWpBVQQ2YTPMy6ZmoyjFN0GGE=;
        b=GVvJdOqEY1CYdb2DtrI3mggkTbLBmmJafUXg79kgX2tDIx2dznyFXnw2cCdBuzsHjy
         IXPUVcCLJyO5q64VdUw5gpS105cozAOvFzTpBJ8cQ6QqexIwHq2RiC6zk498c4u1n6N+
         7hlxxU1ejJrqPpgUHMND/ULwgH4e9s8zQi7tYlduM7QKs3xT4gVIrqOjDSf6zpEV8VZw
         O0CA1usN5/0FpFqMmx2hTT0aY7SZfo3vGUznRmNdGNCh6hNUiSLpBqydS/AXJQBXF97H
         YYKMWOnJHzCuNZ+gHx4hukUqVWZa35D+uD8o8OYAkAbeov8P0n2L5HUSh7lVFmWxLGO4
         Q52w==
X-Gm-Message-State: AOJu0YyhgMQcXx4AKoTtsYpSishoxZ/8rOwSD5QjTPjzBlMxqbav70Jc
	GWSnfr5tv6OsJearr2pRukAiQYi3iF3v
X-Google-Smtp-Source: AGHT+IHSFLzIMOdZMLClCkJhOThmOClRy30ep3/ZFs+55TAb6kM08lo1dDdwBNKotykaeaR7pVv7k1gDXaCN
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a05:6902:181a:b0:d89:3ed5:6042 with SMTP
 id cf26-20020a056902181a00b00d893ed56042mr268371ybb.11.1696876780144; Mon, 09
 Oct 2023 11:39:40 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:07 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 05/18] perf buildid-cache: Fix use of uninitialized value
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The buildid filename is first determined and then from this the
buildid read. If getting the filename fails then the buildid will be
used for a later memcmp uninitialized. Detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-buildid-cache.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-buildid-cache.c
index cd381693658b..e2a40f1d9225 100644
--- a/tools/perf/builtin-buildid-cache.c
+++ b/tools/perf/builtin-buildid-cache.c
@@ -277,8 +277,10 @@ static bool dso__missing_buildid_cache(struct dso *dso, int parm __maybe_unused)
 	char filename[PATH_MAX];
 	struct build_id bid;
 
-	if (dso__build_id_filename(dso, filename, sizeof(filename), false) &&
-	    filename__read_build_id(filename, &bid) == -1) {
+	if (!dso__build_id_filename(dso, filename, sizeof(filename), false))
+		return true;
+
+	if (filename__read_build_id(filename, &bid) == -1) {
 		if (errno == ENOENT)
 			return false;
 
-- 
2.42.0.609.gbb76f46606-goog

