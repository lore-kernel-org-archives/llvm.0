Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418967;
	b=wmy54A2le8qYGfoKZ260MWpQah4/NBOToLoYoaFY4zrZM+SBf0dnWeyXI7MeEXpGj36V
	 rLzynJvisHUv8SAxKfEqAf2dmk0OZinAVGGabbWwZDJXw9LFW+06jcM6M4TRVPKy8ZBj8
	 x22OmSssSwNOchF67nFWyP5OBga5wSiOje5zsilKs7wZWQrcRfNRAYw7A84cO5bBawHgj
	 5UTkGeRHNEk96uTCkR/ICKZkCco6V9sVkGKt6MLQ9c3Z54RtWHkBqHyfaQvnQ5sCA34HO
	 PnANIjsh4KauB4LrAw8aGQBrPAFge/37jpBlxKE5+i5RB7wwkcq/7LCjImVkNmmj0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
	b=oPm5BikPl78d1d46tFeNGJlRZy2Md2vSAYjQ7RhfP9SDjGmRiabovxSWIVJmIvIg/ZRh
	 heo/xkdTpAt0SfdJxaXo3iJbH/gK8Yl2LqjuH29AnkSfQ5/pwK2hAM+X2gGgV6D/ymr7Y
	 CyUAQgazSQ+RgQo+AQQh8UtqAc2GqU3QqK9Fe4CbO7NvZDJJm/ytaA1KehS4rb5T3PxrR
	 CUleJVgpsO64hXcHT6gDWEp9jpNQf3oUcxbaFpcofYWDNl7lLOx1tJBbJ4uxYzTvWjUAf
	 FVUbW+YwUVBrt7ZvREw2WJtfiNbNyBsuUpJtqOK0sNZxD7gCjnXC2sebmDi9ZVMqERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPnTNJT9;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD8860A3839
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD8860A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPnTNJT9
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5440025c88.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418965; x=1795023765; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
        b=IPnTNJT9mgSRBORfMfLqc/Ezuf6N1Zy/vxAJP3xztBBPfDngHC09yhhJbBm5bJT+vO
         OxvmHbd2Qzzk5W6rV2Hg55Pt1DC65T/42qd4x8B7R4ZemTNio/N5NTDEQ0Quk0z0JYm3
         th7lJN2ulRuvHD8Ubfu3dsjBQ0v7tJtL8tYSA0arH6h4kCJ8nVDO3kbVWAEzFdzcciS/
         CPF6r953AzYDwbuB2XrIkZTx6vvdcOngne8KEFoWM7K95hxK9RXkpu0VKMIl8DZ1OXN1
         oigq4/BgEEeBbBMNmfjRmfY/Tiwzyi6Xb3RGOLvXwSk9qbMkq6bf7DYb/dPf0j0XJLj4
         MyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418965; x=1795023765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
        b=lwi+0VgzNF9zdRWZ4zxn+ZOA+oR6pFxKe/4gRW3TzqAAy79rjT44K8Oh4iCeX0SVHs
         ksoEuuQdyUtVUcpVEyqSiRWBWR1D4KrhdT1UFomOzdKw+gErHaHdxfPi6nwPqUeAs1Rj
         SjhKhTZoAR1+WWmc7zovcVkW0SAYWDrfZmU3aGm4TVUPtGHXIV1efbMnHn8h24jm0Fmn
         Tm2rggwNUwR3wctFJl868AG+J890fcrVHp6Gz5dccGk+40jN5GVO+as6koekuOLtVNTz
         2TGxStJtIE7WNJi88fmkqeaGK5ZW0/4Nq7e2LLvuVcIQHBeEh7/vXtTS/jfsdY6s27zH
         Sxjw==
X-Forwarded-Encrypted: i=1; AL+hErFvWplGFw1R7M/aINYdpHSX03DdM/xDWykYGYYucC7f14nQWEF0wO2p7m29qpkoRSQJndvo@lists.linux.dev
X-Gm-Message-State: APuU4Z8knCp9lvKcXgdfxGgbEZUQQfS0WCREUjB8MroDGJrlH1zhFVS6
	rtmgjM1CRV4wgm56wm0wDmyrW6+oO2kncZxIXyRRLc1nldUqMszhDWpLznK6IvwBD3ydkYOZpQP
	Dx1gSN6EgJg==
X-Received: from dlbrj24.prod.google.com ([2002:a05:7022:f418:b0:19a:9ffd:b30e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ca05:b0:166:5552:780a
 with SMTP id a92af1059eb24-1b3c02f379amr2988632c88.8.1794418964501; Wed, 11
 Nov 2026 09:42:44 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:04 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-13-irogers@google.com>
Subject: [PATCH v12 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index 9e38b3b69e9b..df1748763d95 100644
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
index fbbf98c4ccae..1b3f8b84ed30 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
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
2.56.0.542.g3ef89b7020-goog

