Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244343;
	b=lBXNKWoWQQfjL0oCa4ttcFTA4pMdFKKeDSq08pXzOE2L4V722dtSkW80A0Nxn/e/5WIj
	 Pdo+z1t5Is8DxgsHbsnnWl8DN1iQNMgaA7/2G+3XgWbWTKEiapJD1/PiqvPMNZWPRwRrh
	 LxVsySKcFiQfIjEsWUov5jTxGjuWVlpuivzLTuqwhdk7FuScjQbhP8ZeauRdvVG7bkMLB
	 8V07kQ6KYhkvPndPqZNm4SIfy2irlFcmPv9SKsj+GOH49G5g0/gxVQH3L2MF6DKtbNbn1
	 DC8Z6llolI1rNcWjlYwSQT9B7u+Wf5Go2YwLW2w5ZFt8m8aAIhmrGu7MzOF79aVMUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ceOCiUal3x2CUb6+gSFDn+xj67LposR+qOo8ZKtSNko=;
	b=oOxoijgp/W/3QVvcGgJbUWvq/OD/3EHl2dnbYDO5JAt9dQwt8x9iBjN1je9ZG+G5AcDv
	 oPqPvWGUq79jtd9ZSN3Mrx03d829It2QDj9pXKHgg7fReUOjC2hUWm1tXoff4GGTZpYYU
	 hrTm4jYp5fh1Zsu+DSeBLggHiwhXyDnisnarWKE+CUj5XXgbSafKcqOF0cG0pilvdkYGp
	 UbnspDWtSb95tYMOXRQkl/0U28Q0yPxrjm7Ph/z3EDAScTil3et3Ne2yq+eBMex2jfY2c
	 wsOAsNY64AFZnmg5gc8xkuSGXY+d3QmdcycEdcYpMtI+a+ySUBFFKwD7A0Q6d4o/U/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=emiXz2Ok;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F4606A338
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720F4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=emiXz2Ok
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2640808eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244343; x=1795849143; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceOCiUal3x2CUb6+gSFDn+xj67LposR+qOo8ZKtSNko=;
        b=emiXz2Okft0EYfrA8l1cVrwFV4QzLUyoDOxo/6VkzNj2ESbUyEFUESnN/PKeVTZO78
         fe+eZfytSOnrzx7bkGc/wLzGzsJwkwt4FqkU1m6OEvnJIVlCSXMTXJMvHzqE6L9Hp8Qg
         akgztR1Q2hZZdodw4Ju6AniQcxlsImoTvRej+JbVv2w/DRPG6YrwJVsP0pd8151dpmnM
         VYexaGPrO7QhhwELNhPcGCLeFA95h6va3/EPfhopv7MtQv3jSuCbcX9/5FnVBUreiGTM
         VW8JFShP7vZGQZQJfFAZ0My1ELZeyJ0hh9QDawyW3be4TeeEPCAL4fdbV1N50Lcxoe38
         s0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244343; x=1795849143;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceOCiUal3x2CUb6+gSFDn+xj67LposR+qOo8ZKtSNko=;
        b=EOrS5RK85Tkh+mXbB+drffy8Xb5TAZptAruu53fFsezToYFODrEBofYmsXDvfQulSz
         J9dazU2qU1usCW4pJQ5xaMhn28LgYW0mOjzz09Gei/se3d+XljMfCaG9WG237eGBiIB9
         L3W1sS2jTKdIFPfxTvYLtaAWvEA8Qdjmv70DaY3FhInaUx9B5ABYVk4YWep32Af5RBd9
         2W2ZImqeu86tAdprhz6z7ahvg1Wb+2MGxoYPCBnnFOQRkoOLibtOiqw6M6lCEiRqBPEW
         C/gJOgPynL5tZcT5t6rMbVX5m5ENWbNXml3Qi/Jdy/UQwWGdf2vYr+VPOimCbUR+0tqW
         iTaQ==
X-Forwarded-Encrypted: i=1; AL+hErFk976l0mVDz8GrDQz4W9L8CNS1AFpYL0XYbSk8Y9Nt/uiWp7VzyqMTkheLtLUwKXGSO3aD@lists.linux.dev
X-Gm-Message-State: APuU4Z8rOUXkA/UYvVSZt8NdfInBL8IVz1m6YL9a1kDQxWZ1sCaso4QT
	LgHQjuL6PhEhbbVn92eEQ6yXYywQl48DPD9VOi/8sMHcMLj8//aTGDY6mNDsfPqYEHlkHRlHzPn
	KofImlYAw7w==
X-Received: from dyjz27.prod.google.com ([2002:a05:7300:b1b:b0:381:fb4c:34e1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8641:20b0:383:50b7:1d78
 with SMTP id 5a478bee46e88-38571223ee7mr5801142eec.40.1795244342218; Fri, 20
 Nov 2026 22:59:02 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:56 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-8-irogers@google.com>
Subject: [PATCH v15 07/23] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock, and machine__findnew_vdso() and
__machine__findnew_compat() initialized machine->vdso_info and created
temporary VDSO files without synchronization. Acquire
machine->dsos.lock in write mode across machine->vdso_info
initialization, duplicate checking via __dsos__find(), temporary file
creation, dso__set_long_name(), and __dsos__add().

Fixes: f649ed80f3ca ("perf dsos: Tidy reference counting and locking")
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
index 7f2dde70f3e4..8bf81e2c9e78 100644
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
 
 bool dso__is_vdso(const struct dso *dso)
-- 
2.56.1.750.gf70dc682cf-goog

