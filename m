Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948657;
	b=H8jSmX/rRp9NGKoY4acJa3h+uNOrIcbnClKy1utUj/5NYrexY8gkLJQnocJCKbU0Rrfo
	 kecvm8QbY7LmfNAwpjrEA7AYRcK8BTocEBus/MG0sgwGZs2I2alr+p2/F5zNv0j/wgh+n
	 fy4yYGWUSUiD1FFNEQA2F9D+TlbqehBYCjuct9BJVQWGiGxcmR9V4sg6WK7sp2D7x8/g2
	 kUwgTAzX1UprTZNTfNowF3H/J7PpC9h+IpWOt5kueIWYkoMb8poRgA/u9MMcFL8+5k4Vi
	 1QQZzVnIDHWgdvqY8BcAL2U18mOQVApsq+TP1+YzpRpn0uJ4i+sGYdHKnhfer9jVNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=iUqizVVvwT1k5Dte+AWvARCrBaBRh/pbVDI0i//Xbf1Mpu9bJCn3F7QDZQaHW2xs8Fa2
	 eNeskqPvujH/gHED3bocHaORDTZWv6NWgUyTWXe6YgSMIhGdPq5IEwFWtsS9YiNim01zB
	 SoP+yYVLkULsw+I2jcfmPjR7JJJMxxwjJSVfvqJXUx1jM63yytXpskUWKGJBsR3pUIuC3
	 yGbs1Rcv7YpsiNStI5mez2n9UTyQlMy7z+WgIYGhXrz+RlOWF+/2soTAKnq7gv3uyRRhw
	 W4/Hd7ckVwM3BczD6lokjaXdoG8vHejTrlkqrNrfbuh767RE0TMI1jXvFdH9AxkAdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YOVMCICk;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE82606D82C
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE82606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YOVMCICk
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so771456eec.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948656; x=1794553456; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=YOVMCICkjKebrZJVB8KecdOgD2KVdN87lncPS5AniH/16zVLSDUiROUXbONAPsgg3L
         Va6RDdY4766wXGVXhMnzqtJrRYaZOz3NyLcE2M9bmgnTTcVGKvYX1aIu6RJG1sOCeKxo
         TL48eXQGSKwRLVrg4XxZYTCdJY8k9urQKC92dwnhUey8T+ouSD8mhkoLM0YbEHpjYqeT
         NkIslmauMUffOJt9vLe956W7E3ZuuuOi7iya9okXHDtilDouFhJWqfWpwp/L3aTef3jM
         PX81Ip3KdMkL4BEMcv+3R4cbaobjMkiGcwupe6HVyxAcNZNzm8fvr9gr18eRp04E/TSH
         nyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948656; x=1794553456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=V84IMdajaDdK2oiZQE6XlZtZyid6dBC1MA6uzr1Wblvdz5GPo9yajmNBhZvl8+OV3a
         j8VFWlnKRAPMqhmlcOXx1UZ0eRPeGPqt6r4wMrOQYQ5oDoelBnjaakog0aCve0ZcVeNu
         E4z7JvlQKHEIFPJ6UBYtmZtYZGLtTzYBtEDIhjfBLEzqfOwRKIXJ7fCQNOzLLyzpRnTe
         4fv+acnkB+8fIeqcHs7/FpQDSCq7jg4/0ajswj+x/JvbRywYxgDphiBGZwu0cejHhMQB
         FCnTTfNXx+u0Weie+Tj/sjyAjI21Kz/HZVBe5khrCC5fAONRqeTNaNSjU0sBNZLY/Yj1
         wR/A==
X-Forwarded-Encrypted: i=1; AKwUvBzjhrLYB5yjRPxK5mP9SQ0mafVWym9tT6GXRjL8dPJeSM4c3ENPjlxKV4J9+272WDVBUwte@lists.linux.dev
X-Gm-Message-State: APuU4Z9Iz6RINC6uC9NAOs8OKhoEp6s2z2p2/rwz7cAWS1Vy5jhTljWp
	GgIiCt2WI4i4T/EwF+i/ogZz9vJ1MsIf0yzZnC/wqHpBvIpYvBSBE1CLFxMI1jg6nhhEg2G8ZDY
	8vOlwtozmXg==
X-Received: from dlbeg11.prod.google.com ([2002:a05:7022:f8b:b0:189:49c0:62ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4292:20b0:15a:4155:3d9d
 with SMTP id a92af1059eb24-1b25d37e36dmr1929835c88.31.1793948655551; Thu, 05
 Nov 2026 23:04:15 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:36 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-13-irogers@google.com>
Subject: [PATCH v10 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
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
2.56.0.455.g6c5a503b38-goog

