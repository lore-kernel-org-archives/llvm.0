Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601297;
	b=j2B9chc4LRL2dJWCmZCqNMJBEET/j7d7IMPicj47enesJn7L5Oln5eGHIyJSAxgMTrIW
	 8p0yqCWJ0QKvFAR+C9dinsLuASpbe8KUtPbkAOGKlEi82Iy8kkaJFfWdhU9RJlvtgeTfu
	 Wo2fwdFRwu9/EtkjLW0iT7UZpe0oBzlYEcx3sar3RE728IJU6TyR3YmM2wYJsIIfxE/Fa
	 JCeSTDcQuLxLvbgxiC/MAYQct6rtbjx4Q+g4LzIZtomUgw+4ckGL47ZGpoTzOhCzCebmP
	 9jwR7YCu55sdHsMvhFi5JE3AWUimF9bX2sMqBxgOkg46vuOp37epgYG/eg1XasbKQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601297;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=huWNQd8f5dKBY/anqpOcIdlAG1pqKmrF0SOJUgi2ST4=;
	b=LlpB8tGJibV2jaLN7VAC2hPgVED/Y/M9n9f9I3Os2pTuohy8uLQCmNSklUunVkto8Cs7
	 sWzxgN52KA7nGfDKeu+Ggno9CrI9HplwRTnRHi0f+VBLPMbjJh47/Bo5UTYp4x391GIoM
	 aWVz3xRHh2S2aSBeUtdCKdU/ida11Y33LInbjKSdd6j4sb3WITOryjPa8Kc13wQZ4nrSl
	 HggRzQal4NCWa7CFGRXdFlwPRJgQD6qWYMkIvuMQ7bveynRcP6YJJeNgK8c2HbgarXak/
	 YcGJhSjYIfPFDNskQ3I58N73VDHB/CSyJzrllkzUFRbYQ1vSW4l6GcmzvR/3s1VH7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="vKwm/ysx";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2012606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 10:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2012606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=vKwm/ysx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795601296; x=1827137296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oxUsbUUI6wl3gb8tpPgl9CfUst6l9KNJvinAj8Kgvs=;
  b=vKwm/ysxVXX9zi6zv35geIpf2tJo7KP57OnDegUpUr7Yz2pmaYfJXpez
   OUkl1Xbe676k1x3KIpyeQibhir2OohMNHOqGXKah1mrX4gRIwf5VVi3yC
   IkUphVI1GkvPaq1FJ1cFZuwzxP6i+Uy7+m8XxgUSZOW57APNbbIRY0gGX
   WELkdIkuM/rrsduQm+tFgg53xCrbHfE/y0d5gGiBN+Lfx0uBit5UZCPFk
   ncXRimQc1hdAa3OW3ld3rHtbCXJbAQYEPQ5LnrcOdtHs1oOVPWrhvPXl0
   f5gsazogc23ccdAMQ9U/j8Bwdg+KHaNtagOn7wxYQnwaC2KXSlot7+Drr
   A==;
X-CSE-ConnectionGUID: VvsAXqvMTYyfMnYDI+mTpA==
X-CSE-MsgGUID: 8cOewiq1R/u3NMQhgpJddA==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="234072207"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:08:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Wed, 25 Nov 2026 03:08:15 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Nov 2026 03:08:13 -0700
Date: Wed, 25 Nov 2026 11:08:12 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: <netdev-bot+sashiko@kernel.org>, <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, <elkin@google.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
Message-ID: <20261125100812.gywdqx7zkjelinu4@DEN-DL-M70577.microsemi.net>
References: <20261119170729.1524516-1-irogers@google.com>
 <179545939880.3135.6341792822211409455@kernel.org>
 <20261125004031.1005034-1-irogers@google.com>
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
In-Reply-To: <20261125004031.1005034-1-irogers@google.com>

On Tue, Nov 24, 2026 at 04:40:31PM -0800, Ian Rogers wrote:
> On Mon, Nov 23, 2026 at 10:43 AM <netdev-bot+sashiko@kernel.org> wrote:
> >
> > [Severity: Medium]
> > Will this tx_dropped increment ever reach userspace? lan966x sets
> > .ndo_get_stats64 = lan966x_stats_get. dev_get_stats() adds only
> > dev->core_stats on top of what that callback returns, so legacy
> > dev->stats is never reported.
> 
> Good point - dev_core_stats_tx_dropped_inc(dev) is needed so
> dev_get_stats() reports the software drop alongside lan966x_stats_get(),
> and it avoids an unlocked increment on dev->stats.tx_dropped as well.

Yes, only HW counters are reported, and the tx_dropped will not even show, so
converting to dev_core_stats_tx_dropped_inc() is right. There are 7 other call
sites that also need updating - let me pick that up for my series.

> 
> Daniel, let me know if you'd like me to send a v2 with
> dev_core_stats_tx_dropped_inc(dev) (and netdev_tx_t return types for
> lan966x_port_ifh_xmit() / fdma_xmit) standalone, or if you prefer to
> fold it into your upcoming lan966x PTP TX series.

Please go ahead with a v2 with dev_core_stats_tx_dropped_inc(). The netdev_tx_t
change is hardly net material, so it also fits well within my series, please
drop that change. I will make sure to credit you on that patch.

> 
> Thanks,
> Ian

pw-bot: cr
