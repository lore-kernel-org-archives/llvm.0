Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244351;
	b=n0KEF1Z+TJ3AHHQ0rXQK0SzDopSA7FugStCiMS52nNTGQSGs0HgKXkYv6Or3AgP27TPh
	 +UehUsl/hpFvmrBnx0y3qgixJmLIVCV625z3BVhbrTjd22g9gx/2LYmY8RgFP1R7I4wYz
	 FJWJ0kgiSS3t5RGf3PcYq+cjsaS+YD4qcAcxKePOF1EbfXFST7vHC/ErHGmJYO+5zc+zp
	 kMA+9rSCZiUXvCwcYLC8sfmjlBdRxhx0rZWcljfVi/d6nsbwXodueMAfkdw5dCFcV9Nyg
	 1Vwk8nQPIDW5lpBeaNOr+2VrnT+kg8I1hHobqhjvQtnxMtEVHVwqfm2vwC+f6X2iv4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
	b=zHKpQd+TsRFYkFVwpVpnS0uXzFlGPsPkZXhpZaoDjH/f+RGPSU4Z4iOhFGn86kihsGdp
	 mpr87OkM8MLNi3HbUWfNZKyGap/MRHqpK31oKYwN8qIxs1K0QCediCi3th8c4w1Ccy4r4
	 VttjtAPfNgfy+0K4xujQAdIt8IaUdJAWpxitDlpXox/My8jRuIndWWFrOIBQMTS1J6A/G
	 igWIhif9+B726QMbQgiX8PGrxsrFP63JM2EDIe/p+lNUrkr5B8RnrNDNFQ1zvEvgg79YM
	 PnfQNNOIWG9k5VBEx8vYXR3vzwj/OGLoOQm/KEhLHMqIQOnlY3LPslzroa4KyXlIWzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RJL6nIf0;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6220606A683
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6220606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RJL6nIf0
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so1742047eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244350; x=1795849150; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
        b=RJL6nIf03GN7n3qY88nSn7WW5Mf3qQN63W/cTS6amWHxOQUQ5GEh/1oswxxEPmswVg
         0YUzMoV0VLcLx/BX1kTgc6gQWBmvQeEne8MpZtfU2t65SRNCcBU91zPm4zGzz7L5UjlV
         k/SRc729zA1Tq89STjlwzI6gA6xFDCIoOQ/juCaADMITYholy+k5yuOcjAB7jXVjgcHQ
         3PDGUmFDVR5xBk5Is5IMyv7shypURC3BvDhRCueNSwoo0he+s441zW3zgCB5BzcQv7KB
         agA4a7bos/1/p0lzRHzr/R1FxYUH9Wq4qtY6N93Mjf6iUR9+f1Z89ysCG/6w0NXP7TDS
         kU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244350; x=1795849150;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
        b=iM5HHstClNTR3gkD5C2H9/6+kDmsLHVnquBLiWkSqK9DvXfFj99gXYtt5lhmmrVNSi
         q5xeliOBzqWhqntp0CNf07dcqbydUI1JbxykhVoy1KYmGRbny7R6jNebsIz9Z3K/67Gc
         iBQJq0j4D+m13jmNoCA7oyGibCFfpT1gJ+SaAH0bdQ3mY7alLBRgLb1op6TPr3YJ+H+W
         mdntm5IAJEjYObGBIHSx0tA8Rn1dxtDHz+BnCC3sSP5oS+5PgkrWbasnhCkYPXDn8JHH
         JXts16XAP7tJMx2QUYsL+mJYK9zb0zUZpujdLeai7uu6CSlydTUSsEPKP6L5Zm3QbgJI
         mSzg==
X-Forwarded-Encrypted: i=1; AL+hErHGRZmLHGTiTkBFePj5f2yo6+WMko1PoJRoUYTnDlNPMxZ/rsAkSROVoVsOFVu3i3QSzluA@lists.linux.dev
X-Gm-Message-State: APuU4Z/6c3k5w+MdidWEqvrohWUM+BBH+UiQhPGZ+5DbBDCl9/tE0z39
	VcIA4F88K80QedY2weM5xe9XoMLd5P8nmavhxX/EelxDqyRAIhL6ypJ1azETTXW28p4arsJcCHX
	kp0tDFTTfDA==
X-Received: from dlx1.prod.google.com ([2002:a05:7022:81:b0:1a7:450c:8b47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4502:10b0:1b2:539b:496c
 with SMTP id a92af1059eb24-1b5569050c8mr5961784c88.35.1795244349476; Fri, 20
 Nov 2026 22:59:09 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:59 -0800
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
Message-ID: <20261121065813.4143649-11-irogers@google.com>
Subject: [PATCH v15 10/23] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
index 3975b6c935a0..3d0ed7b0be54 100644
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
2.56.1.750.gf70dc682cf-goog

