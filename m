Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640515;
	b=ZEdSfezx0oc+OWw3YcVkWbGtuio02qx2P2UUdZQFHIJh9ZsQLE6Ke26do/zPbdi5hnVC
	 L8LvC3L3XDOozC7z3n5SOfZP1ufMtpEljtakrfSH0ADSPZmxCH8KwYhpxkjxjYcGUUe2R
	 CbZ+3LuhI1yTQNkiompS24sMl/qE9+AtB14EVH28s5igF2AQqD7mNz9TZnIUF7pfEJzPe
	 2WLRoF0SmB8rFpwlmblJZecQx6OzWLJTiCfPXtrIoGLbQ8x/Vb8vO4Yb7pegOfylOK4cO
	 uHAeVfuyNM9Qf2qZV/k/FNVbqb1mwO60fKUTk6vS8lsAyuhSsiW4WgVr+fA1pueZbUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
	b=GS0GEPae9P66ILCRaQnH8M9z38alnRe1i1LMKqXGFAP9d9pKY64XXkDyj0kAgvJzIHrJ
	 kg/0ronmz4kK20VORTxKgqLeFJ5aD7XgsmVq2TejdNEpPTvB8zWvy4wOb4DXCVLZUKI0i
	 F8EkR47evIi0XHf0gD3rz0An1mwQm3CJNS/YcahIFeNodNNSD4xoi0YEx6OGRSKmJa8XL
	 MC8S7fVEcGreKqCIWk3Yu/PlS+QhCPA2/i+EICsObKeSil7hfFlsXJAjn6LS/q0T3e1hF
	 XRfGrtSvKlcDoYE4zAGOj8wrlHeOhAlTcciH3OjknADJYmAebKZZY7D7wb2drO7dpQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E4Oo+EMa;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7B606A326
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E4Oo+EMa
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so3567482c88.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640514; x=1796245314; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=E4Oo+EMagj49PFxzPhj6TnamVf7Ls7FDQRMEHjLWzLDexVCegIZRVte22pfUyHLqlG
         DCJQEelH3XB2BgDxczTLv3fzoW9E/47+ktLSQfNBoCCQliW4iU5Z3Kr+tlialhkz2Mzm
         5K3j06nIwrgoX4/QqfcxJUHI6izXWOjJIp05lPKBMZQNQfJXnZDd6I2UrPYtTvgp/CbG
         h++xHXA/f6FWiYsO0Y6OrI3itEf71WCYfrud8mQ66yI2JCpAi2gE06mpugAAYb79WRvk
         WMc49P6DqPCkahIjjmIHGrQjChxKq5tHDY3HUffCxgb7spH/Bmt3iqyhBeH+XMYb3grJ
         pCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640514; x=1796245314;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=DdT7wFImLhUAIMSWPyeMEmu2MaT6wXam7iOoAuDnpluPZQrk77e3C5yb2f1Wx3yL4S
         wmnbzJDpp3GBd1/Xe2CsQxbf56XtR7PhKbLz6oilSVyFqZkuOzfSNgczK6p64fToW++S
         pesPlqamZUUpRmVHfLzA6sikgJe9708ZNNy0TJ65ZwKeKMz4EZWMqaoUmwQHtMbNn8Fo
         OlUnl1uEq2BIhW9FWVkj2f4WaozY484beTHsr17Yv3YxXk0Cq3/kR0myIpbGZ/fLSMPt
         ifXO+vwysjD3EQ3Pm/7NMpYhNSuC49FDUMooWrBSiFHEC0PU7ufzI8fH1yThji/l3s84
         AvTw==
X-Forwarded-Encrypted: i=1; AL+hErHkK9XV1AXkh5d/GEt5vm9IHE/LnShLEDcLE9dKy4G5Ke8zvzcdB1w4Y90BwZtOzZeDBYbA@lists.linux.dev
X-Gm-Message-State: APuU4Z+XbFH75LHGPR6i3J60/YXv1o3X3qfYrwfUnL5fHrRsIJ3ImpRP
	HczJT/9ijGhdo3tHGt8phfhTFGb+2nt8KcJJgBq2m1888JciLhRqFefSFDeYhZ8Q4OcLfsAG6x5
	nEQ==
X-Received: from dlbuu1.prod.google.com ([2002:a05:7022:7e81:b0:1b2:6c20:7e86])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:45a7:b0:1b5:4eec:14e5
 with SMTP id a92af1059eb24-1b55687f18fmr26708145c88.6.1795640514079; Wed, 25
 Nov 2026 13:01:54 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:36 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-2-elkin@google.com>
Subject: [PATCH wireless 1/3] wifi: mwifiex: fix UAF after skb_realloc_headroom()
 in bridged RX
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mwifiex_uap_queue_bridged_pkt(), uap_rx_pd and rx_pkt_hdr point into
the initial skb->data buffer. When skb_headroom(skb) is smaller than
MWIFIEX_MIN_DATA_HEADER_LEN, skb_realloc_headroom() allocates a new skb,
kfree_skb() frees the original skb, and skb is updated to new_skb,
leaving uap_rx_pd and rx_pkt_hdr dangling. Subsequent reads of
rx_pkt_hdr->eth803_hdr.h_source, uap_rx_pd->rx_rate, uap_rx_pd->ht_info,
and rx_pkt_hdr->eth803_hdr.h_dest dereference the freed skb (and in the
RFC1042/SNAP conversion branch, rx_pkt_hdr->eth803_hdr.h_source was also
partially overwritten in-place when constructing the Ethernet II header).

Save rx_rate and ht_info from uap_rx_pd after the packet length check
and re-derive p_ethhdr from the live skb->data after any headroom
reallocation, since skb_pull() already positioned skb->data at the
Ethernet header in both header-conversion branches.

Fixes: f7b598532f3d ("mwifiex: update statistics for bridged packets on AP interface")
Fixes: 442f6f9b49c8 ("mwifiex: maintain station statistic in uap mode")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/uap_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
index 318bd4ed8399..d2512b985014 100644
--- a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
+++ b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
@@ -89,6 +89,7 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	int hdr_chop;
 	struct ethhdr *p_ethhdr;
 	struct mwifiex_sta_node *src_node;
+	u8 rx_rate, ht_info;
 	int index;
 
 	uap_rx_pd = (struct uap_rxpd *)(skb->data);
@@ -113,6 +114,9 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 		return;
 	}
 
+	rx_rate = uap_rx_pd->rx_rate;
+	ht_info = uap_rx_pd->ht_info;
+
 	if ((!memcmp(&rx_pkt_hdr->rfc1042_hdr, bridge_tunnel_header,
 		     sizeof(bridge_tunnel_header))) ||
 	    (!memcmp(&rx_pkt_hdr->rfc1042_hdr, rfc1042_header,
@@ -183,16 +187,17 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	tx_info->bss_type = priv->bss_type;
 	tx_info->flags |= MWIFIEX_BUF_FLAG_BRIDGED_PKT;
 
-	src_node = mwifiex_get_sta_entry(priv, rx_pkt_hdr->eth803_hdr.h_source);
+	p_ethhdr = (void *)skb->data;
+	src_node = mwifiex_get_sta_entry(priv, p_ethhdr->h_source);
 	if (src_node) {
 		src_node->stats.last_rx = jiffies;
 		src_node->stats.rx_bytes += skb->len;
 		src_node->stats.rx_packets++;
-		src_node->stats.last_tx_rate = uap_rx_pd->rx_rate;
-		src_node->stats.last_tx_htinfo = uap_rx_pd->ht_info;
+		src_node->stats.last_tx_rate = rx_rate;
+		src_node->stats.last_tx_htinfo = ht_info;
 	}
 
-	if (is_unicast_ether_addr(rx_pkt_hdr->eth803_hdr.h_dest)) {
+	if (is_unicast_ether_addr(p_ethhdr->h_dest)) {
 		/* Update bridge packet statistics as the
 		 * packet is not going to kernel/upper layer.
 		 */
-- 
2.56.1.839.g22a8290db9-goog

