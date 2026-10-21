Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602695;
	b=ccYYql4Y61XjtDU+bC0aMtt5VAdXoeT7f9RsCS9ZuecDrlCRVUQz5JeWjB4E3+XF066E
	 myQhHpVqRB6qd0C+jI3XC97YmQS/02iw0mc4k5xzn3ipD9CMlZoNAcSTLL4HPOmgnfzN8
	 VYyrfpeHg8bcwYD9e0o2JvsjIK4DRYT+5K1mB0gmwB8XYGPMig5FReY/VDxwaeByTzFZg
	 f4MxbLWmZh7udFhhpakCGxx+N4cJLVo+n2Zt94aNHBE4obKm/8+eg0FhJu3hIKacAy9b0
	 6acbff5Sq763Swj7X7XXrBtRpf3Tmd1WV0CU+OHXuUj080I+AVbAbuR/kltuTUZK5lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
	b=dd51Q+zdjFD0IcpcOO5Wk9Zw8OVPl5Ls3+zy5L2U66gv4OZ4zx3l2+E3C7IQ5/J+8JFu
	 4bkcfSwOM7EMJQ8IqPguzx3vJmKIzRl6yroVE5fz79Htnjyh/cn8+jsyOhTuWzCLae8t3
	 vDwztIxlXZjZtPFv6JanRTp3Krj/tRuFNvVfFjUuvQy/XulIR5qc9PsTcIuaQ3izVnmIy
	 rNoN4aR5c4utYjSMq0SpDpdRGMQ4QJXpB4ahW40GcYGWkKXcaRjWJzPvKdDGFd/5tEyiG
	 Gx6yUVXcEIAQR7SfC2H6K8ppA9EhLaF1qi3WTFmbumn0jZXhz00Srk6nnCUJ2mMka0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=W78cy7kS;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736EB606A32D
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736EB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=W78cy7kS
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so3425988eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602694; x=1793207494; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=W78cy7kS6JOQi9eeOtWibMKJHJZaDPWa/nLeZQIoJfQhVaHFDwXx+H6aP3xeZk8Jdb
         EG13br/MnbXS8Jcwnso5aJViqfrVi0vd5RaQfbV47e/NDgHM+jgT5XjqQ+R9izMRHJ+E
         PhSLnmZcHcgRFEiCJrwDPqpBZiLPY3u8zAcp91OAFlB5SO70jiAMsxh2QEnNUgH6mdAn
         bh64+EW2n+ZY5nLYD6EmCH/dwah981uDxSPxEP6xRSSAJgQ/0GwFg7OnQ/uP+0y44eoG
         el+RezF058veJ1ZkMfxyesQcXw34/EAVxGquHmQ9ooFnmMGb6DwO/dbN1GKZMt2vSrnr
         1OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602694; x=1793207494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=MgckBBeKufNx98eQT4fElNDhxg2DY+z8YnWMudasureK8i+5dOdmlGMhHiJRmsBb9t
         ecd5TTXq+l9Hs2uu/T87EvUOzjrL3kbptt50rK+M72w77Om4TbncdDs9A0mr8n3ZTeng
         +IBfygAk2EQ0ufmo8Ul4x4uh4dmSllYAj5o9BbUEz8HjRZ/FkmYGhPB1lBd/Z1ElOfVh
         7HfIZ9UlGRDr0CuY4J5Q9X3oV+sfh+k+49f8KvvWTVhrJzURercdEVGElnANbPheNyW9
         5zmjXYiSGqTKPF49Y28nBTB2MsFbmpuz+ewQrgzbwIFyZKy//9wiw4GJ4olR+CYlDMTV
         +RXg==
X-Forwarded-Encrypted: i=1; AKwUvBz/thj80jweVidmZkS9Jg3POszv/eB8snK0R3mnGcz2+pZfy4zTnTIhWjEXst1SyNMDqKOT@lists.linux.dev
X-Gm-Message-State: AFq9FYJFLsvAslKwid3hqMWJ9NvXOOCVelw92oU0osepBQAloXe92ZZv
	VdSRpo9xidtF/Gp64V+tbgXUC6dESi4CkrwMPVS5UJS+I3EpFA0diypyIiNc5qo5TxOydsJ0oaC
	pUgVWhXw2hw==
X-Received: from dybms18.prod.google.com ([2002:a05:7300:d512:b0:366:4c35:6e99])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c6:10b0:35d:4185:5395
 with SMTP id 5a478bee46e88-3674de4e772mr4215847eec.16.1792602694116; Wed, 21
 Oct 2026 10:11:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:33 -0700
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
Message-ID: <20261021171044.155240-8-irogers@google.com>
Subject: [PATCH v6 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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

