Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588138;
	b=Kf0FR06MYjyYnmyoEkUbsyf+FYWlSPwykrpmh2XR1mlBnfrVUPOfkPF4B+WwjfTpopNI
	 ATg9kaTZVb6lSXfhsG5rluL8rwMrhaoP3lMGf+It1ggCgH7fWOZq1Ft0bNpE0/j1xowZt
	 DI+zdZcsHi/ZZ/noE9m8mTeSEoU+56ohc48W4DzhU036kmR/mStkZ/dsToKwHfyCnSFM+
	 CHitcxy/r6pYJDFMGhnjXModn8sXvUMvmklzWy9lFMEDfC+Sf609Pj+CqdKIcNmpl2q7Y
	 I08fv5818WhvoiAcsur3D7/JxP6Uxov613F8jkVN8G5BV3aExgGRmksYos5Gl0ZXBwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rDTLPla507EOtrS5G3hSHbXrnwat6DVdvRdqc4cmgbI=;
	b=lsgZdDvajru6qKZVKla1mWrNo0XEyZFjpCaYtrOJ7UjzmrnN0cEcQ56TP+UbAG5xQqDd
	 0Lh96T2+RgaML4OVVPEmcNSFDn3aesQkWp00F3Pbyo0eAPgOQ538/bhEfFbSe5nGYndP4
	 h9CjVmFUkSNu50fnMnWODDnysDrN9VMiYP89gBIR1ilF7kDOz04purfcRALb0+XJQB4UH
	 FgM2Kz4HKh29t7FYzkzqZ+S7BeCf8RLcOpU4sa8Yq1Sg3oRIo9HctjUYwhWs1MRb4Vgq1
	 OD8sVtZe6C4XQ2iaToI+msxIY72cqfJce2GekCc7gE894ut9UQGI9UHjeeZOCy0WpIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i6An/ntX";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACD607CD77
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ACD607CD77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i6An/ntX
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1754211eec.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588137; x=1795192937; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDTLPla507EOtrS5G3hSHbXrnwat6DVdvRdqc4cmgbI=;
        b=i6An/ntXoc5z1KyraaRVWl4tky4N2zOSTYGruZZS2512PegYne252hONC0OlfnxeE3
         8Pcx6PHzkjDn5SzA0xfFp3cTLh8VJcGo2r0e9eZ1HQi0RQ/IoxBV5A+OAqk4UBtyvyMZ
         UEMIKHc9NiqBfF9HxYWI3Cxpb5OClh3F4SCD9Lx+nb1m1KDOGSSTZc0Qu22Oh4Ew3eqZ
         Zgvxc4t2Rm0qh5kL908VPetL9YnZpcELK6Jr5aVk0IRwwCY7qX68c+OarvO9+mrmPWmK
         5jYg/XMTakIVIyzl/ytXA3qwFDLH0r3gUKwJ6+1jQBd6/k796gbrGPJxtMkcP8k8iwZL
         qdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588137; x=1795192937;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDTLPla507EOtrS5G3hSHbXrnwat6DVdvRdqc4cmgbI=;
        b=mlV6+StrQnU+HF12KNrNkQqF+qB1OEjy+r1+t33ANJD3/Vr4MMlxWy+b0dynARFem0
         Q2Dsw4cRKtlxRH+McdToe/de1XHUXtufVbxX/F/fUsgDCqvh3qWYyyW+UiOmA7an+yZd
         xJFMyp4g0HIvEuo07uU6iHmRdDkNaw2G5sVwhjWbUxY+wZebXI+940T+bV+Ns9I2BB21
         WNOk027f2H+bd4F8Yr1M+W3qM5AvwOA2K/4SXfXE/mv5LHIK1QhvmzPGBBgwrI506b1l
         DRS0YP8mPx4/7rT1jHB4VH0vCKcUYR3+fWjOkDzTIng2HyPMiikrs1fcP/xWKLNMtwqW
         pOxA==
X-Forwarded-Encrypted: i=1; AL+hErFgq02Sh2cdlK4TgplgKayFFirSL++kJme85ducXn+kvAyfDcHBza5y4SY2+03qtBF+yFM9@lists.linux.dev
X-Gm-Message-State: APuU4Z92Ro/zbtN5sG/ISBDk+Gq/b7PiGxBs9cfo8i7LN5Hy/Z7nQMiY
	X2df48gbuqzkwCrxqP6zzRoh2GCnXmpGEOykptwpuYzEKzKDHa71qTwgVp00dnu4CK0auHjUxJu
	NKFjCnxe0jw==
X-Received: from dybrw2.prod.google.com ([2002:a05:7301:4e42:b0:37a:8a0f:3aba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:414d:20b0:36c:d1fe:84ce
 with SMTP id 5a478bee46e88-3796740e475mr2991962eec.33.1794588136311; Fri, 13
 Nov 2026 08:42:16 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:39 -0800
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
Message-ID: <20261113164152.2095566-9-irogers@google.com>
Subject: [PATCH v13 08/21] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Factor out dso__is_bpf_prog() from __map__is_bpf_prog() and update
dsos__find_kernel_dso_cb() to skip dso__is_bpf_prog(dso),
DSO_BINARY_TYPE__BPF_IMAGE, and DSO_BINARY_TYPE__OOL so that
dsos__find_kernel_dso() does not match ksymbol DSOs in machine->dsos.
In machine__process_ksymbol_register(), also check
event->ksymbol.ksym_type == PERF_RECORD_KSYMBOL_TYPE_BPF before setting
DSO_BINARY_TYPE__BPF_IMAGE for is_bpf_image() symbols prior to inserting
the DSO.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h     | 16 ++++++++++++++++
 tools/perf/util/dsos.c    |  3 +++
 tools/perf/util/machine.c |  9 ++++-----
 tools/perf/util/map.c     | 14 ++------------
 4 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index f6c60bafcde1..009bd3001ace 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -1022,6 +1022,22 @@ static inline bool dso__is_kallsyms(const struct dso *dso)
 	return is_guest_kallsyms_pid_name(name);
 }
 
+static inline bool dso__is_bpf_prog(const struct dso *dso)
+{
+	const char *name;
+
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO)
+		return true;
+
+	/*
+	 * If PERF_RECORD_BPF_EVENT is not included, the dso will not have
+	 * type of DSO_BINARY_TYPE__BPF_PROG_INFO. In such cases, we can
+	 * guess the type based on name.
+	 */
+	name = dso__short_name(dso);
+	return name && !strncmp(name, "bpf_prog_", sizeof("bpf_prog_") - 1);
+}
+
 static inline enum dso_binary_type dso__dbginfo_type(const struct dso *dso)
 {
 	return RC_CHK_ACCESS(dso)->dbginfo_type;
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 1574c8885d78..a7f6a98acbaf 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -475,6 +475,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso, void *data)
 	 * is_kernel_module() treats it as a kernel cpumode.
 	 */
 	if (!dso__kernel(dso) ||
+	    dso__is_bpf_prog(dso) ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__OOL ||
 	    is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMODE_UNKNOWN))
 		return 0;
 
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 5eb5efa4eb90..afb95b64bec4 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -769,6 +769,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_binary_type(dso, DSO_BINARY_TYPE__OOL);
 			dso__data(dso)->file_size = event->ksymbol.len;
 			dso__set_loaded(dso);
+		} else if (event->ksymbol.ksym_type == PERF_RECORD_KSYMBOL_TYPE_BPF &&
+			   is_bpf_image(event->ksymbol.name)) {
+			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
+			dso__set_long_name(dso, "", false);
 		}
 
 		map__set_start(map, event->ksymbol.addr);
@@ -780,11 +784,6 @@ static int machine__process_ksymbol_register(struct machine *machine,
 		}
 
 		dso__set_loaded(dso);
-
-		if (is_bpf_image(event->ksymbol.name)) {
-			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
-			dso__set_long_name(dso, "", false);
-		}
 	} else {
 		dso = dso__get(map__dso(map));
 	}
diff --git a/tools/perf/util/map.c b/tools/perf/util/map.c
index d5319ffa88a7..5155c95df85d 100644
--- a/tools/perf/util/map.c
+++ b/tools/perf/util/map.c
@@ -248,19 +248,9 @@ bool __map__is_extra_kernel_map(const struct map *map)
 
 bool __map__is_bpf_prog(const struct map *map)
 {
-	const char *name;
-	struct dso *dso = map__dso(map);
-
-	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO)
-		return true;
+	const struct dso *dso = map__dso(map);
 
-	/*
-	 * If PERF_RECORD_BPF_EVENT is not included, the dso will not have
-	 * type of DSO_BINARY_TYPE__BPF_PROG_INFO. In such cases, we can
-	 * guess the type based on name.
-	 */
-	name = dso__short_name(dso);
-	return name && (strstr(name, "bpf_prog_") == name);
+	return dso && dso__is_bpf_prog(dso);
 }
 
 bool __map__is_bpf_image(const struct map *map)
-- 
2.56.1.703.gf848ed807c-goog

