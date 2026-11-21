Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244380;
	b=r3LQUQdYc/ZyQ3iIBdX0XA9wLCNUewWhndSi8EKLcje7XPmSmF1cwcWADS9r+g7L3FUK
	 hDDw6OCLWzpdKlyuuE3bTYhDAvOpWvySfve9M7dv6UKqcxl7ep/iZWTIXW15bIpYYyzn1
	 uBhAAlqPqiATopyZPHX+c6+Qqjtodoc61zsXscb62f1fv1SnEeRxoey37mxQZ7jeGyYS5
	 4ExEHLAa26KBdh5aZuvxjKnRB85zs2Cm2zTqOg91BME5KpxhN2oS9EDZEe5KsEjd3LaAi
	 iY8sDDRVti6x8s8I5XcxgeJfCv+R9tgkcTTGYkUgHDckfkzM67KV1g1oM+Q61k+n/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KOONOUBRea55D4L/MhBbf8K2lc+JFi0aqBhiCgSX6Yw=;
	b=xVUvUJ0Dua0YFuVmfQhxfLd5a/gFZjXF2UcC4AcIGDsqeMnOg/z5By/OK4KDpgVYniqg
	 nu7UNb5cxQ1Ymonx4Y8/vcuRyh2PbvMeZPFMJ4DCO66X7SMMjgCaUwMCyM4XMIF7GoTrW
	 O2fzuGuDYLIi3w3Ol/hGM/yydSAWWKqp1ysAqGaQx7yWdPDeeICFlBRty8VR5UfBIXpHQ
	 hn+JVwJOb1XtQKpLmXdyK+IARu5cmFmySolo/ZVciClnmA6SnS3XcruOmnbjyv2p6+Ruk
	 zDREUsU/Szgt++G7i0zOd6qWcy+GyxBcWH++G+JRUV3Bn7AEVmNKcumu/WjjbsbDEqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q3pe65gp;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C59606A331
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C59606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q3pe65gp
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e6091d8a1so1338452fac.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244379; x=1795849179; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOONOUBRea55D4L/MhBbf8K2lc+JFi0aqBhiCgSX6Yw=;
        b=Q3pe65gpVuDwsURCZdU+Mvq2gKvVAn1GIw4+p+RUsad1YNmGvZ0xcdaY5hswCPKxou
         frIr/+VWeygX9dZlEdSGZKYHRpV6lmG4LMgYeJnonYbQ1S4pSzeHrUfQc0NZDsXTamVE
         8MuCajnYh3q1cJkLmJJ0LW77HKTA9J49Y9ffbrlVHDty3D6kb3qz/Jukw2oF4v+tBmwz
         kIq4/Y+JYC+Q70fNOSHSYtbmYcENydODlEeVpMFXDvyo9SJ//klvnnJndQNR1OublhbF
         7hK8YEjONX57U+MYgL1mZ/Ch7vx70+5EQu/a1+YVTS7mXrDUWjQ0vvqkxKQADewxZ0E+
         4aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244379; x=1795849179;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOONOUBRea55D4L/MhBbf8K2lc+JFi0aqBhiCgSX6Yw=;
        b=lUYf+4XkhuSulTVSX0Ypv0UKf+XyICLSoF7dgu8vXX/Yl66W7iENFYSG+cBicts4Rb
         4sN18m1wU5IxhN/d4i5vOhnSvLJKeEMpm42gug0pLWQ5HVA5LAkL7DyBUWLsVwxpLnk7
         Ak7oBlWaNrWUdrSP8T4A6s6SLqGFChPpHBPc9/m3HMTEmchXuIgI/5eZ69X0bKzRnaSP
         9sH4Q3YG8zZzcZx5CVyoapVZ6Lm4pFYs6bKhyTSORWLzgz0lOiSs1iNxAcES8p3gc8EU
         nsaW2mBTfd31G4WRYAzBtZqSmVynnPqLny3nsVcmCgVArFxU7GrefaTQMAszuVYje02F
         WGrQ==
X-Forwarded-Encrypted: i=1; AL+hErGUrSIOqQSy7xqtOcpuqpEzaBok5nBZu5Q34kr2EhjS+3wzafnnHsP9p8U6qJHrKPn/WpNv@lists.linux.dev
X-Gm-Message-State: APuU4Z+HqHPorhOo19yvgsa0DJZA6WKp39+L3pHmfk9dNLC5a7AeUSrk
	dB7E8CwmAsjG/flYpnuKRiK5HtBX0YXKLIdYFSUm0tJ0pVcrneAZCIldUK99755/WznO5ZDvxHe
	4btwTzG05yQ==
X-Received: from iobmr2-n2.prod.google.com ([2002:a05:6602:a542:20b0:9e2:221a:fd83])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1a02:b0:572:2919:eba3
 with SMTP id 5614622812f47-57a0ccdebf8mr6144982b6e.67.1795244378377; Fri, 20
 Nov 2026 22:59:38 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:08 -0800
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
Message-ID: <20261121065813.4143649-20-irogers@google.com>
Subject: [PATCH v15 19/23] perf maps: Remove unused maps__load_first()
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

Commit 553d18c98a89 ("perf lock contention: Load kernel map before
lookup") removed the last caller of maps__load_first(). Remove the
unused function and its declaration.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 10 ----------
 tools/perf/util/maps.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 675fe0223faa..496a592284c5 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1457,13 +1457,3 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 	up_write(maps__lock(kmaps));
 	return 0;
 }
-
-void maps__load_first(struct maps *maps)
-{
-	down_read(maps__lock(maps));
-
-	if (maps__nr_maps(maps) > 0)
-		map__load(maps__maps_by_address(maps)[0]);
-
-	up_read(maps__lock(maps));
-}
diff --git a/tools/perf/util/maps.h b/tools/perf/util/maps.h
index 4ec9b7453a3b..4e6eff244125 100644
--- a/tools/perf/util/maps.h
+++ b/tools/perf/util/maps.h
@@ -83,6 +83,4 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map);
 
 void maps__fixup_end(struct maps *maps);
 
-void maps__load_first(struct maps *maps);
-
 #endif // __PERF_MAPS_H
-- 
2.56.1.750.gf70dc682cf-goog

