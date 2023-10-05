Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD814001
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+kiBGZO"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d9299cac11aso1322408276.2
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547344; x=1697152144; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVKoLuc5a7LEHlQh90vyaH3VbvcXZG1OCxjaJSmoY8k=;
        b=1+kiBGZOW/hAKzQjGfVe5gkicaF6y0YheLRJyDBlnTYvLvL153aZlgxgGrnalR2YRW
         mbvnvh7s9On++9yd9reOlJ2WXBvfZQ1jUljrRAaKRbbLYLfd2KrInSlg1dL361zUp/4b
         Y/vnM7VBQUXPbq/X935SsFc+TnJZIhNAeil6riFuqWjbLXEU6J6VGxLEC0li4FBHh0mw
         LS05spm/vsbEj4O496jRsgfCe2r5RfSGLlWS9d9ZXAFfUXfeC0MiJqhdM0lcqiV2K8u8
         KMIBS9H8zcaw6eUIKhVnTq9Fkv/+PFEX4Q7LS/ox2UnNPRyppSppipUCy5ztw10irSzr
         YxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547344; x=1697152144;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVKoLuc5a7LEHlQh90vyaH3VbvcXZG1OCxjaJSmoY8k=;
        b=pjr8xQiO/ONi2QeXzTR8Km94HxhFvbmhCbPhe0DN/cMPr6CZIlHrii2C9nfkx0Uu8K
         Ghluv5TUlC24gnfziczzcwFyGniQmW8sEfYMmlCLj/FeJW/sxgdnAdHN8RLfWHzyCTJJ
         4VzWxb1iIyXmf+Rwwvn9LpCiVS1t3Yz7PUEdWv150c48FpmULimMN0iJUVtlQvPVv9o8
         qxrVOvqqyc4QqIv8ibX2MTUi81JX5mSwNDFFaCDh1p+kbvyXAN2ES4TNodpONttKB3OX
         Vn7j8X1cTfpM088q2GJeAiU/KZWhotN+GFggwgtBow3yWQtrRpvHQ6nWCfrPw0Zsvn1Y
         r8Cw==
X-Gm-Message-State: AOJu0Yy1dXbyffHUJwLrNPpoZbSNasFEfXFgBfUext8APcG72tsajIfw
	FJHTkoryGKPAjfXRPth6idvejhUjdCjj
X-Google-Smtp-Source: AGHT+IHo6U+kJASF6nCohpjFiAn0CLPcx5Qb6otqZC+Kpf+MOzGXa7HHf6AdITUGY7vbn2be8G5F1c0EEIDU
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:d4d1:0:b0:d81:7d48:a459 with SMTP id
 m200-20020a25d4d1000000b00d817d48a459mr114013ybf.8.1696547344121; Thu, 05 Oct
 2023 16:09:04 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:36 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 03/18] run-clang-tools: Add pass through checks and and
 header-filter arguments
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

Add a -checks argument to allow the checks passed to the clang-tool to
be set on the command line.

Add a pass through -header-filter option.

Don't run analysis on non-C or CPP files.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 scripts/clang-tools/run-clang-tools.py | 32 ++++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 3266708a8658..f31ffd09e1ea 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -33,6 +33,11 @@ def parse_arguments():
     path_help = "Path to the compilation database to parse"
     parser.add_argument("path", type=str, help=path_help)
 
+    checks_help = "Checks to pass to the analysis"
+    parser.add_argument("-checks", type=str, default=None, help=checks_help)
+    header_filter_help = "Pass the -header-filter value to the tool"
+    parser.add_argument("-header-filter", type=str, default=None, help=header_filter_help)
+
     return parser.parse_args()
 
 
@@ -45,14 +50,27 @@ def init(l, a):
 
 def run_analysis(entry):
     # Disable all checks, then re-enable the ones we want
-    checks = []
-    checks.append("-checks=-*")
-    if args.type == "clang-tidy":
-        checks.append("linuxkernel-*")
+    global args
+    checks = None
+    if args.checks:
+        checks = args.checks.split(',')
     else:
-        checks.append("clang-analyzer-*")
-        checks.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
-    p = subprocess.run(["clang-tidy", "-p", args.path, ",".join(checks), entry["file"]],
+        checks = ["-*"]
+        if args.type == "clang-tidy":
+            checks.append("linuxkernel-*")
+        else:
+            checks.append("clang-analyzer-*")
+            checks.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
+    file = entry["file"]
+    if not file.endswith(".c") and not file.endswith(".cpp"):
+        with lock:
+            print(f"Skipping non-C file: '{file}'", file=sys.stderr)
+        return
+    pargs = ["clang-tidy", "-p", args.path, "-checks=" + ",".join(checks)]
+    if args.header_filter:
+        pargs.append("-header-filter=" + args.header_filter)
+    pargs.append(file)
+    p = subprocess.run(pargs,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
                        cwd=entry["directory"])
-- 
2.42.0.609.gbb76f46606-goog

