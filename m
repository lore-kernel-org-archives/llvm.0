Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A942AA3
	for <llvm@lists.linux.dev>; Tue,  7 Oct 2025 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851526; cv=none; b=hayP3iRskdAWJayDIMFyLSeTNzjFKEOdFdIA2GHtUQVaLJ4AXeDZnNZHINDvvVBkcu6+IMbh3hp84x6B1+wCrKnseaLMV2Q4tlD68a3j1XrSRGzrvo+tebdywPR4MzXhi4pfcy+Djt8Cqrj7BUpZEVYqfhMRli2iXPhEeyk9ndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851526; c=relaxed/simple;
	bh=n9zc1w1kc+MtlfYX6aY9R3/gS+Fpbxtfvrs5vlvfd2c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=G076AOJMFzbN+x4aYsNG8sX1pE8J2WJNpB9UaVIDGpAoP1utp7+z2iQD+fh5atvZ4+mA+OXMd3U/oScqG8McxYsHyyRH8tzKgFR5KH79Gs7uXTzukEoNbAiOJdWa9X0ULXsGXJW+MDVCug/V5RtIBnOpAftuWUQUwW/tBfNuOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5dssXVn; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5dssXVn"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b522037281bso4506645a12.3
        for <llvm@lists.linux.dev>; Tue, 07 Oct 2025 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759851524; x=1760456324; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fTztUGRGLRXSGwUvW/0++WhlrFfWUCK68FeZSvOHSCA=;
        b=M5dssXVnCm1wv9iUk1VOGl8BQMjpXxmEJ/qkHyDCeCYb09b1lPTh+9RkfENRx893eU
         Nz8lw5TOrRG1MJUlaT+qIS0rGdBFfI0Z+o5ivoRh8Y5ZqxMS0Eq64n9/2XH0Wf3F5uEF
         SBz1cpEIZvu99gpB/ygFfK9c0HI1udtx17Ga3zrDpP8NDbJ0MVaQg6JlYyOynGlfZHj1
         ARgWX0ctQ2/rz3B4aQ45nqWhRhDcZijtCVLD1P4gPLiDK5YZxXy58UWrclY8wm96euFm
         BE9LmY9GdOpZp96wVJg5bHHr/6myn+tTCnYQogG7WnQQSdKWojNQIXjpBcexCk9MZX/Z
         hYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851524; x=1760456324;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTztUGRGLRXSGwUvW/0++WhlrFfWUCK68FeZSvOHSCA=;
        b=dMUBTpRjBar3Ky/LpCmfOxJ6aIstU7yt8mpigVfwIjWpkFNR6cUUZKbXPocghdvoRn
         6eEM/E+aDSuihrVDogbpxZQoGU5z7GKau/E5fUBjm4uL612qLmThF9qr40/OIbp8Lvyk
         DtfWyMfLkIXMtVKtUdjjCmvIUrXBxZTsMMhBaBKv7NRa1PDuV/8RF/k9djXmpze2RAcs
         RiSXPk3RNm8hDhHbV8Pr59YIhlyk+EQkFGbnuqbpN8r+T2kOqmkXpHNnvX7PDTMgJdck
         dpCflRmovaqfWKPyXL9ySG2A4fyKwLcX59lmg5iohJLIOMZOaclMIgPVwMcKTNQA5rY/
         +tCg==
X-Forwarded-Encrypted: i=1; AJvYcCUMmqFgdRY2zqLJOpPxkd5YTqjt9j3GX2aZBve0Y5D8E00ovwYbsmsrQgjFrvdtTuRrOJHY@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs7BGea+3DYLmAt3E2meu0sOM6WWX3kiyrJG9blQ3t3hRQZh7o
	MXHYBkvV0mJwGp8wBop1CNcONiJHgKm4+iuDZl3PAGf89bHqmiBhY9yLW4Z1PbbgYGQFTOymjBd
	engJFX/4jkA==
X-Google-Smtp-Source: AGHT+IFb4J3Q5QVLqW4wuwDUxu5iviXENAhxA/eiZMq2fcGItwB2kmamIaNQlEnBytkBWVhE83h4sHsR4CeG
X-Received: from plau18.prod.google.com ([2002:a17:903:3052:b0:274:bc82:df8a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:910:b0:240:3b9e:dd65
 with SMTP id d9443c01a7336-290273eddc4mr2078165ad.38.1759851523912; Tue, 07
 Oct 2025 08:38:43 -0700 (PDT)
Date: Tue,  7 Oct 2025 08:38:35 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007153835.3578633-1-irogers@google.com>
Subject: [PATCH v2] perf build python: Don't leave a.out file when building
 with clang
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
Tested-by: Justin Stitt <justinstitt@google.com>
---
v2: Resolve merge conflict with:
c6a43bc3e8f6 perf python: split Clang options when invoking Popen
---
 tools/perf/util/setup.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
index 9cae2c472f4a..b65b1792ca05 100644
--- a/tools/perf/util/setup.py
+++ b/tools/perf/util/setup.py
@@ -23,10 +23,17 @@ assert srctree, "Environment variable srctree, for the Linux sources, not set"
 src_feature_tests  = f'{srctree}/tools/build/feature'
 
 def clang_has_option(option):
-    cmd = shlex.split(f"{cc} {cc_options} {option}")
-    cmd.append(path.join(src_feature_tests, "test-hello.c"))
+    error_substrings = (
+        b"unknown argument",
+        b"is not supported",
+        b"unknown warning option"
+    )
+    cmd = shlex.split(f"{cc} {cc_options} {option}") + [
+        "-o", "/dev/null",
+        path.join(src_feature_tests, "test-hello.c")
+    ]
     cc_output = Popen(cmd, stderr=PIPE).stderr.readlines()
-    return [o for o in cc_output if ((b"unknown argument" in o) or (b"is not supported" in o) or (b"unknown warning option" in o))] == [ ]
+    return not any(any(error in line for error in error_substrings) for line in cc_output)
 
 if cc_is_clang:
     from sysconfig import get_config_vars
-- 
2.51.0.618.g983fd99d29-goog

