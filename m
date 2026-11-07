Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026490;
	b=H/CeOzsS+9XSALCigLmbFSMu3ZxUAEHkgCcUKXXK06pzOJwhOVVFFis4qTkIRCAPoQI+
	 sh6qPktjFyBY7ML8geZONnQCkld9ascw8cMynvTUwk9NxOSRt4qrxjyhOqvugB72PRHLg
	 aRQ915wJvoKRmfiA98U3TicOcSSCdBMi7RC58EeGfnq75kT1wCIYViklyqfHoflg5Vn+E
	 VqplzMOW5tQSX9rK3CwrICYGWtfBcb8SKhvlNbg7pdeP/XQVVMtcSLdhqHRI7cjE81XgF
	 GhPu1Gd8TsGFfFLDMWPXsOuM/zbbzbIlyGXJE4mebAPrno6cBIE1tAZW+QoDETnplBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
	b=5EMTBadRaBptKo118Kve+w+m0tpgdsYbsS6FeXCf04fj+yx2ceXAWM9iztrf/njEBmft
	 t9YCqOo3CT+XMTtwFFIM82el5V3G2sEHYXK8urJhsJPdr/mOTbZeRR3SVNadXYPHcK8HQ
	 0O6fxDYqAn0qJIW9WaCSEPGCbdPdREHBeGfV7rn6Gs9EPoAOhA9XgauwNiSzB/2jma9jA
	 aPEgEeOx8lA+nh8Bw61IXFTrCojpyX0FYAvhJLr4pk9bYS2LSUOXSPdoSgNeKFQeRyvfL
	 IIHF5XAn+1fN9anOhQmi+qH6qukpJoS53yvLcWTJ5H5B1q0rFgUxglJAkjtoevOTqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="os/Ao5EK";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C6606A33A
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679C6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=os/Ao5EK
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so2347524eec.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026488; x=1794631288; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=os/Ao5EKZQRNfCPy2alv9RlTPyVOlLWCBPTOtoUkhTdG1uM+LIDTzKF5uPKT4O8/k5
         cPXiH8GW0AxCAsIqurAGJFB90Q031K8ivgQBwOwR1QnBiPftVzR5bIwYbyjtHSdR4p9Y
         2PotvaDrUGoQOcOcH6yD69Qha12isD/nYe9M3Ly5F8F09mnLkH5P80YPYQWJ2pxkI6hO
         9YzSQjDxc3ndcaR94Ckwcn2VN9xEoBRPNS0fOmjclzFmwu3tEox9Qo5K6GdMGQgnmlqR
         JaFfi9/ZnOAVxtcWwO1fc8eYWU8HaIJs7PDgOqymhCDRafMWKRnc32LIlhtt7EbowDMh
         EI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026488; x=1794631288;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=Uokjo0qwC6fAn8Uj4dBsulrDov4BIrAeGFdYcfDIfNa+1uMqRtMDyOAOoxysf49p9S
         iiwE+4Zo6E1ygrjvWkd97Plj1SjX27X44N5W8h2V2sgOOpxkFAYGqSMfB/t2Y1Z2Hl4W
         lYn1BGzjH5Vhrz9Q4/OeUvX5WL78uJzPa/KnZmcgMnLKTSSxlJAj/TLYdBJNPKg1XW9O
         /3DRNR9pD/Tjq9mpAwiieqRX1ltTZ90G4WNTX28CbTmqd4/bziA6LueEY8rb9dQ+QbL8
         FuSzDAvQOatR8ZH7OspxtIdaQDDMx0bHdf/h4MDuHPPSEabUcYVkjzhtNxb2O/XbvjpY
         agMw==
X-Forwarded-Encrypted: i=1; AKwUvBzDodlTJfuqSkbCHaNHQb2bC61Ct5IMGyP1Reo0Gr+urI9xHZEKgfAz0ry0f4mqfDZsAzcJ@lists.linux.dev
X-Gm-Message-State: APuU4Z9FDwex8WCtZ4BD7e9KSHGEXwJ9HTfkxmt/d4kNtMzRlG72wNHs
	ag+9NaoqfLoWscDtnos8x9/8mCIOj1bOY32ElVb837h8nLdAuPnEbmAe2BPfeGptPjkc/OG26Uc
	mq71EZBTAIw==
X-Received: from dleb19-n2.prod.google.com ([2002:a05:701b:4253:20b0:18c:3061:3bca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a86:b0:156:6676:d0e2
 with SMTP id a92af1059eb24-1b25d2fe849mr7410117c88.10.1794026488142; Fri, 06
 Nov 2026 20:41:28 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:51 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-11-irogers@google.com>
Subject: [PATCH v11 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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

