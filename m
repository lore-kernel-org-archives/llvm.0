Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640584;
	b=3EXe/3JO4FXdkgrRe6ridX8gJafFULq1M3a2ZZM/GebLxvtolf76dYODhCNox051DZP3
	 OjKYmo6iJPWoW65yGS0F8ZSQHOo5SyIhvshjYzjJ8hI1io6ZAtpQFa7XN4hy4WcCJmgWY
	 ia8iv49/QYf7RfNGa0tnvSi2apYrR2P4W00lHEZwZHXIzIYmKzw5MmR4tkDOIev62CFxN
	 oHoZqgLxduwwnxZt2PKgiUxtWEgIX0ImnY0WNTAUS7H5EbXpbLaYpj9AyU0rQOuOIiPW+
	 0WowBngEwzdI6G7OWDjpojA+ljpkPhz78TWhjbRmVQCQHM1L/CpBvUT3ueFAWElsGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
	b=scI8LTXK6NQ8Ye09rfxWbR5KIuTImGAKV1RO1UtlMVaEbT84n9vLqZNZ4InEmreCrGTB
	 p68fAQjXG34jHiL21nLdagf3wvaOIjdRuPWLXseaFJamI9M1eqyjVmTa56ffEBZdCwdvZ
	 klif3AZQKK6qJ7Dq/Xulf00ozsFmdSK53x3u0B8qn4dymfUrx9qpI7iNI+UqoUsj8oBwB
	 A/rF6Jqmk7jQM6Y7fMBawiqZkkE/8csU/L6IMprZy0iwqKFrqMQ4xLocFJcFF5O12UX/8
	 j34HlCMH3VfRTgfgWFMYuJUM7b3MORP/uqzbtg7n8ynt+CDFlpfc1Om+ytIgjP8oTmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V+75KAEc;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96568606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96568606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V+75KAEc
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7966951eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640584; x=1796245384; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
        b=V+75KAEcy6A5VW5qVgIqS7svFyU1QshHRDPLcQv65b4Cgy7fyNRtjYa1XgP8c7aUG2
         CQp2J1SeFa5Ek6sXc9wjzi9V/wGImTNWg00n8ohvDJ49spNhlRmPcgr8089LBWaKKmhf
         YO9msrWcF78J+ew48B5kT26lXShZVRn8UMSHBtvtj93qfqVcswzBDp36uwpCOwV1GXtw
         vOroMU+0Enm8biJrbJp62UQ+vxTsmDa7HMVx+mQJJoAKCsYFvbMam231Wal9FoJ5TBFu
         GnkorJfFapHbL97vCQoun1wR04M4aKwcxPtskEzOxNfqPvxLLEYu/ixHfJs/LcCPL1fg
         r/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640584; x=1796245384;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq1LqV/I3EkKfuWXMTSw+B6TAIfUEFhKN+ETx366hf8=;
        b=tVj3e84xTcX5R/2e7GWMlS7J0kAVpJEzuvzHVYECwNokx1aw2jglwVvhhEYQGvAort
         TwG8YfoQLB+XxO1FDuj+O5TSbKVJTP6HXiwSYfGEta5yGHnrSxiWF6r+ck+q1cqsTDNP
         ao3bLeoFJYi0o/YREeZRrGUBwGIrxIz1t7w77UiRP3dQfteP7lnHy2a1lL+RsaoWTNp7
         5bLSr9Kk/5gLuFlVcEHNAEQ3Z3Qo+ylgdSpBaBBF59ATF6vHPhgRZPp5goTjxUP0Krq0
         Mo/jtv7dDP0wU1oQGVjED/3AiKEhycyyRbmKuaDyrH1I3B2Qi+SWTsZZONtVbFzVl0gP
         doWw==
X-Forwarded-Encrypted: i=1; AL+hErFlq+6zBySP4iB50oreM0DFWoj+pJ4DqEvx3VTob501dW1UfSvv4g74iowaUJ6giZH48Pp2@lists.linux.dev
X-Gm-Message-State: APuU4Z+XltIVIVPTgcvu0oWqr9ebbMZAnL9LJ8CX+YmU2nF7F3o8+XCs
	3EQUEwkiGJbGTx73rEb1R74xbaKvgl9DuNP7XuDDLs4RUOUoN9sS5XaEccowhoxocwIHEHF76+L
	9qQ==
X-Received: from dycmv8.prod.google.com ([2002:a05:693c:2808:b0:386:c2e4:36b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8209:b0:383:e7af:c28d
 with SMTP id 5a478bee46e88-3856f14d5b2mr19627407eec.9.1795640583471; Wed, 25
 Nov 2026 13:03:03 -0800 (PST)
Date: Wed, 25 Nov 2026 21:01:58 +0000
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
Message-ID: <20261125210158.1280227-1-elkin@google.com>
Subject: [PATCH wireless] wifi: nxpwifi: fix UAF after skb_realloc_headroom()
 in bridged RX
From: Elkin Cruz <elkin@google.com>
To: Jeff Chen <jeff.chen_1@nxp.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nxpwifi_uap_queue_bridged_pkt(), uap_rx_pd and rx_pkt_hdr point into
the original skb->data buffer. If skb_headroom(skb) is less than
NXPWIFI_MIN_DATA_HEADER_LEN, skb_realloc_headroom() allocates a new skb
and kfree_skb() frees the old skb, leaving uap_rx_pd and rx_pkt_hdr
dangling when updating station and bridge statistics (in addition to
rx_pkt_hdr->eth803_hdr.h_source having been partially overwritten in the
SNAP-to-Ethernet-II header move).

Cache rx_rate and ht_info from uap_rx_pd once packet bounds are verified
and read h_source and h_dest via p_ethhdr = (void *)skb->data after the
headroom reallocation block.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/net/wireless/nxp/nxpwifi/uap_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c b/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
index 840dddfc4f5a..c3191575db17 100644
--- a/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
+++ b/drivers/net/wireless/nxp/nxpwifi/uap_txrx.c
@@ -84,6 +84,7 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 	int hdr_chop;
 	struct ethhdr *p_ethhdr;
 	struct nxpwifi_sta_node *src_node;
+	u8 rx_rate, ht_info;
 	int index;
 
 	uap_rx_pd = (struct uap_rxpd *)(skb->data);
@@ -105,6 +106,9 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 		return;
 	}
 
+	rx_rate = uap_rx_pd->rx_rate;
+	ht_info = uap_rx_pd->ht_info;
+
 	if ((!memcmp(&rx_pkt_hdr->rfc1042_hdr, bridge_tunnel_header,
 		     sizeof(bridge_tunnel_header))) ||
 	    (!memcmp(&rx_pkt_hdr->rfc1042_hdr, rfc1042_header,
@@ -178,18 +182,19 @@ nxpwifi_uap_queue_bridged_pkt(struct nxpwifi_private *priv,
 	tx_info->bss_type = priv->bss_type;
 	tx_info->flags |= NXPWIFI_BUF_FLAG_BRIDGED_PKT;
 
+	p_ethhdr = (void *)skb->data;
 	rcu_read_lock();
-	src_node = nxpwifi_get_sta_entry(priv, rx_pkt_hdr->eth803_hdr.h_source);
+	src_node = nxpwifi_get_sta_entry(priv, p_ethhdr->h_source);
 	if (src_node) {
 		src_node->stats.last_rx = jiffies;
 		src_node->stats.rx_bytes += skb->len;
 		src_node->stats.rx_packets++;
-		src_node->stats.last_tx_rate = uap_rx_pd->rx_rate;
-		src_node->stats.last_tx_htinfo = uap_rx_pd->ht_info;
+		src_node->stats.last_tx_rate = rx_rate;
+		src_node->stats.last_tx_htinfo = ht_info;
 	}
 	rcu_read_unlock();
 
-	if (is_unicast_ether_addr(rx_pkt_hdr->eth803_hdr.h_dest)) {
+	if (is_unicast_ether_addr(p_ethhdr->h_dest)) {
 		/*
 		 * Update bridge packet statistics as the
 		 * packet is not going to kernel/upper layer.
-- 
2.56.1.839.g22a8290db9-goog

