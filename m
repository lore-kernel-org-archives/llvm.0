Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825974;
	b=sJ4C6ReUPcbjRMQwF4MPLWqBzCJhwkRYwQrvjVKJ56A4lJG7ojKeCghXv7UgSNn1lawO
	 nwpuqJus3OxZTKlnZyKSeXApaYA5LC/PE80zb2fO1YfMF1WMRw8pNS/KRGzIj0o95NHUD
	 vur5zWCz9xCkU3edU/Z2XkfxcwkNdPj9uJ8RMU1apn6vrQuTOAiCAoIvfSBkv+QLNXESi
	 zRB7PdHNLtI8Z1G3AWlfF4ZV0a+AjoFqs1pmTwsR0MpWjY42jNCfCe+h/scNRNBzIXrWT
	 n2DMu8zpcs1b3xr/5CN9z3qeYyaynPE6O/eprH2FPG/CfhxBRrzX3xCla/cQ92ze1NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XKfZSIPsTc0RF8AF2ugTHpT+Ir+cil0epfxw5x9ZBj8=;
	b=A/rsvDfUmzyFmmOiGkpLzxkaO3IxAZH8dl1yDd4DrY2UI3Ems9lrezoORm5TRle+E4N6
	 qUhLh/P+EFBa6ByQni5ZIveCcXFXUYu31Y2oEJzCxjR8rsKmcZCqkKjqh1Mb3vOndMpXx
	 eb6BTDZLzdbfBr/Aekc6foaPkzQo0vKEJ0kctZKjLGUP25vVJS8kcRevnwjmDSWxaf7/T
	 4GHa7bACOlPmIjvY+AhX2AypwKjt1liuU6tae4NPA1Di7s+rYleEAZUxUTC8ldvgXBfIZ
	 XlO7TKxtpJOLPm8dxNzztxFeDzNCKUBcmG+J3kBJ5TQXHk/BJdC5yZpMfZnJE+uiHJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WZZ0VmvQ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58960609ED43
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58960609ED43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WZZ0VmvQ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2043896eec.1
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825972; x=1794430772; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKfZSIPsTc0RF8AF2ugTHpT+Ir+cil0epfxw5x9ZBj8=;
        b=WZZ0VmvQxB10miEhBCvH5ZZOIfhAsSBY48VTMsDMZ32M5R7yAY8H4m6X4hSD1SRyLT
         ucWip2iyMlz5Krb+kSju460nRL7ZSuR4yd8aSsuH8CsICkgsiaciWkq3ykmPbqJOhNW/
         AufbQv/L9BpPulrGKmowvLvwP0iaetKA43ZAD3jSHfvsT6d55JkleJe5hE+ghYW1nDrn
         1wH0SmSEAHs63PeM4AITB86vrGCxU92F457GGzm4ZeN34n3+JHd61k6wG2T507arTSgF
         tj+4oUFZZHtLU3vBMui6CW1sV8nYNMJJGXcP7aSdlLom4g7Jtkb+RcNdHywLwdQqpR2c
         XUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825972; x=1794430772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKfZSIPsTc0RF8AF2ugTHpT+Ir+cil0epfxw5x9ZBj8=;
        b=aNGP/G5wTQpTox/wAhP9z30l/v1CQtjZ6gccRBKGS9SMR9icXqJDqdWQ+duk5hWCEX
         Aa8UbvB7l9k4SNPrpWmlVkrqA6bn1OCi194ivnuD0EDEBx+wmOG/SudnhtDYJQEow0eg
         Qo03Gbjlo1VOjdct6o9UVZ+OZFwdsxeTIs8ZYIRUsdIVQTpt5xHrV6Zodk2YhDsUbLCT
         bcZbsaZTDdpGFsmqxPH38X+Kwm/DYN83qMDwNYshkI6fj2e9SXT6GiG1JXpxHwVfbU+4
         endudW1AvIEfLS+bHqAX/0HZ+4tZCyRSMnqSvSQoYWPJwl1TXl/nkVnZ7zO8+dm/u6yZ
         QCxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiVmqqCrfb578G5F8QXpPR7pfF4zOdS+Ayh42aOAK+ItAmBFhJVUvPMFYqxdJAhQBGRSRI@lists.linux.dev
X-Gm-Message-State: APuU4Z84qMsvfFGj7kB6BabpgGt3f1sx1x3sRsWNI2UG/66E+Pa9hBf4
	ZIoTr8S5ftOfNfoziac/kKwUtRDy7B0O4BMAza/jFyGAYCtG5YxPjSRBJnY9IScpGKHDjNfRnmN
	Un5/hkPetew==
X-Received: from dyw24.prod.google.com ([2002:a05:7300:8818:b0:369:f3e9:e087])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6381:20b0:36c:d1fe:84ce
 with SMTP id 5a478bee46e88-36cd1fe8f91mr4237742eec.33.1793825972204; Wed, 04
 Nov 2026 12:59:32 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:57 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-8-irogers@google.com>
Subject: [PATCH v9 07/19] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
 tools/perf/util/dsos.c |  8 ++++++-
 tools/perf/util/dsos.h |  2 ++
 tools/perf/util/vdso.c | 52 +++++++++++++++++++++++++++---------------
 3 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..1574c8885d78 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,18 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock)
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
index a26774950866..dbd06f420753 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,8 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock);
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
2.56.0.455.g6c5a503b38-goog

