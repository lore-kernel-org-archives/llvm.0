Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609916;
	b=o31rrOmpNWMo9Xy9KwOdjJNQn4SRAO+Dn1yRkSpQTIeNYw3pZ9rpHewZq16QzNVkG8jA
	 ZcLOAODWDbtfxXuUKZW+VQVGbIrRbCQJ4CfvOxrkOAmff61WI0zWrqx44xBZWtpVQV7SO
	 0bCgK8/RQEHcNqRYm0k5OfXtn9+IIOH8CqOEwnbkxnBDdUa1p7B4y8zfbw/0eF0NAcUey
	 I4enBn5I0Vi67b6IBhj/8nIuT46iaIHDGOkQz2AjgrJh7O2ejWp4lPrR+1aq+Sw7UJ+yp
	 TmoOjCxKo7nCSiCr8+mL4FFV+BEre2P7KK47IvPZPWezTi/4MEbmxf1mPciGjiKUbcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609916;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3yaDcAf1oj/ySN2vpJMlDxXJGpm/IAJcorBM34baRh8=;
	b=IxDGCFUl8Km3n2lfb9gLX+WhI39U2itzjpmK1cOgllOLKCpkayOqApd5x46y7uUP0u4e
	 rYKoXVZI0cYQcHfgacLLUHlfyakaIyLj3mwXLvPG0lSYd1i0TAvEJ19+kJ3wGBDvazheU
	 L8cH66mEdPuOc3W18iVfQg2iPauL/4Des9ZCOEWmJeGcDWM8vIFfBcRtQ1NEtqrQQeVe/
	 cL4uT01Z0aY5ufn7guycw+n5GRPZ7l8WxgW42sd2vrOyOsSld0/ogtEWQhJHUlq59b37m
	 RyXPPughoSzH4pcyIZEsbix1hf88+Sl3IvBeBiTEf/eFOBKuvHFafLSbXnVriPe0tmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=KufApDAa;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23CB606A329
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23CB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=KufApDAa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795609924; x=1827145924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4UZpFuKDX/vjyd2dmzd1ze33NJp5qh9mgYFYYWHOYzM=;
  b=KufApDAa5vjddO5ARfdM5FVzHJXJXBnRIw1hEVq+8bR2K9ZsHCOM9g/n
   dd2tLoD4jj1+BPKzY93gq5dILpjR3ecMPLve95B3DxS1BYCKm7RYByEzn
   OTXdYkTdYmNeKldAOG7a/QbxT6Z7Z3V4PKk+PKPeQB43PNncVGHP8JhD7
   C19L6qNcC37IimItrtyeJ7hb0R5yKq+kHHyoTUaLd0LJiQR4ODGr8hVfy
   7JqtxZude/RPJV/+EkQdc2tq5w8/woH2+sLMGL49EtwFarJ2cugzX3BTp
   7DbkjijKEWhUXN5MAXvxJ/+u8iuZCEIKOeq8Eu+4TGqa4E9lMxyO/reEJ
   w==;
X-CSE-ConnectionGUID: Z/VTAwobRie9TaLrsDOrXw==
X-CSE-MsgGUID: s218ldDgS0uvBxuK1GrKrA==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="298445225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:31:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Wed, 25 Nov 2026 05:31:47 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 25 Nov 2026 05:31:45 -0700
Date: Wed, 25 Nov 2026 13:31:44 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Paul Fertser
	<fercerpav@gmail.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
Message-ID: <20261125123144.p5i5dc4ifsnqbhly@DEN-DL-M70577>
References: <20261119171009.1534335-1-irogers@google.com>
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
In-Reply-To: <20261119171009.1534335-1-irogers@google.com>

> set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
> nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
> last VLAN entry in that window, list_for_each_entry_rcu() executes
> zero iterations and leaves vid uninitialized on the stack. The
> subsequent 'if (!vid)' check can then proceed and program stack
> garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.
> 
> Initialize vid to 0 so that an empty RCU list cleanly hits 'if (!vid)'
> and returns -1.
> 
> Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> build. Verified by building net/ncsi/ncsi-manage.o with LLVM=1 W=1
> (-Werror) and -Wconditional-uninitialized; not runtime-tested on NCSI
> hardware.
> 
> Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  net/ncsi/ncsi-manage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 1d63958c4429..f7eca228c281 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -640,7 +640,7 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
>  	unsigned long flags;
>  	int i, index;
>  	void *bitmap;
> -	u16 vid;
> +	u16 vid = 0;

I am not entirely sure, but can the list_empty check below be dropped as a
consequence of this change? Seems like the !vid check further down catches that
case now.

>  
>  	if (list_empty(&ndp->vlan_vids))
>  		return -1;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 

Either way:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
