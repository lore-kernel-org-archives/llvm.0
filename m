Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588136;
	b=VjA4IMIMCm4WwBZiJlGrpAiX3K2kEFikfDgKrLd9OLAhJlE/DojdpKXBQEQ92gziKtjD
	 G/L67eEE+MCYBSUiKJogvHj0CgQx6kibQ+mtJnun7xu0V24BX7rrLO3Lm/vH2VvX8n9yd
	 MTyFsjmtvV3oXWb0ITZB9SPwmMuVsElQiCEcbf6Wqz3gsMfhm4fG12gTPIK6c8k4s+XE4
	 N731/H56hmRHdvWN6b7Nr0a6j8qMCobPQrv6YBFu/21184kGbt1+w73IsWprc6pi3a4zd
	 mhY4WpnIe3r3/zqaIJk4gn7TBCLkSJVZufPfd122M8q0jtql4NHYPnhgu71dCvfSY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
	b=ndVIzRSHRSqRIvqNhoMgsjseTCs0z7tU/cOqf2GxEnox6dy5yh2+Nu0jHrTgZiy3rX7G
	 GT7yX4X2xMEQn4zRuaRQnUdI7ZXe8ahYOWvbnwu9X3OokLMFwK4VQDu4GYEFPH5sYK/uO
	 HmVYPDLH9tDGyKg3dcYIeyTTrDAinnw/ICO04caHm0GB5d17za2XOgQ0CQaVyEsGEqWpB
	 jyyJGKGESi4SbLXVVNwywbKKTwztn8634AQfkS2DzBXh3HUFv+WGAg0nXa53pFfLar8rc
	 WPydCV2I4xcOra6yAm+ZsBYuAYIHlEYb/JX0/zCJNw5rf02CkWzU/o0n7lw3KGUvPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dth1+j8f;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D16607CD64
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D16607CD64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dth1+j8f
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1437303eec.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588134; x=1795192934; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
        b=dth1+j8fheSa8OwaSdtjyHMCRy32UvtD2U0uTPHsaWuZf4CW4PYKcOOjGyk//nj4AG
         22qhUhfAW7kY0/Y7ld1Xc4H6r3tXu6swoiLqvlhuUzzGTroMtBWT+5QBkmDClIDR11Xh
         jCa6ruZ71Tv9YBmVVwi47GtXIkdphhm271qsHCjm1zVxDL+lq4U2A7K0F4ZruUkAzpCo
         6lHpWaxbRn9Xm+deR+LQXr4BbDIU5duQ4n8GkpJ+TbwbCXl7Ey2il9s+5ka5KOWGM4Vo
         WBnwSSXyF8vSskCA1mrkCMAFnGMjwf2mPMb+3bNW1Q3gJPw+6fl64vXwUT3CBe1cNP3O
         vm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588134; x=1795192934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
        b=0tlM/i+8ywGwZ/O3QBd7hdTIg56QVlFgnCGnmRMbnOqL1D9l85EVtGeYXzs6u0VxrG
         vJRj/Pi5lzqX7NyTf1HM77S8zMA32ZlqqPoJYJWIxusF8DeaIybmmzcgN3Sp5LNCkDbb
         Gu2yYk+iVyTQsJWI+N7Myi1q2J/39uuVhotrQpQKUvc9jQXLQR5w+9Ok3rJTyKGQWn2w
         1YhFGLrT5CdkOMwmd1uhsm9b56Oeum4XeQk2zNXiOeu2k2qxISU2DWrCpuXopJ69vb04
         Qi7H+W7uPBjU/DbIjfw4RROu4furU9UDMkYYM7aSdRHBd5GXol+MM3fJy/sbrDRy3qRE
         KE9g==
X-Forwarded-Encrypted: i=1; AL+hErGic8Z/UORyZbHz1Vzw7Y2LPlcE3kkQOG33zKh1l2lPCUR6UMGdrOvU9Tg20OCq4QAz5loE@lists.linux.dev
X-Gm-Message-State: APuU4Z+SJ/SV+T8ULKIL4beyWhAkNDxbRgFSfWAncNmSiiCllo3wiigS
	TYkWOW94qp4MqOGiUP2S1ruVI22uDZ+oe1dVzSDz+FDVK3ALqqpbHd33xXZSdb7dTjtITXiIXSB
	Myl5vEHA/XQ==
X-Received: from dycqz10.prod.google.com ([2002:a05:7301:df4a:b0:359:72f9:2aab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b284:b0:35e:2c6:d46c
 with SMTP id 5a478bee46e88-37966e3abf5mr3032399eec.10.1794588134111; Fri, 13
 Nov 2026 08:42:14 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:38 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-8-irogers@google.com>
Subject: [PATCH v13 07/21] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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
2.56.1.703.gf848ed807c-goog

