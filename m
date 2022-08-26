Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310484401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:43:15 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3328a211611so33475117b3.5
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=Rgaq1z5LOjS10FPCONzKodXjmm6pDD9DpzwInFEM770=;
        b=nl+Qh97XZk1KJ88OfXW9aPzIUNFMYSiDtZHMv5SvJstTLcntVJ2oztHnY+KiRHT3kT
         kxGubUgo9pIyre3cM28oumxGadAhesrLufKNV1+HtDxEgNUhRpm4iN7xGRfPUl4cu7jk
         ak7a9kqiKgvE60a2HYuzHY/wd6xhkb42GJM+0/6r9Xu9UBtFowN98FQkkedSH/sLywPk
         gd9Z5Iw7DYOeow252llFAVKTfJkJVWPUSR6mW6LXHwnLl2obc6JW8y8d/qAkWUt0IUIL
         Kyv4xDs+CIsRZl65hn6ylB3VKdry3X7THPwDevdSrKWj9BtbykigQ01iMx2KWt//AO0s
         c5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Rgaq1z5LOjS10FPCONzKodXjmm6pDD9DpzwInFEM770=;
        b=ZoxsheZY6sP2wNsU/NLAUu/laj9EjuUN2jfuSWoU7r5C0qw5gb9SKf5J4P39o1bvRx
         Or/FE1tgEEvD5s8QFhWaMEnfTx1G7VAv9YU7iHR02uOxnir73uxo4MiRJXsznkr+UEYV
         5jeaTYfRij4zf9WIGQPABNyRzMlxTESMl8iY98vBfZKwDuafZ9v9inv1ZRpWrNYSE7ZX
         MSbov5CA4YuGzQyzymmzchOG6YwcKar5vAlr0OF0fUFwlbSd9seXbvpuNTWel1mowFnf
         UMkp6hbm5UHPHyVcRBey3vbnFTzFgB5qhtXfIJKFzYQRrFDIIqAAV/29VKUiQhgc0N2L
         C9Gw==
X-Gm-Message-State: ACgBeo0GZ+IF5xz8FJ5fSwxk4Rfp5C2vrxGJgPcz2zKiEUaG2BHX/CE8
	muwN291O5Bexwo39JLloa9RU2XL2QTPn
X-Google-Smtp-Source: AA6agR7rr4cAm33WV7u+4zxKPqfDoUFhcdJ/w+TdWr0NJw63hF42lS3uIKi5UTfG/JnaYn5DASu62tOLWAIv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a05:6902:1449:b0:67b:3ea:e49d with SMTP id
 a9-20020a056902144900b0067b03eae49dmr480144ybv.511.1661532194250; Fri, 26 Aug
 2022 09:43:14 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:27 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 03/18] perf tests: Avoid pthread.h inclusion
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
2.37.2.672.g94769d06f0-goog

