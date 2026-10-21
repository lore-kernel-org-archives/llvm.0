Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622385;
	b=elrQPd5GeztQhmn3xLlYZ2gQeQJweWcYwzzRPpiUvFxFNxagvSoK0GO2URf4pLB2FuwN
	 E6tbwMjGM/WVy48j8DYK2nzWpLqU2BlOsJ0b5aDoDqbCiCV2+d+lykdKDD2IZolzaRebc
	 vc6z5A/bxz+RnF9NgXXWSHLmetaqtBPz9K7gitW5J9a1MDl9fsDnoMw/NZZyFHDb2ubBF
	 o/CJs6tWZ1aPrGgp2SWpa2V6T/ct81iNYG8wHrulw/3Zax0EMcgB0+eNAPd80BRQ5BP0p
	 9L48VLa2Fkqh+IyZT5Gk0WzY74X3OnDJK/3RhTof3GkTR216PUCookgoZtT6vFP7+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=r4xZM05fPg6K3mxtPAQZIFHOn//K/uz75vM+M83u43k=;
	b=cPiGHwYakws6o09LSCzP8y9peVNDYIaILSaH/GID4zvz8yhFo+4PeptNHlk9Bkx5PjM8
	 PfY9O4tsFgsNcW0dNyw6YCvdoNs1Zo3R7p+Kr9+Yh44ZlNIjIbXEG4vOVA6AImITR5dN/
	 iGzl9gEyQgmzKYPvwoGBvt5fFJgV7yjgCfQAK65tVt7Pn6KdRdEv7vYrniwSdkHQuXsFy
	 wHQfsVBDp3VMmJJXQlxPuQO61454jDorH0J4N0x6KQ09nvBnnd46zWcQdxRKvgSSsZjWP
	 qJwtjBbk6s+Hsa1z24FQyZ/1N/01NvEB2pF4XvKNJ8Oy/dOutvzqpd4FCKWUyHEW0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O2R+rosh;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC16B606A321
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC16B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O2R+rosh
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso3435147eec.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622384; x=1793227184; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4xZM05fPg6K3mxtPAQZIFHOn//K/uz75vM+M83u43k=;
        b=O2R+rosh/2cO2eGjZjtVh81kJ6Rt8QQqBm09saD/cqy1pi5bzTwY/T7YITgclUGY0H
         AzcYkuj+q7Wy0UrYY5Oh64xGdy91Hjf+B1nVUc0SMLN9xRwVgE4yreXt+L/vhtoYVx/V
         epAaeyyP2FVPvVBxl+HNkxGVI57X2E0y9z+meNJPX9ltd9ZgnNmI2Po8GS1jS7orkBCX
         o/noSJVg1K+7oqtyNVCC9VEIS2W2uqt4hd0AlKKiJY4UmcbVZLUMP902Z6qVDMR959MM
         zcAFw8l12O/0mLwjUVgQ4inWQDPj9QZ+I6HPVep4SpPavKh2uniW+7Xyuby4Pvt6JRRo
         S30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622384; x=1793227184;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4xZM05fPg6K3mxtPAQZIFHOn//K/uz75vM+M83u43k=;
        b=ncyjlUjWXQbxLw3XsTmXCegtyBz5kJveQNptcwHB1nOm57T0uXw7MQS93mOSox9DOV
         dNQVINEh/7N6elOLYpml1P/KilxohjHTTN4rR9XRcETAwTgXKKggqBu+Ly14+HlIkZ7i
         WTxMSdarkpXHaBy3Fo6FFXI5FXwn3y5u3b+9jUiyY5vtcuoFHa/jo/Jk6gpXhHQjUlJi
         9W9KRdRISKX1WOOr6KhyeEcmNuaOiirzVcQG1xMX0vpPk5bLVC4s0tM5eig2cRAd+eq0
         imD92D8C+rJZpFbeBjgWIi2Xm8lto4O7PBD2pyI1PgS6DW+g2RfnolPZzDXRBww09Sqa
         OVMw==
X-Forwarded-Encrypted: i=1; AKwUvByOn/v7haDJQAo2ns7bQ23Ihdyygn3b2h5PKxvq+ZAnE576jlqvzmw9FK4zIgP/H6zueNSW@lists.linux.dev
X-Gm-Message-State: AFq9FYLgQWdLn/lMPyZhzV0tB6abGYMqwUh+ivEq1Klt3PW6Jm3yA7NF
	ELkUfLeCP8Vi3CNQgJU4GHecV+lwQVnaYLxr3Tp0ASd69dl3eVNoiaGepaMSdo/pJl5CUA5IX2N
	sz5pSwOk75Q==
X-Received: from dybhv5.prod.google.com ([2002:a05:7301:2b05:b0:353:82df:8b1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d942:b0:366:c497:610c
 with SMTP id 5a478bee46e88-367502fa72dmr4756205eec.33.1792622383367; Wed, 21
 Oct 2026 15:39:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:59 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-12-irogers@google.com>
Subject: [PATCH v7 11/17] perf dso: Expand context analysis annotations
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
 tools/perf/util/vdso.c      |  1 +
 5 files changed, 29 insertions(+), 13 deletions(-)

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
2.56.0.218.g1ec904b173-goog

