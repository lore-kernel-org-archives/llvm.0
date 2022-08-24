Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A067E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:39:42 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-335cf0fd1a4so297231137b3.11
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=kkLvqnwJBxJuW02GoX/GzvRRDzNYFeMugLbS0btBnq0=;
        b=B9NeSXVK1Z/YGVgg5ME8fCdkrk5kmvUFhcIxIa4KEn4ng69OxUi6ns3GRw8VCQQdGS
         Sgop1OYDLylw9yEDt9gKa2KU7BZAE9ViKooESlAKp3p0rGDU3DJgmiWqrILuQKJ3WY5a
         4+gPt0J/WPg4GCpozetMbDp472EIJmJgcsV1MKbfquS+lBN8fMGaNRYt8ZQtdnyjmoNO
         A58LFdbBvNmcuxeUEmJKfonYQVOpvUAd9+cwguheIuZvWBio/YHsQNiHnEGCF6DNbwA3
         2JW1U3A9sx++6GtBkSAmQEuW3vge/TKg9cIgZNlZ7k86+Tlw5P7HwWWjD+EmeLyWv4HK
         OLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=kkLvqnwJBxJuW02GoX/GzvRRDzNYFeMugLbS0btBnq0=;
        b=sKuGaq0SAj9CrJACDEsuIqoimt8E8QAytXkglNyXazTaUYBAdPeOSmUcT15k5OprBO
         DNnl2B2KEPCuxzR+ljSp8JEIuCzGDUiFlmGOEtmHg6PGZ5/5xBNNNeB32itnx2iFVPFu
         7N7DEyDIo4VbrRzNnYt8ivHd3pnJWr0vDDzCGh5lFQlrVqIx90YP+Bf06U0CF2462Otk
         /HwFPgeM6RpKKVXd5oMP3kGEn8/y0IR7OPvMEsSq1tRv+Ti12bq9wbsKpbRe85pkpJrm
         KrrEyFefUuWBSL+xgmZdEWstEy9kWke/HrCouN9USDnOr3ZaJk0kfYOAu5Fy0Wv9ZpPU
         X4vg==
X-Gm-Message-State: ACgBeo1h2g1QIezPZeRRNAEDumJpHfbPTnemcJK1BCYZFMYbx2+P3e6q
	H1apcfp7zxksTg8j3kls2mrE78GKW/os
X-Google-Smtp-Source: AA6agR7x43hwf+QCzO2HL5X3zNDuQ479UfzmfZoh2CI7pJJ/ZpFXBAkUnKPG0dh4+XTcWw+Y2OnQtjQCfq20
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a25:3ca:0:b0:696:3653:d1b with SMTP id
 193-20020a2503ca000000b0069636530d1bmr967511ybd.175.1661355581832; Wed, 24
 Aug 2022 08:39:41 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:38:46 -0700
In-Reply-To: <20220824153901.488576-1-irogers@google.com>
Message-Id: <20220824153901.488576-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 03/18] perf tests: Avoid pthread.h inclusion
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

pthread.h is being included for the side-effect of getting sched.h and
macros like CPU_CLR. Switch to directly using sched.h, or if that is
already present, just remove the pthread.h inclusion entirely.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/mmap-basic.c              | 2 --
 tools/perf/tests/openat-syscall-all-cpus.c | 2 +-
 tools/perf/tests/perf-record.c             | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index dfb6173b2a82..21b5e68179d7 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
 #include <inttypes.h>
-/* For the CLR_() macros */
-#include <pthread.h>
 #include <stdlib.h>
 #include <perf/cpumap.h>
 
diff --git a/tools/perf/tests/openat-syscall-all-cpus.c b/tools/perf/tests/openat-syscall-all-cpus.c
index 90828ae03ef5..f3275be83a33 100644
--- a/tools/perf/tests/openat-syscall-all-cpus.c
+++ b/tools/perf/tests/openat-syscall-all-cpus.c
@@ -2,7 +2,7 @@
 #include <errno.h>
 #include <inttypes.h>
 /* For the CPU_* macros */
-#include <pthread.h>
+#include <sched.h>
 
 #include <sys/types.h>
 #include <sys/stat.h>
diff --git a/tools/perf/tests/perf-record.c b/tools/perf/tests/perf-record.c
index 6a001fcfed68..b386ade9ed06 100644
--- a/tools/perf/tests/perf-record.c
+++ b/tools/perf/tests/perf-record.c
@@ -2,8 +2,6 @@
 #include <errno.h>
 #include <inttypes.h>
 #include <linux/string.h>
-/* For the CLR_() macros */
-#include <pthread.h>
 
 #include <sched.h>
 #include <perf/mmap.h>
-- 
2.37.2.609.g9ff673ca1a-goog

