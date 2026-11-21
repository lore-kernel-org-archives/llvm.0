Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244358;
	b=1hkLblo5LHs9t/5/E5wEeaYQXo4vYjJ8X3jpK2+n+BW/srDvpRl0UYIpAzt3Dhx3gZ2U
	 o2MQu96rYgQ3tqMOTTuzEtZ9x6nTGrQMVv0S/J3j5a6LUTh472OoNyLnhfB2d96lYflvQ
	 fwXR5WXsJsaiAKqMYTEAifGzsao/JT8rrlW1LBUHoIOwt3FXNcP67nNTQkAaiXJqWjCOz
	 XxMghfYOHnLX09eoo+vMK+bQXq6DJarz4yv1gzluqRK8gKpH5vOM96FYFwpzKkx9jCO2Y
	 cyx5PREtf5CrLt6WQZ5TXyA8QKb1UyV6+bv+t9zk1DMPrehKicALP4CB4IMVEUDkgcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aVB8Y+p+SSfHh9qUhyaF69ZnIILGyQybiQn1OGrqgeA=;
	b=dSaM7nCJGCatf9NferPvpmYU+segj3TT6O6jyySFMFz/PWIth1GCoEwwaN89FX+TMZa3
	 4PRs24YQMyRgcZB+jPBtdIzkCmET93sbhQzOKR2ZVKW/mU1YI0mg7EQVaP5L6Wz0vQYqQ
	 Iwq/hYWiaBiA0R448HApvdH2JQ8Pv7AooVVfJ5XZdhM0NY0Mk6c8/NCR0du+WzedTLIt7
	 XffkWYm43Wq8EqJTdnnvLPwf0TcbY7LQ/HXEfDF8ZvgFe2bqHiL85CzMYG40wIOu9GeUe
	 v9uZ035Zvpegm2huF2M8z9nhrSZayKTUN1qWyMkp3+KWMJ0wv8bGkxAKyAoRpJyfpwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=go7EE82x;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C9606A683
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8C9606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=go7EE82x
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e6091d8a1so1338334fac.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244357; x=1795849157; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVB8Y+p+SSfHh9qUhyaF69ZnIILGyQybiQn1OGrqgeA=;
        b=go7EE82x2S7p1diBGRZpUsCfcPoeVRjyLHl/bPrLmN1DTtlEVFa1nd7rwd/K048l6I
         C/1DOIBDPIaTVHOYvRS07ROH9q8S9Rg4hugjtwE0vNA85JZGqb6ULkusmKWIaNDKYECf
         X4gAYXVJY8sVCwPkrDnYqTjuDvLDmqKsYDbDXEJoM1KU4FHUUY4CDuxYjz8j1R2Il4i+
         QMFbKAXw6zQojZ5HhhYrGIDNh7HOeZB1s7C6ZjSlW3nJpIapzYg2uB/V8TbdQ/Wex0sd
         SN/gF3JOAgBgxUv3xGoN+dfF4erSk73CqmWNvinE+F8UJKF+W/mR7QZHO8DntFTmASPb
         63qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244357; x=1795849157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVB8Y+p+SSfHh9qUhyaF69ZnIILGyQybiQn1OGrqgeA=;
        b=S6oYNJvsIb9AGa7KoslLOUDTFvAwUyQRfOIn5ZV9hdzofaUHXUA8AVcKdmtchfAnxd
         JUx7LCAfFr+OOl/AqQMfpTR9iGPX9spOu4bdAbgmr3ohBJ84qVRe2w5+t6hWfahrG5zW
         lP/ze1oGIK+/xUejRzTXtWeX09pQxoR1gSZZCmNnm0L6PZi7bD5IxRZ/yuIg71q8+n4D
         vYqdH1rFl/EH3/aijqMPbvkEFEySgDTigVotLGeV8dHUH8+73q7kJRrJXqPPUP7xmo9g
         k1lVln9g0pglRc7Z9CpPL+y3g/K6krKWADHH8aI6TUVqZtIDsIL8YxwaFzWrLIEYp4H2
         qeVw==
X-Forwarded-Encrypted: i=1; AL+hErHEOFIO0uLNMvOZ2iGi6kqAH6Rhx7ucjbJfqU/GNdkTI/I5YApaqhqnAGcI7dntpjQdoC54@lists.linux.dev
X-Gm-Message-State: APuU4Z/rLzpNPnYyX1Gfl38Ei55SxvtncWi074Yt3JTKssO7RKUyyf22
	s+ANLvSRqPHlYn3HOJYf/UiUUoLZ7gDSp3etxq/DjHK2QFnwKdbKtaECn/beeqz4BXhwX56KrWA
	QFpDEs41mog==
X-Received: from oacje12.prod.google.com ([2002:a05:687c:2e0c:b0:4a6:98a5:8dea])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:6986:b0:4a7:5eb7:ab8e
 with SMTP id 586e51a60fabf-4bc84b1d780mr4716649fac.44.1795244356893; Fri, 20
 Nov 2026 22:59:16 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:02 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-14-irogers@google.com>
Subject: [PATCH v15 13/23] perf dso: Expand context analysis annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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
index 1c938d1b11e9..49813424e4ee 100644
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
index 8bf81e2c9e78..fe28e346dc2f 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -126,6 +126,7 @@ void machine__exit_vdso(struct machine *machine)
 
 static struct dso *__machine__addnew_vdso(struct machine *machine, const char *short_name,
 					  const char *long_name)
+	__must_hold(&machine->dsos.lock)
 {
 	struct dso *dso;
 
-- 
2.56.1.750.gf70dc682cf-goog

