Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107837;
	b=hyfE6x8n+tTfJHY5fX/C6R4MYjAm3sE8cxa3c0Cqkg1rnJUq7rUK7C3Ocb57LLca5dz7
	 fp1THsQg2Wb7DRWGwMcj+RyHJuacItUD9/tCV0lr1g0foVVbnUeNvb5K7wcZdTqmTh11s
	 k/wueFAlxKd/ddIQgx4SFr9LPXw9/uYZhSrYOzMQUjVzuDjflp/dGJZNzQD2GioTtcSUL
	 DUZ1UEato/dGym0gj9rNrVhuknqHr6R59ICQk5FjsziGAOBU//jwFhr08+JmhhWFwrRdg
	 wvS8BYFIn0tYsumY/HMQn96q80vbcuW+bqpWS2+SGgV+EN80xTrkVyWXIYFOU00WB6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
	b=e48dckDjv4X0ajujx/buOiBIyTngNNb56flF0TzecMxtN1yB7+YY4ETnJqTcWU4oH7Pz
	 l1Fm10/Lpw/q2kYgLo1T7SONVhNiNGXEEXnpz/J/ecOk9PdZLzAgIJOBtcdbiTflgnRRV
	 5UMrmtN1vHGMOKMc3Vnci8iMBWwi3+PxKmluooYdJQn1goPacePKgqWSq2FdYbGGZxYLH
	 eefYGXQpvYi2Wzd86YyEfZbk4pOfuyPzETtNu/Vi/2Haa886+Q9cGk+EGkPPDK4oMkWPF
	 PLdabvQzXDR5DDoVAx5+9sgXCCfiXwvsWoro94uHoNQhxtcv0x2qxPUHoAUFHg0Wj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c9GlwLJJ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEB606A331
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DEB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c9GlwLJJ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3837afac185so4817773eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107837; x=1795712637; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=c9GlwLJJ438lWzHCgyyF+CN1mnej8Wkqa77jAzfuo83ONBt2+bZdsR2jUftxAo4q/z
         x0cc9Ee7NSrP4QSFEr2HCM7oOuvYOkNCUxMsPQMiYj7oo1JzTXd/phgbFDos2AT+SKFi
         T5wuemhKozQ4VCJCoZ/T68PJDEx84MRjccZjbvC218ItrefmW+QdRl0JtAKIi21I2Xhy
         ye2LNWFQXhbokUr+nStJK3xzmGBzXa1YGXc/Xo6tjFUbXYLVuOEliA17rU33wUiqVKzg
         ntyjBEroFOAIqgTtgc+3p9Gy2PtJWS7zIZUKHPUGt8gTxbAxwNbVrchcL6mYWxqb79H6
         dZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107837; x=1795712637;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=jFaqHY4gDo1V9UrNbZXo106v6RkFuHcTLqE13dg5OmNx4Rjdx0rbs5GjJMd6jO2V05
         CRT7hvaM370wV0Fu2qi/Z6YmbbM85h4epSyZ+gWyMkku8TbIjtUIIiPjF8POCvfMaAF6
         mmQ9rAi9mu3gH8makSYOYWH04X5TMao9aujtF/ec8xGVNeyY1XRNQ9UxnCzNhCXaOnCp
         63Oe0f4jCw+OH4Z8S63ZzCGfWJbDKOzRNi5pofap/omkGgOsrDUcLnZ5qVI02Ar6lvlS
         fzqJjyoz1DfDGoeGpjgME2EjPBAKRJT6MGz3ZZjcwpz/Xv7x10e2YJ2vRAgPT+8P1R/4
         FmTA==
X-Forwarded-Encrypted: i=1; AL+hErHOywXeh5nYQ87mSunMmuY7FlZ/j9MPQjEjO6idC49PQjtqCyD5rZ1I49rzSMR1jllSqWNe@lists.linux.dev
X-Gm-Message-State: APuU4Z8+GzmYCwuzQomMAAjupm9E8LGW38X/GkzB4mik8+g48y74vw/K
	KqyIJDd1GT+9Se7xAf5lDVne+P3K/NoONYgJLMgqgIkobHrBYNuHMEwFtoL82GUBPbdAe94ldSe
	msuMPS4+9Dw==
X-Received: from dycuf10.prod.google.com ([2002:a05:7300:10a:b0:379:1aaf:7a27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d401:b0:362:fa87:2aa6
 with SMTP id 5a478bee46e88-38569256f32mr42571eec.0.1795107836309; Thu, 19 Nov
 2026 09:03:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:53 -0800
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
Message-ID: <20261119170354.1509589-1-irogers@google.com>
Subject: [PATCH net] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
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
returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
netdev_tx_t value) without freeing skb.

In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00)
is treated as a busy/requeue condition unless dev_xmit_complete() holds;
for an unrecognized positive value like 0x01, the core neither frees nor
requeues the skb (or hits the unrecognized-return WARN path), leaking
the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NETDEV_TX_OK.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on Prestera switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..7ac9220d33c5 100644
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
+	return NETDEV_TX_OK;
 }
-- 
2.56.1.708.g77570a6a1d-goog

