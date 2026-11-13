Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588142;
	b=Y6XqL9NtCDkbKp/SsYUUsprFMAmbVTLiWcEyr0Crgy00ACkSANGTxIMesmpIh0K9zj+7
	 wmhyBJMHbopbIyUqS0gSeLLWgEKFWBVtMcKy2AdV6VOTN/OEYyJnFNk5mLbjEo0PtlYwM
	 Rl+3PesIaFdLyUnXtjIJM67puFf4+vODxrr6VtyYL+Zh7PL9OqMz7jgaadMJDe495qwDN
	 niWWj/QwyHsh+UqeKd0TLtSFIRWMlV8vCk5XWXBxnRF9px36t/FMbzWSbz3YyqK58cjUl
	 8vYOS2kzVFMlk8zANZ6z3/jHmh3D9XjPCl2gdi1UyjrZneQYjPY1ITVsu5HUZ/r8SWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
	b=jb4MtBJNc4rgR2tYqhXGK3FSrBGil8CPh70Vw1DCPU8odutuyY839GZBhcfCUUzcRh1D
	 dxt7BFLPq9B6yHRFfBLGNw9h1PSA3YFyHeDVSm+ermxoEUr30gBudOjrYZo0MbEX0zY2m
	 ZBkDhssh6iFARbc2HNT0DvMrjcmQfBWg+SO0kH2qUZjHHAVB5uo7hCPhLvvogRIGt5wPt
	 evuT2gfzCzUip+0KNQTYZc5rvWm2u5txR2pDOhkWnr1eX4Vl0BF/OlEPeHKOHNFPsM7CP
	 MakD5p+iND8KUcxiifYKWQgEdgyk4YM7DrpVw1MMWpOVLOH548/vQN/56/yBNUY9bqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ppf9EnNp;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371A60A5BFE
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C371A60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ppf9EnNp
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1179033eec.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588141; x=1795192941; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
        b=ppf9EnNpSNlKK9bW6zvCF4EpV1gMy8sAVYZu3ybKmOgeWkqIYJLPAii+08JQVITqvC
         VsFJEn0Fj83T2qVZk0jFTDs8KGnxo1Vo/Vbm4f0WYIvd2KXbSgX+UWkdK2zqSKJQpl0L
         ZVS2wAbYL5kURmH7vAKGR3n1EGf997G+FIeOlsBfuH+SnhRqIeJPmYTHTbN0Psa5ITYW
         NZROoiCBdFYLUZL53k1qHnMCmBKHqCW06Z8bblHyifWCR38VWmFL+eQstSsPDyIzOIs3
         KyDpsqkU+DwOv6BtlIkxNtPAsalN9ow7tBwe7z56weRabyknW0JNQcftlJVej5O0h/I8
         1kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588141; x=1795192941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
        b=F3waXkYvH9P4EG8E4Ikqz/u+q6NoJMN5cN1LenWfvGU+oPuFLTqGTR/7iQBUg8roq9
         /+t2EKjVyUFzSIxNkx+WHXLsr/Bpzj7rBHjvYh0XcdLZ1LhG0YznRKqQD3TuN31qR4Hy
         nRqPMRtIEe+weIDvmIGq8ZwTIKd8gRboT5SFa6f/MtLsfXTIeKAFjUUIfImagy0h96SP
         08L1PACTwJSdebY5ke9XvPzvQyxScfvp+cmE4Kx+gjRju//RlReO4DyuY0lriLcKnOON
         80RxhRoMHqd5zsmNlRDuKOcjfUUHAOtkfgRWEMiVwRLbtQtvx8G3HhPtH5Y98Z0z+bPN
         1h6w==
X-Forwarded-Encrypted: i=1; AL+hErFeQtqLxt7P0QDjGE2RZgbDlMxPvi4Lxc1U94E1jy4Sp/knF5BbXKbIPuzXBFYTU1bVO2d6@lists.linux.dev
X-Gm-Message-State: APuU4Z8EvBqUeSTTbUo/DxmXdcnQTRv8MWrDTFxwoEinGJjcB+s79XJ0
	YGzUz/nU0wJYfdSGjTFVnzEtPJqBOODAPr7oHUALZNy4Ag9XH5/HctPjaJJHgR9gXBPHYpj8xRS
	k0rQA2HEW7A==
X-Received: from dyrp7.prod.google.com ([2002:a05:693c:69c7:b0:369:a832:e377])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8284:b0:36a:1f8:a589
 with SMTP id 5a478bee46e88-37966e3b0dfmr2529003eec.27.1794588140579; Fri, 13
 Nov 2026 08:42:20 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:41 -0800
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
Message-ID: <20261113164152.2095566-11-irogers@google.com>
Subject: [PATCH v13 10/21] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
index 009bd3001ace..a5e8d195f129 100644
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
2.56.1.703.gf848ed807c-goog

