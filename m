Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588148;
	b=oYnJpPl0SMkZIZwcjt03hAY1vQylH1K5v9yfwPWs0nwIRMPx4FF0sIpuQLGKKJuDAyoZ
	 JFJ67CssITesUejeNI7FxqpZxzy1BPs7QVlEeJNApqh08I/NtU7oeCQS59RB9Casl+0AT
	 0fu2nemMDePPmKsWR49y4hJAf2FODj5XOCzo7ne40ckCwZpGmq09YBKOUxUTZucmDVPSh
	 sn+cQeJlScYBYUXgiQp933+7HFnUW+s7EHTAYKVwXdhx0mPItCwrQKp80XHmNz6s6TRxN
	 ID1Og3LUHdbqxPbFexIt9s3WZjYOqDoWUqUulaHSLOJV0Fu9qjsXSJyMgNSPwn5GQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=drIFIGRpVF4Rwfa4SlpVZ10h9THWcqWMFBwpCDBlAuo=;
	b=I8KD2bdJpU3ulPkO1NbqOTceLQOOUPS/nWeMXd7zhQsn4qbcbRY9AoTrziGIh4aXXZio
	 1GMqH3TzQsyixRQ8rGGbRHRkvmDxSHwhY1QklO4PSkllyc1dqIU7R0hF6G33Se12pNlI+
	 zhovcwR0cxAfj5hat68QyhUnsG/BvA/TUCJH0W/0Ke6MbBaS1yADtm3STS4CbfNRKyiMj
	 YIRoVbs0Y2ElBP+1/uMuyyzlyCkQNlkDXgJFD+INJKE1KeQDtlAHdA7plz8ieet4m/MuV
	 tm7DKe1oY2edkISqmT32Y+cCFMqiTaBQyzUomIpF1mvN8P6rbPur1w1kOzqjod8pEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YC0iMZIM;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25660A2624
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA25660A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YC0iMZIM
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so1982863eec.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588147; x=1795192947; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drIFIGRpVF4Rwfa4SlpVZ10h9THWcqWMFBwpCDBlAuo=;
        b=YC0iMZIM8iqI89bnT0fa36AjhlaYaYdwXwE1Rf3+67CzD9wl9OoJxiyloC7fYRAlc5
         emjQi/Evb2hmmIc6cGt5L220QOv7GX1Jbd50luv8INHAfATa+O3fKVMFePWvynKobFoU
         OmDYucSiIhXppDwowmm2Zk1zafReU2JCvxXov8IwqtN/oMjZLGzQoCow2NbGHKNWOG7T
         FlpNzU6tM900RXCRjTTO2MvE6geL+6BEGYz1V8yBl3WJABfKKNb1nR3DZmWqgMeYtokE
         Rolo6DuaJ/yNqXVmd5DEiAN6IGTxUIt5nK9/nOOcg6m1DdD9Mj8FLn6jeGdjyJajfb6l
         Fn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588147; x=1795192947;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drIFIGRpVF4Rwfa4SlpVZ10h9THWcqWMFBwpCDBlAuo=;
        b=ZGHp2Jj6m5VCqtOqDXIyxXJKSRvTcu6ULm0LFo7+eECAwhSc+0+RJI+9Huk93fasTv
         4k/ob0KVS3To4pTuVvCfTnDcIVvsiApQFkMM46aKeNovdbwbzSvrogBzFPn8dN7stiDm
         tn0ssJfEXIKDO82t4njXUvxpgBgnro6KCoPJJ51G6P2b60r44+xf0qV86Upcp8iH2Ujg
         mGgzIPBHkpUv1gwPTdU2YXHxmdP4mTaisEL5XezV0c8QUcg3KKlVETtzu3mI7MD6zr+N
         DNnxw9HzdA4Etc/k+6mRHh2n2KrYKSad94wkSvoW4qXyZ0PS6ztVcdqJ7xf8E/nNQAji
         dISg==
X-Forwarded-Encrypted: i=1; AL+hErFP0yfI/Ft87qp5MOZZlkw0dEcKV79tF6I8DvKxL/yA7OQ6OAKAF6jydaJBBDbeurYLatjX@lists.linux.dev
X-Gm-Message-State: APuU4Z/bD9FOi4KhwvbdQVVfcZ778g2Uv4q6neNLhTvh+w5YWeh9ZG+B
	D5I7YzXha6+d7MPUZVq2/LaGDthTPLfi+B4vu4MWUwi+4cwls8AWe6ux+7/Ws+pxvUdWfcMYlb7
	7KGfbblLsQQ==
X-Received: from dycnm4.prod.google.com ([2002:a05:7300:d184:b0:369:7ef0:57b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:83cf:10b0:36a:79e7:2fd
 with SMTP id 5a478bee46e88-379684b838cmr3033785eec.40.1794588146719; Fri, 13
 Nov 2026 08:42:26 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:44 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-14-irogers@google.com>
Subject: [PATCH v13 13/21] perf dso: Expand context analysis annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate struct dsos fields with __guarded_by(&lock), annotate
dso__data_open and fd_limit in util/dso.c with
__guarded_by(&dso__data_open_lock), and tighten __dsos__findnew_id() and
__dsos__addnew_id() from shared to exclusive lock requirements.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/dso-data.c |  4 ++++
 tools/perf/util/dso.c       | 14 +++++++++-----
 tools/perf/util/dsos.c      |  9 +++++++--
 tools/perf/util/dsos.h      | 10 +++++-----
 tools/perf/util/vdso.c      |  1 +
 5 files changed, 26 insertions(+), 12 deletions(-)

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
index f736a94a53a9..d233cc5baad9 100644
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
@@ -1726,8 +1728,10 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 			changed = true;
 		}
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
index 4ff38cb5e2cb..7a56577f4ec8 100644
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
@@ -320,6 +324,7 @@ static void dso__set_basename(struct dso *dso)
 }
 
 static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = dso__new_id(name, id);
 
@@ -336,7 +341,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
-	__must_hold_shared(&dsos->lock)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index dbd06f420753..cc7e3a42f9cb 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,16 +19,16 @@ struct machine;
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
 struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
 	__must_hold_shared(&dsos->lock);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index 93828e660672..fc75c0cf372f 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -126,6 +126,7 @@ void machine__exit_vdso(struct machine *machine)
 
 static struct dso *__machine__addnew_vdso(struct machine *machine, const char *short_name,
 					  const char *long_name)
+	__must_hold(&machine->dsos.lock)
 {
 	struct dso *dso;
 
-- 
2.56.1.703.gf848ed807c-goog

