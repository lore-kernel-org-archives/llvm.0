Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825981;
	b=zUadE1JLoCQpiUQ5APuze+dz8MN1Zc6Eash8g9QXNxKhZCkbwKp72fe+dH7qiBHRv9D7
	 ja5q+Eh5jIE52xF2CFW7k74f8qtCtLa8SvoQsJA/ep9iGsnsqpge/+Ky6j+hIvaXEakSK
	 25omQh/wHZle9OkyNEdvfNBLI05baLes0hNSjNh5RpFcnTW4iUFp64+TDv7hc6tbnkkdd
	 VJpDffKvE9gkV225J1WzNjF1Z+0AKMr4PLVq6LL8DV6kqJsxWPJRCLHzY3ol3ue1dG6Wa
	 62VmURyePCG1VjpVqeLEkTqHuiJkBnvq42phQZBZYBe8L+unxSCkrxQ5qz8boGGUX+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
	b=sfLruehKKQZ6Di+i/Cd6cTW6mknKjm8HAadN6gmJfjeDiwsk7TJseISJGkv02QgfdF8d
	 q9lYgsloRS2S7vhSG7p8aTOcX7Sr48z8SkWI6hukIl+pknArvzMYtgf89+ypQ2jMafjpC
	 RzHJgBndm/VG4TW69Ji6OKYaY+m9vfrR6jo9NP6p0Ia4lBQTd3jWorG0Y2GQxdSmm+gul
	 eexBTQhhd/5W4wJ6eZPgWnNQLE86UDYBTIp5mZdhYrL6LkM8RjsD5vNdVBFpk2b6RgAqJ
	 DPx0fCbB2eMyTwTulgkJVApnJFIE7q+CAmaQOmlzswM7DYJEEZ/hsoDAtZcnaNVbNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QqpwhFsM;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F110760E480B
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F110760E480B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QqpwhFsM
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so1843311c88.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825980; x=1794430780; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=QqpwhFsMn15mzjp0TC4Dh05Xghub33hD0rUTqPdpVaHM7hiBp4pKvSSB2zjuTBqiia
         5VbhCXYVezx8awWHCmzk8nI4vtYqA7fvndD8gt2e05ea6WIu6OgTxQV1i9Ds38Bb9FR9
         gTALXESD4CRRYDETFJ49EutTlWt6fE922BA051y2fyU4c/NgYcf4wTgyyOieHBy1/hx+
         YfT0Kg/w6eUr0Uivj1SCbEDsQpZ2BjQcAA+BhiEWoMITtXZvYX6kGeHorrTuQGL/UDDA
         jN83fnlEoDcAW+qatNe982+P77pezO4IkX0Fd9+XRT6A87xrBPGY5UXCAhtxnRcf56n7
         DhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825980; x=1794430780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=QODQH4pXVWzBSQXgzIkOLXfq4Wa1pYjXoyjQGbJ5bf+ocqtBNryXUyCrh6J7S5Az1O
         NfuWCYu+VPqpSXBoWmJqdFC6cXWSQqE9ea34iRrxlWQ7PoQnKbQ5alS+AiuGkxN1Aoan
         Zs85phAO7bF90YApmU8jw7DC5y3uKNYc7oWCNcMbb9TFMgrKOggraIqnwCt19Pq4JXs5
         L/V4qyTnQtSARvXRgG9IvmV7MNQllMiLAI6Qlbz1M6JWquldP2UEYBFBUcLsvhZj/CXZ
         zxGtRO51msHqiBw61xSw+cRu4SQQPQCDnIeLLaQ/1vbYkzj7qVJiVn8P/qabDRuAKJ6G
         g3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3KWRLsup4jZKVqyKmiMMn10B+LRvJCwnZcaLFlOmQrns5t4NJ674W2nFjJ/aRBgt7/2dE@lists.linux.dev
X-Gm-Message-State: APuU4Z/5dXIFucPVHfCYe4Xzewys8pNlyIVsUOW0gKfeugzT3a4K8w56
	PVs1xyuDMcV37rN5AKPQg8IN3+UmHFH1WuKqMDojSfrxKOZS+29nGhLXEh/+JSUzXOMRCWzxzpO
	DOixtDChVtQ==
X-Received: from dldnz1.prod.google.com ([2002:a05:701a:ca01:b0:195:d59a:94bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8a:b0:1b2:39fd:3252
 with SMTP id a92af1059eb24-1b239fd3ademr10299415c88.19.1793825979562; Wed, 04
 Nov 2026 12:59:39 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:00 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-11-irogers@google.com>
Subject: [PATCH v9 10/19] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 44 ++++++++++++-------------------------------
 tools/perf/util/dso.h |  3 ---
 2 files changed, 12 insertions(+), 35 deletions(-)

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
index f6c60bafcde1..0c18c0f3ef88 100644
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
2.56.0.455.g6c5a503b38-goog

