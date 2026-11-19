Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108258;
	b=BvK6QbiWEk4ZiJQG1tmPkVShPuLRXDay+syU1TJFjXLZNJ08QP+1U/AcbfGoc5EvgAWl
	 agyIo953o542bRXBkjo1537eMyib4kaBM7snwhEHb/hfvWTaExpaq5OCR8ZAux1fObVlq
	 XCwgWfmRIMMKQacet2SqpsvVeRTw42JDFYufCWVHG8KA2K2R2hC3XlHlJbtxoO6ahZf9W
	 OIG2TJE5j+dT2Iqk/nDJ41zUPYtR+/R/i2ptPkbI+/e94QyThvwo7XB2Lc5NyCE2HQOcl
	 Lg9Yh6uCRw2hjAWeVToeqyDw0Rqo3GNPcWbaGim5h3U00M6a1iFtPSkWSEabMCPslmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
	b=BVDlOAb96ErKLpNVt3WKoQ+dFlfO1H7F6rpv3ga6waTGFEMwtHzfA2XNPpumKKztPtJi
	 93U4zHqte/8gtC8k15jjFuxAJLEvOZaiW+WShXr8++N6BFbo7xxXrJN/iLarNPcRA2GF+
	 +5OfovU99XZRPtZ0Th/gBTa2xPFHNtfEb9XFHg6mBs23bZ2kX/5IoXriOFWeyGhAztisf
	 eGQLdNa+DQUmi0bSPTlNQro1X+KtTYsRhI6UJqHOhz2kYKtQjryk8j/yho9XRiiwtRiUv
	 /3B3W7s0Wn7QKG9PLDWsIPUzg22g3XNiBe5VlZ6owWMR56WX76cQa9sWKi2D67GeijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XxyAUW8f;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0160A6F5F
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC0160A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XxyAUW8f
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2099676c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108257; x=1795713057; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=XxyAUW8f1bPCh0y9/GA9jjnuTS+hCxIqy2gq8dESxEsMQ+ULtlUbOhPS93MudJ8fZA
         HiT1ojPufnOU2VErOWt9/SaFcJ8lSAzsZYegJ5rDrwZ+DksO/vrUytjwIjZC7Z8ncNwz
         GKBgFRsPzCjwYmg7IVO69Z/u1RkVpQ/IwVOw2C4h/2kNeo6VFY5bEvYExiWZ7/K8AFxX
         gi66lKMxQhHOJ5JtgzLVAuqNxpxfLSXuxB+UC7tSYnJyTikuKwO7fJs+IWnxv2gm5P33
         tPddVS37Ov1EG6Jxe7+2NH66jibDfLQCm3z+d+uGFnBQN4XkOlRZdxGS+ADMon5hBLca
         hx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108257; x=1795713057;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=vrBZp2Mdq4FJUF7vdz3owdfxxNDqVxs+VMBP7+eYwwxnDGHojc//pNakFmKS0AKCGY
         qwmtvwJZf42TLKugTRvobDF0nbsSBkzdKaAhPhL0oQXSpD2yeon14htS6uTkgt8aZMNq
         7iPqK19nPTn7H+PK7f4/CoCvti9fZz1d8nO7h8SNKmR5aqZA9RE+Ki8ztv1SU2tqMhhP
         Y+Xb3eeNU/C0gIVYYUAhOuwJOMUYvYAciTUb4mkTLPnwFTJ9Y5+rGIh4sWeK7/F0QWVC
         zhMwGKfZlTE7Cb5vVnYFG6FV6jzer8TTjTFF04JreoN1huwOb0xf1x/uG4M4AM6VChKb
         btiw==
X-Forwarded-Encrypted: i=1; AL+hErGmKEdn8IPW752c1TU2wAfAxzBUcYmWq4CHTTz85oAtv96aSabbL7JS1K/zBfe/2Ftcja2v@lists.linux.dev
X-Gm-Message-State: APuU4Z8uweJjsyYb/wsmwOxGM6kP5pXcKV/p5Psebv5zTjy5ymDQZY1H
	FU8KiPsK3iOuOdP1uR0GpWNM0gn8xAFKhrJZpp/o8xlovBfP8lCnuYTCcfgD7BdQzVzwWMWuG9R
	zsyN5qFgFVg==
X-Received: from dlev8.prod.google.com ([2002:a05:701b:4648:b0:1a7:450c:8b47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8d:b0:163:c5eb:d42f
 with SMTP id a92af1059eb24-1b5567c02b5mr259999c88.5.1795108256626; Thu, 19
 Nov 2026 09:10:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:53 -0800
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
Message-ID: <20261119171053.1537233-1-irogers@google.com>
Subject: [PATCH] drm/mediatek: Initialize ret in mtk_drm_of_ddp_path_build()
From: Ian Rogers <irogers@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

of_graph_is_present() returns true when a port or ports node exists in
Device Tree even if it has zero enabled endpoint children. In that
case, for_each_endpoint_of_node() in mtk_drm_of_ddp_path_build()
executes zero iterations and 'if (ret)' evaluates an uninitialized
stack variable, aborting probe with stack garbage.

Initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/mediatek/mtk_drm_drv.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MediaTek SoC hardware.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..4b15b90b11d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1006,7 +1006,7 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
 	struct device_node *ep_node;
 	struct of_endpoint of_ep;
 	bool output_present[MAX_CRTC] = { false };
-	int ret;
+	int ret = 0;
 
 	for_each_endpoint_of_node(node, ep_node) {
 		ret = of_graph_parse_endpoint(ep_node, &of_ep);
-- 
2.56.1.708.g77570a6a1d-goog

