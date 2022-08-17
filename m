Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017723CB
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 05:39:38 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31f63772b89so137661857b3.6
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 22:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=nFjjywYL+BVjt5EDUuhdhFDZkG96RDHku4lEiPwRqSM=;
        b=DY963OWNxbUetRHL/zVLldA9FoKtyoCuJj5av8/bni8HuabvoELzPFFmjhpQlDSZdm
         OSOeUg615k9F4HcUcvzSKEM05MsmcIqWYixSKqrzPQvZbtajf8wwkbZCbXUhwJqr3fND
         TgMkiwHIUn61iXvBYj/h08fm0qtwu35t/7AopPODtQCqszGMUvsegiIYG6mdBEN8kwbl
         mZyXAf5EghM28D8MJaot1nIAmoUOXJFk9VM+gKpLuLanNhiyq8VCr3eqtuInW8ncXzb8
         7ThAyVLtqSbedCRujaH6y/B9jG+RJlkbinII3b88rj1/oanhaMJlYioHzQgRUFKpBHaQ
         VzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=nFjjywYL+BVjt5EDUuhdhFDZkG96RDHku4lEiPwRqSM=;
        b=uqEyywEcRFMUFpxqNGrCR8NKuqyKthCqjAZbqls/5LoR5m2DV0dwDT98Idv59uFUzY
         xftgNZygFBw5imv8folKUCBM9K+Y3jae8cxNf/Y5AR1QGPCj1cI2wXz9wI72ouY+Q8n7
         L2GuP/oIHZwko2+eId8WGwsBViY7ryBfjRHq2/Gri4uSeC3k2GLvm7tQOXA+fRMWlAb8
         5q07lftsw0+bO3zamnzR/wJmJFlMY0K0W/23vRS83SusPZKgjz1q4n5Fn2KihQ1h/Iwi
         GihWyrik9tMQEWfavDr6q+TNVpCezhXhDL/saCL8RNxxZ7QXlDNnbHgOecCgTBvU4WzS
         aQ7Q==
X-Gm-Message-State: ACgBeo3gZ8OVAIvOzY9vz1dyt73FgtjOl9PnVO1+ZGnkZmhDtKN/Maya
	WKynUynO85kfiUMZ5RA6O/DoV/sRSWRy
X-Google-Smtp-Source: AA6agR6uvHiEAD8FKpS5Zq1mVo2EGqf4MDZxVAHCk2jlM44oEFgnPYVVKCVce46t56k7uUnIbgXr3gRUTs5f
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3bec:858f:9a6d:63de])
 (user=irogers job=sendgmr) by 2002:a25:b5c9:0:b0:67b:a397:5e24 with SMTP id
 d9-20020a25b5c9000000b0067ba3975e24mr17396936ybg.108.1660714777306; Tue, 16
 Aug 2022 22:39:37 -0700 (PDT)
Date: Tue, 16 Aug 2022 22:39:25 -0700
In-Reply-To: <20220817053930.769840-1-irogers@google.com>
Message-Id: <20220817053930.769840-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v1 1/6] perf mutex: Wrapped usage of mutex and cond
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Weiguo Li <liwg06@foxmail.com>, 
	Pavithra Gurushankar <gpavithrasha@gmail.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Dario Petrillo <dario.pk1@gmail.com>, 
	Wenyu Liu <liuwenyu7@huawei.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Dave Marchevsky <davemarchevsky@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexandre Truong <alexandre.truong@arm.com>, 
	Kim Phillips <kim.phillips@amd.com>, Leo Yan <leo.yan@linaro.org>, 
	Quentin Monnet <quentin@isovalent.com>, William Cohen <wcohen@redhat.com>, 
	Andres Freund <andres@anarazel.de>, Song Liu <songliubraving@fb.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>, 
	Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, Riccardo Mancini <rickyman7@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Zechuan Chen <chenzechuan1@huawei.com>, Jason Wang <wangborong@cdjrlc.com>, 
	Lexi Shao <shaolexi@huawei.com>, Remi Bernon <rbernon@codeweavers.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pavithra Gurushankar <gpavithrasha@gmail.com>

Added a new header file mutex.h that wraps the usage of
pthread_mutex_t and pthread_cond_t. By abstracting these it is
possible to introduce error checking.

Signed-off-by: Pavithra Gurushankar <gpavithrasha@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build   |  1 +
 tools/perf/util/mutex.c | 97 +++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/mutex.h | 43 ++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 tools/perf/util/mutex.c
 create mode 100644 tools/perf/util/mutex.h

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 9dfae1bda9cc..8fd6dc8de521 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -143,6 +143,7 @@ perf-y += branch.o
 perf-y += mem2node.o
 perf-y += clockid.o
 perf-y += list_sort.o
+perf-y += mutex.o
 
 perf-$(CONFIG_LIBBPF) += bpf-loader.o
 perf-$(CONFIG_LIBBPF) += bpf_map.o
diff --git a/tools/perf/util/mutex.c b/tools/perf/util/mutex.c
new file mode 100644
index 000000000000..d12cf0714268
--- /dev/null
+++ b/tools/perf/util/mutex.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "mutex.h"
+
+#include "debug.h"
+#include <linux/string.h>
+#include <errno.h>
+
+static void check_err(const char *fn, int err)
+{
+	char sbuf[STRERR_BUFSIZE];
+
+	if (err == 0)
+		return;
+
+	pr_err("%s error: '%s'", fn, str_error_r(err, sbuf, sizeof(sbuf)));
+}
+
+#define CHECK_ERR(err) check_err(__func__, err)
+
+void mutex_init(struct mutex *mtx, bool pshared)
+{
+	pthread_mutexattr_t attr;
+
+	CHECK_ERR(pthread_mutexattr_init(&attr));
+
+#ifndef NDEBUG
+	/* In normal builds enable error checking, such as recursive usage. */
+	CHECK_ERR(pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK));
+#endif
+	if (pshared)
+		pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+
+	CHECK_ERR(pthread_mutex_init(&mtx->lock, &attr));
+	CHECK_ERR(pthread_mutexattr_destroy(&attr));
+}
+
+void mutex_destroy(struct mutex *mtx)
+{
+	CHECK_ERR(pthread_mutex_destroy(&mtx->lock));
+}
+
+void mutex_lock(struct mutex *mtx)
+{
+	CHECK_ERR(pthread_mutex_lock(&mtx->lock));
+}
+
+void mutex_unlock(struct mutex *mtx)
+{
+	CHECK_ERR(pthread_mutex_unlock(&mtx->lock));
+}
+
+bool mutex_trylock(struct mutex *mtx)
+{
+	int ret = pthread_mutex_trylock(&mtx->lock);
+
+	if (ret == 0)
+		return true; /* Lock acquired. */
+
+	if (ret == EBUSY)
+		return false; /* Lock busy. */
+
+	/* Print error. */
+	CHECK_ERR(ret);
+	return false;
+}
+
+void cond_init(struct cond *cnd, bool pshared)
+{
+	pthread_condattr_t attr;
+
+	CHECK_ERR(pthread_condattr_init(&attr));
+	if (pshared)
+		CHECK_ERR(pthread_condattr_setpshared(&attr, PTHREAD_PROCESS_SHARED));
+
+	CHECK_ERR(pthread_cond_init(&cnd->cond, &attr));
+	CHECK_ERR(pthread_condattr_destroy(&attr));
+}
+
+void cond_destroy(struct cond *cnd)
+{
+	CHECK_ERR(pthread_cond_destroy(&cnd->cond));
+}
+
+void cond_wait(struct cond *cnd, struct mutex *mtx)
+{
+	CHECK_ERR(pthread_cond_wait(&cnd->cond, &mtx->lock));
+}
+
+void cond_signal(struct cond *cnd)
+{
+	CHECK_ERR(pthread_cond_signal(&cnd->cond));
+}
+
+void cond_broadcast(struct cond *cnd)
+{
+	CHECK_ERR(pthread_cond_broadcast(&cnd->cond));
+}
diff --git a/tools/perf/util/mutex.h b/tools/perf/util/mutex.h
new file mode 100644
index 000000000000..952276ad83bd
--- /dev/null
+++ b/tools/perf/util/mutex.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PERF_MUTEX_H
+#define __PERF_MUTEX_H
+
+#include <pthread.h>
+#include <stdbool.h>
+
+/*
+ * A wrapper around the mutex implementation that allows perf to error check
+ * usage, etc.
+ */
+struct mutex {
+	pthread_mutex_t lock;
+};
+
+/* A wrapper around the condition variable implementation. */
+struct cond {
+	pthread_cond_t cond;
+};
+
+/*
+ * Initialize the mtx struct, if pshared is set then specify the process-shared
+ * rather than default process-private attribute.
+ */
+void mutex_init(struct mutex *mtx, bool pshared);
+void mutex_destroy(struct mutex *mtx);
+
+void mutex_lock(struct mutex *mtx);
+void mutex_unlock(struct mutex *mtx);
+bool mutex_trylock(struct mutex *mtx);
+
+/*
+ * Initialize the cond struct, if pshared is set then specify the process-shared
+ * rather than default process-private attribute.
+ */
+void cond_init(struct cond *cnd, bool pshared);
+void cond_destroy(struct cond *cnd);
+
+void cond_wait(struct cond *cnd, struct mutex *mtx);
+void cond_signal(struct cond *cnd);
+void cond_broadcast(struct cond *cnd);
+
+#endif /* __PERF_MUTEX_H */
-- 
2.37.1.595.g718a3a8f04-goog

