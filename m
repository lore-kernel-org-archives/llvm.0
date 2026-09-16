Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6D23EB0E6
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 06:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539201; cv=none; b=kqVRYkUfTBX1yRObXhs7ixJKA/qk9p4nvYeOsfGKFEdaxE+Ftm3EYPWoW5DUDVRJse7UmDi2CPP4IQguR5MJ1uPqW0ECx9UNWD/ale0oB7cav4rFGOFES+Q0gVtEB3+2OM7gW2qlYW3pzoBeZSi3CWmgyMXi7CofnzJ2mSgst5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539201; c=relaxed/simple;
	bh=468xVfbn+0XdK7xEFVTNW5kercEQE4h92XSg5yNP3F8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=SWO8vNrGnYhDA+vd0QJYYgJcoiI+ctmEDYOdNQj+AjIlqtcjMd0qyau/8g978IjzHCGqEukWnUI4rHx2E68ABF62VukzgIgUVfe0jOiyDbCNhiXt2xl3maKPvpjIw9HmTYsznTfKXhHn9ag/+uphN9iMDJlI3zSkZD3MjZIJly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ENDPjQBD; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENDPjQBD"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso10579896a91.3
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539199; x=1790143999; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vR5Z3qVkhKQF/LqVThiaZx4q5xKuQTz4oWFML5HFRTo=;
        b=ENDPjQBD1E1inYwpcbNmCLCV8sefFIIxrSS6c9c5FRFGq00mF26JRIrG5JhLAIaQ29
         cviLKmibaKF1NVusLP81OyQeNqgo50gRnP7uMox0qFeUji1ZDHbM28ZpzkGwOfaA2xlE
         stE/39nasE3Bv97zeobncjyWL2qhaW2PVpYrWt6fLITuFZFrLQLg+KY6FazQwH6MtUDw
         P8bQK3FhnwCa4wMRnOzV/eDakjH9rfp/zr99+RRYgNv/OOiZS7c7tyLCX+uoheSKhsqP
         FxN/grhLO5yTl7tzEv1vwhB2yln1QkX3QneS7xETDI0JfxRwDkEoB7xISnumcoJxtS1t
         cU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539199; x=1790143999;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vR5Z3qVkhKQF/LqVThiaZx4q5xKuQTz4oWFML5HFRTo=;
        b=ytR762GCJZLsw9y7k6EulgcuEgKPDVrn+ftBJ1P010FDa5M/ZNXUx5l+Vq72zdVzf8
         H5auMDjLx59OUTmrp7fYMLSIPk0jMqvJ4IlZoGxXsjfrrVRqYkd4WJ19bMpuposufU8F
         77oXceu+ws5kzme9eogJhTlVEEc1znGOo336SEAshXGLQwixfFeFepiW0VzrJw0EvVIY
         PFAmadtvebSGlFHzAp8VrBeUnpM7oPelnnoVq2kL4aIM1Afspz+OcjKsNu60j15dcvMJ
         /UgFSQZ1MOV2CWQ88mIPW9/QrUN0xsMlaC4ew+P0FFoei+5CuZDeR7hDY4eCkDnYvDpS
         yLEQ==
X-Forwarded-Encrypted: i=1; AKwUvByeROHyyTrN5nSlcHk7NzjjIk1wPjxerBjT2wjTEYz0kJfeDefqVjpQYDBYBkySqMxF59kL@lists.linux.dev
X-Gm-Message-State: AFuF++lqfJ99rziNiCENhNX0AVcESSfGmeEtVpA7DLTW027nzAkgsZhV
	iNQQoL7MmqIlsu2x3vuGRrZEL1isliSytEmOv4IAU6q5jaX3A2mTYM5AuYLycyLjclwqhgd4sOA
	Gq+qpcbl3MQ==
X-Received: from dyay26.prod.google.com ([2002:a05:693c:62da:b0:339:7600:c341])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c41:b0:39d:fe64:5733
 with SMTP id 98e67ed59e1d1-39e1e5612demr4059471a91.24.1789539199252; Tue, 15
 Sep 2026 23:13:19 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:13 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-5-irogers@google.com>
Subject: [PATCH 4/9] perf pmu: Include the headers that are used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

pmu.c uses errno, free() and the str*() functions but declares none of
them directly. <string.h> arrives by way of <linux/string.h>, and
<errno.h> and <stdlib.h> come from whatever the other headers happen to
drag in, which is fragile and breaks on C libraries that don't nest
their headers the same way.

Include the three directly.

<ctype.h> is deliberately not added. The isdigit(), tolower() and
toupper() used here are the macros from <linux/ctype.h>, which is
included on purpose and documents that it doesn't handle EOF the way the
standard C library does, so pulling in <ctype.h> would change which
implementation is used.

size_t is left alone too, as <stdio.h> is already included directly and
declares it.

No functional change.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 836e3b5615cd..744e253e851f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -8,8 +8,11 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <unistd.h>
-#include <stdio.h>
+#include <errno.h>
 #include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <dirent.h>
 #include <api/fs/fs.h>
 #include <api/io.h>
-- 
2.55.0.1032.g73a4cd73de-goog

