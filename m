Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4C13C8FF
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909156; cv=none; b=cqLCG0TeXTPO+7rD7/HjDJ11tcZjvlBE1hASlyYvVsSOkjNRepjowdWHM7aO9QCYoFPcPd8bpZgbIDYgDwE+btU16cZ/w/QSTaxuyGKzfkUHa/1oRdgR+2LieAhfG5YD+niD0/GrAtYT7TZgQxvSpIgeOkSLCDW7CkmsfhT20aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909156; c=relaxed/simple;
	bh=4XYuTBlR6hYwFS1ueXSOzYaxTcNFVQsqr4/c3vmzres=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=E4DJ4jDKZXl1mZd3LCJU4RpK3U7Nv+Oa3T/8KVIlPkz99v/WF3DnODbfM+xFEPzsyoT+y0AgAltE26Zxjn2oTIrZuGyU2DHyci2FjOLDj/ly8lYe7MbWcqTkPJUYvoB58GNiLfuoqLgOc7E7EtSMRiISnXZYM1ebsahlsgKibhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vvoAnOCW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vvoAnOCW"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-24458027f67so58164755ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909153; x=1756513953; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ijg4Ede0urfZx4RJgifti/T7L7s4uVTkA9wvhJHnqsE=;
        b=vvoAnOCWjN3iZ0d6j++2xyFiC7PpS+N3d8XTynoOGS7nvQMM2L73EwwMKRFl4QkRa7
         O+IMkAX3ym8b2V2/N605hkL8i20EY+rilO8kJYtu0KoFw0KMNrWSNmsJGb8RxWwUFciC
         bvi7DlkygeY2ynEfKCxzkqLqOWosH6VogQeZdXScavms2EXRoRP3Fb/1xpIPAhlZLGd/
         MwvcgIbl2SREHZay0GNP6wCOmw5vFh6Bm0D/34DjFLlPmjSQ5GOn8IIjjM5kMrAvtCiv
         wL2fk0h2iz5zoDHnhHPBAo3TA60eACOnHfjEi+8UPkkYdboC0/JMUrpAbJRVO7OF8Ooc
         sE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909153; x=1756513953;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijg4Ede0urfZx4RJgifti/T7L7s4uVTkA9wvhJHnqsE=;
        b=AI7jr0vaRmtStAXWLmK9eEShKnWMIvZ3+jsdy9Xf+7MVhJrA8NVNu2C2pYDs9hxH16
         D09aCr6GLSDV5jO5K9Ssxg3qO2tR2lCLo1XA+BLm2y4bAukeUTPKFBNFe/fQAvEGw1wj
         2r0Oi/0D4/FZFT3y9/edq4VKBqcD0Q7mR8Yfd6TmPBvDu7CcaDAswxO9VTRTCBJYDAEd
         TOUKcWodrgGxLXS5iVZBV6sKRM4XZiW4oDlGlgsymj6U3mqmeWdn4tsToPSFGnzn87m3
         II5nekZYuhVd4qZrd8RBSzABcznjurAsy8Sj/0Du9kudlOmInrSmsydiS14yQO0dXFKi
         1ScA==
X-Forwarded-Encrypted: i=1; AJvYcCU6JnrisT+7lMhR8NyhjlVMOt6oIgf1FqgSF28cTYdPbyDEL0tTe2OZRKqGI68C9Y6v4job@lists.linux.dev
X-Gm-Message-State: AOJu0YzIX99VX3732Z8K89q/7MwBN86Z/AmbDkSG4JrxbA2uQGQrC7M1
	7LRYDTUfPoEJA/+dgxvzxnCFeThV/rNYFJdxku2Zg2xE+6baGBlIEy/hjmelnoXX03/b99RWU60
	31Mx/IgMTug==
X-Google-Smtp-Source: AGHT+IGMYeCxsgrlwx1si54aEYiTjcsFA8gfzIiUxjxIYcOIKjCABHao1VnvVTFQKEPtCEduDnI1c7IR/WiK
X-Received: from plcr17.prod.google.com ([2002:a17:903:151:b0:240:285a:2adc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54d:b0:246:571:4b21
 with SMTP id d9443c01a7336-2462ef49e52mr64510395ad.58.1755909152887; Fri, 22
 Aug 2025 17:32:32 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:31:58 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-3-irogers@google.com>
Subject: [PATCH v5 02/19] perf map: Constify objdump offset/address conversion APIs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
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
index b46c68c24d1c..41cdddc987ee 100644
--- a/tools/perf/util/map.c
+++ b/tools/perf/util/map.c
@@ -513,6 +513,8 @@ void srccode_state_free(struct srccode_state *state)
 	state->line = 0;
 }
 
+static const struct kmap *__map__const_kmap(const struct map *map);
+
 /**
  * map__rip_2objdump - convert symbol start address to objdump address.
  * @map: memory map
@@ -524,9 +526,9 @@ void srccode_state_free(struct srccode_state *state)
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
@@ -569,7 +571,7 @@ u64 map__rip_2objdump(struct map *map, u64 rip)
  *
  * Return: Memory address.
  */
-u64 map__objdump_2mem(struct map *map, u64 ip)
+u64 map__objdump_2mem(const struct map *map, u64 ip)
 {
 	const struct dso *dso = map__dso(map);
 
@@ -586,7 +588,7 @@ u64 map__objdump_2mem(struct map *map, u64 ip)
 }
 
 /* convert objdump address to relative address.  (To be removed) */
-u64 map__objdump_2rip(struct map *map, u64 ip)
+u64 map__objdump_2rip(const struct map *map, u64 ip)
 {
 	const struct dso *dso = map__dso(map);
 
@@ -618,6 +620,15 @@ struct kmap *__map__kmap(struct map *map)
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
index 9cadf533a561..979b3e11b9bc 100644
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
2.51.0.rc2.233.g662b1ed5c5-goog

