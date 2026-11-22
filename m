Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323192;
	b=Cc0en5jHYDhKPzaRQF72c3yslSS1or8xTfnYZe3Xc9y493yhIS+onUWQRRj+U7zLxJHh
	 kOV9A1CobCqfqnqGD/0+ng5px8HFwu4OzwOYEB6PoLe49XhDg78nkNRXHJmWeFXsqg1z9
	 /7xMlcwqQ00fNR+3KqTgJljOHmJPCPDs8PH3fIG4FC6aQwXh5lJUcWeBFRDYAjWyRRIwE
	 N63RJ6//vFi+EhvKrZEe+dkv7lCFsiEC85WNRIXwqnLjtY21b7BedS0qji8GHlGuIas66
	 AmfmwFLgKRwaYACRp/S6Ni9Zjy42D1nyc1j/IoML1pnDkdpNcnePlotWKsLsDVAgm8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
	b=Z05U6rKRZkG5T9DELc9J7VqDD8NVSifP+BYjsIR+hkqrIPnTCru6yctV4oANfcMZIQW7
	 l8LYZXPFxUhlEGVaqasZ4cl/Bo9d/7NXJGt6pAuQpvfxGARhc8NMu2K/1ZqyvnqwrduWv
	 p5EYfKzJBgjfkzXcGNGF58Nzz6kQTOkqegq7fmfz+hvy+XMQCwMh9ugw7lDia33UdsAH8
	 eQJtH3RSBhqI8+wSv1E7NXmVHJMA+uCc8GQGyd0KuR1HSgRkTsNVGh+3HKuMgvLJs1MSQ
	 qvnfts+UwPinlNf/znfO8eg+AS98h4CUxKJ+rrP/jZR0t6kQueCp6cIgvnQY4/vAh7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mM81Bs6Q;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0527A606A32C
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0527A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mM81Bs6Q
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so5918152eec.1
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323190; x=1795927990; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=mM81Bs6Quht2keyersOPskdAI8d+GP4QkjHS3ksyK37lkqn7xvPNE3YVUDUSRf2wMb
         7LKjdpTE+MuJxGXvkF9fA6JB6UvQaCN90sELNtfCyXEDzgblkn4Fn5XAkWPG6cUlpaS6
         8nfLh/MqkcWebMl0Yah1FSqXBWvYxzuBuxnvadXDTYa+B2V/r21+Q28Lkx9J0bMkh4XO
         S79gRfTx6Zy0F/a+eUH+2B97amDCPrw5pVq0TXpNHnz1AtEHmuRCeQxJISlL1+vZQ6AW
         G2cE5FJsitlygUMbsoPqSUbiSLi56pTCBMMfNmvOm/XgqjcC+p+Pfd3djCGodGJld7ye
         Ob2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323190; x=1795927990;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=fPPJvWxCZuzp997RBbp0c36FHDdQnQlTAfDjvyyGuCeeBX389Z8Bjtpz7T8k2Fleam
         Pnv82kxP32eWvQ6Y1QJlIPPlbuZ2oeJJ1cNYx6Y1vrgX5Jm17fmwG7VcFIPeV72Ufe7w
         GypOk18W+9TL5e8BaC5DNL3lblS7w/s73UBFzSFSo2+QsQYKea1ZfUhYYEghGjFx2KCz
         V9vcuVg16PubJAATLEs3BjhdO8FH2vRmg7W9L+RxTG5UpFiTf2+B8X3DX8j/0QNRvxq6
         OfsIdGGVObsSx1tJesti6ObXENdMWSQJ9bEdUBKAAwf4g+5QC2Ak9JLYRbfg/+zK01sB
         18DA==
X-Forwarded-Encrypted: i=1; AL+hErHxeze1maELsNVmmFC75syHL+JbgTpRtgFdX0DGvaEx0PD30d7mFpwAc8VC5OWMTBdkbztt@lists.linux.dev
X-Gm-Message-State: APuU4Z/tdZDjMo9sX0TfWj09om4scF5D4z7Wajrpxrj5bby0FIpHfnHC
	Wz1q2qzesOhbvIMaM+ejhQD8G/Vc4lnko8pgC+S7c5oyVO6PCTVzUZK0iFKWWhCOEIQKfXv/uT0
	tImUoHa2PtA==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:383:7f56:6996])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:416:b0:356:7ddb:2e54
 with SMTP id 5a478bee46e88-38570f27b33mr8386164eec.29.1795323189687; Sat, 21
 Nov 2026 20:53:09 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:05 -0800
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
Message-ID: <20261122045305.17511-1-irogers@google.com>
Subject: [PATCH net v2] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
From: Ian Rogers <irogers@google.com>
To: Elad Nachman <enachman@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
returns NET_XMIT_DROP (0x01) without freeing skb.

Because NET_XMIT_DROP (0x01) is less than NET_XMIT_MASK (0x0f),
dev_xmit_complete() returns true and dev_hard_start_xmit() assumes the
driver has already consumed or freed the skb, leaking the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NET_XMIT_DROP.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on Prestera
switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Keep returning NET_XMIT_DROP at drop_skb and fix the commit message
        description of dev_xmit_complete() / dev_hard_start_xmit() (Elad
        Nachman).
    
    v1: https://lore.kernel.org/r/20261119170354.1509589-1-irogers@google.com

 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..e62378abcffc 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_port *port, struct sk_buff *skb)
 	dsa.port_num = port->hw_id;
 
 	if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	skb_push(skb, PRESTERA_DSA_HLEN);
 	memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
 
 	if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) != 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
+
+drop_skb:
+	dev_kfree_skb_any(skb);
+	dev_core_stats_tx_dropped_inc(port->dev);
+	return NET_XMIT_DROP;
 }
-- 
2.56.1.750.gf70dc682cf-goog

