Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107982;
	b=I8TIBE0rH5YdiRP1rWP/PXnjiDiEf6D9ZuVGsK4/fWD05l3Zp1wC0BEiFUEjYMMFrtOp
	 yI8eFbKgWh3Q+3yvZ7D05XXAKGGLqXc4uqH2KYWcarAoYRjpgvpAimaQc09KcJuICMqvH
	 vX7QXaaPiymC8MIGpOoOOEQUexAvvGm+znmYFAhP4E1/aGD6Pg5D23sCYEN7kKMzGFHI1
	 4zgTxDG0wWHGkUdAeRb7bbJ+eNYk/zth5UrWTh3c8SRR8LbY5ypFHldnTE2FZ4kojG8jj
	 f/Ip6SIc734Ko9Y+XmRqampo/3Wja/UMZ0Y/Eb4iPP5b4PGqqI9X3WfaiIJdc6xk68g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
	b=sdVOdU5CzTqiOiYu1g8f4m279Vs4TOj7aD6hQZ9YljvoA1fv5+gjdcQ/yS/O3iqkzxsK
	 kX5BfTdqifChwM0bLl+U6hLUk0Mg7tt9BU9EjpggesOpCfOeV0KVpSFKz88Rfuh8giVLz
	 654/e/tA8+P17GOdtGNokyomWwfJQ0fItBgkSUhXZMPvcs6dTRdW7GRAUI1smAaSNxEkY
	 wbhkH0MhYi6OnjaINLcQZbDR2BkENP+9fR8N0VB9rzgQ8fB9/E7F6lFo+agXAX0EYPfDc
	 SLwwX7KMH+veBZbMq0+GproHNauogHoOsfMDYVF4HaAOOoAFPq5P9wRtIY01NZDot5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iOF/Oeo7";
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83360606A324
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83360606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iOF/Oeo7
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-70273936138so2274742eaf.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107981; x=1795712781; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=iOF/Oeo7Sg3iB8gE3lrEdXwNVIWIBDVvZf41KmTv5fdOtoOT7WwmE5o6OJJzcmbx/J
         xNX+U4Yhiv3hEvBzNbfqtX7A2d0I7yCVurgu7v+rblq2i1U65jX7tpAHDSX47dt26Z9M
         hK66H2DWTUPCnoFWitBLAPzE0Zk8pR39MnZrp05ditKaMGDkRar65m5UyonSoX6bBFoS
         Y1lTKOExxVNzPftMkT3dDQ6JFfF5hDQAYJo87lvkpkkKVbR6Rjf4taLhzfZzvnyRJMpg
         oH7cZafiIgSX51JUMEagKwAjnSB16KQDpJEAKdyj4Zm/Bo4985F06W0IwM4ODql03UkG
         YX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107981; x=1795712781;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=tkAD/YBoUZ9VR+3yDH2S1yAcrvogD3LukCOdN9DSRoD5iUzfmrdTapdJtG7//9/ErO
         bzBp7yiNlDyaS7kITVlLAMJWjL/iZEiIM1cu87BMBJNzJ6RNoVbh6WYbnmEkmguRZ8Qo
         OmvEj3b/6BCFJyC+arYxgJBR0+KDm/ZnzCACu5Pw7eS0ustN3SBFe7hzTMtWNLimQzvZ
         8CRb8kOBsqSbZIRotLSfbJZjN4K24vuc9JcwGwVFRLf2VzN8a2Jb9MNUTxQFSUWuFGbo
         zwYWvoxxyr35iq6biZSwtZlky4os+2ZgObuQVE9MFtKHYBmZWHeFLeHZLKXYZ6fNiCjw
         w1Xg==
X-Forwarded-Encrypted: i=1; AL+hErEXzoAxRTcBhDXCCwDwGAnHrMBkXKUdEpLxZSsFtab1rEQKYoZeM2XD3LAH7uEo+RvZbohz@lists.linux.dev
X-Gm-Message-State: APuU4Z8J5tgUnlwNBmoTfH2J/x8Ym/xf2Pkm9HRYJPiYWpsjTJ42jaxp
	wjo1F+biHhc78ZMPi0nWz1sRtn1EPjHuZ1l2t3ZvqCWNZE5ssh6nsWeTGKuJsu1z3sa8oxziuSm
	VqlhZc4HB5w==
X-Received: from oaccw5.prod.google.com ([2002:a05:687c:2705:b0:4ad:bde3:7f14])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1620:b0:716:d2b4:f895
 with SMTP id 006d021491bc7-71b395258b4mr197475eaf.62.1795107981165; Thu, 19
 Nov 2026 09:06:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:13 -0800
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
Message-ID: <20261119170613.1519353-1-irogers@google.com>
Subject: [PATCH net] eth: funeth: Include FEC stats in fun_free_stats_area()
 DMA free size
From: Ian Rogers <irogers@google.com>
To: Dimitris Michailidis <dmichail@fungible.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

fun_init_stats_area() allocates coherent DMA memory for
(PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
64-bit counters (632 bytes), whereas fun_free_stats_area() omits
PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
triggering DMA-API debug size-mismatch warnings on teardown.

Extract a shared fun_stats_area_size() helper used by both allocation and
deallocation paths, and cast the leading enum constant to unsigned int to
avoid cross-enum arithmetic.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wenum-enum-conversion; not tested on Fungible Ethernet hardware.

Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
index bad8276d26b0..e0d4e69abfa4 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
+++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
@@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
 	}
 }
 
-static int fun_init_stats_area(struct funeth_priv *fp)
+static size_t fun_stats_area_size(void)
 {
-	unsigned int nstats;
+	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
+			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
+
+	return nstats * sizeof(u64);
+}
 
+static int fun_init_stats_area(struct funeth_priv *fp)
+{
 	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
 		return 0;
 
-	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
-		 PORT_MAC_FEC_STATS_MAX;
-
-	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				       &fp->stats_dma_addr, GFP_KERNEL);
 	if (!fp->stats)
 		return -ENOMEM;
@@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
 
 static void fun_free_stats_area(struct funeth_priv *fp)
 {
-	unsigned int nstats;
-
 	if (fp->stats) {
-		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
-		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				  fp->stats, fp->stats_dma_addr);
 		fp->stats = NULL;
 	}
-- 
2.56.1.708.g77570a6a1d-goog

