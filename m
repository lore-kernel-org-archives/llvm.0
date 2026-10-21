Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602702;
	b=tLLopIWERKBnNcqKqGfQtlPDWjLyBd3dOeB7K+DJVZodkw/dcc5DXuO9cAteWfxHvb14
	 XwTAi3ZI52CiJCBiLqLfJ46PLDEy3H9GLLHfVIhDzUO683igxxOkJoON07MzcQKXQVibd
	 JkXqm4RWoDkoNsd4tvQFRMOnu73tozZq8e18qvK35dv4HFtThefPVdTK2K3nHRJECWdja
	 o6WaHMRP4lIJm42CIXbBFzMftTcO8wmdzYyecKNIDIJzHGLsthNZXpN1b13SkeuCFeqA6
	 YoYoPG2V01cOBQy92DlHxdIFgPJkM2xv7g7dVg95hqzRXh0hvl+wjQlOm0jjKM8tzMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3nvn61O82kZwf03u+jwEIvZ1ZarZIzjJ0CHdkbm51mc=;
	b=OYsVWdM76MJ+nbukLdXb+nDFgPzBjH7VKCvvSHsynyCi7mp6WS5FrIs0RHN7YDprTzPH
	 kaIGsdR+8BgHM7trosEMDxvI3zDtfsy1cRdVlm3h1C3iuLgockVLadZsAj+9m/9aEfENN
	 0LZZ/r492a5vGBw7Jbu0fnYFc/u7ej02SgetYrcZEHeG8PoAZd6gmSjrUCCskt5TwbcT2
	 pTIT8iT6Ovr9v5YWSZLn6AFDmXhOwq3TPFLdSFjNUA8efsMLZDC2oyTjpqdmPujvkkels
	 HVV0TmQngoJWHH9Jk8CrOs2O6mX9G0FCDK8qPYKyRtquve5J5R+CcAvN6wX1uwlT3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T9roWnGT;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F016606A325
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F016606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T9roWnGT
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2387222eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602700; x=1793207500; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nvn61O82kZwf03u+jwEIvZ1ZarZIzjJ0CHdkbm51mc=;
        b=T9roWnGTKt3YtCjcEWBT2TfmhM8VxFth0ReZR8Ca9RJR0qDHOnal3ACHEvf2U18qOA
         5fEVvdFKZAoL0xFcF0UZQLXJDi3fm2xx+p6XboRfw4usPsUPA7Q361anve8jbAxHuCqC
         pyYUqf+muN6FMMNMZmkBfdn79c2BxDGUIghr6bAh9fJg4LEwCF1ZYhiIHcSZLNt+iIux
         7Mh4f6Vj/5/ikyWtD86CLCUoWaMDtlsd/gWJ4G9/RggYUS/iY4tcTlVX2Jn/zPUyreaL
         zzZO6Qpb948eRq5drzoynRtO9QJy63yU5cVVx7DwGaY9ohDmurjG0wXDaHMIda2pilYZ
         1hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602700; x=1793207500;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nvn61O82kZwf03u+jwEIvZ1ZarZIzjJ0CHdkbm51mc=;
        b=veDChLDIKzIhWrmNj/bCNnyYy1kQnqavnK9KeFnf3+mqe0UPS0u0ugdSsr1tuBj3DB
         iQWBdj9iXTJ828inRGWvS6jkbt2SIxCwVOXJunPYqVI83/phaTGOFOoNvWXl2WYVa7Br
         PlvnACCjjNxZZI0A8KoY8mS3k1kcoWKFjUArGTOcxfWeZ+hQCLPlABN5skBu15SJ2npV
         QzLAnHnK7FgkCEEcRxG8lzlimykyKSYuBSdH5+fhWTjIOPqt15cyv29LXqnNivWfRUOV
         6byY7Ev25/2GfM5cuAA0oqy3iqoylSaTCo0QsL5UlKFx5og0RlTC/CbZN574gkds7oz8
         Uclw==
X-Forwarded-Encrypted: i=1; AKwUvBwNJTUUBlILiLmcqzc1sb7smfYjfN2ksxPdTX68f2Q77GRtOKwTOC1WApMhLDuikuYcKAtI@lists.linux.dev
X-Gm-Message-State: AFq9FYJqaWDn83KbS05J/nB1SjdYU6j0gahtfvEJuhjQqzBVLnXGdzRv
	bx2m72hk94VsmvYDxrebQQxPQsBySKY2lWu44KGO4NyBjDJZ2sO/RShf7+tKCycfpCSUly6JcfC
	gNf+d2krUTw==
X-Received: from dloo4.prod.google.com ([2002:a05:7023:a44:b0:192:91:5cc4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4512:10b0:160:a80f:3ed2
 with SMTP id a92af1059eb24-190a55c1745mr2956539c88.10.1792602700014; Wed, 21
 Oct 2026 10:11:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:34 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-9-irogers@google.com>
Subject: [PATCH v6 08/17] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

close_data_fd() and dso__list_del() only operate on struct dso_data
fields, while close_first_dso() retrieves a struct dso_data * from
dso__data_open. Pass struct dso_data * directly to close_data_fd() and
dso__list_del() so close_first_dso() does not need to recover a
struct dso * from struct dso_data *.

This removes the REFCNT_CHECKING dso pointer from struct dso_data and
avoids dropping _dso__data_open_lock in dso__list_del() to call
dso__put(), preventing lock-order inversions and races during EMFILE
eviction.

Also place the DSO loaded in addr_filter__resolve_syms() into a dsos
collection so dso__dsos(dso) is populated when dso__data_file_size()
opens the DSO.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++---
 tools/perf/util/dso.c      | 44 +++++++++++---------------------------
 tools/perf/util/dso.h      |  3 ---
 3 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index f30f86156a3a..5fdbd77eb451 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 24ff066b9878..cbc4f30e7f23 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "dso.h"
 
+#include <assert.h>
 #include <errno.h>
 #include <stdlib.h>
 
@@ -544,22 +545,14 @@ static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_op
 static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
-#ifdef REFCNT_CHECKING
-	dso__data(dso)->dso = dso__get(dso);
-#endif
-	/* Assume the dso is part of dsos, hence the optional reference count above. */
+	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
 	assert(dso__dsos(dso));
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	list_del_init(&dso__data(dso)->open_entry);
-#ifdef REFCNT_CHECKING
-	mutex_unlock(dso__data_open_lock());
-	dso__put(dso__data(dso)->dso);
-	mutex_lock(dso__data_open_lock());
-#endif
+	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
 		  "DSO data fd counter out of bounds.");
 	dso__data_open_cnt--;
@@ -729,13 +722,13 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	if (dso__data(dso)->fd >= 0) {
-		close(dso__data(dso)->fd);
-		dso__data(dso)->fd = -1;
-		dso__data(dso)->file_size = 0;
-		dso__list_del(dso);
+	if (dso_data->fd >= 0) {
+		close(dso_data->fd);
+		dso_data->fd = -1;
+		dso_data->file_size = 0;
+		dso__list_del(dso_data);
 	}
 }
 
@@ -748,21 +741,15 @@ static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
  */
 static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
-	close_data_fd(dso);
+	close_data_fd(dso__data(dso));
 }
 
 static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data;
-	struct dso *dso;
 
 	dso_data = list_first_entry(&dso__data_open, struct dso_data, open_entry);
-#ifdef REFCNT_CHECKING
-	dso = dso_data->dso;
-#else
-	dso = container_of(dso_data, struct dso, data);
-#endif
-	close_dso(dso);
+	close_data_fd(dso_data);
 }
 
 static rlim_t get_fd_limit(void)
@@ -1858,9 +1845,6 @@ struct dso *dso__new_id(const char *name, const struct dso_id *id)
 		data->fd = -1;
 		data->status = DSO_DATA_STATUS_UNKNOWN;
 		INIT_LIST_HEAD(&data->open_entry);
-#ifdef REFCNT_CHECKING
-		data->dso = NULL; /* Set when on the open_entry list. */
-#endif
 	}
 	return res;
 }
@@ -1918,10 +1902,6 @@ struct dso *dso__get(struct dso *dso)
 
 void dso__put(struct dso *dso)
 {
-#ifdef REFCNT_CHECKING
-	if (dso && dso__data(dso) && refcount_read(&RC_CHK_ACCESS(dso)->refcnt) == 2)
-		dso__data_close(dso);
-#endif
 	if (dso && refcount_dec_and_test(&RC_CHK_ACCESS(dso)->refcnt))
 		dso__delete(dso);
 	else
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index fa5669709eb3..d6b0a1a4dac9 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -261,9 +261,6 @@ struct dso_cache {
 struct dso_data {
 	struct rb_root	 cache;
 	struct list_head open_entry;
-#ifdef REFCNT_CHECKING
-	struct dso	 *dso;
-#endif
 	int		 fd;
 	int		 status;
 	u32		 status_seen;
-- 
2.56.0.218.g1ec904b173-goog

