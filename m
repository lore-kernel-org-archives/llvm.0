Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231059574B
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171909; cv=none; b=bam5M9s1TlFbOC84ArfXWPVLj+vYzWa9qs/XL9nFaFOWbmcpkAsqhX/6Y9CMkwSEzhiH93+PRT5X/dAB6LhXLda/97LOrLOQDMzaTAD7ZIdPzOamr/6MF9Tu+NIAaDw2TwZbf9mEuVsy4zrTqHkBdXIjcCsalVzEI3KPTVvPDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171909; c=relaxed/simple;
	bh=ZKqM0sVJ+27uer4iOY/Tjp5iTcxC/uxu5XBBljEbnoE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M2O6CvU1FSvuwbra1+T/aiXlNEQRmuvjj16UHNiYkp+8e1cewhtCTwjVw4NVjt1Zj/7+2d52NXEac5nIGwW0FEITKhxt9gwiS1uLsPw2vGnPl7WSvfxqwO+aqMSPI+hUB+/mQFWXlZ44ABm0asT0B8BzJ1JxwXu65TOTZ7N9aZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FFe41hKm; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FFe41hKm"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so265063eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171907; x=1792776707; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaC2r/apdWdXklYJhKK0+lrxzUvkSmE5Hw1MieCQmEw=;
        b=FFe41hKm4SCD2uI/OclydCdwb2gKTIDSgMcetogabQz9mGHda9b9/INtdK1POYeHhJ
         M0r6qS0EWTrORA1znYpFkTRAOfRjJ3H9mX6CWLMqXqUae19UAtPnIuTyOEmrwXuv9S8F
         Nd7eXqD40XUsML9xpzmsYwKhnwJcS3oYEoDK61Cdbwwz3bKLgdsn/oAIEWgNpeVJXUOs
         3RGQINHCtfKxt+42tGmaar1xunBlOi9CmMeP2BnkY6Oyk1KuOmZniHqxWZczKNWbeoy5
         N/oM4kj8veNZeQppk8PnubT4SJcgyVSuW0H/JivXP3bzHQe4/aUxcVKHZqMEch3ZlpHz
         JBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171907; x=1792776707;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaC2r/apdWdXklYJhKK0+lrxzUvkSmE5Hw1MieCQmEw=;
        b=0TTqdy/heP2+BEDmTrYGn1DV07WAZCIvAtOwxxBBjK45jmhdpb40sAPMPQAe3fTK//
         Z2BnL2b+ODl96386gS6g06DupbSbszTCTyVcLFx3YuV78T5g+6OSB1YpvZowtTA1IYbz
         sxffojfZDl2FDzrZlHy5KmqYXijxgf2t8WG2WBrCMh4cfUt6ZPTcuWUtIOifwVLCw4Zk
         5yJUefFHK69W1uRgkpsclEAJFq+7PP/Fb8jQwL1Zs2paUPuF+u6u9msHBkJWBcjg0Adk
         cFmawt966X9hlgHn03IlL9wJrCO7qk11xGTdLh4GvIwX7B32QPbz8rKU+cQLWsa1wFUk
         rodg==
X-Forwarded-Encrypted: i=1; AKwUvBwEqoud9SlvMJaqZNYLFw5cZHmeF3f9Fb4d84KsMtryhjhmCGgsiUNBgEggLLK8JjPTIogl@lists.linux.dev
X-Gm-Message-State: AFq9FYL1bw5e3+gDEV95Rqh7imczVQawbTkTbcy4IqXnyEJC/Ta6c6YG
	vCvPF2LMW1Mdu1eMOd/5A3sp1uUuwf8RgoKQlPcqePkC5KkmAtvz/OKmxyTBphEKzJO/grzy4Wh
	MwEur5dOUzw==
X-Received: from dlbsw9.prod.google.com ([2002:a05:7022:3a89:b0:16b:e65c:ee1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:454b:20b0:144:f096:4dda
 with SMTP id a92af1059eb24-1851434bc5cmr626356c88.43.1792171906336; Fri, 16
 Oct 2026 10:31:46 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:31:00 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-12-irogers@google.com>
Subject: [PATCH v3 11/17] perf dso: Expand context analysis annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate struct dsos fields with __guarded_by(&lock), annotate dso__data_open and
fd_limit in util/dso.c with __guarded_by(&dso__data_open_lock), and
tighten __dsos__findnew_id() and __dsos__addnew_id() from shared to
exclusive lock requirements.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/dso-data.c |  4 ++++
 tools/perf/util/dso.c       | 14 +++++++++-----
 tools/perf/util/dsos.c      | 10 ++++++++--
 tools/perf/util/dsos.h      | 13 +++++++------
 4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
index 18b7052a2dc5..6ef59929e6c0 100644
--- a/tools/perf/tests/dso-data.c
+++ b/tools/perf/tests/dso-data.c
@@ -116,12 +116,14 @@ static int dso__data_fd(struct dso *dso, struct machine *machine)
 
 static void dsos__delete(struct dsos *dsos)
 {
+	down_write(&dsos->lock);
 	for (unsigned int i = 0; i < dsos->cnt; i++) {
 		struct dso *dso = dsos->dsos[i];
 
 		dso__data_close(dso);
 		unlink(dso__name(dso));
 	}
+	up_write(&dsos->lock);
 	dsos__exit(dsos);
 }
 
@@ -254,6 +256,7 @@ static int set_fd_limit(int n)
 }
 
 static int test__dso_data_cache(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+	__context_unsafe(/* single-threaded test */)
 {
 	struct machine machine;
 	long nr_end, nr = open_files_cnt();
@@ -324,6 +327,7 @@ static long new_limit(int count)
 }
 
 static int test__dso_data_reopen(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+	__context_unsafe(/* single-threaded test */)
 {
 	struct machine machine;
 	long nr_end, nr = open_files_cnt(), lim = new_limit(3);
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 4dc518f7cb7d..5f4b4cd9a089 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -525,7 +525,8 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  * Global list of open DSOs and the counter.
  */
 DEFINE_MUTEX(dso__data_open_lock);
-static LIST_HEAD(dso__data_open);
+static struct list_head dso__data_open __guarded_by(&dso__data_open_lock) =
+	LIST_HEAD_INIT(dso__data_open);
 static long dso__data_open_cnt __guarded_by(&dso__data_open_lock);
 
 static void dso__list_add(struct dso *dso) __must_hold(&dso__data_open_lock)
@@ -757,7 +758,7 @@ static rlim_t get_fd_limit(void)
 	return limit;
 }
 
-static rlim_t fd_limit;
+static rlim_t fd_limit __guarded_by(&dso__data_open_lock);
 
 /*
  * Used only by tests/dso-data.c to reset the environment
@@ -766,7 +767,8 @@ static rlim_t fd_limit;
  */
 void reset_fd_limit(void)
 {
-	fd_limit = 0;
+	/* Only called by single-threaded test setup. */
+	context_unsafe(fd_limit = 0);
 }
 
 static bool may_cache_fd(void) __must_hold(&dso__data_open_lock)
@@ -1723,8 +1725,10 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 		dso_id->build_id = id->build_id;
 		changed = true;
 	}
-	if (changed && dsos)
-		dsos->sorted = false;
+	if (changed && dsos) {
+		/* dsos write lock held by caller. */
+		context_unsafe(dsos->sorted = false);
+	}
 }
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index b5c8086941d5..f8e4395d9b1b 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -12,6 +12,7 @@
 #include <unistd.h>
 
 void dsos__init(struct dsos *dsos)
+	__context_unsafe(/* initialization */)
 {
 	init_rwsem(&dsos->lock);
 
@@ -50,6 +51,7 @@ void dsos__exit(struct dsos *dsos)
 static int __dsos__for_each_dso(struct dsos *dsos,
 				int (*cb)(struct dso *dso, void *data),
 				void *data)
+	__must_hold_shared(&dsos->lock)
 {
 	for (unsigned int i = 0; i < dsos->cnt; i++) {
 		struct dso *dso = dsos->dsos[i];
@@ -182,7 +184,8 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 		}
 		qsort(dsos->dsos, dsos->cnt, sizeof(struct dso *),
 		      dsos__cmp_long_name_id_short_name);
-		dsos->sorted = true;
+		/* write_locked is true, so dsos->lock is held exclusively. */
+		context_unsafe(dsos->sorted = true);
 	}
 
 	res = bsearch(&key, dsos->dsos, dsos->cnt, sizeof(struct dso *),
@@ -194,6 +197,7 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 }
 
 int __dsos__add(struct dsos *dsos, struct dso *dso)
+	__must_hold(&dsos->lock)
 {
 	if (!dso)
 		return -EINVAL;
@@ -285,6 +289,7 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 }
 
 struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock)
 {
 	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
 }
@@ -319,6 +324,7 @@ static void dso__set_basename(struct dso *dso)
 }
 
 static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = dso__new_id(name, id);
 
@@ -335,7 +341,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
-	__must_hold_shared(&dsos->lock)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index 857a79fd8805..cc7e3a42f9cb 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,18 +19,19 @@ struct machine;
  */
 struct dsos {
 	struct rw_semaphore lock;
-	struct dso **dsos;
-	unsigned int cnt;
-	unsigned int allocated;
-	bool sorted;
+	struct dso **dsos __pt_guarded_by(&lock) __guarded_by(&lock);
+	unsigned int cnt __guarded_by(&lock);
+	unsigned int allocated __guarded_by(&lock);
+	bool sorted __guarded_by(&lock);
 };
 
 void dsos__init(struct dsos *dsos);
 void dsos__exit(struct dsos *dsos);
 
-int __dsos__add(struct dsos *dsos, struct dso *dso);
+int __dsos__add(struct dsos *dsos, struct dso *dso) __must_hold(&dsos->lock);
 int dsos__add(struct dsos *dsos, struct dso *dso);
-struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
-- 
2.56.0.212.g129ede20d9-goog

