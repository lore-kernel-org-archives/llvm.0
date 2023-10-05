Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265A436A0
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WOrSaGcH"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81841ef79bso2109201276.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547351; x=1697152151; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTpWBQgPQVQy0TAZXLEWpBVQQ2YTPMy6ZmoyjFN0GGE=;
        b=WOrSaGcHrEKol3DIc+t793nj1SZTaC1nD/cZ+JMzAeQIVPi6SNfgWuDvYVTjArRzIH
         p/vME0GTzEEc4Ywptk90WA7X/r9oGsLpjsuczEaEvtAjDfv6RveCJFOUnDPcWegzbmqu
         2dP9St/1tCJStXl64WfBSaGtOhxfWFtM5Y4DnYoB8BjkYP1vo8VGKzzwta38j57LHf0i
         pKwfBhhL1uJOex4t/owiAYI25c2o0MxwsCb6Uhes2QMw2Tpu++HMzXhHGJ0RzStNNXnc
         KmkHnTfBICy4AlvTHqQaQ/LtaBavUsZgOtSIK9wJl4o4EeTJtew7bxix++El+ezRXax2
         l7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547351; x=1697152151;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTpWBQgPQVQy0TAZXLEWpBVQQ2YTPMy6ZmoyjFN0GGE=;
        b=V1FSDy3/n++9U0RhPhHQodaZD9ORvvX9ArUL/dc9ZZ2YjIWqAUZsOzac6b2KTR8X2e
         1pXTu7nwHyKEwKi2kx8PsDG9quFsrDdPnLgvE+WHWL9T3I5nSKZZYfV/rRPcA/DgIQtE
         aQGETr6J1fIbAqCF7ISqWbLYlXTzm5/xYdQc4r7aqZFSuHDci+vcMGi5yh6qyqEfCHYL
         Z8UVmSxEDbbAdVvGF8S0MD/FN68mHFew7JVMsnskEuF3ZpNEIWEwSGd1baOz4qipEd6k
         uhnz96a8cghQAAOjKcNHVK8FIa43fTF4zKmMrCUZHd7on1XOhN8DcQgGEPFvXUTB4IBH
         AB/Q==
X-Gm-Message-State: AOJu0YyD8GT9amlfDj9BwQJMM7hRhHB0XdQORHJaqodCHiXMfOIcV9W0
	g0ujj8byUM7JualRm+jDgcooYfqbynVx
X-Google-Smtp-Source: AGHT+IGnxaCsZLcDNpjb2IRnCqzooQl7/eSuSXSt2DJTDf33tEW2BnCckAmI3vVY62Ne9wg9AkMtIxPrNICk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:2513:0:b0:d0f:a0a6:8e87 with SMTP id
 l19-20020a252513000000b00d0fa0a68e87mr93479ybl.2.1696547351036; Thu, 05 Oct
 2023 16:09:11 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:39 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 06/18] perf buildid-cache: Fix use of uninitialized value
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
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

