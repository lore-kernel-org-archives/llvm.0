Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7C1EB195
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789285; cv=none; b=IMJcQkzXSayz8Hs+2LLI1eW0AZH+Es1RyAkmCA6NYoEP/zTUuAXQWiTAP1uIQ20XzGH2uT5hMVSgH5QuK/ECeF6osH3w8FNW2GJ5+UIIjUuGv7DYXtTtfPhCimVKIoNHOi6BZlDxVA4Y6iboXlV10oS1Nwqk0xxetY08ShZZNdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789285; c=relaxed/simple;
	bh=pG5Yf72C3MqafKFRNeVo/6WJSrEMD1cF8DCDnUjCrR4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=bZD9MWLWX5tQiwj3ZAiVVwYu34bU4H+wkVHQ/l9Z2xg64pA8ht1WeryEiIjCiIhTmu5Mdq9yJpBDeKswl1cr5FGb5ytR+0ipVNH3f2pOZnSbXkseTsIdG2/3IkHYvx36B4mjDpu5BDRr5kBu7h7FxgYUz+FM4mmgwFTSOeGjEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hzBUh8w3; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hzBUh8w3"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32ec2211659so4579010a91.0
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 15:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759789283; x=1760394083; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HQWL67VG2RJkWDD0RBurlwFfJhiEYMgxw5epo/dpmeY=;
        b=hzBUh8w33qHmDQa155Fj28Y5s4GU3bFqg+WJorhZRjubjkzYV3ZLXo5W5QPuBpGDvX
         m6mIs9w3hpyQ41E43ppecrXgYr/Iv8YxC75WE/bkdgvfdGzaQGl/j4Y+noXbodjnIIFh
         yshEcNpKAUKNqjEvlyQDoC84FMmRMFkmyaaRSpwjJ8O/TF/8ntBi9Zdaafi+ZqIqxG3I
         ugtWA/37dsc23Vzsqug83RzDnMWP1vBqrP5GcskDY594hQ+pDQ245KcSqbEvP7a9Lfqn
         hELWcsSwdh4V4WFTTefBTXRVmYEuk8OSvrAYuF6l4KyqByKQBSPxDdBrTTyN2rhoAaUL
         ra+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789283; x=1760394083;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQWL67VG2RJkWDD0RBurlwFfJhiEYMgxw5epo/dpmeY=;
        b=pmOTI4G8GkZkmWcM5Qox/i20UQXL8sBcxZ+W6SFBYBlvt3zhprjdmnW24dmnuKxFYw
         cJ570uqbijFsLMLJa06Dac+pO7BhbMCLT8FS4fmTMxa+gaMM63MCejX9+4+MwDMpj//Q
         5w8e+K3f8ruqF5bjrVxn4BQ/dEdLqZRR8X0wdwymJRO1WQFdr9YuCEZCgsEVD+iA27CK
         wj0mtmhG21v9BUWGoWldRUhsoTMFw5boY+nmU96I07zcHx9dS+9DjidJmiST9hY5iS8/
         nryOFyMStAbIb1qOR9Xz8n79+W0kVWiroesY4sQjFZvj3DJ9n56ua5a7Ew7JUxBh582b
         KTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa9OsVhHFk0e3rlbDjhAIBijiJJJL4Rh5f0lxZQRJYp0gNzS4baN5uJuTa8TM+psAbnw38@lists.linux.dev
X-Gm-Message-State: AOJu0YyMQ8rBmI6ZhDB+lsraWFqERAOOsj3XrqZZwgL+8m72NxFv54Hg
	Ln9Fkv1BuSUgl//vDX4ylpDJ/m3sDfxcbF+e5NbhiesYKdvKRfoazqy3dd8p5QKriW7nkANqQhq
	thvSJsq+tEg==
X-Google-Smtp-Source: AGHT+IG9LGXJQP1sxyydOdHtv0ZVI9tHHJXDh68uhbhHHO6JQs+vkAbydr9aE4+5APzeHyRyAJDVj5L8NboC
X-Received: from pjbsy16.prod.google.com ([2002:a17:90b:2d10:b0:327:dc48:1406])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b0e:b0:330:6d5e:f17e
 with SMTP id 98e67ed59e1d1-339c278eb63mr16671097a91.24.1759789283381; Mon, 06
 Oct 2025 15:21:23 -0700 (PDT)
Date: Mon,  6 Oct 2025 15:21:16 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006222116.3335193-1-irogers@google.com>
Subject: [PATCH v1] perf build: Don't leave a.out file when building with clang
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Testing clang features doesn't specify a "-o" option so an a.out file
is created and left in the make directory (not the output). Fix this
by specifying a "-o" of "/dev/null". Reorganize the code a little to
help with readability.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/setup.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
index dd289d15acfd..6caf2126b1cd 100644
--- a/tools/perf/util/setup.py
+++ b/tools/perf/util/setup.py
@@ -22,8 +22,16 @@ assert srctree, "Environment variable srctree, for the Linux sources, not set"
 src_feature_tests  = f'{srctree}/tools/build/feature'
 
 def clang_has_option(option):
-    cc_output = Popen([cc, cc_options + option, path.join(src_feature_tests, "test-hello.c") ], stderr=PIPE).stderr.readlines()
-    return [o for o in cc_output if ((b"unknown argument" in o) or (b"is not supported" in o) or (b"unknown warning option" in o))] == [ ]
+    error_substrings = (
+        b"unknown argument",
+        b"is not supported",
+        b"unknown warning option"
+    )
+    clang_command = [cc, cc_options + option,
+                     "-o", "/dev/null",
+                     path.join(src_feature_tests, "test-hello.c") ]
+    cc_output = Popen(clang_command, stderr=PIPE).stderr.readlines()
+    return not any(any(error in line for error in error_substrings) for line in cc_output)
 
 if cc_is_clang:
     from sysconfig import get_config_vars
-- 
2.51.0.618.g983fd99d29-goog

