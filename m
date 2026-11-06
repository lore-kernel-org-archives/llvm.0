Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948653;
	b=1NmKvwBNsNt4s48z9fPcDOwmJgAQ79AIlqJZ/Sih/zc1O/KuOX8T/dROKCCloqT0x/gD
	 uPhy78JWTUDTfW3uOOhouhqBksDGqaIScTtKzZSkW+L+Xtgr10No2x4PNNGMsbGfGR8hi
	 6bEen6Tt1r+Gw2MjzTyLvHiIvfv9idtjtZbceWBfvbjrjO1ofUIqZoxRwxAWSAcJ58oht
	 2d7ytTrbbi9sUMdExuBOvnTGRYpvXQToguDNJS4eA7tFVJQm7Q5A+EWmzsxmnB4uPkhUV
	 b7SfB6hCfns8o5DvIvJwiaI/QGiJauk43NpPP6jrBhqtsB2H/kwl6sC4Fw9lz5abs2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
	b=qVcIE3BEkv2h+AvfT+Wmag9QbgteZmYbBxWVr55NNbzcSWlL0u3D7Y+0mUeBDNNrV8Ns
	 Zzf+5tNgjXnHus/7QUO7eMEb+yL+nb8DuoaAAZShwj2c9ujFyAHsyjpIe119ef3ggVnNd
	 777A1M6i2/LedVK1549nWaidF3S2iakQsZwVQcgJV03M+RQdkACC6Ko+KBxIYmmLKIUXD
	 0Y0uQfufdNf/ciVED722IbfdbFus2kdGgFbLhFY6+TetMAyglFhpCchSWbDUvOdU06QcS
	 MXJVCzpp7LBvyNd+5p1HdZC2SDVdXaT3oT5ZrM24xnI0IbPZ+ADdQH8wkwIAR3kx2+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FK57rBfd;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE8606D80E
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDE8606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FK57rBfd
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so771212eec.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948652; x=1794553452; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=FK57rBfdZIZQCaoPnKLO1ObRLTfaZ7FwEbEYUM7tYZXbKuRoqzfvpaH4mLjlLVMnsl
         WGTlL27yb8MJ7Ziq80dZmeHmIijeYLV0hD31o/4xCcDIPuzYd+wpjfHsaIz2Dsaqp14T
         7cd1/4LvpQJuQT51swHI1NbQVtYzJAhtttWxZoZOETsy+wgsJfHhx74JUgXAlbPcJg9F
         3o9kRJ1RQzKLjTYcQAoZrg7qXekJfN1r7m9mxf78pbv95qZDysQPTiOMPZm3Kx068Nfg
         m0iwLh1RgqXnjkIGBmpoovZo7gCCXe6z2S0JDqCNvV7G4qywDxwZXxsaMl1WNGqLrUhc
         tSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948652; x=1794553452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=fiqM8VBnUIlMJuv9s7HEVEDaB7RTIPn3Y6wjkrZmCqyjUN3rktEisy2qDOSDYCDH1P
         KubPEUb+jfeM1dliHxGZeuZ7SGrKH79FLp+c04tawPr0a5KVbAg3Oo0T0ulJXUGHtH5M
         Iyzlrj3/bOWEuTCAsVwzdg9KWPHyog61+tvdUW6rK2eqrdOo8SxrToCF2TOgRBd0J8w9
         2LGvYhgFvphyq02N9Vmo3OKPVg0/xt3L2F0LkRVPdHT5G2d+X5ZFQLIMKe1gotGSlzMG
         Ua3doqlQA7hbOdxO/Ii5erKaRI9eP7YP9v155tpsf3C2p25oGv+tJ5Qszl0tZZ33UXM4
         1hcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmaAWMjb0j2fdqUZo7gw6zWkyIyHkTTi//zIe+M3IddE9Pig+cBneJGtu0zrYu3SFUg7pN@lists.linux.dev
X-Gm-Message-State: APuU4Z/9tXEsctnbe+CPsIYCxIPbdPWVgNMPW9lSzIUb2LPP+/MZnyHq
	TjLkepTAFApR6o+755mdXBhC48GcWvFiqBFh/UJUsg6vzBcNYxNZyz3j6F8oEBz8K6Fv9QudPea
	KYY7wxJX+pw==
X-Received: from dldyq28-n2.prod.google.com ([2002:a05:701b:455c:20b0:1b2:48fb:f4d0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8e:b0:19a:8e3e:530e
 with SMTP id a92af1059eb24-1b25d32ea5amr2314713c88.8.1793948651489; Thu, 05
 Nov 2026 23:04:11 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:34 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-11-irogers@google.com>
Subject: [PATCH v10 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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

