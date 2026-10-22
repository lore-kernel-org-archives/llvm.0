Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700137;
	b=oDIeRcFfKn8hkD4+eziQGkRyD1fPbuDY3/skqCdAn8ip+vnXyMNZOCvQOB8lHW0IVegf
	 qzEDxrQBD/R+33LwPsy5ih5iwwsKYRUW0pDUJz+l2qJ1ma6b/k5l1U9QripuMcozpUJdo
	 gMM7UsR2pBuXll5v+2mAy1Oyrys3mGik+GBjejpFrAD2wm7XDiUk+HrSzUJYK7gcAtcfi
	 DM+4+Gcn0ZQTXdkAVtt7NlMWtO3SRJZfu4sm4an+XR/bi0Rt4CsQH2kUpZCYAvPodYXVu
	 3pwsNdljDkLiiznGgozvi144UGmXBuepDEVuHNpF+oUPM53tXaLw0UrWEZv2bftYFjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rC4lnjftw6rIxuKKEP8wYqbMgtFehbcRX6Ia8qs7pZI=;
	b=hx6wW1xU42G8v9XZSu0H6DQMbdVLLnTFGSuiXaJksFT2xUhzMEP76dBlkLX/zTrlyMss
	 kjCh68pY8KiXS4PWBGSSirYhz5OTcenZBYa9KFSsUbLojWYB8mGjV43VNaksuePHP4+/b
	 X32S01QSw4MiHHE/HBCl5sWQH/yLCJswsSVxWCZDEhAToL+U6uOtNXdoU8W1iREYOBiXX
	 nRF0m5o9g47AvBf/hmFWEmVW4Z9GJ6d0XL5TffYtIZ/WhV8FjUBNkRFiHdTkZsj1DdTS2
	 /tsVjo1JIsqUbfaropcJ7Oiryw6ME7I+FT/4UqvKuLMqgXDLS6SMUSNOYxyhwP1FoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vCEMhJAn;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4938560A262F
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4938560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vCEMhJAn
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so172758c88.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700136; x=1793304936; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC4lnjftw6rIxuKKEP8wYqbMgtFehbcRX6Ia8qs7pZI=;
        b=vCEMhJAn78aXGEWoqMNtDDxEuibGnoklkQrceq8h2TootHjWSIBhGr8xdqwqhqQLpF
         VQteLSX1invfO6QuUUeqDD0zeFNeOuDTMCFPlhFNaZfvvN/UPqyaRcx1pP1FDm0Oiug6
         fQwC1uBHLO8WUJeaAbrSfn2/G/rzX0KxTPLsWSj8UR+RKuNm8LPzTS7QD9n2q2M9skRD
         garpZmaOtGNe6gaL+Fywdt4NgJw9q+R4sJycKm0+Ek2yFTlFN/irRclfzSQ5flxlzUuA
         0RT5jmm05egmFoAAGrMeYyR+QD89nK1ZA1ZB+GML1q1JCJWeYr5pSioy3hTil/0qlie6
         nBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700136; x=1793304936;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC4lnjftw6rIxuKKEP8wYqbMgtFehbcRX6Ia8qs7pZI=;
        b=Y7JxS3ix4cTw9hKEQZp7xUW9zg9FH7aJR4JhH/YWj4aaMimek7sckaeWEcSq2cP+rW
         cVAnW2w3OzTWIlJIltbgrhPAE9nsH8EM0wsjjxBA17v/SaLvUMLLhGyK8RtR24d4kIMt
         eS67//o6nXlvrTeIbpB/VZi9GTdSRj3KvD6JRgOS45izVvfDHEwLeiHcR0jw88fCZNV0
         qiEpY/26aKI4lQ5/K/plOL8dxepZDCnCM0LqNA8LHbk7azBIkaGW/iciwYP8TIdLsFeF
         DLWQVo6FcJH5JUAd6uCRyBbgJE7HamWK29WkKs2ZpV0T99FGsPC6STfIbVz/0hJcbhlf
         N/mQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4yBqhUvMBVM2vkqCiB9daaT1DhWjLQq0sOiRE7HoigH3RyJ65A2sBi7R6FEtNUDGX7KI1@lists.linux.dev
X-Gm-Message-State: AFq9FYKNEiqA97/FDpN7lnCgl/JXJGNHhyMZL3OqwWweFcYLH/g0L8l/
	a8s9RoZSjDsi6jetTfAmRoGXdfXyOU4IG2nxne4jp2v3ZzWYdmSNDg1CR2zL63lVjQ0Nl6WlcM/
	hGtljM3y68A==
X-Received: from dled6-n2.prod.google.com ([2002:a05:701b:42c6:20b0:191:8b40:a632])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4511:20b0:18d:5ef2:1644
 with SMTP id a92af1059eb24-19599707360mr525513c88.30.1792700135908; Thu, 22
 Oct 2026 13:15:35 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:45 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-13-irogers@google.com>
Subject: [PATCH v8 12/19] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
index 2df0ce58421e..ff58ac2566cf 100644
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
2.56.0.307.g5fe7bd680c-goog

