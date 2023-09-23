Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64546AF
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:44 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-597f461adc5so52794987b3.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447343; x=1696052143; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YyfrmX8SYfxgP/g8BqVIBEEAppz8GcyEO0PbPfBBKMU=;
        b=wLVbEx1LkrUrGGJfqrBgHeM/d21FfTKCiDIhxiw39GEbF5zZXP8yE4td6kVPmpMWC+
         5lct5WjXfWKCj4qRrY06281/tCehrUgLkfzYqY8U43euFIAyvsJsy86FebpLTL6hYCyI
         u9yc3JhegdFEEnjD2zHj1P9uhqFgtbsAdQgn8EsGTcvyLIv/sXnmOP28lthc6o/V4Jym
         Lh02q++UrGUOdFIYYcbR8oW8yQtfj6I1KS8uJtGh/MJAhGsunPwpJXqBh7zlzUiHjDWK
         GXHnxqoVcYtO4AUemBzo2MfoyCmvJ0JmUOpPJMwV9cYWH7RHivU1UsgWYEKCdylvreLi
         NYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447343; x=1696052143;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyfrmX8SYfxgP/g8BqVIBEEAppz8GcyEO0PbPfBBKMU=;
        b=X+uby3dOt1cdXIHEFI3EOe4zOL99IvJ0mw3L5YvS0KTMVNAMMTWaqq475TOOlRjRfY
         W9xrPYjqCR/UXZFwpjlNy1UUh2UF2vKtSGeHD5Dt2RClkX1irzM4MXzjpRhRLzagrizn
         cWAHGhI+Dnvwalng483LjgTSrIzLS/OUSMAKQTNMSDYBGqAtvP7YDXwdts5JvRF2DsXf
         U+w/1/k4IAtgkkqWsiuyglZ8p3rHItLTSJuq0z1hY8oUxra9jRhZDE8nYj37Au3MYqyc
         ZJ3j9ypDM76IBRXjotPaIueU2PLQAaibUQ9WZCnYmrFpd3Z64IJtXm5RtdjlX3tVnZpU
         LZ6Q==
X-Gm-Message-State: AOJu0YyEILErsYVQndyjxU43/qfuGAqv12w3p7ykcpB5ogZIGI1mPZxv
	rZ5qurTHdCawm8CZ1oACoduJO5yUOcwo
X-Google-Smtp-Source: AGHT+IETS2wMpCT0fvXFeWRIoyxRh6J1rlFulgIYswN8qY/BztVcD0h804M/t46jW2XazPHnfi7jT5YN+Nc2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a81:c607:0:b0:59b:d9b8:9ae3 with SMTP id
 l7-20020a81c607000000b0059bd9b89ae3mr21091ywi.10.1695447343513; Fri, 22 Sep
 2023 22:35:43 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:00 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 03/18] run-clang-tools: Add pass through checks and and
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a -checks argument to allow the checks passed to the clang-tool to
be set on the command line.

Add a pass through -header-filter option.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 scripts/clang-tools/run-clang-tools.py | 34 ++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 3266708a8658..5dfe03852cb4 100755
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
 
 
@@ -45,14 +50,29 @@ def init(l, a):
 
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
+    pargs = ["clang-tidy", "-p", args.path]
+    if checks:
+        pargs.append("-checks=" + ",".join(checks))
+    if args.header_filter:
+        pargs.append("-header-filter=" + args.header_filter)
+    pargs.append(file)
+    p = subprocess.run(pargs,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
                        cwd=entry["directory"])
-- 
2.42.0.515.g380fc7ccd1-goog

