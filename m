Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855B58E2B6
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171906; cv=none; b=Wc29JnN+fK3qzoo3YIgxr2GKhdwxM640cDX1Lm6ROt37+RF+rkqtpP2BBc0J0sqtR4jtGr6SCGPaOwJT2BnBdroXZk/3IfEBA0eRsEPNizHNPhT7hydQrJXmHh/97n2mJKjwuGkhSgMKXrIvRZYDEnRi9eIW140I9jUidWzEKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171906; c=relaxed/simple;
	bh=uHzjpn2rehiqi0o3nqXWkTbin9jDsPX5sWThpgvpbwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XwLBjbsAjFNQrXHYrLuc9sjnSgXOdEbv/bzMkgzmKNwRZKi36KcmjHbo72wBsdlG+wG9v7zDZdjW6ScPV3a+svNmMPQ/c+Gy2m83b9raynuxSfQywE8iJjVplC7dxdM9LW9J0ujj6+LtWu27ptHwS4+trZGJ33jgWCIc1Z0mgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGpJHXIi; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGpJHXIi"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so130208c88.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171904; x=1792776704; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=lGpJHXIiYdk4bM5QBMA3xISucirTDAjnPkGL0njyJwscJq/OSE09xQfvVw9rYFeGW9
         zoEqVLAUf5b+VUDLpLN07smIjsKjrgqbZ9r1OhEKmbZciQB2B0HiNonmNsiAj8IYUC5G
         tfwvdP0JGwBVgdhTE1STTxvFCfUE8fM/6ogGl/9nfG4cG8PXCSajJ7plds+xUL1L4DHj
         bvxaNi03Csnoop3Zslxx4Edp5GSOkgold7VPNrEHcgLrImK7BRmWdJ/eq9JO5NIIzYKc
         8KEhTRd3U2cebCudENABGfwDYykDcvB26KGCX6/uX/vhG18aA5tPoCoMCjqOsKKkB1z2
         uFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171904; x=1792776704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=S9bm0X/wka7erSuwYVtAAfk82wfvMoiyA1/w5mw8byc1PBKmhjh0bFpxIRr10kRKjC
         0osCXbnP/uuf2wK+9Ylvj6p0W6fCgfGWg5QOizqq835qig2e5aTlUNGujmcIMa9s0eeJ
         74ptkpPc1ruMk/il9OHGG+7b0cAW8r5LLS0xUFwlDu4ZoFVaK4pmNo89PjpLpmCn9xpx
         oQNKywgxh1TwZd8HUf3Qjp9xTdS2ThL2qXf7426dODN/Hi0HXA1h911xhf9nsEGj981b
         49GKlqIQcOEwwS8ugMUQF2L8DF7a4I5UiRk9cqA2aOSNbFmCEDz6KNFl79DPratjfV+t
         ea+g==
X-Forwarded-Encrypted: i=1; AKwUvBw614Mfnh0+2zZG3IfHCZHCttccKj3WsPjcNRZjMNbh2OyQZ7hepFOJu4p5xfFLmvm6dh+E@lists.linux.dev
X-Gm-Message-State: AFq9FYJG3WSbdJhzDOEZ1OfaKjM0kQRcNYkUq62ApOny2kUcnI7ZjOdD
	gLc88WFEkzR5RJO8SZ9estvrXn9WAeBga4sBuCGiUFYgC+AnEBNM3vRcsxkjOjjWHc6QTNUb4uA
	akfiMV00Beg==
X-Received: from dlbbz25.prod.google.com ([2002:a05:7022:2399:b0:168:6cd7:1061])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f51b:b0:16a:1fa:58cb
 with SMTP id a92af1059eb24-1850c40d8eamr628355c88.1.1792171903575; Fri, 16
 Oct 2026 10:31:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:59 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-11-irogers@google.com>
Subject: [PATCH v3 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
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

