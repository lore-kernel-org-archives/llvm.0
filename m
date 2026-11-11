Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418980;
	b=QkYnqY940SSoGX6N+U2uh4HD7241zZ8xFgBH47u5zwqIoPUoIL4zY0OlbjQi6XhqXwmJ
	 C0F5tzICQ5QTzKBdGzNgp/6DZvTkKRRpfSXJZcA27fMuu10/rE66mOgkXoMuORUXTPUSo
	 q4M0aLNV+BwSlQpuZkHMntmyytnc316innQaGHIFemVqjeYQdXUsS4FIR0Dl3uHNAjOK7
	 FkSrZaCGGpeYRCStytVDN/nVobYXWw/xYy5zHS1EbAl6hYySZXbXnEij59plRXuYMmio1
	 F2b3p1L17VifWGTTnLjTSg4qOYW5LVpooqmrhFnwH13MQiUb+XYrB09E9Fd0OToOiTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
	b=gPr1TwYMIi0koG527w2JsmABpnHp8IMJEbIQlnbPfp91bmNJU+4wKTTxbgI8edyxcuzO
	 NvtzSPpMmV0X1lB5NFZJ/2a82ZfBF6G9AZvFuw9AShljDOnGbVufqIdRskZZvoOyxpc5r
	 SynI/o8P1u2SOv9zrLaS5Ktp/9PnLzGy0RfDLsU0TcjPxB1pbSx5QLZnf+9J9pi93zaHw
	 WLIqLXNux4pptR7kCSdK/rUgYJBXq0mqzQs2Wl4dSa3L3Ro3QNStWPL/+lFwm80c/Uf0Y
	 EIJd5ilvqFeC2EbI9MUUq3a+IONIgMy+wH3n/LGW5Ziw135s/iiXkvDKCzn4Ybr35IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W2Uf32PQ;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1B606B4E4
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB1B606B4E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W2Uf32PQ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3913137a91.3
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418979; x=1795023779; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
        b=W2Uf32PQZW1kYNr1cwXFdO6VmbKtfOk30RiDw8ak/+I4G7jbkbc+1HGMhqkc4MU61t
         YpIKNtcMobXJhYTbmEr6kRWAgA2BiCT+WFW7A/DesImMnKJ5ftLSxg26gr1/5ps/CxGf
         a2vI7fDR1WUQ7jWTYTVKE2LiRiKhWE/aS4b9qd5Mse4w7bFEfTq34KjHJmoW91Pkr67R
         KyAINir5dvHbq3Aqjke1oTL4X/jJmC3kHwWtYXmvjfiU/ZJNWOTBKPB1YyVmAfl5YWbG
         pm4sEZK4XkZIGK2KvjkAz/olvtnmR2B16/ElbTAcfCJJ3KtHf7AW55sZU4VpxJyLtlkI
         05qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418979; x=1795023779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
        b=qkW/MF6A6Fk/k8MqD1cSQp1/OArNJwRihD1CB+T9NhjK4prhbRwqz769cWKFXRG7vb
         hXW408Nktk9EErNWKVLKsEVdwx2W8ZGhb36tnUspKyY08tet5Iev6t+0O6dYsjXerNC0
         6o59dbDjlQoRpJd02AiekgfF8RjKZhm9oMe8N+SILxFN1QeREAAm49DaW6Oy3UqXR9ml
         a5/XwItyE0/jlC5A7Xo5642TOf/LpFvq+KKGkuBMcPdbklsnvaGcu8quYB4rSvPQA3vH
         4XTSRARGTWBIQw0LghR0RlRA4XDMymcMDYvOHAsWrRV5re3O8ekj3luSFDo2ijBYbuOn
         LC8w==
X-Forwarded-Encrypted: i=1; AL+hErFitWlLkEn8wkrEJ+Bsk1ge4VYUYc5gqCIJseI2etnvP/f/f2D8CbcKflOUFcgxYVSOrtZz@lists.linux.dev
X-Gm-Message-State: APuU4Z/E3f9SdhxYtZqvzAKst7GBik1Qj9Qwh+XrQnR14Rji/7oTdL8E
	Qw6GxEQzlUBQ5oK0gWLK4E8ipedIso9yoy3Ap4aBgaqBeKNQ9Yz817591s5++Y4eMuzHVHTcE5V
	W6VmHCWx4dw==
X-Received: from pjzp24.prod.google.com ([2002:a17:90b:118:b0:3b1:15d2:6bd3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e710:b0:3a4:967c:6947
 with SMTP id 98e67ed59e1d1-3b182eac808mr2863948a91.21.1794418978458; Wed, 11
 Nov 2026 09:42:58 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:10 -0800
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
Message-ID: <20261111174213.3526604-19-irogers@google.com>
Subject: [PATCH v12 18/20] perf maps: Fix lock inversion in maps__load_first()
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
2.56.0.542.g3ef89b7020-goog

