Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459400;
	b=TNQvoNbrXof7dgUs9hl3sMggZPwoggNDwvatnKn+R/tgngCY9rlvt9jbHaOcjMW0RraK
	 P/wC9Fma8ik0Y7f2zWf/Ijoz45WbA27mpViYvN2rNmkONTPKbFkjNugkPZ5RFOEqD4j8P
	 UrHIuZLGRyaCaOwvjCon6UJSQkDvYX0HzA+kHdEmeFbh0QQYx25Jgf+t4iP6WvImFq02b
	 KCDteH00+u0S7A3QoSwHgmI3dmxesk1oA0Kr0qFL6LfGKrersJ3mqhdbRVL7ww0tTdE8m
	 /fQa4AFbvL4aLgZaUtCyyxbPa/obfd/J7cGET05Uyu9dtG2dZZYt4kFgY1eF/uMrVpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459400;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Bj0rVj9FLIhf8UiYc+IN8rQRnWePKVpim0REyAx+NZY=;
	b=i0+PAS9VTWm5bZRnYPzz5B00O9pw/QpObV6wggZQ5PFky0GLiHraWiSMcEGbTn4pCy1A
	 4Q0bCK1968p3rPcreUl5F/3+K0RFJNjghDWVKUJ9ZSjEonkiXffh3unyTTmKUMPrhY/Kg
	 AX0KT0X+ZQ5rxRawMjEmuRBYftcavN6e0EunjzKSqNr0HD04RkzXUeWvHWwvjmMCv2TBw
	 aC0uGFIIEDMD/m5XjZcIPXp2GacYDHPaJC2XgL4clzmkQlvAEI6KEfC2r2MWoKZbxORz8
	 nKwDZTQdD31TtpC7ZWIVOPnPzw2jssK3L4CfLF8YoUCDmsk0gBY+X5o52ycuQoL85IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgtdtG6m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D4606A31A;
	Mon, 23 Nov 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgtdtG6m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AE41F000C0;
	Mon, 23 Nov 2026 18:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459400;
	bh=Bj0rVj9FLIhf8UiYc+IN8rQRnWePKVpim0REyAx+NZY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DgtdtG6mxK99luXmkcluJ7cO8/KvuA0cO1nLw1w0AUYAPzg9ZrKTDk1lKuqa5VovR
	 FC+v0ZeSXCAdEICLCUHlo0Czi96oBpm7B6ug50xg1q6ObKybsZ1hQiMP/rxA9qPyVG
	 MeL5d271DHe/oLNN6xWMUnOCZvn66dSqSVIiUI8q/5IvDjiy/dfSiVmBZn5RqCMtPs
	 hWwZR7wrwi95/A2Iq32WzQg/DJ2LedFbpxHM4BGLjbbaMRvR6oqO+bkanVioC2V92s
	 u2r6Gova6gKnp9n85p3b2Zmwhp33FHV7qTX83IWu72WPAcbkyT1mY6JUu0ZpXy1alk
	 qebZ+Pd9SJnhg==
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: netdev-bot+sashiko@kernel.org
To: irogers@google.com
Cc: horatiu.vultur@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 elkin@google.com
Date: Mon, 23 Nov 2026 18:43:18 +0000
Message-ID: <179545939880.3135.6341792822211409455@kernel.org>
In-Reply-To: <20261119170729.1524516-1-irogers@google.com>
References: <20261119170729.1524516-1-irogers@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 (1) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the patch will 'increment tx_dropped',
  but the new `dev->stats.tx_dropped++` in lan966x_port_xmit()…
- [Low] The err->ret change in lan966x_port_xmit()
  (drivers/net/ethernet/microchip/lan966x/lan966x_main.c:421 and :423)…
- [Low] The new `dev->stats.tx_dropped++` in lan966x_port_xmit()
  (lan966x_main.c:410) runs before `spin_lock(&lan966x->tx_lock)`.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it sits on the
  same PTP TX skb-ownership path.
- [Medium] This problem wasn't introduced by this patch, but
  lan966x_ptp_txtstamp_release() (lan966x_ptp.c:448) rolls back with an…

--

net: lan966x: Free skb when PTP TX timestamp request fails in xmit

When lan966x_ptp_txtstamp_request() fails, lan966x_port_xmit() now frees
the skb, increments tx_dropped and returns NETDEV_TX_OK. Before this
patch it returned the negative errno from ndo_start_xmit. The patch also
stores the transmit result in a new netdev_tx_t local instead of the int
err.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index b8696fc7e9b93..9c722d23e0bb6 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c

[ ... ]

> @@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
>  
>  	if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
>  		err = lan966x_ptp_txtstamp_request(port, skb);
> -		if (err)
> -			return err;
> +		if (err) {
> +			dev_kfree_skb_any(skb);
> +			dev->stats.tx_dropped++;

[Severity: Medium]
Will this tx_dropped increment ever reach userspace? lan966x sets
.ndo_get_stats64 = lan966x_stats_get. dev_get_stats() adds only
dev->core_stats on top of what that callback returns, so legacy
dev->stats is never reported.

lan966x_stats_get() takes tx_dropped from hardware counters only:

drivers/net/ethernet/microchip/lan966x/lan966x_ethtool.c:lan966x_stats_get() {
    ...
	stats->tx_dropped = lan966x->stats[idx + SYS_COUNT_TX_DROP] +
		lan966x->stats[idx + SYS_COUNT_TX_AGED];
    ...
}

rx_dropped, by contrast, does include dev->stats.rx_dropped:

	stats->rx_dropped = dev->stats.rx_dropped +
		lan966x->stats[idx + SYS_COUNT_RX_LONG] +

The commit message says "increment tx_dropped". As written, though,
frames dropped because all LAN966X_MAX_PTP_ID slots are busy won't show
up in ip -s link or sysfs. The existing tx_dropped++ calls in
lan966x_fdma_xmit() follow the same pattern.

Would dev_core_stats_tx_dropped_inc(dev), or adding
dev->stats.tx_dropped in lan966x_stats_get(), make these drops visible?

[Severity: Low]
Can this increment race with other writers of the same counter? It runs
before spin_lock(&lan966x->tx_lock). The other dev->stats writers in
lan966x_port_ifh_xmit() and lan966x_fdma_xmit() run under tx_lock.

lan966x_probe_port() allocates the netdev with
devm_alloc_etherdev_mqs(..., NUM_PRIO_QUEUES, 1). That means
ndo_start_xmit can run on several CPUs at once for the same port, and
the plain read-modify-write can lose increments.

Would DEV_STATS_INC(dev, tx_dropped) or dev_core_stats_tx_dropped_inc(dev)
avoid this? The second one would also fix the visibility problem above.

> +			return NETDEV_TX_OK;
> +		}
>  
>  		lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
>  		lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_type);
> @@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
>  
>  	spin_lock(&lan966x->tx_lock);
>  	if (port->lan966x->fdma)
> -		err = lan966x->ops->fdma_xmit(skb, ifh, dev);
> +		ret = lan966x->ops->fdma_xmit(skb, ifh, dev);
>  	else
> -		err = lan966x_port_ifh_xmit(skb, ifh, dev);
> +		ret = lan966x_port_ifh_xmit(skb, ifh, dev);

[Severity: Low]
Does this change get rid of the implicit int-to-enum conversion, or
only move it? ret is a netdev_tx_t (enum netdev_tx), but both callees
are still declared to return int:

drivers/net/ethernet/microchip/lan966x/lan966x_main.h:
	int (*fdma_xmit)(struct sk_buff *skb, __be32 *ifh,
			 struct net_device *dev);

drivers/net/ethernet/microchip/lan966x/lan966x_main.c:
static int lan966x_port_ifh_xmit(struct sk_buff *skb,

The fdma_xmit implementers, lan966x_fdma_xmit() and
lan966x_fdma_pci_xmit(), are declared int as well.

The commit message says the patch was build-tested with
-Wimplicit-int-enum-cast. That warning covers assignments as well as
returns, so wouldn't these two assignments still trigger it?

These functions only ever return NETDEV_TX_OK or NETDEV_TX_BUSY. Could
the fdma_xmit op, both implementers and lan966x_port_ifh_xmit() be
changed to return netdev_tx_t instead? The commit message also doesn't
mention the err to ret change.

[Severity: High]
This isn't a bug introduced by this patch, but it is on the same PTP TX
skb ownership path.

For two-step PTP, lan966x_ptp_txtstamp_request() has already linked the
skb on port->tx_skbs and incremented ptp_skbs and ts_id before
fdma_xmit is called. On the platform FDMA path, two early returns in
lan966x_fdma_xmit() skip lan966x_ptp_txtstamp_release():

drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_xmit() {
    ...
	next_to_use = lan966x_fdma_get_next_dcb(tx);
	if (next_to_use < 0) {
		netif_stop_queue(dev);
		return NETDEV_TX_BUSY;
	}

	if (skb_put_padto(skb, ETH_ZLEN)) {
		dev->stats.tx_dropped++;
		return NETDEV_TX_OK;
	}
    ...
}

In the NETDEV_TX_BUSY case, the qdisc requeues an skb that is still on
port->tx_skbs. The retry goes through
lan966x_port_xmit()->lan966x_ptp_txtstamp_request() again. Two things
can then happen:

- If the skb has been on the list longer than LAN966X_PTP_TIMEOUT,
  lan966x_ptp_txtstamp_old_release() frees it while the qdisc still
  owns it.
- Otherwise skb_queue_tail() links it a second time.

Linking the tail element again leaves skb->next == skb. Can the
skb_queue_walk_safe() loops in lan966x_ptp_irq_handler() and
lan966x_ptp_txtstamp_old_release() then spin forever with the queue lock
held and IRQs off? ptp_skbs and ts_id also get counted twice.

In the skb_put_padto() failure case, the skb has already been freed but
is still linked on port->tx_skbs. Later, lan966x_ptp_irq_handler() or
lan966x_ptp_txtstamp_old_release() dereferences and frees it again.

The err label in lan966x_port_ifh_xmit() and the release label in
lan966x_fdma_xmit() both call lan966x_ptp_txtstamp_release() before
returning. Should these two early returns do the same?

The PCIe variant is not affected, because lan966x->ptp is only set when
!lan966x_is_pci().

[Severity: Medium]
This is a pre-existing issue, but the release path used by these error
paths doesn't undo the ts_id wrap done in lan966x_ptp_txtstamp_request():

drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:lan966x_ptp_txtstamp_request() {
    ...
	port->ts_id++;
	if (port->ts_id == LAN966X_MAX_PTP_ID)
		port->ts_id = 0;
    ...
}

drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:lan966x_ptp_txtstamp_release() {
    ...
	port->ts_id--;
    ...
}

Suppose the skb that took ID 511 then fails injection, either in the
lan966x_port_ifh_xmit() err path or the lan966x_fdma_xmit() release
path. Does the u16 ts_id then go from 0 to 65535 instead of back to
511?

If so, the next skb gets LAN966X_SKB_CB(skb)->ts_id = 65535, which is
outside the 0..511 ID space. Whether the hardware can still match that
ID depends on how it echoes the IFH timestamp field, and that has not
been verified. If it can't, that frame's TX timestamp is lost and the
skb is purged after LAN966X_PTP_TIMEOUT.

The decrement also assumes allocations are released in LIFO order.
lan966x_ptp_txtstamp_request() runs outside tx_lock and across several
TX queues. Could a release undo another CPU's allocation and hand out
duplicate IDs?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119170729.1524516-1-irogers%40google.com
