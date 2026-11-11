Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418961;
	b=q36tAoAB5esXExwAPzv7bvNktJS7+ASKafy4C9dlU/riv6BaK2Eo5KAIb/oY3obskK2i
	 UtbPOqjk/lFH9qiC8luBJrQp2TTYB0TCAL4ywxgou+sRfdqcbsssumOCWhRckHTk9a/tw
	 ze9VRjYWwisrK8J/QIIJKcUVUf1GbuV5OIMDF4ec2wiyR5+4908lFs+Fy1mJpR9tXhTb2
	 6tNWsrVQrEyMTDZ6qz3CyLybdrh5enu8Xp6zcMesePIPxyBmkuBMvlPHsQ21dbYAVkMzc
	 BIXWJMg8VSsJ3iN6WmeHU0U/pMXSNPWJdABCAXzDoCix1whrKb7Riij1XdbZUIXfryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
	b=ckuNZ1YTjUb5MB+AdVuROe5R98PgyQSpBvpwpuhf6C7ILeER3xOcSE/paF0eo1Yz//II
	 Vhv2t0VRbteRorqVyYn8B+RyouCFhD47CoBRLUSw+n5siUfY64BLALoXm4bPeNvQyZycU
	 0a31PkVuB8CCmZAQ9wvJS4Pp5yuuXrH35GLc08XIuxoZ4Vxqj9KsrgzyVRFtiZGD1UJMl
	 lHVnx7A99RNznsV4olmdPLVefsDUwCpuHdM2t3aXlB4e+ed67IWUlwua6sGwS1ThztJ3L
	 ecO6K9hGH61mTSeiZ1xcYMMXc/t2tV+A3nNuWQzExVpu+hFFQ4bNiKhVp8+hAsdv5WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NBHTreXA;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394F60A381C
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3394F60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NBHTreXA
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37158b53d06so41500eec.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418960; x=1795023760; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
        b=NBHTreXA+tv6eK25cXTUaNjOgOzrmtqx72KOidEj5oZHFdf9CF8BoB7UTgNVfQNlCB
         eNwge2Hlgd9LIR9K+75WQBplI8lG9YaEXrNRnMdMXQ+/Lffd+4cFzRxeTYRSbQsNbCVp
         OQaHblaXsuAlne4gvPCpGss1Ixl8r9tcJGkUKSjeEmPv8xuPCt66xuIJlec7n8wn1r9Z
         odAk0Sv6mAqGl6q1Sr6zPDLoe65/WHGhHRwqiJ4LBfVYyGptYSpn1IeIHuZ0/J8wuCgs
         ZpRNKcc8OvfbYzmvxicc1q3RgK+dEAKsPYodPdLzzyZa7C2UhKwQuQPNyRzQvmfK0vEx
         G6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418960; x=1795023760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
        b=2S00SrQVA06G44rKITtVcQaMiuWk53L8H+8idekpWZ3+OJ9k24Iy52x3S1dVBFQTjc
         GhFvbl569EiSCILtvi3gY4pIRTzab9LkRFZsoHxUAL8nTqZSdmnn454A2AGhDBBxf4ul
         JJ5kFoyzjES5qswJ6/DvESJzy7+gVXIVOJjLcYtVpRntnE+0Q4Ss93jZ5IQa59lYQmZt
         wa9jzO4+Q8nrDS4WMSLuBz53kOrBQSSPJmNwYz74E+HZGMVNZK4cf0tLhatipNRoTIIY
         dUbJmswqvxxa4G/emZ2lk4Vvf85qCc6EmHtFaAhC08NAgwwFA8XsSLWZl+6kFT6erI9a
         d3Ag==
X-Forwarded-Encrypted: i=1; AL+hErFK78QmEEj5AcUHXKJZJNNMYXsWrBSw07Bl6bStZWoz9v1PLQwIHOoM55CVVpuc9+PNI27e@lists.linux.dev
X-Gm-Message-State: APuU4Z9fxPwEWpjB6WCfJ1nd4PNPQwFdYffZElOLMa/JJf0/4ktj/yt7
	y9wnOV9+BMMOeodLXqk8BnJ6YyjcohhlWiGqZbX3rAP6NSW13HH7UiRV08P9Te5Vs5DMAt6Tnig
	tPSB636RnZQ==
X-Received: from dlbtu7.prod.google.com ([2002:a05:7022:3c07:b0:184:b43a:63ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1701:b0:1b2:6b17:28e6
 with SMTP id a92af1059eb24-1b4f5e83172mr125327c88.9.1794418959955; Wed, 11
 Nov 2026 09:42:39 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:02 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-11-irogers@google.com>
Subject: [PATCH v12 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
2.56.0.542.g3ef89b7020-goog

