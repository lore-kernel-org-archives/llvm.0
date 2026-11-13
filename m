Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588160;
	b=DlYdfNkOWTXIz+zDSiBhpk3uujcu0RfHRH7dVFbC6zDoKoSm2NCvkAYeujSRIb2Ytq0H
	 8/r1kNziOitZdsOEWxk6J+sEVlHj6itsJKiTboXFqE5u4nSCZADy/fkz95hEIu2+loorT
	 5fIKd1qDtlQPm+cNby+Qcl0DU1ZEHO18vNDEpLw+LL7UlQBei7pWIpiROKH5XOa/Uhfed
	 +bOud8WtUeQHPokj17heNsaxEhH1KliODsylz2KEEWqoO2UKRiYm7G983zHFTRdMuB2Fc
	 WpBsoNQnsv9erWY3zjJlOLygH8XSI2yLvk3r+tZskNU2GcVKKO9IBVgjZJjYVr8HzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
	b=ff0tzctJ6GQl09Ou4MXQ1llBF15T+71cCjIF3tIaw8wtCwhrBG7rAgAKo07hDzV3Rk0+
	 d13zI/E0AMNEHwqAkhvFVRkaRSEXbPipthvMDXsPSWlNcPIEYiBG7Kgp0AHwZD4mzO3qo
	 lZ7Ritqb/RvSqXCoM/bTYiPyl0DJ2RUq4Lm1PBu6Y48R03qKJD0AUhSgetancdBkzfm66
	 4wRfiBJ9Wzhe7rS/t9q3298qJY1mKLmxBjEK3+SyeAtDI8eVXBXcjKivZE+JTX8jUNf6f
	 fCGjuDyjSzx/kSEnyP2V35Ns8OMgPRcl3GzqSLIRKvBfFIO3plJABDlIQsslBIXbPIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ltiKpwsD;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7596074E28
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7596074E28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ltiKpwsD
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso1080154eec.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588159; x=1795192959; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
        b=ltiKpwsDve18m3l61ZoeVpYtQktg8CV9HYMK9RD2hQYHdgWalJdRmLhuoy85phSb//
         jOH0gRsxvXU29yotdoiQ7jFnS2uf6hF3jmgPi9j5BtjBhGBkbotPTeH1zB3lmlpj8p49
         8QHF8Se/yInEaWkH96D+FK+fVXjc4WPHcH5xR9EID7xdMbBLutl0F7Z6AfWCQZR6qtYx
         /aIOI8OlH7usIVar/jC+oOo32Y/NECV0hxwmiIUL7o75lwXMXLjMzuOv8GhohpJ6XBSz
         sIt0OoeIjHdVlTS8qKbsr/e8qQTY+mOqbCdRLPiUOPLayDv+W6pOsJ5jDJuNlpstqwR7
         L45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588159; x=1795192959;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
        b=JnEBmQT+FMSNhRVa17plFIR/UbhQCmZompbNfmL6EjvaZ+O3bWJFohsLuy60PRA+wP
         ASRxpNMm2dHKtpG41yV6soyyHKhb7TGqOFzvmxgM80BA67aG/gCwUQu9yswaK3cpCLL8
         dTbtVJYTKZrBvDaZVRnjYCtWB0Yl+HUPaLw1eJi2e3M6g67jaW/KkkRj2lcrGr3Vhm23
         znolCgeWUhYSZDQT6ekMbSBEmIFpqW1cqlYyeMUfMyGeNjTey9uuFkItxX4zdgfkGB8T
         xnSNQsp8qNYog4TQ0WZiYUxuRDCraP0mDmVyL8sAxHl7lm/5mhtxrCGHvn7Yj8GwPYVd
         gX9g==
X-Forwarded-Encrypted: i=1; AL+hErGQGb5pS6O62BvMCNmUTY/3igqTS47Cpc/kIHPQubB08cViODbjDUuQcc/3Y/a18ahxF/No@lists.linux.dev
X-Gm-Message-State: APuU4Z/pkLVb5pYKVzD/VDbg7S2yA6tW+b1whSzKEnWaBLLAUFJxwfLv
	SbRfpHl+F2aapW1tYoOyz/vUqLI/rz6LBnbJ7fuwg2VmhsZRdjr2gHrl8Ub3WOQQdASg00nfcTP
	KOkW0VCuGFg==
X-Received: from dybmi46.prod.google.com ([2002:a05:7301:fae:b0:36a:eec:f68c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7481:b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-379677f25d5mr3766972eec.20.1794588158792; Fri, 13
 Nov 2026 08:42:38 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:50 -0800
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
Message-ID: <20261113164152.2095566-20-irogers@google.com>
Subject: [PATCH v13 19/21] perf maps: Fix lock inversion in maps__load_first()
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
2.56.1.703.gf848ed807c-goog

