Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202588;
	b=YpOr9pVLKgBSacPfjwUzjOKZfNEeDjxd3PhUEF3mL+NC8+A/sz/50ZVfVnst3H67iMD5
	 HbPHSzP/e1Ww7WfTwRcRugpaDEsB5Jqw8zdQg8wqQbp31GSdjWnYf4PIRV4Q7Wp95/qe8
	 wb8Ptjkv4JZdJajy9MyGhb/yCZku7wGdYeOrxct5XUR0kxL87JAlHsVXQbonsqNvuHuQe
	 0ZutTi3N31LMtjdXNFeAJxeGxKlJXDgw9f2CAAM1Ulf/bYNmV7caF7mhOzmOV2PqB+XFb
	 YST4WfvVfr20tMD5Q5GrRxqOtjDE0e1lw9y62zBCWeT0hMpQVuWjTgebwRVr1Fes86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
	b=4+xiKMhIFNuNB/xYtmjnIFUexHA9LOSXqv35sM0qaU//rGng9MvrVkNxgN61F0QLfp2k
	 t0Ij853PAvL3A6TO50fY+3ytXsHspqwIo5tSpfchcsto/ndk1N6QrVpEZV3i+4j6rV9HR
	 LCsL4h5yDhhLJBAjsvvQhRgcryEoOJ73zHtoy/cn+cjD/Fc4ALVXBAqdxrY7e0n0CNSoK
	 hcjBBg/qXw6L5r4UqpqhiQhHnU822zx8HjhvLFOQYvKPnrgrCn/4j1X81hvSUaYvsR6ck
	 CMcXenArq5EDcTJ/yujAFIZNBAJFL0fvPAKblwwQ6J6gcIVXf9nA+AeibT2M9Y+UigA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RYhbwGB0;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3A606A6EA
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E3A606A6EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RYhbwGB0
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so3642349c88.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202582; x=1795807382; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=RYhbwGB0PbgbtU+nw993hajiNjc/LNLWXRmmsoxDsc/AtFjC/o6oIyaU6T7XnaG63l
         RLEPa/pjhfJjfTaUFbRDjcwCdFk3ovzhQIloYdhQFaoXD3dHFNaZUSuQo/LAmhcKjrpF
         9GPL7tZUPsTiHGSr1LlImXsGSfOr5vJTejQWjBEBY2fh90l8eYJi5IgHlyVmy1S2gdtg
         x0R42KtR6moU9WhJzLN72I2cPjR2BfLqa70Zvp/auaPtbON8q+jF5AAycthYa37R66d4
         rKKGgfxfJ8MwBc53u9Obldxx7mUdI2i4TiJ03uoD2JNaTFP48vvphIkM+2RU4YK/kixi
         GN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202582; x=1795807382;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=uB3yM75ULoH4J9xNMwO9htiEAlN3pUYJO/QtUOaMShzAb8Ud71px2XeKdwn5r9W5aB
         oGlF/qQTD686aNWf4mM9y3OL/xZ8tOXm+/6m9meclm8cyhLSj2VoHLXGDceAQoChfkb8
         eMwTJHESSScHSaMInhmXRV8myJ3onw6kUV1PhvhVEVFzPrSwxwkpr5TVFQBAZlbIyqJB
         7OE6peISelqD3XAOiKNO8DhOyNO6t0dA7gt32lnHpDQ6n49swv2eJJP93RlaeewtAsIq
         BJZL2U7jq1SY+gIvgnTRgFCBtWxmxswX+4s0DsxLBeUTYzNOdnC+olU01+gu7lLlzFtv
         n8YA==
X-Forwarded-Encrypted: i=1; AL+hErGJtntSg26oT1pQYBEW7UA1/MQCi1TsSYmE6BDdxgxC8SaHTAs1CUqlMiKB9OGom0S5fuRB@lists.linux.dev
X-Gm-Message-State: APuU4Z8sQs1WOXZ4yoBL39JWyBHEnNSOf6XxF4NO8R0PRmAyPRD3sYAV
	cm+Z5L++Vk7G6/+TYqhngfzO9N1UXw1V5/jhOcNEgWmkKzTgXYFmS+G0KOKmGXlXVmUOJsvMcn2
	B9A==
X-Received: from dydu5.prod.google.com ([2002:a05:7300:51e5:b0:384:8179:4ea5])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465f:10b0:1b2:48db:23dd
 with SMTP id a92af1059eb24-1b5568cfbcdmr4131052c88.16.1795202581997; Fri, 20
 Nov 2026 11:23:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:35 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-1-elkin@google.com>
Subject: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio()
 error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio()
    error
  ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio()
    error

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.56.1.750.gf70dc682cf-goog

