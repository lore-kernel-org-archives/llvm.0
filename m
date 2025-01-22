Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7A216E2C
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567799; cv=none; b=ZVTmV0+hGaRoaq05dE22Ei6fPatMDF5bVijGkPlhFWI37ngmkSn3myVSnUKF11F0au+KdkZmWWH0NPq4jkjGWtkg6I5GEC9DJLkpcDbvG/mPjP8ZJnVxqYxtknjaixPrP833Raqv4pKdrkl88Tq3tXWMuTffW72UcsOxOm6ABQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567799; c=relaxed/simple;
	bh=WJt5cb/0k5W2nwh1HNJ6Jogn97hrB3OoERDCfCptbfM=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=V8UhRHeZ9v98KLP+fze/CHQGLHFyjZ/XW0nAm48FfT3Za6yi/P5bl8BFGTTTxB8xt/OXEjkxmQyA9w9z90hUhaWthEBYgKf3kLdur4v6RNk+iW7cmRhTCqF2s/pXzzBvOB0sXjfhO74723NtuYAmXCSmklRTH6lCy+PQ0fPhqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lM7klv0Y; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lM7klv0Y"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e53bf9e60e4so17225245276.1
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567797; x=1738172597; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcjBK8L/P8OV6edsjSeaFLzzE6iK96Z0X/N4sZi7ys4=;
        b=lM7klv0YqRZVZXm8jzCilU+HiNMQMOlf00AXzzrALDUnk43RK+v1GRaoB2N93Bczjz
         uQ9vv9xwAYJNdNirySOZ4dPsluy/1kmvt0jw+YsdqiRfGyU2t9uTveUkIzf0+JXlySlp
         Wx3d/qABNQfSDB0zQF1VAcfXS2T3hDuVcFMhW4o3UZNIXuuEOtSPCPl40ouluipe6J4w
         66/pJxuo5cBTRBBQ1ZaCfjAcvEDEkelvzRpwvgUgUI8Wak56LnCBVNHNkUBN/qaX3H+W
         ohylmbrUJ/ebsSZL+9h3Lx7hNAGLHrxpkndnfDkn0CbJzsNm/3UKqDxqM8kFZ3u4PzlW
         II7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567797; x=1738172597;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcjBK8L/P8OV6edsjSeaFLzzE6iK96Z0X/N4sZi7ys4=;
        b=VKbpg+gJKhDnQ69zeMiq0extNsF1S0fU/0rMXeIz1MMDyIKHzbM2AtBoFTvKsyMmdg
         Xq1jToeGLELryF0p97jXRKLRDRWQ+j76zR8MDNWtMNPoWDCRvVHhTJR4mJyCXMtYn5NU
         UZ79Il95omE4UU3pyFKZfghAyYkH2cGCZfriNLDBq2DFej5rr/khWJWePXRxzh8fN9BF
         O/BZL9m2JFBvpUOgmfKy7zq7x5cIB5HcczenvfDj2AaNav7DiDstKf22lC9fiy8ApEr0
         p8djd7nO7GCtKbqw83MPyTZWUJ9XSkuMDegAn9qEQH7IilR9InacteX/niQJRU5HVeze
         +PPg==
X-Forwarded-Encrypted: i=1; AJvYcCVxJwufGPTucS88iSHsxyZ0/kDNl//uIjgUiOkhB/CR4cU3xzYmijleIarUo1pMdiFcD5VD@lists.linux.dev
X-Gm-Message-State: AOJu0YzcUapFNmE98g++8JlT3BQlMmlNDEqt/+8qitSOZU7WYbcJmaSX
	rVDu2oWgDurIVHI6ZRBftM6wTow389cN3yFXQmVoF2V7rAFFNvoX1r7bO1mkrnN/4S16rcVWGCw
	NxNI9jw==
X-Google-Smtp-Source: AGHT+IGck6iBXWnNQNNAFess+zdbWD1500PKjbeASn2i5vUzvBiLOSAywNQo35XWkC8hVAcuERbytCMZU2Ub
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a05:690c:6211:b0:6ee:4b9d:df44 with SMTP
 id 00721157ae682-6f6eb947731mr567087b3.8.1737567797019; Wed, 22 Jan 2025
 09:43:17 -0800 (PST)
Date: Wed, 22 Jan 2025 09:42:52 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 02/18] perf map: Constify objdump offset/address conversion APIs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make the map argument const as the conversion act won't modify the map
and this allows other callers to use a const struct map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/map.c | 19 +++++++++++++++----
 tools/perf/util/map.h |  6 +++---
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/map.c b/tools/perf/util/map.c
index d729438b7d65..a22a423792d7 100644
--- a/tools/perf/util/map.c
+++ b/tools/perf/util/map.c
@@ -514,6 +514,8 @@ void srccode_state_free(struct srccode_state *state)
 	state->line = 0;
 }
 
+static const struct kmap *__map__const_kmap(const struct map *map);
+
 /**
  * map__rip_2objdump - convert symbol start address to objdump address.
  * @map: memory map
@@ -525,9 +527,9 @@ void srccode_state_free(struct srccode_state *state)
  *
  * Return: Address suitable for passing to "objdump --start-address="
  */
-u64 map__rip_2objdump(struct map *map, u64 rip)
+u64 map__rip_2objdump(const struct map *map, u64 rip)
 {
-	struct kmap *kmap = __map__kmap(map);
+	const struct kmap *kmap = __map__const_kmap(map);
 	const struct dso *dso = map__dso(map);
 
 	/*
@@ -570,7 +572,7 @@ u64 map__rip_2objdump(struct map *map, u64 rip)
  *
  * Return: Memory address.
  */
-u64 map__objdump_2mem(struct map *map, u64 ip)
+u64 map__objdump_2mem(const struct map *map, u64 ip)
 {
 	const struct dso *dso = map__dso(map);
 
@@ -587,7 +589,7 @@ u64 map__objdump_2mem(struct map *map, u64 ip)
 }
 
 /* convert objdump address to relative address.  (To be removed) */
-u64 map__objdump_2rip(struct map *map, u64 ip)
+u64 map__objdump_2rip(const struct map *map, u64 ip)
 {
 	const struct dso *dso = map__dso(map);
 
@@ -619,6 +621,15 @@ struct kmap *__map__kmap(struct map *map)
 	return (struct kmap *)(&RC_CHK_ACCESS(map)[1]);
 }
 
+static const struct kmap *__map__const_kmap(const struct map *map)
+{
+	const struct dso *dso = map__dso(map);
+
+	if (!dso || !dso__kernel(dso))
+		return NULL;
+	return (struct kmap *)(&RC_CHK_ACCESS(map)[1]);
+}
+
 struct kmap *map__kmap(struct map *map)
 {
 	struct kmap *kmap = __map__kmap(map);
diff --git a/tools/perf/util/map.h b/tools/perf/util/map.h
index 4262f5a143be..768501eec70e 100644
--- a/tools/perf/util/map.h
+++ b/tools/perf/util/map.h
@@ -133,13 +133,13 @@ static inline u64 map__unmap_ip(const struct map *map, u64 ip_or_rip)
 }
 
 /* rip/ip <-> addr suitable for passing to `objdump --start-address=` */
-u64 map__rip_2objdump(struct map *map, u64 rip);
+u64 map__rip_2objdump(const struct map *map, u64 rip);
 
 /* objdump address -> memory address */
-u64 map__objdump_2mem(struct map *map, u64 ip);
+u64 map__objdump_2mem(const struct map *map, u64 ip);
 
 /* objdump address -> rip */
-u64 map__objdump_2rip(struct map *map, u64 ip);
+u64 map__objdump_2rip(const struct map *map, u64 ip);
 
 struct symbol;
 struct thread;
-- 
2.48.1.262.g85cc9f2d1e-goog

