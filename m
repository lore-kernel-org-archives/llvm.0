Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0681B0F21
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527044; cv=none; b=Wbgb32gtlLwQExa5lsqQ3NLf7GcE5wawIE4qZesbQ/ZTGvcizBLF4kNyoOOdpOsDbA5IbcV2TXneeeDdd6dnTuRkp7jAtLcgyL/UfwqacBqaCTzXbA5JUAIIDLz9pZPFNvuUUzXcu20XAaZbB8xLDhu2YfGzof+Ec1Q3ZgpzaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527044; c=relaxed/simple;
	bh=Qmq55MBFFDlIdUOT+YCdRI2WTxYpsmxURFZ8UOnIG5k=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=h51IkV8zuuoMtU/YmPg+A4565h11BfQ2H+NQFUfoGeq3xddWdL4msww2QBZ8QnJ1SjI4vRsKk7QaqMsFVv/DrZmhNnkNKUQs/8mRiuSYiWiS+jo7mQz1vXjW1GSkXu2Yqj2Timy+TkKQy46ge/6B8GaA3SMU+n+ew60WM9SWCqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pOHa2l4h; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pOHa2l4h"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e57b1e837fbso10686349276.1
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527042; x=1738131842; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWzjT8BGnYGxE3H8fS5inyNnD+mPb+JDTto8cogfHm8=;
        b=pOHa2l4h9pARB48XY2W9b0xUNUkE7HPgTBJNDHFVwSBnmVkfJx5O5ph6lYLjnZWw3Y
         1Pd1NBznDrZMvciKbS2PyDG6vtvLgHNPEl3fgZcFVs5pbICgaERKiTHzah+cOUzXXLpA
         xWDlTPqvJhD+8CYPcWBu4a/jsCYaYOtVQl06Fg4lGsjIiB8VldRJY3QT2daDo8U242eB
         E4XQ2DAsUB8bK3PgJd6rJGCZGPKHWT2szBD2AfJj8u1zMTyjLNOVRutogVDPXjGo9ggw
         cBs8Jfajf+z//Seh/uIlW+jkUFtb6ZWcql1PjAZ/0/XF50ctMWflYcnHUz9CCfG3zGSF
         P6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527042; x=1738131842;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWzjT8BGnYGxE3H8fS5inyNnD+mPb+JDTto8cogfHm8=;
        b=G/6uF+55Xm5nyHKaK1L169QKrg/8tz2COCHJqUOrhcpQFqZsTD6wvFH9hAqyYg6tHb
         o5ThpaIdrFVLwtVvH2l6+6I45deHrrdkB6ZviEXMHGM0mpvG21bkOF3xvf5Gx6R/wywX
         lkncin+rdGTP8cwbFjz/dCBPnzJIpJL5DK5O9ekVtUYhtAkpZjWhZLWpngH6y8+GPTho
         sTxMAhw4rB2ZogVqcNbj028Q3e5lNKPQpHnBVmKasP9767N/FeXVBCU7jqy5XgCZ8lhE
         JxiXcvfl/dFekH0BofeUpOPa6HzuQxuA5mFzEx13y5TdnXqmN6jSHpdkGxg1kkDqIS80
         WRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt7Bt8eZL4pXdN3V4vPu4mKQHV4TxTt1sCwi9JOaVIHYKzYFIU/1CeR6T3xBGlWVvNyFcb@lists.linux.dev
X-Gm-Message-State: AOJu0YzX94GbMMWxayZWwQcCJ2YBksqzKHiWdRDxazSCxHbYcs+pC9t9
	8J/7v+yhPq2MCdOnrSlgPIJO+smXtMMFVvcNky8Z9/PamUbLCbw3OximWWtmcZf7B6M6pu+JRQr
	bL0oGBw==
X-Google-Smtp-Source: AGHT+IEkQrVl+S1ecATwU/x39/z+G48tsIZyI5LDZqnLUZLk9fS8HATbtR2ta/8MhmTWSqrSAgqjrw5VZEOC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a25:538a:0:b0:e39:91bc:eef5 with SMTP id
 3f1490d57ef6-e57b103b91emr42227276.2.1737527042387; Tue, 21 Jan 2025 22:24:02
 -0800 (PST)
Date: Tue, 21 Jan 2025 22:23:17 -0800
In-Reply-To: <20250122062332.577009-1-irogers@google.com>
Message-Id: <20250122062332.577009-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v2 02/17] perf map: Constify objdump offset/address conversion APIs
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
2.48.0.rc2.279.g1de40edade-goog

