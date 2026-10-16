Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4C47FB19
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189120; cv=none; b=J+wxDQkitifjUh6/f5fESk9oy2BLDuFC+nlntAD628pgbiORSIboJGNPALb5sz+RqebHDvHj38vbWLYifNzXjOU8qSxhyc3fBEX7OWwmo7P+cRb9YHok9u/ZM3cTOVZyddWVT6YFZJ411GQzIImzmS374sZSH93+BMu13ISNQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189120; c=relaxed/simple;
	bh=uHzjpn2rehiqi0o3nqXWkTbin9jDsPX5sWThpgvpbwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PAZpIUWHZe7EeE2m6FsESZTOIaUoLxba3nw8+ZJIoX3FMKhG3tFdpGdyCv+EvfbtTAffk+jHxlyrDLhnvX+ZRZlNky1G1H8gY1D1PAzJRtbKqtddYXIiURMZrchOK/6gi4qbPWRd5bjJQ5+/l0+ZrHK4n2x54giTkzlG6UGYEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSZISFWu; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSZISFWu"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1719303eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189117; x=1792793917; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=MSZISFWu3n02HxEO4BDcwfBdjTdkEv0R2HYrPJVvVpL90X2BJWMO7iWzLoclUp4qGE
         gZmNQxEd9OIB+JLZvIgPCRamBKyWIMUz0k/QzlwLC7IVKW+B1LmdnV8BX305BxEV3JCM
         BkmwFRMJukpikLXAUj5Mp6wRasBvS3m7y7bYrufG7DfMUFxDFHWtXKtay0LBG//OLDQf
         FbSgANIP00FYwKyV3BM2BTuGI4W8tQnSk6jBtwIZqaLy3KcpU3XLKl7Zq5GGYrVxAUeU
         Bur72cYLVqoJ01WWjqfDxsmAcfTIGMmH5mAgzhJB4Srp+EWL9YeNXS0Pl9UmMs7IJ/d3
         Mn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189117; x=1792793917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=LU6iUYhiVmp5gWF23Y0/pNsZb2YSN2tFF7akHaGoGQ7Bx+vyV5mvINpkrnys2ULAlQ
         ayB6K0ixELePY3Tw0jSp4+4JSQyLHU7dFzjB7Ko/ojml8Xu1UK7PzJCj/w0Mts+CXMhx
         jiJDmbZftg9psQURydvp36TGoG0GB845jVLoYEZPh0bAOYYGWaKoJGo/jeAt4vjrGGmm
         Yz0/FJmM0JcLkmWJoe4FuhDjR0RBE03w4v5NMHtn2/mi3KfzPKR3a/XJ6QKr55jk1f03
         X74iLebsr3kM9y0eNEWS/ZzRsO1j+VZtLx/PWXY/ebKmv4R5/UZfPixyfRi4LbLwbRyY
         Hhnw==
X-Forwarded-Encrypted: i=1; AKwUvBy32h87Z82yYr0rCH7eT9LlpOkKIvypMqIdDQHsVTpHOaEUjAzpJRBM3/Rab/fXfyRp/LI8@lists.linux.dev
X-Gm-Message-State: AFq9FYLy7ccRZGVLiroB8mGUXUQIsRKMNv+MPwbZ1HryjYIafa+3AUu4
	hJuURD9w3hKrLgQJ2D8fcff34Jdt1OPBzZSOMjOQ+7Otf7+wbhZkpwTg0yjk1IdOtvw7vDcDwiH
	xXTncYB2HMQ==
X-Received: from dldyr6-n2.prod.google.com ([2002:a05:701b:4506:20b0:184:e9aa:8728])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:43a5:b0:152:dd1b:4fa7
 with SMTP id a92af1059eb24-18511eb69acmr1925709c88.19.1792189116570; Fri, 16
 Oct 2026 15:18:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:53 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-11-irogers@google.com>
Subject: [PATCH v4 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
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

