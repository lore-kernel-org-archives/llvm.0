Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8EEEC0
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539200; cv=none; b=du7ix5dNmRaaKMCtgyeKcTyewKaMqsSfakD7dqW0ZhtHP4JA1usTfQgAS/kH6Jn1V94xqDVSJUMlJbXQpxaW2ymA+YR31o4rFXNdBZk8m1cy9SgBi4/cpD4vIuSOO+Q34aiB8Q7nAKgr3Uuqi5/mZD1FoFyMWcxf+FeUlGIUl0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539200; c=relaxed/simple;
	bh=EkUSg3SW+p/sIj8byFhIiyPtAE+kzl5s7N8WhAJ4buA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=S0pGZ5BfBAlrApcodj5UNbKd1DjH02R1pMXjzuJGbDkDujBWjb9WEgIYs+N4dgALEXkKetO01FjDlj2XFFpbsIDh4sRXqCj4lw5M6Ma5PBEWrw8LnsiF++Q/KtiF2HrrkRASr/+qt9rAvTNiMIVFHeVE6Ub5CMrG10crT4INWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sAyYX3XJ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sAyYX3XJ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso5049477a91.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539198; x=1790143998; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SntUi1xPjgoMQfW2YYfU5u+fl62gD37oiHiuv4x3AKU=;
        b=sAyYX3XJyu53egb2ma/XtyLvOOFScsUeWE1I4zpG1LmDYgfbTNmTetGHI1EFElZJ1Q
         3xSYoQgxArt/Ndue0pgwRLw8/9qPD4g7YEZ3e05yvU4NHXfCD1dIYap2cAB/lC6NxzPK
         E1FLPRMnZUwPOeOTJ7YgCiFTeMpCmDQtIb2Ti3lH7zrWEX5Es+DpO1ViLxfMxT/FgdUC
         R/pm4Omni4sW2CFNIydctswl8G/+xxE4dFMiC6VH2ybODTlbrnfvW4QNKt1A9vvw74Zd
         SV+H9Ggyc6Xxk6/iy2D75IIpnhN1zo6vzr1dxgZAVBAjiKWRZxdZXbUzn+g+iPU3NUtZ
         MvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539198; x=1790143998;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SntUi1xPjgoMQfW2YYfU5u+fl62gD37oiHiuv4x3AKU=;
        b=RRoK5ElKU1uFd/r3TRB47i3lCU1uplwpf+OJCp/TlSac1OmFpjLh2ae9UdrX3M360C
         R3g1MV9bmazgRQuPTAOoGdzp8No3p1mqIZvHSNUh18JGNVQaB+V58MbAiuoA+rLy4KNt
         4oRWV6I2mT5nR8oz+25DA503/26yNiZQDmhWFD8SYInEsM4QlutmjW+Nx7H7Bk2VxUog
         oYEdZyJpbvo3K7pRPC1DE6ypzBhLQNrtnRtYiWVo6gxWYoi9zLr7XzfwJ2DcJTbofdkJ
         wZEm3n/TVPEy6congFUKJ4e/S9+ZPA1hicSkjpv+dcEjTnXlknkg1PXoPWdJwA/IJpGn
         MUxg==
X-Forwarded-Encrypted: i=1; AKwUvBwj/CbUwuiiXRnCOiHdC8ymb2j9KFvShdoVjt6dRx3AuJd7ib7MjtixkLIxzADRz/LJYOkw@lists.linux.dev
X-Gm-Message-State: AFuF++moOkIejoONHJoRGCtNaPlfnirxw20zDAkBqkC9hQYWzZoMaoJx
	dc3vFVNRuW3N4YAZ5hyiAlZXc2jMrwzo2YRH3Udx3s8BhsVzSPS8NsCjVhszRqCeqlEwSlh4LNA
	x04mguCkAaA==
X-Received: from dleb6-n1.prod.google.com ([2002:a05:701b:4246:10b0:144:bc91:18ab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d0e:b0:39d:f5b6:ca47
 with SMTP id 98e67ed59e1d1-39e1e47abbbmr3117561a91.12.1789539197679; Tue, 15
 Sep 2026 23:13:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:12 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-4-irogers@google.com>
Subject: [PATCH 3/9] perf libbfd: Include the headers that are used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

libbfd.c uses errno, PATH_MAX, strdup(), strlen(), strcmp(), memcpy()
and pthread_once() but relies on other headers to drag in <errno.h>,
<limits.h>, <string.h> and <pthread.h>. The BPF disassembly code needs
<inttypes.h> for PRIx64 and <stdint.h> for uintptr_t for the same
reason.

Include them directly and group the includes so that the system ones
come before perf's own.

No functional change.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/libbfd.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 131bfedf48cd..1b23a261a9ce 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -1,5 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "libbfd.h"
+
+#include <errno.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <fcntl.h>
+#include <pthread.h>
+
+#include <tools/dis-asm-compat.h>
+
 #include "annotate.h"
 #include "bpf-event.h"
 #include "bpf-utils.h"
@@ -11,15 +25,13 @@
 #include "symbol.h"
 #include "symbol_conf.h"
 #include "util.h"
-#include <tools/dis-asm-compat.h>
+
 #ifdef HAVE_LIBBPF_SUPPORT
 #include <bpf/bpf.h>
 #include <bpf/btf.h>
 #include <bpf/libbpf.h>
 #endif
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdlib.h>
+
 #define PACKAGE "perf"
 #include <bfd.h>
 
-- 
2.55.0.1032.g73a4cd73de-goog

