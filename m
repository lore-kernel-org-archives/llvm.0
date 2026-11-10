Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283081;
	b=LYGGqBSUXoyBGg1B+G+X6bBC1Olk7NK1bB50Y1EVkOL4eiIeGld+vZrMi8tADlaWweSJ
	 WDnDyaktC/DtV7lAjjfCMcRdAszqSqj3+4l7d9yaCdwm6NmljE3c/WmIYg7+nNabynWxe
	 Kn4eab3nK173oi6YOAIrdVPCPNz6QTTPxVDtSbpW0+IUCsHlEkPEveUunx54/wwbZuNrM
	 Yv8gwVE34zrgBvWjoERA+EZfeQxFh/jRlG0K+0LSSqYKQbby8wKKlNkzPOzrl2YflYkck
	 YgdlB7RyMo78KCSnPEf3bm5S5i7JE8ulDwAiE1q2gDrZ4t58S89Ofau2fe5Br4dj6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
	b=RSMWqWXs6QxQIdT6QfeIImLpeFNenMWWJKLOp0gVgu/7SPuw2s7uPJkcdl3q1j0To2z5
	 1gv02kBT2wK434iOthoMr3KbSNvVPjhlH0CCGLw6YUvLvTbiUMIS5sRmYQnjkBl0aeZye
	 m7A2NSR+AVw6T1f4A5QcAwe6IM2YH9ze2k8kJk7YX2w1D2jcg/3kdeVHWZC7Z+jw8AtyD
	 Vb0JFRE7QKm02NNpKOeWx/OzMG5Pe+jNJxn+3Y5q3xgSxbWjx14srDKxhyhtGiUk77UoP
	 NJrEwO8IpwmNdoZ4l/XzoKApsFK7h+zNZ17jRjJnRteDwy11k4+tU+a65Qpx5mYS5aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=GEeR7Isb;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883BB60A3825
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 03:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883BB60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=GEeR7Isb
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1721581a12.3
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283080; x=1794887880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
        b=GEeR7IsbvBEres4MpeCz8bEvZpqUc+4dgosIjnNEDjyj79K8GSM/7Zggbt1lkdMND2
         bMkaF8V//fuB60bRxIqUWsN2NM9chCVy2xMH4xtbir7rlVwLGoqF6MHfHp6J/CwKMNb5
         Bw44xKUbmf6iNXNKaA4Qw9HOPcjzM1lIOLml1gAqDPwDtzU3iknXYdz3KI5LlvsqVrO7
         E9wvMVQPbUC77SAnyzfAiRAUzbbMQIJp6ihEYJ8OVNOaCQrtYv41CmIHPM1WWol7Sgfh
         ZLVwRjQZwOGhUDm1qr2KkBl4va78Q14T8dOAVBXQyozw1oFG0dTEOznmvClUNrB8J2aU
         zreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283080; x=1794887880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
        b=zmP0IhQ+JHdpzPPsFS5/Du4vfqzgzVkVS4o9u+sM49J9zBlDpLIypkkvXeoM8AGgRg
         1OmoOqNNyWXnaFcc4wBXZNS2nBFzgz0i0aXq6/Y45xGJ3IZcFmTFIZEETvVZ0sJXYCDq
         9KJ9aei3Nf2zDrtWtmqvbQ0iSEUX9QEW5eu6B6UheFtt8HllL2lH/75M2iJ9W/TGnEDu
         7BenVg6Dn4Bvk3/E6U0ij4FUJva6hdJtnBQQZfrxJeKVXbQsW+xvCEfk7OUJb9/oNIha
         ToC8/Ofyx3WXPRtDUnLBLdS1N9dATMEQ3ncr/rfjoRdXUzEzEKQujFf2ZSML/rUd23lh
         aNlw==
X-Forwarded-Encrypted: i=1; AL+hErFq4aA7k10XZTVgGXO97MDla1Z9d1EUCsorKBHJf/DI75dEnUArrMfddO3xsjNxTQeZlNPL@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZYqQREt4Abu5uWT/Cs6L8qJrTmaavS8FuyPZYGW2NgYaJG+FA
	UT8cWl7fxrQkKmG3pKWlM42LZWcRUMswn03sVSFTxgQWZkFh6BgDcauf0ntp44eYO/k=
X-Gm-Gg: AYBFou0YuWbCLrK9waj9DHA9ma/7lw9gfQvZa4r3bR8meSDjZyoxzIF677q0NtzHmKq
	/IjRfLS7sUDsdR/OoLLh2k1gZ7RMkHeB8eUPPz2euK0DTFsbJ2AX9cFl952/lhh3OQg2S2zheSq
	OcG8IaRA8smZqrINx6RbkKwLVMQdLEjLcVdTOdUXuOmOBJIa7mYeD4yQ9B0fiA+LmXuCvdIAeWm
	0PZCeiJ5KmjRg2fRgHpefOnPxvKZz5rLDgSg+98flbp2AvB0K5DHKn3+uCmzwbAgP6z8+7tjMmj
	+yhhc49NQzYz+eHc6enEbKMIqV5Yr5aZCblg6STa0WV1zh93dqtoGpf/omdXHFQsXo2fWiEDVSA
	MylNx+vAsag6K1Wa4as0kLzqLxcicG5nXHmc6HLC69GOUzQv0G6DvXA49UhRDsi/38+7CgCH+6e
	i03eqTgVOeJ9UtmQh9dESk2mZe2K1/Kkcgn+sqfWYAh1BaYS0n829hzfVRpkBCRNwoZti0iwEJm
	UIkwwoVRs+G2DvVJOiqKiLzo4nYJrX6y3hl/V7iP2JeY8mWYZUdUKq5o5h8tn6W7KY+ouM+paBA
	OC0GdztqJbcJDodEiSaads9BBpwzxGPemfOeIqh8aZzQHbHRw8hnGnuSbk8n4fc=
X-Received: by 2002:aa7:cd92:0:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6b756b0d218mr745095a12.45.1794283080043;
        Mon, 09 Nov 2026 19:58:00 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:58 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 11/15] ice: set skb RX metadata from the skb core extension area of xdp_buff
Date: Tue, 10 Nov 2026 03:57:09 +0000
Message-ID: <ae488c057454cd57fb01ac01aefc3e97d6271ada.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

On XDP_PASS, ice builds the skb with xdp_build_skb_from_buff(). Then
ice_process_skb_fields() sets the hash and ip_summed from the RX
descriptor, and ice_receive_skb() adds the VLAN tag. The values that the
XDP program stored in the skb core extension area are not used.

ice_clean_rx_irq() takes the skb core extension pointer from the
xdp_buff before it builds the skb, and passes it to ice_receive_skb().
ice_receive_skb() calls xdp_skb_ext_to_skb() right before GRO. The
stored values then replace the values from the descriptor before the skb
leaves the driver. ice now sets the skb-ext-pass XDP feature.

Zero-copy is not supported in this patch. ice_clean_rx_irq_zc() passes
NULL for the skb core extension pointer to ice_receive_skb(). Hence the
skb-ext-pass feature does not cover AF_XDP zero-copy queues.

Export xdp_skb_ext_to_skb(), because ice can be a module.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c     | 3 ++-
 drivers/net/ethernet/intel/ice/ice_sf_eth.c   | 3 ++-
 drivers/net/ethernet/intel/ice/ice_txrx.c     | 4 +++-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c | 7 ++++++-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.h | 3 ++-
 drivers/net/ethernet/intel/ice/ice_xsk.c      | 2 +-
 net/core/xdp.c                                | 5 ++++-
 7 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 454fba07d4ec..cb619689d11a 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -3461,7 +3461,8 @@ static void ice_set_ops(struct ice_vsi *vsi)
 
 	netdev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			       NETDEV_XDP_ACT_XSK_ZEROCOPY |
-			       NETDEV_XDP_ACT_RX_SG;
+			       NETDEV_XDP_ACT_RX_SG |
+			       NETDEV_XDP_ACT_SKB_EXT_PASS;
 	netdev->xdp_zc_max_segs = ICE_MAX_BUF_TXD;
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_sf_eth.c b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
index a730aa368c92..90f2ce5da022 100644
--- a/drivers/net/ethernet/intel/ice/ice_sf_eth.c
+++ b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
@@ -52,7 +52,8 @@ static int ice_sf_cfg_netdev(struct ice_dynamic_port *dyn_port,
 
 	netdev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			       NETDEV_XDP_ACT_XSK_ZEROCOPY |
-			       NETDEV_XDP_ACT_RX_SG;
+			       NETDEV_XDP_ACT_RX_SG |
+			       NETDEV_XDP_ACT_SKB_EXT_PASS;
 	netdev->xdp_zc_max_segs = ICE_MAX_BUF_TXD;
 
 	eth_hw_addr_set(netdev, dyn_port->hw_addr);
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
index a2c7c4962882..06a1a5fdc43b 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
@@ -966,6 +966,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 	/* start the loop to process Rx packets bounded by 'budget' */
 	while (likely(total_rx_pkts < (unsigned int)budget)) {
 		union ice_32b_rx_flex_desc *rx_desc;
+		const struct xdp_skb_ext *ext;
 		struct libeth_fqe *rx_buf;
 		struct sk_buff *skb;
 		unsigned int size;
@@ -1041,6 +1042,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 		continue;
 
 construct_skb:
+		ext = xdp_buff_skb_ext(&xdp->base);
 		skb = xdp_build_skb_from_buff(&xdp->base);
 		xdp->data = NULL;
 
@@ -1061,7 +1063,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 
 		ice_trace(clean_rx_irq_indicate, rx_ring, rx_desc, skb);
 		/* send completed skb up the stack */
-		ice_receive_skb(rx_ring, skb, vlan_tci);
+		ice_receive_skb(rx_ring, skb, vlan_tci, ext);
 
 		/* update budget accounting */
 		total_rx_pkts++;
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx_lib.c b/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
index e695a664e53d..85439853596f 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
@@ -247,17 +247,22 @@ ice_process_skb_fields(struct ice_rx_ring *rx_ring,
  * @rx_ring: Rx ring in play
  * @skb: packet to send up
  * @vlan_tci: VLAN TCI for packet
+ * @ext: skb core extension area of the packet, or NULL
  *
  * This function sends the completed packet (via. skb) up the stack using
  * gro receive functions (with/without VLAN tag)
  */
 void
-ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci)
+ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci,
+		const struct xdp_skb_ext *ext)
 {
 	if ((vlan_tci & VLAN_VID_MASK) && rx_ring->vlan_proto)
 		__vlan_hwaccel_put_tag(skb, rx_ring->vlan_proto,
 				       vlan_tci);
 
+	if (ext)
+		xdp_skb_ext_to_skb(skb, ext);
+
 	napi_gro_receive(&rx_ring->q_vector->napi, skb);
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
index f17990b68b62..cfc77847696e 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
@@ -133,6 +133,7 @@ ice_process_skb_fields(struct ice_rx_ring *rx_ring,
 		       union ice_32b_rx_flex_desc *rx_desc,
 		       struct sk_buff *skb);
 void
-ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci);
+ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci,
+		const struct xdp_skb_ext *ext);
 
 #endif /* !_ICE_TXRX_LIB_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
index 0643017541c3..f64659dc8313 100644
--- a/drivers/net/ethernet/intel/ice/ice_xsk.c
+++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
@@ -670,7 +670,7 @@ int ice_clean_rx_irq_zc(struct ice_rx_ring *rx_ring,
 		vlan_tci = ice_get_vlan_tci(rx_desc);
 
 		ice_process_skb_fields(rx_ring, rx_desc, skb);
-		ice_receive_skb(rx_ring, skb, vlan_tci);
+		ice_receive_skb(rx_ring, skb, vlan_tci, NULL);
 	}
 
 	rx_ring->next_to_clean = ntc;
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 984299199906..fdda072a5858 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1086,7 +1086,9 @@ static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
  * @skb: The skb that is built from the packet.
  * @ext: The skb core extension area of the packet.
  *
- * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag.
+ * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag. A driver
+ * calls it after it sets the skb fields from the RX descriptor, and sets
+ * NETDEV_XDP_ACT_SKB_EXT_PASS.
  */
 void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 {
@@ -1115,6 +1117,7 @@ void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 		skb->csum_level = csum->level;
 	}
 }
+EXPORT_SYMBOL_GPL(xdp_skb_ext_to_skb);
 
 /**
  * xdp_skb_ext_warn_pass - Warn if XDP_PASS does not use the stored values.
-- 
2.56.0

