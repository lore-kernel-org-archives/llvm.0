Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561977;
	b=vGkG1VJQDyQE+gEuroV4KdRbcmLKiVNbmvgkzbTMuAZ6YscmPz4/65RrLr4qDjahJyyf
	 wFQVk+VHuAmixdtyQxttBG6wSUTC53CRYPfLeRZTv2dLO8mryEpJgKq5dLLI0fhtVdzhq
	 y3bU+dmKzMxN+tC4GVUKIrVEkWe6a7ynQlLQPy+5A7iEZhd6kpwBS5j1Fw+GzTlVDllMz
	 +y7hYqriBrKIrsB9p9BqFfSfoYendTcoHJrVpSiTHzvez4AgSb8PupngSn1AIIoFkGoQr
	 k8pJY8rmE5xbY5yu+roGqYgPDE2CsBgQKulc/Cg9zJwoi0QC2ep7nHP2QisVqXVic6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
	b=sLEjHvvTysHbmgM7GG+yBJx2ypmI6AfEFqDdoseBaqEOFrY2B4D8UlbY9n8REVlxYSxm
	 CLcLeawbTBN2isBytp88/r9wP4XaqmbwcXA1wTXy9JH8ka2nTvd39urjsVbRQi63toLhg
	 hFg/81nKwmJFXMcWH39XGA1a7ro9iC6C3l1xt+C5zwZOooqahix5swKNUBY4SQgTYAZRD
	 uD9efe0KQfpIqS7J9IaqkZkQsYZ/B4NS0KMXGWJ2//YMwKcN8fYRKTxrFHQBp9TBNalQi
	 7xI8jzjusrGBdtH94t8RtWdkrY8YBOwVt4A+iqgHx2LMmvFPwxlv1A4RnAVmc42/Hxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+q2na9k;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C07606A31E
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 23:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+q2na9k
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so33393775e9.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561976; x=1796166776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=T+q2na9kwZfEXMailyHzD7rtFhlsjZuic99Avsy7MjBg//x5cLpWoBBP1GGtC0mrwJ
         tz0OO47kcSgLquq6v9utwIkkw/tX28s2Gnnafm7dj+Al9KGOuCmDm3YmDjB2v5i2c8wr
         DVCRPeWjKYy4w946Yj8YcSKd5jVux+5PEIYPET3YLSr4qNnEGJt7pNQ58OFYzOJfnguQ
         eGDsjbZh6gqjXiCM5LjpfL8+mxrn/3w0Drq9KySbDcWw8WiKEU2nyS7G1oyXsbxWP/q/
         EehS7vVX1JY95TVhFtITVYXxSFGhT7C1NfYgL/+GPlSoM5HwgiaxT8oNpKxPPvLEgWab
         gA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561976; x=1796166776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=xsuMhEUE2O83a34rDBfbfyYwLg38cy25gRKzL22gVCl1wPspUymmnR6jWpvs+HU0BV
         zAj1g0Lu6zOOKQdtQtlq+Kguk3PaWCJi092kUegjNTsKv6bGSwRvyqo1jkbr9vAIuc3R
         zQbpcbgD/gBPIRuDAkmgJZL3IPeNjGkONuA/uzL963aithsozHPF42HBn+SZGHbvwkHI
         24tB3A3KnfqnufekNQhfpkbCNQMD4ASfxCJBymGN1ZbdxogHHWVkZsRjW8OTgQkSUO6D
         9nPR8GVYhmA/oI0hYz4zU9+dW4vFM9wxEx5lLX4rDR2VXj1/vYwg5Ntkl4l1w8H2Yklj
         DuJw==
X-Forwarded-Encrypted: i=1; AL+hErGhAci7GW9BpZMi2GhJ8BXvDCp7YuA6bqs7J1FBK6Bsak9aE7zWBKzIvLxRBBghnabo/PSC@lists.linux.dev
X-Gm-Message-State: APuU4Z8Dw54ll5OKWUUxdUobwRMjaWJqg6oOwnOP94HxgKhUKwwlmuUz
	6ATIdxBQCSkYwLDc7VjOM7gKspA2dP6esUoRJ8ZuEzdfzZENAYHg4XNO
X-Gm-Gg: AZFdTZewwO4hVYeVZPNC3gKjfqyZ5JzMRXwFA640fr0k0uTIiXYfkw5MC3/lrkD7qBN
	qvHmz7IU5qXYvw3QCIwmVhp0WGribEB/A1Ag5GSKNfbDUoc1WRVq1+7zb1Pf/dh7P396/bHqtkg
	cZVNoj1NP58egXNqZKbC4bYgoLSS2mJLxcZJ4yRuldUCDQ5rqEa0PvamNCoWn7QBRwueQZM2kLk
	NwYkgcAMHuwB7D2qA6cYifFUo2Re3e4wmpJWw2EMjBiwlPQ1Zze0ez5ziNyGCz3Iuamz0gtb1ZN
	/UEeYDm0JiYENxXtuXgwzs+g8tpSG25/oCFguB69p/n/LqmZAqdP8l5997wvPgJNadJxnArI608
	a9mY8KyZ06LiKYGmOQCY9cGDOivAP5tNzFEi22mdpPVr0LLvTP3Rm5ja1dXvU48qoKT/VyrK7r6
	cSFZfw/tS8fqlxjNG4TcF3+rsZvtVquMiMpi93fFvjGSfa8H6ZUeLnZbIyZmBfqSpu4j7WDaTxb
	3i9p/im1H0Cjtldd+OvqlrpkOoNm2Eb8XqT9+yqI+CpxR8Yr6G+3/ztCmUQKDNqShhPdWBpEIZv
	o0j+dU/yTYW3WfuX9SV9M3po0pB3UtAVG02KsQQSzUuklYaObq0MSMjpRawhL4WnUjalE2wdfXJ
	qotZgZ1J5bk7fu40Z2ZvHiznp
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr336408085e9.10.1795561975632;
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm527766585e9.3.2026.11.24.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: fix objtool warning with memif probe loop
Date: Wed, 25 Nov 2026 00:12:43 +0100
Message-ID: <20261124231245.271869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Objtool produce a warning when clang is used as compiler. This was caused
by the memif probe loop when assigning the irq to the memif.

The warning is:
>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

Fix this by giving a fixed upper bound for the loop for the memif as it
seems there are some problem with detecting the runtime value is hardcoded.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index d47edb630452..b17d58f25d9e 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -447,7 +447,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 		return irq_id;
 
 	/* init memif */
-	for (i = 0; i < afe->memif_size; i++) {
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
 		int sel_irq = an7581_memif_irq_descs[i].irq;
 
 		afe->memif[i].data = &memif_data[i];
-- 
2.55.0

