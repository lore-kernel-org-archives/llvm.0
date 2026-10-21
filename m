Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622374;
	b=0b5WwA54Zhs8mvKMFFddRdv000se738JumjUZ+/m8jbQhLJNWycPf5yZf1JrItVi4YEm
	 s7USpihLKE0wv1P5rajpj/8JWWgHEMCsBWZWDXRusGWlWOV7oKdbFdtRfeggjKvePySp0
	 9wZ4guPeUfImAdiyu9RCarsfSIR2zt9klW3/8pMg7hFv76whCDHW0V4fO0sqUQQNUToJn
	 f+nm3CF8ZaMuaiU744wWj0G9hKuhbp4cBaG+F9Iw8Rv0XTChR+RLhFtrTOs3HMqHc45Hz
	 joBZBEwsRz6vcENHIeZZHSPtENut+8b8nnQ5od3IZ8qZGLXAlAvd8nkqg/RRR+HA4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
	b=sKCVa2w3asPbJJb8c7GhdCM5lukBlyU8Yq7mOhCldnlQ3YrgIAYuT5iiiukNk77zQhzV
	 C1FBovoTL1rni8YVK9w45NGg36cX0Gg8vf+z1/eob5F5b2jLFXyoGRTYTWkRpCG+kKkbX
	 FGIEZvTv0grWeDgUDgvHrKE0dCht+xNg9Wx8khi5FABRS4JfggCrKkhMDxDyWDZY/55yR
	 By4DMErtiO5RXYZEnECdQmYjK3/TGbTpiFG4saBa+ScieEV3f/NmnHCxUrUPclIvUupAG
	 ryt5ZfbQW8r0btPCt1EzMiWkgcvtRTL3Wa9mhFQQEewiyLKuXEo9FAvF/nba8Jz+HBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ALsNdZWv;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A70606A31E
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ALsNdZWv
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2251986eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622373; x=1793227173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=ALsNdZWvoKtGUFgdj1KllBWVUvIlmKiyqUKWPzxBEGdVdhD4rVAjUVg0qSksfvetoR
         JhPc2QUnDnIAD4VKt3AUPW+ZnAKC3k3yWXDoCRlRSQHBIOnZexKVDuycStvLVyY4m7/f
         LvfNh32ztg1vV+SgItvwOnVU3ClHowuI2Co1q26+r15Ult/UEvqMDPNj9bHYqHPRYeX7
         tVxehX4mL0qAvQfo+qefR2nNXtOQdgDpWcGKctcqDJ4o0EuIzlWOjCjIe1TS2sdrC/S3
         0OOpBaP90bGzLFblRM54JEL/WYTg9pn7RE/CnryOCLKPydH9qdYlZZ8HCzHTB+Sib3Rn
         x6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622373; x=1793227173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=ocRyizqgE69HTrXMIvf5ydNkGHye+kz18Dpe6UjPyGOzQQFrEUQhjYsquxjpP6M2H4
         2Xa9xat+TTPCvCYikYix/Zo6m1n8akmsQTYo2jg69LnR06gD+mV7NRDm+XwBBEf+66XD
         LS3mY1ehzQf5bOaDmHBIfw9VHGtvlk/Zsn9Zgr1veQaUWRAmKsy1tfP61p0o+IQGf8oi
         ZGwBR4AIH3z97wBuckPopaL/81cJpCQXAOvxzs+U620lgRxlDorqw2xvcw8AvaGomoO8
         jOWLjgVhRmmS4UR4X2pjXsC9w/Y0tAegdWumICMlHI0gAkDKyqox8qZqBBQ41O7b1w9x
         FNuA==
X-Forwarded-Encrypted: i=1; AKwUvBwt8ijAJfYFp2ljY3fcHLXexerz4GWFresHUz/BS4maB4JfoTslxnJeLmPLQk0mF5kcxxNL@lists.linux.dev
X-Gm-Message-State: AFq9FYK9JsfZGbA5rRnYShO4MsCnM/IENV8k9muD1qlQGCokX/OZbis1
	SHI3kAeSP6jk9jRqv5SYb5/HhXJvOuFnKyGWHjjZ9djffmh3KYm9dYptXArebaEp4yu3v2mg+1e
	Us0WcyYdI0g==
X-Received: from dycak12.prod.google.com ([2002:a05:7301:1c0c:b0:353:82df:8a9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:414b:20b0:367:5e31:ce29
 with SMTP id 5a478bee46e88-3675e31ce6bmr4921809eec.20.1792622372488; Wed, 21
 Oct 2026 15:39:32 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:55 -0700
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
Message-ID: <20261021223905.715051-8-irogers@google.com>
Subject: [PATCH v7 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock, and machine__findnew_vdso() and
__machine__findnew_compat() initialized machine->vdso_info and created
temporary VDSO files without synchronization. Acquire
machine->dsos.lock in write mode across machine->vdso_info
initialization, duplicate checking via __dsos__find(), temporary file
creation, dso__set_long_name(), and __dsos__add().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  7 +++++-
 tools/perf/util/dsos.h |  1 +
 tools/perf/util/vdso.c | 52 +++++++++++++++++++++++++++---------------
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..40267d3a725d 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,17 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+{
+	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
+}
+
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short)
 {
 	struct dso *res;
 
 	down_read(&dsos->lock);
-	res = __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, /*write_locked=*/false);
+	res = __dsos__find(dsos, name, cmp_short, /*write_locked=*/false);
 	up_read(&dsos->lock);
 	return res;
 }
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index a26774950866..857a79fd8805 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,7 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..93828e660672 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -131,8 +131,13 @@ static struct dso *__machine__addnew_vdso(struct machine *machine, const char *s
 
 	dso = dso__new(short_name);
 	if (dso != NULL) {
-		__dsos__add(&machine->dsos, dso);
+		/*
+		 * Set the long name before adding to machine->dsos so that
+		 * __dsos__add() inserts it in sorted order without needing to
+		 * re-take machine->dsos.lock.
+		 */
 		dso__set_long_name(dso, long_name, false);
+		__dsos__add(&machine->dsos, dso);
 	}
 
 	return dso;
@@ -250,15 +255,19 @@ static struct dso *__machine__findnew_compat(struct machine *machine,
 	const char *file_name;
 	struct dso *dso;
 
-	dso = dsos__find(&machine->dsos, vdso_file->dso_name, true);
+	down_write(&machine->dsos.lock);
+	dso = __dsos__find(&machine->dsos, vdso_file->dso_name, true, /*write_locked=*/true);
 	if (dso)
-		return dso;
+		goto out_unlock;
 
 	file_name = vdso__get_compat_file(vdso_file);
 	if (!file_name)
-		return NULL;
+		goto out_unlock;
 
-	return __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+	dso = __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+out_unlock:
+	up_write(&machine->dsos.lock);
+	return dso;
 }
 
 static int __machine__findnew_vdso_compat(struct machine *machine,
@@ -332,33 +341,38 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 {
 	struct vdso_info *vdso_info;
 	struct dso *dso = NULL;
-	char *file;
+	const char *file;
 
+	dso = machine__find_vdso(machine, thread);
+	if (dso)
+		return dso;
+
+	down_write(&machine->dsos.lock);
 	if (!machine->vdso_info)
 		machine->vdso_info = vdso_info__new();
 
 	vdso_info = machine->vdso_info;
-	if (!vdso_info)
+	if (!vdso_info) {
+		up_write(&machine->dsos.lock);
 		return NULL;
-
-	dso = machine__find_vdso(machine, thread);
-	if (dso)
-		return dso;
+	}
 
 #if BITS_PER_LONG == 64
+	up_write(&machine->dsos.lock);
 	if (__machine__findnew_vdso_compat(machine, thread, vdso_info, &dso))
 		return dso;
+	down_write(&machine->dsos.lock);
 #endif
 
-	dso = dsos__find(&machine->dsos, DSO__NAME_VDSO, true);
-	if (dso)
-		return dso;
-
-	file = get_file(&vdso_info->vdso);
-	if (!file)
-		return NULL;
+	dso = __dsos__find(&machine->dsos, DSO__NAME_VDSO, true, /*write_locked=*/true);
+	if (!dso) {
+		file = get_file(&vdso_info->vdso);
+		if (file)
+			dso = __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	}
+	up_write(&machine->dsos.lock);
 
-	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	return dso;
 }
 
 bool dso__is_vdso(struct dso *dso)
-- 
2.56.0.218.g1ec904b173-goog

