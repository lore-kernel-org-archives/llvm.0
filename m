Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941359;
	b=RR2pRX1LFcME9mU2z5oLjnYKElMncnJJrzTlaYrvhXEDOfSS0DeGYdFzAROSGfFRUd0n
	 cfNWPofUtfOyCQBbem+MW+EFGOyJr/vONPcCElLeIfAqiCP+eWTBjwcFVtVmaB0gryaeg
	 F4DtaXju1KzhAF7UPJkc76cv9m9peL5pBzrSov4S05Y6IZuq0b90TlwT7cXT3V+XUEOGF
	 zQ7z6e4wwHxJ/FR3mF5c99y79Wb5fMtB8dbaiVCx0WpO8xkFwYpeOQNXfBgcC5335c7M2
	 RTMLjFECqmd4/J/zAtIx9sOMIHNIXJafqdjjKGtOOf0UIyJqn7wTX7D6LXcovC381qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
	b=Nc17j82w8QylaVvPSuHB9EsocHXeW/PL08GXX5Y1m3lh9Rgr9j57zFeF8DHeEzMyqAjK
	 3Sy5h36kJo0/cD9XwfLWLiHfW4MbxVUTRvIcia1+9Mh2bgICOxId/xUYeghNvQmyyR/KL
	 3FYBxwKCC7x/16t02r/bGji/BYZ91SZqgzfqZPSCT6YLv60es88KyZ1dFE0DjfeskkcPb
	 4O/7v4XpBrtMmPWC4dMn4tVqkX3lENDP0YetO4vJFY8MBa7DfcnpPbYyDm9hThSDXQTgU
	 /sbsDmL3mHjrJVck7BaiZueDNY/6cd6Jx7CnmFGAQpJpmKk899l1ElQDKwJYFqbJsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="J/VAIgT9";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAB6606A334
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAB6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J/VAIgT9
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so238049eec.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941359; x=1795546159; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
        b=J/VAIgT9vK6v5JwrDTLiR39R+nJ2rXCYt0KMNjvJA+HOf7bI+4l5FTw1ReGKZXmynp
         QEW8DCreviZhveU2C3MS5LBcvbIN6Inr00Z3Ap30ZmutrVgS5s7GpmJ9pyGX/DlkMDWI
         ZrJlhvRVUWn45FpmMkJrxw3FbJEiF2VBJmUXQLh4gAHqSp/z6bQbbR0WcmUugRft9C1u
         ehsbMBmfOSyB9OZBFS19IWcmP5YPPri8gAhIYwcwlrnz8FQG4uq0Z59153HeFQnFl5K4
         lwdtNHRHuxlG1rXT7O32mSg2qse0V9cLU9l5A82tKJBIe2RhMXu3sZh2Rvyq8ryvq9iK
         LSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941359; x=1795546159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
        b=qYybDWDOAcyVdQsIPlZ9jz7Fs+CKZqU8YtYZ+gzuRQL4kA5DFQ6WRzl1xG1YwIjN3G
         tZGmDiTafC2XvvjMtNlYJrDIOhgCQbDJQbGuXCNH5YbLv0FdSIOj99p9mkeNc9eWyYeD
         H4s3+pz8VsvyrEKBUXKX9diy70x9xh9WZLLCgxHa/63gcFBBFpNxKdJc/Z0Nn4UEeET/
         d5kFnJP2a2LaQgHVTZtTZsMbhl4ZLN52TFfgxLSIjuzHyPicF9hOCYvB0FMFY8XTUy/P
         VIv/Y0K/anT1wopj3siH80bFJumXEqteo8Ruto/j75YhnKy02vpYDtc1v6xSKJUt+wpV
         CIZg==
X-Forwarded-Encrypted: i=1; AL+hErHN4wqDYYdSU46zuLfbqS5WLWmYzB0A6qBLJ0KlhIYMh07vVCc7rr3B0/hgpKQmjAwyisuh@lists.linux.dev
X-Gm-Message-State: APuU4Z9wssYwcmfFkq5hrF5lG3AILjWU3jYxauQUsSlciN0f/tMcXrlx
	y07Oj+KLyncRQ/jwTwVon+/UEyn8fLC+oag/StQNP+HvqTzpqo6EP2IEH0S935yRaR3zGYpnF/v
	39xyHaPqHbQ==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:455a:10b0:1a9:d04f:1b55
 with SMTP id a92af1059eb24-1b543cebbc1mr403105c88.26.1794941358056; Tue, 17
 Nov 2026 10:49:18 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:28 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-8-irogers@google.com>
Subject: [PATCH v14 07/23] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
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
2.56.1.703.gf848ed807c-goog

