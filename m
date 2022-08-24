Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F37E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:40:35 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3363b1dffa0so298932787b3.23
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=ua6Mh9sZaNR0LiKYM2tdraTGYLGQ45WZ0snfG2zK80g=;
        b=sxKvVrOvT3wAcZc0FbAB3VtBnp3F+YpYwhBmEbMRn7nYtIxM8uC04WGXQOnD/9TMt8
         H9bY2osKtfilmRiuvnADPHlPk1XYQw2hzCepXrdawXdOM7oO7VG7Li/HBIymyg27Zj+z
         BbhsJKIryjeZtnxyRxe7PPzhRnUSuMyiQolPTSpbwk7SYfuzoQ+V1WQmCJmoT6o9sksN
         7LIWiVN2t0jnu32hJCDzHT2x81E4KEf2rvpiwuKGhtCHWiQxZOvGH36sYmQ+WI2/HqC3
         yOlOyOq+2dxUmKI32i3ZKd0/VPPSBILrkAaEBDa9Ue9kQSW4scuGpGSNeCo+9PXGLhqE
         NL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=ua6Mh9sZaNR0LiKYM2tdraTGYLGQ45WZ0snfG2zK80g=;
        b=nUXXZZobyoEDCjetUEcYHPVd0eZTGQ3W455O6aZnJD+nqSkBAmz+0MWqjcDZWZjxEC
         I2TSbmD2DH7uHrKrQVkht39Yn6Sq0Eca2uznmqxtMEh0su3wYdSwU5M9XSDKSYJNX/UJ
         PDzF71c89tIqqlPMzLOLpXSwOCmku9p66R9ETkrQ/55xkTluFOg7DWRmBToHnQAHyMqc
         9EtEQyaH7xYoz0e10Vsy9y1TZ8gO6pZ+2a9Idcz48P69L2+OPEUx7PGfdI0qVJ8f+r3o
         uPfl+oq4agVFpgwHFt8p9s6knRUjFzWtsfs+m6PxZdth6IPDkCZQSQI7GW2o2uTuKMxJ
         B2iw==
X-Gm-Message-State: ACgBeo0S7Swznm9xixo7YV4wwnZq392Sv41VyflkUeM0PbW2RVqqWVqL
	7KOKsP8RjQ9uCJ+tA2XDbvfv399Lw5qg
X-Google-Smtp-Source: AA6agR5K0U0pB5+rrzYj5Qm9IGZe+7+xGt7VRLRQOy0NQnV4M1wQ0yN8tuhNpfN5lI1oB5q5pons61ZU7/up
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a81:8003:0:b0:336:be9e:df56 with SMTP id
 q3-20020a818003000000b00336be9edf56mr31205120ywf.92.1661355634840; Wed, 24
 Aug 2022 08:40:34 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:38:54 -0700
In-Reply-To: <20220824153901.488576-1-irogers@google.com>
Message-Id: <20220824153901.488576-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 11/18] perf dso: Update use of pthread mutex
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

Switch to the use of mutex wrappers that provide better error checking.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c    | 12 ++++++------
 tools/perf/util/dso.h    |  4 ++--
 tools/perf/util/symbol.c |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 5ac13958d1bd..a9789a955403 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -795,7 +795,7 @@ dso_cache__free(struct dso *dso)
 	struct rb_root *root = &dso->data.cache;
 	struct rb_node *next = rb_first(root);
 
-	pthread_mutex_lock(&dso->lock);
+	mutex_lock(&dso->lock);
 	while (next) {
 		struct dso_cache *cache;
 
@@ -804,7 +804,7 @@ dso_cache__free(struct dso *dso)
 		rb_erase(&cache->rb_node, root);
 		free(cache);
 	}
-	pthread_mutex_unlock(&dso->lock);
+	mutex_unlock(&dso->lock);
 }
 
 static struct dso_cache *__dso_cache__find(struct dso *dso, u64 offset)
@@ -841,7 +841,7 @@ dso_cache__insert(struct dso *dso, struct dso_cache *new)
 	struct dso_cache *cache;
 	u64 offset = new->offset;
 
-	pthread_mutex_lock(&dso->lock);
+	mutex_lock(&dso->lock);
 	while (*p != NULL) {
 		u64 end;
 
@@ -862,7 +862,7 @@ dso_cache__insert(struct dso *dso, struct dso_cache *new)
 
 	cache = NULL;
 out:
-	pthread_mutex_unlock(&dso->lock);
+	mutex_unlock(&dso->lock);
 	return cache;
 }
 
@@ -1297,7 +1297,7 @@ struct dso *dso__new_id(const char *name, struct dso_id *id)
 		dso->root = NULL;
 		INIT_LIST_HEAD(&dso->node);
 		INIT_LIST_HEAD(&dso->data.open_entry);
-		pthread_mutex_init(&dso->lock, NULL);
+		mutex_init(&dso->lock);
 		refcount_set(&dso->refcnt, 1);
 	}
 
@@ -1336,7 +1336,7 @@ void dso__delete(struct dso *dso)
 	dso__free_a2l(dso);
 	zfree(&dso->symsrc_filename);
 	nsinfo__zput(dso->nsinfo);
-	pthread_mutex_destroy(&dso->lock);
+	mutex_destroy(&dso->lock);
 	free(dso);
 }
 
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 66981c7a9a18..58d94175e714 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -2,7 +2,6 @@
 #ifndef __PERF_DSO
 #define __PERF_DSO
 
-#include <pthread.h>
 #include <linux/refcount.h>
 #include <linux/types.h>
 #include <linux/rbtree.h>
@@ -11,6 +10,7 @@
 #include <stdio.h>
 #include <linux/bitops.h>
 #include "build-id.h"
+#include "mutex.h"
 
 struct machine;
 struct map;
@@ -145,7 +145,7 @@ struct dso_cache {
 struct auxtrace_cache;
 
 struct dso {
-	pthread_mutex_t	 lock;
+	struct mutex	 lock;
 	struct list_head node;
 	struct rb_node	 rb_node;	/* rbtree node sorted by long name */
 	struct rb_root	 *root;		/* root of rbtree that rb_node is in */
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index a4b22caa7c24..656d9b4dd456 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1800,7 +1800,7 @@ int dso__load(struct dso *dso, struct map *map)
 	}
 
 	nsinfo__mountns_enter(dso->nsinfo, &nsc);
-	pthread_mutex_lock(&dso->lock);
+	mutex_lock(&dso->lock);
 
 	/* check again under the dso->lock */
 	if (dso__loaded(dso)) {
@@ -1964,7 +1964,7 @@ int dso__load(struct dso *dso, struct map *map)
 		ret = 0;
 out:
 	dso__set_loaded(dso);
-	pthread_mutex_unlock(&dso->lock);
+	mutex_unlock(&dso->lock);
 	nsinfo__mountns_exit(&nsc);
 
 	return ret;
-- 
2.37.2.609.g9ff673ca1a-goog

