Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514230;
	b=ORW853S14doqKbGRzXOALDDVaVDFU/415L6CJOfED9aro/YLYEZJvyI7gVk2DBq7nwjm
	 EM8L22ihN40axxsITeUWT0BgDCWkWzedI7N66ViM7OKqkEfd+dDr3daUi+q4FwuqHpML9
	 2q8C/Z4cKHF2wk1LeZSPUOl6xxvKFKoK+0/IBt6dAHRtM9bINI1QUvigLqHX+ymdwx+UW
	 E5+2MwewVuhomiJxH0zWv80DOVBUX32xWEkLxiCzOmEdHrvEDL9QZUr3esVJjbAERXF/Z
	 gYKrCQpJSUnAsAAwGZK+tjeRWu0OTRcGS/htHyVmBbZxP+A18HFZioB5tT86QiefLIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Zl+TlYXbSfzAIe9HavUFCRzTRlYjwjUPh4I1/9KtP7M=;
	b=JKEjaIhkhUgayHWJlowtO77BVGMiJJPhvDl5TFCpKinNExTgzQFtpPm+WTjsyytTDxkL
	 hBTniKVVNQ+m0DBA3+FzsCqWHdBGx99QtpHnROFUR2h2EjiYeeJBlP0GmaIOeAP7WC7KW
	 p1qATgS9kV5j2nXAQa26QLKBiWI0pwzQcXRo8nM3GSa+O3jgv0/2kirRrevoYhYH61R6c
	 dw3cnoOSCZYz7oqxbzPKnG1+dsw1A1QrDILSrDCjT1Cp+xZPfJT7tMvEqcoxKaQ816Ypa
	 flFklIhXGYAVq3WhE2uqUBZ0452BltCJNNic0/VJwoWc5qjTWR1zUtZx2MSo2K+hC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qFfVTIoV;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F060A3803
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583F060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qFfVTIoV
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so6365086eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514229; x=1793119029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl+TlYXbSfzAIe9HavUFCRzTRlYjwjUPh4I1/9KtP7M=;
        b=qFfVTIoVQLa8GPWVMABFvEzKba+kA1UHHe0hGdxI+gE8zPoVlGbjtIUwgCU8Swdh8U
         YTitFcdviVOsmOq+W9K+t7H8OJYVr31c4KoRSC22dUXI3qZFBzuPQ6GBLoZfIrygLEQk
         WUKNd47QAxezsR5yBXidz5qcjndZtxKHfM6hDx3bfRYQDkvl96UZ+qr0RRwodwMO8lzV
         IjXkI73JpG7OfTJgX7EWPG1MQdJz9702nB3Ze9Mb+zRtAqNrqL10HMAfI/D7DcdZhQrU
         0rFGDgsGnl3rToy9xnaL3mJrMeSky+J8Ab++lshr6KpdAhA9rOwQFcN7P1ygexZr4Jm/
         z3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514229; x=1793119029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zl+TlYXbSfzAIe9HavUFCRzTRlYjwjUPh4I1/9KtP7M=;
        b=HsLsq0DKo56Ra0UTNUtNsZrl/YTxO3yWkQviE6V6lIwmkLjbYl70KCpvujhlrf7tPL
         A438oDrvrdooZ1/K0Pq0fs09D2sF4ziOgWLIIkBemoOth4/KTyTjquQbz4s6oHDq3NnY
         BABe2MfqEvtP36Ppeijg6X5ztWXF0U6ZymbjLr+64FgkjX/w0gWKHda9uOJx75v/gOve
         eko3ogKKDg3csi2Vr5c7zfBYivV+39dlbkAN1dha78JpMYs4D7DEIE3FPOcxt1ig/faX
         Dd5NhSWoSudv1xNMPdu4Dpw8n5tNhxfqx3RUIa9Vy355OXQleVPP+vlGp58FyX2WzqCL
         HLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQF72Pv0FeubFB9A3lAWkNLHdaHQWVtt6TTR/g6RUlU438GKu3ybY6yvl7um7khv/pOwiz@lists.linux.dev
X-Gm-Message-State: AFq9FYLYW2QsqZVe+OJPxi/vflKoPsyYpUsKrjIGK6wgKILRSsq//86t
	yXTPnjwDr9dEitMocWaos7DR8bltapI0H3K3pVHdcqfD+BavU9jEMONU8IeL5B8kKmOiSWL1o0u
	Pk2KPpmwM7w==
X-Received: from dldyq20-n2.prod.google.com ([2002:a05:701b:4554:20b0:157:8b19:354f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f51b:b0:159:aa67:28c1
 with SMTP id a92af1059eb24-18512b3e25dmr16073943c88.20.1792514229039; Tue, 20
 Oct 2026 09:37:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:31 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-9-irogers@google.com>
Subject: [PATCH v5 08/17] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
2.56.0.212.g129ede20d9-goog

