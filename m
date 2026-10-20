Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514236;
	b=BZZp79ZfW+MgdqTg1gUHT3svKpChp9aI6j+X8Bz7eQ2USYBAR3LNZ2la68h7l0OPosds
	 GNMbuLl2r4+15k0AbRrdqzhWpiXwH+PPcDxTbykHy1HcrGs8TeR+W6wRiK7aF5Y9bSG3q
	 hsWlrfgFq4Fl5gOdj2OdnmgpynTCVP/oPeZRjh5W9fe+NCvPu3JvosjoGMHhF8aLslKQq
	 F1M2tl2yuDH8t00knX9hRNRRJ/xDgncSmP9gNX5ZAhE5nUb7wLjSWPrHG4xAqD3b3+8bW
	 LuR+fCBf9ZUDtMUWoNJcpwLvGgdAHxXtd0D5ZPbJPL2Z7fL0d/1j0O1GKfjJQQu0IdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
	b=uMcqSTBbU+/9H/rXK/Eoba3frS4D6HO9ni+UgYkvtba+GW2K2OdpjR/99K0rWW1ngsc9
	 C0KP2o0/YReUz8z9nyt75sqI9n0FL2b04xlCfvK5L84RE0ynQd7B8c7qTsDmW+lfahZJB
	 Vv9jd8DdbAp0sokT1ac+CiABUY27Vkde0y8xy7rtW48wrFlQIEyWlZqk1VS6c3xzRPIok
	 4J6Nvrp+RaX964Bvt1s9cNQW42GR6mTT+B5Y31bWKn95gaw3RduaGzweHp8AdUp4i4rf5
	 Hmo6XssUNuIHir0/xDB3b8ILPzqzmg6AAfgoUfz7JZm3M4FEqRvLbx0y8VQnwttyfHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OG2iJaLw;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0260A3816
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E0260A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OG2iJaLw
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so6365203eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514235; x=1793119035; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=OG2iJaLwVerVCDSfozE/y66HASScQ7GlQeUJkblO0AxMRbVWqtnGRZCfjxo16Or3em
         z4Vwie+yZiO9nT4zvCaoDn/JY+ExAnMsEPsYGB9F30+VGXr/2n1pm5Uf4y4Z+dsnSk2A
         nG5ZSmAmzqliwvgRLC3uMgTurEIibnw09tcdCSiWZCnMbSuXAuVp459ddgzoTzDT+LJA
         2xSbUpC0q5HV9C3O52JXgb+q0w7/nUlG90dNYgxiTjN3/9O/9FI/L4rS1KPj8JuSdUjP
         bBLP1dcWm0dyC9cJ2draQrLF2wb5OGVlojIbpKVnxhNjazOd09fvEgvQ/Tsk3rJa3N3b
         yuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514235; x=1793119035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=t0Wa/zjOt62sGF7ZHUgTD1aAdnfskYkua8y9J0wpCGAjnJJcrZxnSNgcJk/+uhV0PB
         T3NEVUIAwtenZjU/sdudgtSF1vcVZHMOZ8Is/kkiqoOLa6AIbzG0/feSey9vN5aU8M4P
         hKxl1hmvGhBj2ubCD/KUA3OFVgF9cosSaQiIAB7B7jBqCmIzNVdv22GSxKgYQp62HnXd
         +umLGxFQ5ct5ooJMjU0M5r1pTIh1fQQYL0sHX/AC/PsBAUKtUhDpMEuKekBDP3Zl4Bgz
         wwnpHrL9JnTG/TPySHc24RVUlLsneNW7kDuWTEeW8Eh8Nosxt0eG63EZgs4UhoXy9wSy
         5lIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhPIPPKKQlFf+l8guF12BOOyHfA3AKIKsByH5qlm4Pz92Ih4o0TIMIRBHtD5mfyaSHPuci@lists.linux.dev
X-Gm-Message-State: AFq9FYI6HVg9g+kj8FJPGSUFXMC9KBfVTGJb9BePMvKNzwjDGNQrpdV6
	0AJCdOCjxmcZD8QOHtOPYJWsPbXuiKQeAKFHTzFoL0jGA31SQ8ypOgyaNLk+6qGJJ5sa4BBxT+F
	Q3XFnwCelxQ==
X-Received: from dlai13.prod.google.com ([2002:a05:701b:270d:b0:190:ad1:4d8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4309:b0:168:3243:c91a
 with SMTP id a92af1059eb24-18511eb6891mr17156154c88.13.1792514234420; Tue, 20
 Oct 2026 09:37:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:33 -0700
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
Message-ID: <20261020163640.746159-11-irogers@google.com>
Subject: [PATCH v5 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
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
2.56.0.212.g129ede20d9-goog

