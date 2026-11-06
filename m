Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948669;
	b=ugBNtSN3A7J02R0WV9bGumh6TOh9gXEczl10wPxPptlwdgLYo1WS9CdOmILwA1BwcfbW
	 AsOuXHYXuaAYJOr/L94iiNRE8l64dzYAac3DmwKXVrPinO6S9L4HupMJON2jIP9uhrIAa
	 LFXFIAoP03xn+f3TvFjpmFAyFMV8KSc8pOMezEa7WjIaMKjGLcdYzE6h+l42FRtiNR4Bp
	 ntu3GCj7DkCXZyfO9nGKnqI5TRfpIZwSjfNSA52OALNqWL8yBIOg2QMyzW+6e75NdLgLF
	 0x0fuQ6hrpeZIIV9d1gOQREX8Fwic023a6RJ65wxtad/52E2P+V/fgSI5mNc1YHMLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jPaRO8oHRGj9zo+g5wm6NL8QtaNqCuHhACg6/Ph4t2I=;
	b=GwaN+fQOOp7zMF7gKpLiO15jkp964BmMbXXbLgJ1meV1rK5I25rNxDbDd0kxl58Vp6+f
	 SQ5HZiW889wvbMwb0rdjkA+qiibFQl6eQTgUpFRyB9bFT2Kf8xFSkPaXA+Xl9G8RvlYVT
	 MqZMf+D2sk8ZHH03rESrxtg18bDeHOTh0j2A2q0X/Y+3wti2zRFqd/DkPXy5xwG7ZuwNL
	 6IMAPQBi6qoGalzKYJoJKBiZZIvAEXpRo7XATh6aCEpOyAtu2OClKyKW5kxehGiaydSUI
	 cyQzdKUxSMDfmuN5inJOvApbFBLx2/9G3le9zN1bd9U1i8WrBszUX0RILUqYnnxhZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jUW2dnHt;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B5606EE90
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13B5606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jUW2dnHt
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso518489eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948668; x=1794553468; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPaRO8oHRGj9zo+g5wm6NL8QtaNqCuHhACg6/Ph4t2I=;
        b=jUW2dnHt0nVxoAqEgwYaqlznwiDY2VYphzevJw/0/1SnwDU9BoXhetdikOYCjf7OM6
         sL+YI5o0wev4QTFyzqtSf3WqkKZIy6LzoyOBiI3DbYf0tnX9JPsNloGmw7ScK0N4pPdT
         S6eCqJ89gW65cq4iwTf1pWO7gk3/jMPpmTVI8taiC6y1q/ktHDqxH5L9kxCKDu3+yZLg
         /IWl/hmgknil1JjSlWXz2uxxy1/7AZ9KZx8YrlfeGJ63WonYiPTs7gACc5Q0gjJ3wJBF
         bGw5UXeDLCBdaW8DccUUH/NZW77N91laYf5fK/wEbXyvaPUW3ZKl/dfDn45WpsfaMhEo
         sXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948668; x=1794553468;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPaRO8oHRGj9zo+g5wm6NL8QtaNqCuHhACg6/Ph4t2I=;
        b=gA3TKiV1uvFvMH0q/TbhOsnDmtSy71mZsJLrMaUNfQgj36hxzXKnrSTAWE4jCymoSn
         veAFzw92V56Tz6V58/OOQCblkw+TEDvZXKLjKy3KbBdf5DKQkORvwDU0OWYgrhDUQ4oL
         6RCz2niC9rvlUZ+ZQgfx7E6ljWL6WQzUgdvpZ/Ws67IJHp84jgyQqA3usX/XYs6DLB8o
         VA2mVPn83xZIdbNSRpPpONTpzzsbmRvdoYoTIitprX8ZOUATP1HsWLqbvry6exOrFv2v
         jwiL1GSRumLGL57q7jke//JMS6vkOxTj3RJLTnVT0JUW30GFAd691gPEgd879as23Qsp
         ZeGw==
X-Forwarded-Encrypted: i=1; AKwUvBx1gIkwFMxs3VvilFUbKnnG+lt9rdpQ/GrYKWu48pD5hfNio611c3vKuzyLkV8opTvG4YQ2@lists.linux.dev
X-Gm-Message-State: APuU4Z+B9nt8whhG4EdOS6byNCENQem+rDJIqRUmv9SRm7fr+vFLmzoT
	zeAnlJi1udXUdQVJtGitU1wynWexE+JCFTpOSsE767ofHmlz6P0vgTvGYvOuml3mYagAY9W9ZAM
	WnxljRob9dQ==
X-Received: from dldyq20-n2.prod.google.com ([2002:a05:701b:4554:20b0:1b2:415b:9bf4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:170e:b0:18a:8164:ce4
 with SMTP id a92af1059eb24-1b25d1e3e6fmr1997788c88.0.1793948667649; Thu, 05
 Nov 2026 23:04:27 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:42 -0800
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
Message-ID: <20261106070344.329897-19-irogers@google.com>
Subject: [PATCH v10 18/20] perf maps: Fix lock inversion in maps__load_first()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..7ca33e5218e7 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1459,10 +1459,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
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
2.56.0.455.g6c5a503b38-goog

