Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202652;
	b=ehmVklxOputejbL2DnyMdRp4lpNf1ec6xNMn6fi7jBmDqLadwSDCoA4DV+NncE4NXmZM
	 aUeG1oEOPaOWp7OQ0HGrKLSHJlrK6DEveTzSiJKloKmpmh9LZMU8qJ9wCyvgtT/LXnn8g
	 GsJR4CD1vHDszo5Oy+//kxo2mxPvjzUtGQYalmnFoFR/HPC4AWfyEO++w92f53xG1vtcb
	 wjJbRYLZ1dVx5d88m8XGckr1reeldzvjadeJ7EZlbIihg4lZJSkwk2RuMIkPhY+n+q4QF
	 ACMZTlU4zMscPaEI50kCzghrc6ePDC0dc/sL+nl4p7IOhPtM+hZseUZ9rr9aFqZrc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
	b=BLxSjV6PZnlT5cffGB9O5yTi+wljSJKwvq2X9nqtvqNvXEKGpmcaHpk3jGnFjp6ypSTg
	 LSDf1S3sVO767+eglAp/kxsgAkM+ktYVNHBT3PRJBPd7k+jpSU3Yz4uHfA8N74KTNDmGA
	 72unZLhPrVcMWNlv5gZxAKN6VO7gmYghwCoMczYi9Ll14rrbGo862c4Z7f+aw+5FLemuy
	 qO1+yEYQ4TL4iRexWWv7iFRSF0kxUrMMq/kT39PVJtjvG2UgNT+bdchPSrH9BOVg+VryO
	 RCInB8H5wxLM8BxRD0PBn5ffT9SSGRH9wHSQxXj6lSoiEIo5+lEbbQnP6OBsaiUM+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVfS1VkY;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBC606A336
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EBC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVfS1VkY
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2134082eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202648; x=1795807448; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=FVfS1VkYlAx3Sc5Lgi8DKDEJdv1uXLWT4EVR6WtHUSfLMCWLvCpnDILOkNmifEh7ID
         SoG5nettcfAeVux9tEZN6n9E4RJ7Y1KzM2a7WsxLMUbxU8yDfI4U6Veo9J7V+Hs3WnYS
         IfPfZvZ6Zl7xbxfBQZgCSm1pfgAN8c0ppcnA9g4YOKV6xDxL7BzmHTZ1Af4Wq2svCBFW
         EwhFY8qZjHTpkCjFvxI+NC35GYrRLcujLrh5K7B9Tx6QjcZsqyYETEAH54GLFSG0gslh
         ri4m88Xxx4/r71xYp9nb1MxmSLSjBTRR3ARFMAdVp0nQsuKZl/acFwGSZiNXs9dQYSfz
         OT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202648; x=1795807448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=eX2sAL2ZGllwvUcmukj+/0yioOF5hX5bE0la7FQR3mOcv1fN3XdcKZitfWCpK2SLC7
         WenFbxmsEuKsEke+yRAUA8sVEKNs9t2gR+k6GZvEGrjv2vc3cE4OCrdBy5v1Ni9fE+DR
         J7WA1G9RdfFw+qSc70POJpmxyTKkn8eXtk7tuAoEdpRgEUQnzvd/MW/HmI5XG6Exl0yI
         cuj9BmTL6kh8Q8CR5Ba71ZdL9P09ZEScFp5NDeOPOyEz8DNdY4T5oXOTnZJjvMLclC4l
         KmCUKTHWZNZ0t/o6Jn2FOXlnDP8ypoFemnyLAOIwbdwVTEb0Jn7SEpwWGIJAb1hrX6BM
         1zOw==
X-Forwarded-Encrypted: i=1; AL+hErHLyJj/WQpz2FkP0yb4WqoaPqCC4IrH+8wiWpFxtu2bur1G7yGQbq/etha0Xsy65RcRAveW@lists.linux.dev
X-Gm-Message-State: APuU4Z8/eAfLKUFLxunXPV5PFjlO/6lFDM3mmw9/yWv33C6YOniAwcc0
	tGQvIIFeTFBUNo5hTn4DJxLLmAiI0pHKN5EyT9e8kdrELnD2wkrvtKZjqWlaCHa5uHsk9Ikf7SR
	+fQ==
X-Received: from dybmf40.prod.google.com ([2002:a05:7301:928:b0:36c:9b55:8436])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7188:b0:384:b800:2adf
 with SMTP id 5a478bee46e88-38571027b9dmr3890778eec.27.1795202647857; Fri, 20
 Nov 2026 11:24:07 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:37 +0000
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
Message-ID: <20261120192237.2870582-3-elkin@google.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8189: clear afe->regmap on
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

When devm_regmap_init_mmio() fails in mt8189_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8189_afe_runtime_suspend().
Because mt8189_afe_runtime_suspend() only checks if (!afe->regmap), the
ERR_PTR() value is passed to regmap_write() and regcache_cache_only().

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: 5404599c3292 ("ASoC: mediatek: mt8189: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index f39b01590f71..85b5be6d45ec 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2563,6 +2563,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8189_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

