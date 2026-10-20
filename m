Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514228;
	b=uE5/J91XXbAIFb0+CSZ/V/qce16NeWFLqYwIrLmJjBYWxUjhS1jxiXBfxkG2apf7r/Mw
	 ci2qHxZP79g54E3RgagN8gqaVSmY6ira9V98u9w0B2X8ZjuTevkw4s0Mh4XxUcy1kCIV7
	 dH9RMELcT2zNNSPSyuO3qvHT2FNhbVdc/cJSE4Byjl2guh8qfkj09QzIoE61IicOprBuU
	 ng62ooP1XeVR92EDgdG/3Q6RxA14Eb+FlxG5A/uOBulzkiMnjTugVqps4lrRMaunIvKFj
	 qB1j4aqLlcGFn3f0TVntO4WplE+swfma/Ne+TLJE9X+4xknFfn88pv2aVs+0CCajKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
	b=v1nXbBHZ2nC822FyruAN2ZKYRu4HRVcJoifc35h3XxoH37oWjbzGonL3wjQ9sFC0YnsI
	 xzFL3z/U590nLeKmWKvIrWcoohKD7/yZxZ75i0n+9QrS+d7wfprVOMF3ar3O5aDOTMiij
	 v5AfwYt6+ROyVRj4GzPR901dx0Ju35Xm6vjwmO3w8N71Ugc4EKuu35B126K32GCNXZFjp
	 0QR3D3cgHcfgaTsodV3FPqi7RYqrIrKo1udLx2/toRFTCCiTRwWd/YOj7m0PjFN5QgA7C
	 cq7utGsO8kGXm/2P9n4rEI7wsXsnTK9+zbKxbbp8/wf9DOSMkZrG8P0OFgajG0bFn6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PrjGKhSn;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDA60A263D
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFDA60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PrjGKhSn
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so12005549eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514227; x=1793119027; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
        b=PrjGKhSnz/jrcZsJIYNEG5dTZKdafJ+qZRCWgsPBeP6RtyCeo6tNtgy3X5jjyZvEwk
         1TQkwG0Y4TdZzQxJIowBBRMmK2/z9IDASU6c+OKCyWH8iZysRnY5Gd3SHNlingoIR1gv
         2D9CX0YP7x4ewFwJ2AYKihvFtwidfcd+q8QbbnLRECQWoEEXUt8ayHjx+4CdV0KmLspt
         sQfFZR25jlckEeLpJfDCMqXFZfyfG9Fii/X1LwcnReX7FHxPay/3/WL+9c15N6zYUjtT
         63+ywL1yfGjomBYx2meHop/8C1qK3B8rsXB6Y2dohgHPr7jTr2c9FvfoHpWnyaD86rQL
         ThPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514227; x=1793119027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
        b=ZPqmD1n98LSg/64Du0SKEgjNv6Z/PV+jLqVdoGLFqX3NHzgmBZ63DnAgccJJUu+NN4
         IZ3jZ8+f6BZFy1J61rG9jVz2012Z1DXQJOtu5MTJ+ytvvo/TaSopmQv+6noDfx+IwHsv
         0Fuybsmx2mb8RvW6hPGpUJU+TZNJyRxD299aIJE9fjzQy/O/Lg4X6rmo2hrD7a/7QL+Q
         IVeIIfOGo+nEwxk8FyS4Ku1spTim0u8LbubWH4/Oeup82A/6Zp5saJGk0FhYy3Y7qPJn
         kWGHqfsVtpRfaDYXlPUq/2sWSbKibLGnFpRaKGuAHr3AVq7V2ckC+Iuy6bJv5tqm1M2x
         n6RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYu4x1PKAw0xcPmuVDeaTs3yTXhSZi3v/X8pNTyy2jxJYQ+dl70z7KLSn/rekxt/q9bcWU@lists.linux.dev
X-Gm-Message-State: AFq9FYJfq3zD0SP1lMoKR/SbL/rKYNroqSXQa4KxK67nYTSm39xuQT/t
	Gog4FcjOD/9rbiDbBTxpTS74srtP6Ko+XMGMcdEzbk/pQhBKXuKkSQGMj3o/D/5bZjQMRTUBLaB
	7FZYwHYkEcA==
X-Received: from dlah17.prod.google.com ([2002:a05:701b:2611:b0:14f:4204:735e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea44:b0:181:83c:5df8
 with SMTP id a92af1059eb24-1851238b3e7mr15524858c88.11.1792514226408; Tue, 20
 Oct 2026 09:37:06 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:30 -0700
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
Message-ID: <20261020163640.746159-8-irogers@google.com>
Subject: [PATCH v5 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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
2.56.0.212.g129ede20d9-goog

