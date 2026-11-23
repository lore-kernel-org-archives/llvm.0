Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424853;
	b=awfVRo1csCWz3LeAN/OygaNxlhTGTbRMDiW94yOi5tMDEvJzVD2jcJOqQkIbU5fdiPni
	 VvrfSzxycwm7oiQBb50GsVmTfONH7etiBn17etMQnmjjdHVtAzZVGNVYowG2Likl1GOHR
	 RIZ/fVyHF+Fl28muhAwtJm+CbVefJMxeUqj34FrxWMgs7pSPRPbgE/ModXbLDGGTOuWVn
	 hGiunwQ5JxxyBEs/iS9rdAv/lLsE1ik4AvdxNDU5I3B6EBGEuszcInzwxyVLzhM+0AXAx
	 L0N5HPOZSd8Vx64ts3cP53zxBIa2JL3YEAVaQZw5iT5lSrMMQIeNbvst4t+KlfbXZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424853;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=s1+xyywWJx875swgmqI1rAMPqceEFht+o+5gfJd4QUM=;
	b=iFWRTsgYtU0ozWclpxPvzcYGtGVMn+suaUlQUUh1fcEERzsPZ3L3Q2i5qmIbX+KeCMBz
	 Ma7WQtvmOeBvCE2wKnCgIYeBx4/HRuEyhufKYg+6GUEtQtMlO571LKYxLyUYW9A0CZz0N
	 kx09m/QsuXmOTklgdk4GfrLdNFajJyumuwX/lvFN9PnE3cY/ERdQNgwHxSzA66llhtEeF
	 dycwFwFnaaEdJXDAfp7rslDYJRRqjfN1yBLSqkGg3dOpPCkg3DxswoB4AbMhl/JaajLXG
	 PhpN8DA3pE7koDfLs+Wk22l+jI9xtRz3NqYgLHuF1a+IQnV4/0Y69RRsh0+pIqfoPTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=RcjqURFP;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959DE606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 09:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=RcjqURFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795424852; x=1826960852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jEkDjgkAKC9Fxc3XQnLgmWRwUmXMEQRyG6rRR1lxVSc=;
  b=RcjqURFPswTnh1SeQJmJ6wKQNCb7vsaE25aTgXUw9t2kszXiht7dBdeE
   FGJ57R7H+WVH9CpMtpar4m3aLjGi4prpB5sf5O4r0g3T6XpwtyPmmL2BF
   F+Qtk9dK6fw2CWOTvRN8Lw6eMFxYH6TLnYEtl5j6SOlXeTROnZO+c76RE
   jWlc1VLT0ThP2VH+bE7YGMXfsWczJgfMplmIFapj1m60X/KYn7BiMpD78
   avcB1yRdkMTl/ZaxKvH1V8tAq9S0JsKr5NvEGz0NMpCX1VdibGqve5gcU
   wJf2OM2N+tcApYw8UH5LSI9CmqYeMGrLQ88xrOLb8Qg5KVFU2fcC832nY
   A==;
X-CSE-ConnectionGUID: 9QKuukfETJaxYQzdaDaMIg==
X-CSE-MsgGUID: EC7/SU8YTS6mUc72DBytEw==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="65939751"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:07:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 02:07:25 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 02:07:23 -0700
Date: Mon, 23 Nov 2026 10:07:22 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: Dimitris Michailidis <dmichail@fungible.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Elkin Cruz
	<elkin@google.com>
Subject: Re: [PATCH net] eth: funeth: Include FEC stats in
 fun_free_stats_area() DMA free size
Message-ID: <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
References: <20261119170613.1519353-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261119170613.1519353-1-irogers@google.com>

> fun_init_stats_area() allocates coherent DMA memory for
> (PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
> 64-bit counters (632 bytes), whereas fun_free_stats_area() omits
> PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
> triggering DMA-API debug size-mismatch warnings on teardown.
> 
> Extract a shared fun_stats_area_size() helper used by both allocation and
> deallocation paths, and cast the leading enum constant to unsigned int to
> avoid cross-enum arithmetic.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wenum-enum-conversion enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 and
> -Wenum-enum-conversion; not tested on Fungible Ethernet hardware.
> 
> Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
> index bad8276d26b0..e0d4e69abfa4 100644
> --- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
> +++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
> @@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
>  	}
>  }
>  
> -static int fun_init_stats_area(struct funeth_priv *fp)
> +static size_t fun_stats_area_size(void)
>  {
> -	unsigned int nstats;
> +	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
> +			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
> +
> +	return nstats * sizeof(u64);
> +}
>  
> +static int fun_init_stats_area(struct funeth_priv *fp)
> +{
>  	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
>  		return 0;
>  
> -	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
> -		 PORT_MAC_FEC_STATS_MAX;
> -
> -	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
> +	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
>  				       &fp->stats_dma_addr, GFP_KERNEL);
>  	if (!fp->stats)
>  		return -ENOMEM;
> @@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
>  
>  static void fun_free_stats_area(struct funeth_priv *fp)
>  {
> -	unsigned int nstats;
> -
>  	if (fp->stats) {
> -		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
> -		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
> +		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
>  				  fp->stats, fp->stats_dma_addr);
>  		fp->stats = NULL;
>  	}
> -- 
> 2.56.1.708.g77570a6a1d-goog
>

Fix looks good to me.

Although, I think it's more common with a compile time constant for a fixed size
used for alloc and free. Something like:

#define FUN_PORT_NSTATS ((unsigned int)PORT_MAC_RX_STATS_MAX + \
                         PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)

        fp->stats = dma_alloc_coherent(&fp->pdev->dev,
                                       FUN_PORT_NSTATS * sizeof(u64),
                                       &fp->stats_dma_addr, GFP_KERNEL);

Not a big deal though.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
