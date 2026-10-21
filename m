Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622383;
	b=FEZr0OP5fvGRg0p0HfecvAz45TBXx1WJVYGooQtfmT/FzLd1C/sDsQbUtGI9YAZVLSdH
	 rF26rH4d5g4FujdMYElniKIRO2OBu3JXNKNd2gro4P5yRgQ4JjFCndPvhB3ETTLg9kaSA
	 MM/wWOhYlUla+NHZUBo09Oor1li9y6hI8YPgMaP24PbkiHvrYXznOn/AuevnfcJaazjWn
	 W2UcTQC8sDRUp9V4Gp6ghWN1n3KqRK9YgJplAbryE+asr5sgOqoRGRdz6bDgdoWbOQOtB
	 R/ynhbagyIRj59DQMFd3hEhC3XSbWL8b4aVnCs6dcOliCSAjkw2dnzkKBOCWISUlSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
	b=zFhZQyASFuuBW0CwyKor9EfrWkSYUw6M6YqbluxJSU0Zwmv5DnJAz7guUxkapKTx9xvL
	 7eU2zJjmd5VptDvgCy9Y7M0n8jr6qNtJJvX70biq6D4PtmxlKkRgiAxaIZdlr3x+6ZTsG
	 za9Gs2b4a3P2fHGZZPd1TQHNkve7623oe6mMl5hhm/vsERpKUtwieTahdiKXW6T1mbxH7
	 IVBSaB+5LdUtqf59MOAwYcUxnVyfRWfBKmgYpRZGHoZsgAaTxd5A6vByCehDbKwqO5KhS
	 RhgTBv0mBz6mlOEGpjaN0J4U1ptZgDCmV897jUSCY5GaqDX0M/2Z3Aq3Q+vcKNWBe1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O5RP0gTS;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78E606A322
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E78E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O5RP0gTS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so2076825eec.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622381; x=1793227181; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=O5RP0gTSl8uE09IYR8/Y0JoKpyH86JO9b9d9Yv44pyjVEBSEa1ro3wPga/SlBwF01Q
         l2hlk/SmVmANovprNMny80GXXq59eKrgbBExuiEEuh/ZHkbvKStZgl4e25SmEdrBtugV
         XDKRq6xCahuJk7yFJKRgzFe3uVAbeKg/44TDus7zzTP+TJ/WrppXIF2NsYm3daw5ZGzp
         gKPheve1ntLPbPmY8ZU0nRZ0t8387nnD21UVY4xFPoIE6i6Tfb1qNp0zfIk2QJR3Tbfz
         oIDChOxFgH6uO7kzHS7SMbGZoKbK450C075lm1CYripr3g1KZ77tSQedna4Dq3FXEUtH
         tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622381; x=1793227181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=GKDlObdGRJPj1yPxC/s1l4ozMi97K58hS1xewd/JJRKZbfl44udqJyikey0vA+Fn1K
         6u25KP/s86FudF6JLAg9QEI4aw+KM1GMYQUBuK4dAALaVwEZIt3pAK7TkHA3k6yGel96
         uVFFQWkHtdKoX0niWuAHlyfqIrHdIRgo0fQSymKjyROcJW813gSz5bV3ncULD9ywKa8U
         smy2nNtH65sDMYuU957OJIqEwC6xeu/JkXSGXU3CKh4URE4YVo5gNSJkA2BQfHXP9GGE
         FWUZwDL+aWXL5zdgP7xNxhJf+uwUSktkxYknkBzaxGOLSp6tTrWWEm/ciqzqJ9sqY3og
         gWoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUfOOIWiUIpI8a572WJe4cB1Q6ldbOjG8L95RcQ1GBLAG1u/5v6y5H/sgunDj/VAiHTU2P@lists.linux.dev
X-Gm-Message-State: AFq9FYLTkesi9XmfpIpqK6JJcY1+0ijs8t0gKTqk151ru5geNNzzTT7Z
	3g0WL2RLL3/G667cpNDbV4/WypIop+kZj872VvCzTEn3PBVJ+uW/40rvxSKI4KYRBV3r21J9/wS
	3cT7l8a4N6A==
X-Received: from dyuq24.prod.google.com ([2002:a05:693c:66d8:b0:366:847a:68e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:42c3:b0:360:1637:404
 with SMTP id 5a478bee46e88-3674f1164a4mr4452520eec.33.1792622380820; Wed, 21
 Oct 2026 15:39:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:58 -0700
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
Message-ID: <20261021223905.715051-11-irogers@google.com>
Subject: [PATCH v7 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
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

