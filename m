Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026506;
	b=4vTVkKWISje2mZf8fhuzwGGH5HiWit2H4eS2XLI+17un8cT0gdu1Frh0o0B4kroENarM
	 +QyGnytgZJnQIW08p31hwHhgSKCja42mvgp1YG5ys9+/6Ps4qFFXhtpZKVimVw9JI2XoR
	 Iamr19Li5/I60f+6gC58Y3fpu+TJV5hC43W5ftSeHbke66wHU8VHWuVf0PRFUp0F8Env5
	 G67/sUWYgex6Dd4/Ey2fsemohfHXWn9w40xMSTmdzfb7m4Fq92rb1Nrgsu74vKQcMn+EQ
	 VgYdea+F9Gwki95phee5/e2Dl7eZcqgSzTgquJaIwyQeXmZrhlJDEm9gUAwEv93JfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
	b=KnMSRv4roxAhPcTeMNS5sDwMw/n2I6o/AKWP+LLUiqyaIfzN4lWbGUFB/20NhRKKp3NC
	 NPZugEWl7/ynL6vq7FlKQS+5dimlW/wICx9eiY2dFTGbKzfq8JuvM2A3hIAwNRYe4cPyP
	 KU4hj3BqaLahTUhb5fTUNaV4jVrHHbAwOii/jT9WpNKXbTQyXXRHmjEZif3Bx5BxhYyZI
	 n7jPk8wG4NoB4LIvnmTxX0NCG5DYqqGy+b8lq8T5HbjhHvROr2D8dOd+LJYpEEnTyicDE
	 47rrehVqPk4cE+HZGrLtHikk5T1/zpj32b/3oXzvUL0gIBGQSbRvbSm3VpqbnA0qu0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o4Yx148K;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3D606EEA1
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B3D606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o4Yx148K
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3700be873ebso382812eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026505; x=1794631305; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
        b=o4Yx148KegBWJrXqzPK6hFiD8+TsUnvjwVJ98D/vldyky8EWJ3fHcKoTEE2DLEdall
         Pw0QyBf+t24boW2Brecsk6HlfHqXrkZW7Dy9+7Vx+0n4kK2fLKraK4I0HxedmYdVeTEb
         yOvgAwwOGgMlQsxcE1MIVvnwrnWHStTJVNudCVGuGSFwj0ICwwUx64J5tAMpipVR6+rY
         ntb0bVvSXpYd7lfnr1ABdZZwGB7L64TigcWI3lfAcZW5IQgUkdzUA64ppse0E1naktKu
         0xj5TAqv1cZnVIopadUtLQ2IWTruL10D4asSd96VIF74bNlo0D2xkncOAsIJc2XFg+Vn
         L/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026505; x=1794631305;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
        b=KRbKap6VTq9EGIAG+RW06DeEPWHFY/QU7oyRaUggr4M4Nnz6Jle/bMyHcRf7jI9rI6
         LsNACXFxKwSSV76C5dmrS21xAfwJhTCbbkK17NLlN8e2hu75dBPZBTrdD4JoTCOVAIID
         sGR/twStpvZLGKMlEb5titnrMJnH8130sjJrUoSwubdmcmYTNhTOi0AWchHj5x3pEwfG
         wotHx3TOg6jz5ATQk6xfSsqdr//4/gizIgfiK5y0yIcxUmDI1dYAGJiVA4XioDLBoQBX
         sG0XC/gV8tzMMWz3lgdxVJepkHYhiMNxU5BTwvnxuAtsEaZ3F1QaFh5sPW2GTQ0gh05H
         ne0A==
X-Forwarded-Encrypted: i=1; AL+hErEqAr/jF+FTOaWlxITHwbtEHfn8WUTys1o1uFqBUdkgpeNRaUMjPpM+qDJL6+NIBaxIIUDn@lists.linux.dev
X-Gm-Message-State: APuU4Z/UfgdiO7YI7oUCZWxxLyiHW8b7+w8FNeWTDIyotGcQsziCksRg
	dip/++31PF2Ttj286mnKR1PxifTVlb/8Cp2b8e/oy3nPcxqKZ0ybTuN3bvmgu2GiC603WhODPSZ
	rnlU4b0Ru2w==
X-Received: from dybse2.prod.google.com ([2002:a05:7301:4902:b0:35d:1771:4816])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:83da:10b0:36f:5822:4bb2
 with SMTP id 5a478bee46e88-370f76a8a25mr1471146eec.19.1794026505162; Fri, 06
 Nov 2026 20:41:45 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:59 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-19-irogers@google.com>
Subject: [PATCH v11 18/20] perf maps: Fix lock inversion in maps__load_first()
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

Fixes: e77b0236cd0c ("perf maps: Add maps__load_first()")
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

