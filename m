Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344721;
	b=zzDbdCUUoyXnzuJHUWaelJx5mwMqPev2lV9KtNgg3Df4RB9VBaLHif+GJTx0QMeH1iAM
	 0/NqmVCDYABGtCgfXGm2p1fyHAa/P97B56G34wpr74z/2e0OhVygPl1n0sr0aDGpqkNTu
	 U6viPvZZX0diVScgjQgSId+ct7NA5gJVVnBli8bUinjH3CPdQXT55bZhIM8XGzL+Rlq+r
	 6wkZlnz5euVI16bh997E4mh+mmRAKchJKidwrBVoL6nBeItHiWu3/NJHv6VT4f5nIUOvE
	 aEJtuC44ChF4kU+RKLVf85kZBpIux1aenesE0+pRM/0d4WFm2IVs1RoN7AE2w8to+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344721;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Wt/0ZYl14mZIZDfmDwgyA7tOvkpPpdq59BUQnUEDeqo=;
	b=XOrm7FE3OmB7MSP3MOiNYLsVyp2KEV7+roRGUSUp/J6krAfe5FPaZYXWTNYQIic4wu9S
	 wjW3BtTM7IJyXiu92MCeuRxbQpPmcr+pXovHe7bjCjzSPxjt3jZiTsY9K6CtAHr3qP/Em
	 MtK0+bI/ECDLgmPOiNF2mso8oB6KVeFFJgdT6pGYmwhYrXDXRovPwwg/Y6ByKobgI/XIH
	 /RGoZ4dX13yUhdbBbmJTBMW7u4IkrnQvI0o/laPW423O204vOcNe5X7bPVS7ag5FxMRoz
	 /1jTTn9qsprmZjE1R1X10qKPPhxtxGDpdaZArhxuXaB/zgCoMBn2ACS17FT0Bm4MCyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=lk9lWSen;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dLYLBOlQ;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2219F606A320
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 10:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2219F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=lk9lWSen;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dLYLBOlQ
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B76B61400261
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 05:51:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 22 Nov 2026 05:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795344718; x=
	1795431118; bh=Wt/0ZYl14mZIZDfmDwgyA7tOvkpPpdq59BUQnUEDeqo=; b=l
	k9lWSenb2A7K61GD9i/W+xDm8oy65RjsUvwU6lC6auX6sL6vEYXjSKUjsCrLc3wy
	DQWpeephrzGLCp7TNA2gbUub14gDTQNNELfQqTPlNua+89CvHIPq1P975/jwieSU
	Iwn1A6SXCa3VpPkqUrs6aIOsZC+TN/6NXUzK3msKt9pPcMFZ5MI4wBHaa0AlyApL
	RtJBx956+6OhpACFeTNDUrO58HRt7xY4N6id1yqQP62JKZjAOzGtTJ6EOlRQnTH/
	PA1ESpjS1RmxJBspavwI595b5tEVU9q/DBagNXS8bXuuL4UjXFufPmZ66395C8Xd
	56HN+mJuJi1DhWYOrEaqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795344718; x=1795431118; bh=Wt/0ZYl14mZIZDfmDwgyA7tOvkpPpdq59BU
	QnUEDeqo=; b=dLYLBOlQB+01hPGmj4n7CCc1v2xmMxjFUqEE031jLlLHfausmgl
	j+LDvhqzuUnGHyAHYwzqm4eVLid3YmO3ihN057ZA/LtYERKpfNc2XcBc465hP438
	dDMw4a+9a1xwPJdmtBdF+GK9pMp8UzqWcTzZKS3zdkWMKmXmdYCYHdmXKQkmS6r8
	Vr0He6nHl9E39f1d+R3NrwIXxrqZO21H4rKGytulITYIfjyOYP4fHYLzLlzIUEOb
	a2dnY4GSHEN1RYbGeIu87qbm95iaI4zHxdObUqFw3D1ka6fsfN3dRPn1oo63GRTY
	I5LmepiwGYBfBLfpOS/Jx77T4cSPxdoudrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795344718; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm3:rsa-sha256:MbYeMewWotuGZMFcu7h/eDx8Z+R8LQk/qdD/OSOk+drJ7Jj
	WK+LBTWSEtHfheh2vw86bv4hW9sOq7j0lRnnGaFBD3PXsoZNT+1QuX1nSUABjQuG
	bDy/MqvK/XXFOUQBWQ8yo98Oop0tPZ8rlX192gIqyiIUHz0y+cErl8KpM6/nA0aH
	t+ovXghGjys0W0To3oRGjrVfswXTIZ6d4pxwJJSQnB0u6RnU/nNGgX5Nv/Nix82W
	mfH4i81b4ismvO7rJIUPbwln+rLZWBCT3MoR05YW2GTVg2s80+HgXJOr8dgjKj3R
	oHDEwf2vKCNTqw8dxnfMleocniCXpBIpQ0dCG7A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:b0XcX6tgg5+3EgH/4IEfIjcPAtZvtlQmra5sM4bvGsk=:S0/FaFeE3lIwVB5ICtz3b9uvITmZQS5+p0lZrMTjo5w=;
X-ME-Sender: <xms:TskCa6Z5BOxA9VnTfbXUuvWdfigktu-tbWI31R-0qyENeIJ6tX1pYQ>
    <xme:TskCa2VJN6BqOyq1DSNuFdgpgzr3ceZcvof9fnVfZTbSFilF8OKcYco7ZbNbFASug
    V2z2wHCd6gGfTq0_YaDi6YMBq2y_RXu8q9Vaq7Ketbqlp6_l_N732o>
X-ME-Received: <xmr:TskCawhG0HhUashzTZTSGGZDoDmmt_pA6Ov87PhqXt5SPAR0iLwSxceAkgoS37A6UsQjPTX1VZxr4f3gSaaYp4U6Kqpv-w>
X-ME-Proxy-Cause: dmFkZTEha3FN2Rsg8jyRUnzt1CM14thpz5e0SQ8cPX9cgw9YANuj6Cqz59naeW0O+hF/io
    bUmWg/8UtLiT22z1bH8O6BdHS2BizwLs8a+QTGcW2D9vgp2BoxpGBV7p6CYk7pWjYr9vOj
    CXouNXKvE1gMQxXW6ELVqIHRpifIrSEOOPhsrMwVZ/2oA8BQw7PZnJdLNWgdah5dMzKacd
    X4qzRbOhOOqQMu1wWb4BfhEn9Qi3upPZmrJhWTl6ZV/yjgXo5muKq86OQ9ve4+I2je6dAS
    WuG+3IPLY1vvMucJttYMrlPLO2zMc7Mku7tz/oEGTQsqjzznKcriU9UBHY/smfdOAwHfJP
    bgcNlgEOYWlQP2llE55gAnhaBfo0KOrZkJPRgByVaXClQF11f5Av0P3ZTF/bFzTHR76J2g
    6BnbrK/ciJw0Fs10aeXUO9jKaKEbVrjGd5Dx3boV7/5om0+uwJ/zvVl8aDA3KXnSssMGcE
    0kzcQFXKM9nDw7u6HavFz56Vld6Gfxc1yVX9pyHZSAJ6aREjcnvBUSR8MAA9kAtGQKSSxX
    GGM6HLabIPxtxOgQlC1gGHwdGeHo344BzyIY+h6C9oQr/PHdqnDG9AUJu0Jvsu7kB7QuEh
    JDCYkvPWmkqYWX23sgJthGxcz/WvPjRDZ5i/3Bze3NULcAPzyP/PWg3iwziQ
X-ME-Proxy: <xmx:TskCa8tCagYIFRyuXNYZ8i1YF09KVtvNt7bS0siGzEDCAbvvqOoPCw>
    <xmx:TskCax4tKBlpmEGC8o2jSHWvjyb4ZQC6TH9jxFI0HFlYGgTN-k1I3Q>
    <xmx:TskCa4OZOU58Kdl2YHNyvPliuICwRTbZ3s77vJbQSRdgiVweLCCnqg>
    <xmx:TskCa_vdq5Ni93Z9EAh15ib5dF9dw34sXRhlaBCbisYJnhfShCmZ2w>
    <xmx:TskCa_IMSJzM5sUHx8jtmXJbTXwHYjCQxcHr6jwerSuF2GNwftzdnE2T>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 05:51:56 -0500 (EST)
Date: Sun, 22 Nov 2026 19:51:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Ian Rogers <irogers@google.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] firewire: core: widen fw_node max_depth and max_hops to
 u8
Message-ID: <20261122105154.GA470151@sakamocchi.jp>
Mail-Followup-To: Ian Rogers <irogers@google.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119170747.1525767-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170747.1525767-1-irogers@google.com>

Hi,

On Thu, Nov 19, 2026 at 09:07:47AM -0800, Ian Rogers wrote:
> In bm_work(), FireWire bus management checks
> 'root_node->max_hops < ARRAY_SIZE(gap_count_table)' (16) so that IEEE 1394
> topologies with 16 or more hops (up to 63 nodes / 62 hops per IEEE 1394a)
> fall back to expected_gap_count = 63. However, struct fw_node declares
> max_depth and max_hops as 4-bit unsigned bitfields (0..15). On topologies
> with >= 16 hops, update_hop_count() truncates max_depth and max_hops
> modulo 16 (for example 19 hops wraps to 3), causing bm_work() to program a
> too-small gap count (8 instead of 63) and trigger arbitration failures.
> 
> Change max_depth and max_hops from 4-bit bitfields to u8. Because both
> fields occupy existing alignment padding ahead of struct kref in
> struct fw_node, sizeof(struct fw_node) is unchanged.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wtautological-value-range-compare enabled; fix and changelog drafted with
> an AI coding assistant. Verified with an ASan/UBSan C struct-size and
> 19-hop topology test, and build-tested under LLVM=1 W=1 (-Werror) and
> -Wtautological-value-range-compare; not tested on physical IEEE 1394
> hardware.
> 
> Fixes: 83db801ce8c6 ("firewire: Implement gap count optimization.")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/firewire/core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The wrap-around in the 16-hop case is intentional and works correctly: the
resulting index is zero, which points to the first entry (63) in
gap_count_table in bm_work(). Therefore, we only need to check for hop
counts of 17 or greater.

According to the IEEE 1394 specification, the 16-hop limit is derived from
the worst-case timing constraints for copper cable media. It is not a
general requirement for IEEE 1394 topologies, which can also use other
transmission media, such as optical fiber and unshielded twisted pairs.

In practice, most Linux users connect just one device, or two or three at
most. IEEE 1394 is now primarily used for peripherals such as legacy audio
equipment, rather than as a mass-storage or networking backend.

Moreover, the limited bus bandwidth (400 or 800 Mbps) is itself a
constraint: even a few streaming devices can consume most of the available
bandwidth. This makes it difficult to see a practical need for connecting
a large number of devices in the first place.

Considering these practical usage patterns, I don't think this patch is
justified by realistic use cases. Nevertheless, the change does not
increase the size of structure, and removing the bit fields is preferable
in itself. I've applied it to for-next.

> diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
> index 8b49d7480c37..ca2150f75174 100644
> --- a/drivers/firewire/core.h
> +++ b/drivers/firewire/core.h
> @@ -207,8 +207,8 @@ struct fw_node {
>  	u8 phy_speed:2;	/* As in the self ID packet. */
>  	u8 max_speed:2;	/* Minimum of all phy-speeds on the path from the
>  			 * local node to this node. */
> -	u8 max_depth:4;	/* Maximum depth to any leaf node */
> -	u8 max_hops:4;	/* Max hops in this sub tree */
> +	u8 max_depth;	/* Maximum depth to any leaf node */
> +	u8 max_hops;	/* Max hops in this sub tree */
>  
>  	struct kref kref;
>  
> -- 
> 2.56.1.708.g77570a6a1d-goog

Thanks

Takashi Sakamoto
