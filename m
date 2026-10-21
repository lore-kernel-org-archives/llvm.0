Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602714;
	b=oK49uR4K7kSHvyZwDgTQ0KalDSxI02NJHFpVfeMXbQzECuTtlDLIEuWnp/1JaLKnAHss
	 gfKOwzthP1SUjyGB5DAtXcINLk4YpFH9H15BCHtPtRyuPpocplrKGKNnOkI2vG7stwYgr
	 I7xiYp4WNpifYOuvuqMFHy4x/ts3vBuXdlHuFpUchhnK5j6t5fIQhHeWDzfh3i83Kz9xn
	 IczFbudDF+fmU+/oOXVD21TEWiTMcoYeAGgdKG1SUnq7PwNgG3LIo5SK04jeCM6aXp1hG
	 AagoofJ57UymE4EEVWNUgITGehyfLTpuhzRRUdbRC/auGzeU9zYFQQ/5luRsTrsBmRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
	b=YBuXsfefibqRTPmWrhRcsosF2PshNLeSkxwqi1l2qr+0jktiRl6fH6jTHEHV2gjj6Kgu
	 YiGFboNPP3P2oZ1SBn+J5xRP+pvpMrXbIJZe4Z7qo589z+c2U6CwWXbEmC+PC7TrvQ2o4
	 lwFC/lsRjEdQBGFlZeTDhYX20FEMjYRkTz71KNLrW8vGt9dNY9O+ry+ULGMq/KT7Df8lA
	 S2YDO9G0M0qSNUqKoqMuTBRzgQWjfEbeTwFCW99mC8Q0a//7NHwr8RyCLtAPYgPJIw7xJ
	 vv0QrYp95EPT0zZNkANciMjPT9Z9hFBRBIuNxxzvvltyVeNc9nvnWpJfCL8yaNha4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMAgRA0p;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45478606A33C
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45478606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMAgRA0p
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2221700eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602713; x=1793207513; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=fMAgRA0pYgXfUzJCses5pAzWIRFBQpjz/YGkwTMLnQr2ZTr2UTPpEeQI8phufpChq9
         bLhHmnivp84psLhnJyNW3UNYpTDh2kMXdJRHZIezk60f+a0ZBSwWunQcKdUri5iBsrhK
         6K9QwJ7NiJ2GNiWox6GVhl0v4DJMyP1/V39VnPHn4/gfE33y1CQoF7GK+ky2J2Cgb8qe
         9zXLI79uqx16Ny3S6EDdiRfC2WYVeZxehj5jn/tUnYSpAHfZvNtGLQeFK9vGTX609FOM
         TWWonMlG+Yz1Oe9jtKt10JDBp/1Dt1Ay8nfTRmrSsSun5aG9wOGNWs/BdGiyixxoGGWO
         U4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602713; x=1793207513;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=EoptH6E52UNYspPdRtA7ePytCVEGYkiBZiIMkNDLI5FiPIdxEGEfzmmkicxI2DIoEz
         u9J0MCq3DfPLsvm7d5fZ2UkKJOIKlz8Rr4T0p12sC5ikb/yafidhccKjGhb1U8Ta7eJH
         whfwti4zrS3+0d/kWD1/qjOmvmNPoxaiBoUtCGK1y3oxBXmps8dLrX5KKuBzc4EVIW4z
         A4wxG/xgDg/I/wf4gWqA0lsNBSekH31LogRR58sOXHcq4wh1MU4XzDf+yNuH/HDt0koQ
         0mYs3v/6AsAboC2W5rUCcg4+TBxQHgwwSDN9wghV88h6DUykRHYbJB1yo3nT6Bnl/gil
         lM2g==
X-Forwarded-Encrypted: i=1; AKwUvBxHe6p6IwGBsbzJbNpkpXlloiSqJAmp5utff+wyEJqk7wm22mIjL1vCbsTMWmkKCTGWVmDv@lists.linux.dev
X-Gm-Message-State: AFq9FYKHz1VNHiu99SHOb/lQTBa4NvfN8jmN7gen57ufhI4kJJJCrs/Y
	QZX0RfGHDyq+YScQgLZXDUYKFXf4BWIbeOFoesm9o++C4KbLRyxsTFhucZ/IMqyfDJXMCGvASWY
	zOF1M3zmGkg==
X-Received: from dlbts17-n2.prod.google.com ([2002:a05:7022:b051:20b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:32b:b0:151:f0c5:7a09
 with SMTP id a92af1059eb24-190a7c215f6mr4036164c88.43.1792602711852; Wed, 21
 Oct 2026 10:11:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:36 -0700
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
Message-ID: <20261021171044.155240-11-irogers@google.com>
Subject: [PATCH v6 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In dsos__findnew_id(), try finding the DSO under the read lock first and
only acquire the write lock when a new DSO must be inserted or an
existing DSO needs its ID updated (checked via dso__needs_improve_id()).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 16 +++++++++++++++-
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index f0e02062c09c..4dc518f7cb7d 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id)
+		return false;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) ||
+	       (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id));
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id)
+		return;
 
 	if (id->mmap2_valid && !dso_id->mmap2_valid) {
 		dso_id->maj = id->maj;
@@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 9f026ccb0eb6..394960cd2004 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
 int dso__cmp_id(struct dso *a, struct dso *b);
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated);
 void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated);
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id);
 void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 
 int dso__name_len(const struct dso *dso);
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 40267d3a725d..b5c8086941d5 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -348,6 +348,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
 {
 	struct dso *dso;
+
+	down_read(&dsos->lock);
+	dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/false);
+	if (dso && !dso__needs_improve_id(dso, id)) {
+		up_read(&dsos->lock);
+		return dso;
+	}
+	up_read(&dsos->lock);
+	dso__put(dso);
+
 	down_write(&dsos->lock);
 	dso = __dsos__findnew_id(dsos, name, id);
 	up_write(&dsos->lock);
-- 
2.56.0.218.g1ec904b173-goog

