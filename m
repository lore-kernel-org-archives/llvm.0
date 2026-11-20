Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202644;
	b=E7p+M3AmmbAmQ5vACI5c/n79DNtSXrMKhYRqdhvIF1PRcLvoNVz1Puy3VcyuSefBx78T
	 e1e7y/2Ad9gNnOBNAGaurSs+dyRXcuDfS4WdbmipTzIluUHQnU8JyfIsJ5C48WE49YO1p
	 AMNSRX+n15LO40kMj23+V+UqAdFpzzRyXBBkux1lUNQZ5rxvjnfm9kmXJebrDD/jeGBL7
	 KJ1f9DvhzafJdin3RhMQhqGvqjYI2yrR44fqZ3dLHVvAFcoVlCqwdETDdveIb7kNYDN0B
	 TH3FvDZW68NLWbGOKI42YE0NMR9GW88OgQTVX4fx09SkdhExJMNt5DQJt6W8bLldrEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
	b=otWDIWbrf3vcwpJdrbzF8CakGPJNxLFEBQHaGVDrXtN54ImK5aFVLn4rGfoGrk0jJXKv
	 E3uY7F+1GxknFQ83+t5RoFbsmfkR3pDOPU1nHn6/yI4gvHsZrpAZyzx0hAidYR3D99IHk
	 jy01LRxdbLtHRtQKMEZnG6/M7aE6YkSi+FDRQFR43DUC04/JmAyB57AIFyy/MgExqxHjI
	 vq6DvKAi4iCSiOO3mS5So+IY8t9vDoI4jJW0xPrCCiisdMjkDs4NgcUE+IARPe0eOgTpm
	 3ReomCikFtGiJVx2vrdFE96jVmh8Lqppau6Ck7jqc3W+hWX8Y22VJxLrVndyUvWErew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RxWWeWmM;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE16606A6EC
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE16606A6EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RxWWeWmM
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so3646326c88.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202644; x=1795807444; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=RxWWeWmMnSBBh40a2srkpSYZrSICKp33I+I5b7VMAWsmtxxctSa/C0Uc2N6jHhe+O/
         l4X61O2NohRJIVJdlu7hX7u4jcNIkPTUGWjAEbHAdDartjNJf5enIBDnSP5zJVYpH1aL
         TISsBAMBAZp4pqaWA19HSfQ9Dd2rpplDQoAH9FyscHHQd6ijL5iDQEElOnJh3veAMFGN
         tM0q5mfeFn6BeAem0JyXKR6ifyF0yyxgy3PZLTkyed5tatg2iwIvldDjkrLPZmr6JFWO
         tr+IGDqv7s+kETbtUO9RaZ+iSDZMm0AWcfWm/S0zE2xpbVNMfgT1lNHqwgyut7Ia55iE
         /nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202644; x=1795807444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=evEH/PfuNoEzaK/3StGc/S//bhTi1L4M+D1JtTweVUk9S1NnZ2mWLrp8ECZb+G7Mou
         hL5BByLs3tipaabZSrmOfTruXtJE0D52tMTMi7+zBIY2v8BS0w4OapO0NhyCnRv7cw2i
         1QF6vMVXRylUtpvNl2z+nOeyLMbNuSULV8sSPPaVuG30xmQiyPPnXHzM463WsOC10Lz9
         ZGMni2snX7tgjDwe9Eg27Cg8MOOsC0IoUbXNJJCbnuefWMcvf7EwH53qZLz+XOnAUJQV
         nESE6OD76PSy+o2U1UYbB14nmqCerPNeThIEEcL0hkx1ZLhc4Wu9rjWHXHO43W2i70Kz
         z7Kg==
X-Forwarded-Encrypted: i=1; AL+hErGaXPNzT2hmpFfBkLIK+3RZlNTmHz3ZPMrKYHwKCIBrzVdFLz11Y85geLQt/MMSMikNE7bH@lists.linux.dev
X-Gm-Message-State: APuU4Z/fd2G+tu0kiCHTNZStFK2PjwuvmW55blLbHNIYQQKCPueIWCCn
	ABK6KxLyn495S/uT+n72e11wBOXJiS/ZJBEUoigGB0XZGjlkxNQxuA7McEv92d2k80GyYZO0fTd
	1cA==
X-Received: from dybmh16.prod.google.com ([2002:a05:7301:f10:b0:386:33c7:a7cb])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1715:b0:144:f089:b189
 with SMTP id a92af1059eb24-1b55691a623mr3662644c88.36.1795202642255; Fri, 20
 Nov 2026 11:24:02 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:36 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-2-elkin@google.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8196: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When devm_regmap_init_mmio() fails in mt8196_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8196_afe_runtime_suspend().
Because mt8196_afe_runtime_suspend() only guards if (!afe->regmap), it
passes the error pointer into regcache_cache_only() and crashes.

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: e38353138a09 ("ASoC: mediatek: mt8196: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 82b5ae91751a..3028aa82c4a8 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2450,6 +2450,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8196_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

