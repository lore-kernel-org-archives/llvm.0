Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083B58B6C7
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171923; cv=none; b=cL4ateDr4dDfNf+Hw5I7I/HwDQjuJYeG3LBpsr5slvt0hCwzY84aOUXJTO3YadZsq3mgkw6sdp9CSTOITa+a/ZOhVHiiQ4eVimk5OVMw5PzbPb1SR/O++oqY+MmOaa5Ikh/3Q5qIdpCrZeQPBJPO8sgMvlMlLRxAtjNZR3gS6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171923; c=relaxed/simple;
	bh=CCjXTNqHT89zyONIcSR+OwfqIxnWIP+Ljxt3b+OKT+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JsZNIDCrGGpPgvbnO0ji38/qRxkDKwKr+saRi5gAiLmBr1Vv4GDLLCNKqSwvMX7ADdqNhEA0kCU5o3nGVOocdJAxBn5hfeq8OZly9B68gI1JViZ6gjrWQcyZSlr5C2UCZxOZLqLcf6ps4QN8NEusLrChKIfQv91NhHp0Ky6K+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jy23NXNB; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jy23NXNB"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso232140c88.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171921; x=1792776721; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUulpA5j+azs4E3npojsUIbJgcVsNwHBau6Ow0JhWuo=;
        b=Jy23NXNB2aoeORWdC7XHKH+nH1gY/kIHSlQXryme152p2bj0/zHSp4gPB+DybcaTe+
         gICdrz3J7SVRGICnhFkLlDHqG/p1bdRWrH1/s4O5xAm2xHp9fBX2RanxFqEkYQnUySGx
         wB4KJBF93DfTnws4cyhHEOTk72Fs2ZnWkz1YRRuAzsoL+AwKejehuZ+vFtgC947nKwQR
         qfaVKlRYdJdbeBaWFdZw0q4ERXwoGuV4TDhcB9mwGiMHMjLhrsn82uU3mES3AF1WdflT
         ay/hlU6tJaOcJaXCJRhxOs/7OAktqF1zbV/99z8vagpUy9qhde2Ht4yPDK5x14BiSvG8
         MjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171921; x=1792776721;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUulpA5j+azs4E3npojsUIbJgcVsNwHBau6Ow0JhWuo=;
        b=rwah1yKoll44jiq8ZgnUueeZyGHaFijroRmrbpfJvQG+pr8cNImc61kU20WROAPIoP
         SE2eOXSN8mLDUYcz/9vsCswBg3xLtZt2kQKUxsniKbmKCmhlXq138z/H4GPqzQVSEkNr
         FeETXMfMoxcBPFSDuikdbEQ+YcyAzqA8m7Igm+tUHa4V3FougVySjyxlPx6tv7hkzeXW
         /scrbGvmE8Il+9uempAhxCUg03b6BCwRWyXMz2ImSoH8/OdetrOPvNGTeSvxvPs/2mNW
         1GTkQSQbYaZl3dnSFKvaUsDiE3uhqEc7SsF+X16rQUM8KiACcH/DIicBkHiPEJmZ3Cpy
         LbiA==
X-Forwarded-Encrypted: i=1; AKwUvBxm56PHJ0OOVuiWV5ErAxvP98cusoy+BaLj23/NbZjXxv7hT8iFxk5awKm8nZTdafOM/+P2@lists.linux.dev
X-Gm-Message-State: AFq9FYIyYwgKdJI8ul/ND2A+xxqSjrpGXXkxs3wgLtPS3gHv+FYqbwwO
	fP+9NUqKBm5elZfIE6MkOK2LgRWWAFecqCN9WV4cWICSy83Dys5o2oI1GRWnmb/THc917fI6j53
	OZDzr+AftnQ==
X-Received: from dlee25.prod.google.com ([2002:a05:7022:6299:b0:144:c124:514e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:178:d38c:eafa
 with SMTP id a92af1059eb24-18512579328mr608006c88.21.1792171920582; Fri, 16
 Oct 2026 10:32:00 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:31:05 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-17-irogers@google.com>
Subject: [PATCH v3 16/17] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

In __maps__remove(), check that the index returned by
maps__by_address_index() and maps__by_name_index() is within nr_maps
before indexing and removing the entry, in case a concurrent thread
already removed the map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..c0fccb776bed 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -548,6 +548,8 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
+	if (address_idx >= nr_maps)
+		return;
 	map__put(maps_by_address[address_idx]);
 	memmove(&maps_by_address[address_idx],
 		&maps_by_address[address_idx + 1],
@@ -556,10 +558,14 @@ static void __maps__remove(struct maps *maps, struct map *map)
 	if (maps_by_name) {
 		unsigned int name_idx = maps__by_name_index(maps, map);
 
-		map__put(maps_by_name[name_idx]);
-		memmove(&maps_by_name[name_idx],
-			&maps_by_name[name_idx + 1],
-			(nr_maps - name_idx - 1) *  sizeof(*maps_by_name));
+		if (name_idx < nr_maps) {
+			map__put(maps_by_name[name_idx]);
+			memmove(&maps_by_name[name_idx],
+				&maps_by_name[name_idx + 1],
+				(nr_maps - name_idx - 1) * sizeof(*maps_by_name));
+		} else {
+			__maps__free_maps_by_name(maps);
+		}
 	}
 
 	--RC_CHK_ACCESS(maps)->nr_maps;
@@ -1459,10 +1465,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
 void maps__load_first(struct maps *maps)
 {
-	down_read(maps__lock(maps));
+	struct map *first = NULL;
 
+	down_read(maps__lock(maps));
 	if (maps__nr_maps(maps) > 0)
-		map__load(maps__maps_by_address(maps)[0]);
-
+		first = map__get(maps__maps_by_address(maps)[0]);
 	up_read(maps__lock(maps));
+
+	if (first) {
+		map__load(first);
+		map__put(first);
+	}
 }
-- 
2.56.0.212.g129ede20d9-goog

