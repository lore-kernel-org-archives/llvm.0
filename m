Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108270;
	b=jv7ucMyU2nVAOUuyVbdiziTXCNN7ZSWf6uKXNLyW+0pGm3RzTLGmhmqzHruonyhYZY1P
	 1lud0WA9pPPkkELwxrnkYEBinIzm3y8CS+gQo7LxE/8X7BpsmWvjFbHcpt4yvpJPr0bQ3
	 CoGwH7dDleO7hGx1LuUW9Ri9VRj2HAxgXdq/zzYbjjSsUnA3aUHZ8ByAMtIpqrG/yXFjQ
	 AEcFMXbTBlJhSPUoH/R5Nhb776I/+WMrEv+XRUx4mnTJy03RClIplAxQxS623JGanjdGZ
	 CUMPhWyBPaVxWnl7HohqmESDJXmoWK2Dy2MWBBdKdOvHDoIwqAhehhYSqCvYfICIbkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
	b=EcSwv53k/6CvdhinDLfz/+y420p67jsNCYWooMdD+1NX+M5qxSbgii7pdCexDbJplJKy
	 4xO7kII385DTsSvY5Wfrzr752XMkEnM2xQTtYGRt63plAOoNL3JMZ4rZSb0CxjUtpb3fc
	 MoJbznL7XdeR6hVYLpPiZmCF0vw0wldFUCxxYpSaif2z4v0S0GIVwz55RNsEMPcHyE4TA
	 wq2BzS0AFkNSaDPsa8b00uBwLxpyWot9jhxbhdv6U25/AbV9pW9YYbAUESsmKEpZ8mtcS
	 xH+PX0SGgmEPbYvf89ArwDCkk3U5W/amWWA8804lh3QAb/Ws26x8ddJ5NPrtiSKlHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YteZHHhq;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62CC60A6F6C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62CC60A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YteZHHhq
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3047801eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108269; x=1795713069; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=YteZHHhqf+mBHk9u+Hi8DdHZ0pauV/yk4l6/FLg2GL0YEQ/MV4JXXMGhgEzzxx42nN
         L/lgADuC/RkudG2VOT8NmYMz1eOL8cAmChi/VoY0SYpkzOUM8tm4sk63QYWn3/uU4VRj
         ecdVqfmyqXAkIFHazmKVF1fXMRknL2LtuEiMEhdO7MpHYlrgwKfj9vQ/UsaSUfSp4OmW
         wbaN9euMOBGH21cQg0ElwimP09/REH4nXK6C1ThJe0g7PAeKxJC/nhNdiqD/7BLw8Gwd
         Q9eiMkwhzVq3EHyss+468lo6qoIrHewquLUZ47DVRQBYp3xDFC6JTqn+c1tVDmi57d7R
         tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108269; x=1795713069;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=Ilqf1KgP2ndmbio+jYppvAzscWaLMjrw3rUK/4AmWDp+6oGo+KTalWFVqJqbGmipqS
         QoKCwOuwtu1mlt5RIyZPprn0g1BDgtPhv53Ao0s+sudKJT8i0Y7P+zxaNXoaDklVELcY
         7uNaZCnCccrwPDejwi1/JiR1g7TaolkLRwMF/oyRB86Yo1QjLYiGauFY5PxTmwtcAVA4
         eRhRAqhz6muANsNtoSUmE88v5uxdp6UGgU4TaeTRmAp2B3SFQvxn3XWfcD+0UKyrl0Z1
         ZvLcgrGNPdidNyiH5X1jQlWqSxg4xhbFSGOhXw5dPO0JlCUzdLSEtrG1yOAduqXx4IhB
         USeA==
X-Forwarded-Encrypted: i=1; AL+hErGFMwa58HhbF0fI0jXN8OVnfWepy9Fwz5y1I9HfE7jmBdnNqXgY7so9ZUempxRQ91ru5om4@lists.linux.dev
X-Gm-Message-State: APuU4Z/2BK+oVV5PROu0o1MdFg6NWqAkU1ELydou/y4fgQ4V5RfmRq8M
	LDFyDG9P4yrRfUjkiJrLl4kZmM54tYwcI9AXbNNEs/xfmnjlIrTkQF65Z+3Xd1pmMH4XyzVKjQV
	9GQtiA3wG4g==
X-Received: from dyru27.prod.google.com ([2002:a05:7300:4f9b:b0:36a:120e:b9a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fc19:b0:384:b2cb:5f76
 with SMTP id 5a478bee46e88-384b2cb60ddmr1689970eec.23.1795108268800; Thu, 19
 Nov 2026 09:11:08 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:05 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171105.1538194-1-irogers@google.com>
Subject: [PATCH] ASoC: tas2781: Initialize subblk_offset in tasdevice_process_block()
From: Ian Rogers <irogers@google.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When tasdevice_load_block_kernel() processes a per-channel firmware
block (dev_idx != 0) for an amplifier channel whose is_loading flag is
false, tasdevice_process_block() skips the channel via continue and
returns an uninitialized stack variable subblk_offset, which the
caller checks for negative error and adds to the firmware buffer
offset.

Initialize subblk_offset to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building sound/soc/codecs/tas2781-fmwlib.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on TAS2781 hardware.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e6429b4c8dc5..a5e6734723ab 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -897,7 +897,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 	unsigned char dev_idx, int sublocksize)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
-	int subblk_offset, chn, chnend, rc;
+	int subblk_offset = 0, chn, chnend, rc;
 	unsigned char subblk_typ = data[1];
 	int blktyp = dev_idx & 0xC0;
 	int idx = dev_idx & 0x3F;
-- 
2.56.1.708.g77570a6a1d-goog

