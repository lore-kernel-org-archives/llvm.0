Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645550;
	b=yXtTijUNU9qhTtopN8ajiobMRKjUrLErQG+iXC0Im29Q2YUCA4Gx3aAViGQN1nORQ+SZ
	 LpQ/LbbpoCXzllFfLul1Pnc9G7R+uF7wYS7KUXBY33/u8VnLDdc05jM/ctOtqxgaEEywv
	 d4knbFNObqKUhOaDRpJxb2h8DZ4AbJP8P/m+YbluEmpLgxYUAheDxxI/f/3nrXFzTx7+h
	 5kZ0fK/FDNuaTgeGQgBOZM4JaLflJmvXj6Lcjigr5WljRsEhm/HuahSPTbz1eXh4SoQvL
	 bqH8kk6YZ5ixKb1scIPkw5NDL907MT8m1WyFGmkcAnYyDQwnDBX/UWUFn9hqVy9xB0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
	b=o0fJ3MAv5qEQx5PqA7VxgUqJ3zeHvbvktai5nBwtk36OdnPwyJ3Yg/OT+ZERNE6zFQU/
	 RZ+f5ZIaz3M8yg3KUWMfJsUmw3HyNzZrFHrc9EBwQqprXqZ7pC36kVXNTpGCFiWRkFcje
	 Ko7srlOhcGCLBEfdLP0CQkTnE3K/ODBSziRjAqjPqWb8h5VNB6FeFUGqczGpgUA0u1FZR
	 3ZE0E4Ct6E6auwmwnOaqNUyiRtyLEI4SZ/mlKQRj19rDlJH8gZhTxY6S2y418mHKEGpmE
	 hloWxRvZaZB5Y0Zxuzi9757GoS575FMnrttiY1f+BMKGlvu9sVlOFOfLJZfgrMO5PnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bNO8NlTZ;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C9606A32A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bNO8NlTZ
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso6416310c88.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645549; x=1796250349; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
        b=bNO8NlTZKzyhKV/rjmyrsZWd7ZD3Eo1zgbUgKQyWQifJOjdgGHqv1of2DXf4HVhaEe
         ouU7DEUVA1cNIK8SVavg9wGeeG2CMhn1TfOjgLzHWjUqLBWin8KsjuRhT6II/wcYEdSb
         /uwz87w0mBToorAwYIM1rZU8f3uGIPb4eb/SSxGI9if5REZN8OF4SGhnTH8+NmiG/8vC
         pR8kSDoqaoCkX91SPbHmgM+MVqQ63Mn4e8gOBGvVmdPsGIR2ivpQwNMPjmBK7NNSO07C
         X0pzbTTwwetfWoos6VLYS1CO2u0C6R2qezGNBY6SfhMWk0rWp+7jDw/NgK4vSXN6/gAC
         FjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645549; x=1796250349;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
        b=UiR8WFwgxZrOru9sK3awEul8choM/GNNxoSUhENxSudNy3HP5RkD0f8e8GGdIZK0oy
         2PLsaZFFJ3KuCtAq6FvXj2gKUIqguSo9hrpdG5qwnF2fOVCDLYP245i/1j93ktzGNStZ
         bBfTOIiihqCglqeA/4bVRxHJjDEL/3diBa3eSmV1ckD61CPqXRSPvMdbqG0/rIW/mW8/
         lU9yGCBsYZeq3LYAyPs6a0ggOmqexS1DhDZh+M37Iiz8Cmr9siER7FBAWUuIl4sfA6y4
         VGIeVnSu3xz4nixuOcKyNDvmlzYrsIcqWT3NoYDNGVzMFFOxxJB+FZXPofXegwToYYbE
         iogA==
X-Forwarded-Encrypted: i=1; AL+hErFYQBiqDCnE/l+G/4QhLiBiiJJZmIC1mDo/NVXS0DlgC+w9P2KYqympp0HOB92MihrYuujI@lists.linux.dev
X-Gm-Message-State: APuU4Z/9pSR4HMWLcCNgrOr6uXFLb2ZjSVlzvdjYZKtJ4BSjSp6NOjSv
	5iRno8PSu7hK2D9wiJnBdG9ipnx5YXFdzkMoir8L5rsD+lts+4m5Ez3e6HEGl/6tIHGcoM4sRcM
	5og==
X-Received: from dlbds15.prod.google.com ([2002:a05:7022:250f:b0:1b5:3561:2fe9])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:10cf:c402
 with SMTP id a92af1059eb24-1b5568a17d9mr20769440c88.10.1795645548479; Wed, 25
 Nov 2026 14:25:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:36 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222536.1447211-1-elkin@google.com>
Subject: [PATCH] ASoC: zl38060: use bounce-buffered spi_write_then_read in bus write
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In zl38_bus_write(), the local stack buffer buf is passed directly to
spi_write(). Passing stack memory to SPI transfers violates DMA safety
requirements and risks memory corruption when the SPI master performs
DMA.

Switch to spi_write_then_read(), which safely bounce-buffers stack
transfers through DMA-safe heap memory, matching the pattern already
used in zl38_bus_read().

Fixes: 52e8a94baf90 ("ASoC: Add initial ZL38060 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 sound/soc/codecs/zl38060.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 02757ae2b58b..fc67999c84e4 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -534,7 +534,7 @@ static int zl38_bus_write(void *context, const void *data, size_t count)
 	memcpy(buf + len, data8 + 2, val_len);
 	len += val_len;
 
-	return spi_write(spi, buf, len);
+	return spi_write_then_read(spi, buf, len, NULL, 0);
 }
 
 static const struct regmap_bus zl38_regmap_bus = {
-- 
2.56.1.839.g22a8290db9-goog

