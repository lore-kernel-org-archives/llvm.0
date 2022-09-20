Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A126111
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 14:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B702AC433D6;
	Tue, 20 Sep 2022 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663684190;
	bh=I2AZ4a5ewLRtZ+OVequFYRKX7N+DsK2ocVC2jmNUcy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m8z7qP5xpdxGu6V+FBcbAokFPNddjLsAQxkYlWf/CecPLC3/GEv4XeX0spnREGC83
	 lw1WvvY+oYo4wOklCruY8v8kvArRs0bZ38DIBRwjcqZb9a7RxvRuD/AWIqBixMvcoP
	 ty+BFcQpMgVZRF6BR0qgcx0Pu01tSJ54+rzr19LaZ9dOZQtyUr76XkaqCOrMy9xPMM
	 NWFHwru/o56ka0ttJzCB1P5YxJNbFNJaJgbC6ArDnnpB6FOMYdlKm+CQNsFyOWqn5h
	 c8wGYyUx/FpTimpcW/GOrSBrO6In49DVYIZ9IibQ4NRZcn4q2tVn8Ok2WSECfJgRfI
	 rbbp9ajXpcSVg==
Date: Tue, 20 Sep 2022 07:29:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Casper Andersson <casper.casan@gmail.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter
 <error27@gmail.com>, llvm@lists.linux.dev, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Lars Povlsen <lars.povlsen@microchip.com>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: sparx5: Fix return type of sparx5_port_xmit_impl
Message-ID: <20220920072948.33c25dd2@kernel.org>
In-Reply-To: <20220913081548.gmngjwuagbt63j7h@wse-c0155>
References: <20220912214432.928989-1-nhuck@google.com>
	<20220913081548.gmngjwuagbt63j7h@wse-c0155>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Sep 2022 10:15:48 +0200 Casper Andersson wrote:
> I noticed that the functions that assign the return value inside
> sparx5_port_xmit_impl also have return type int, which would ideally
> also be changed. But a bigger issue might be that
> sparx5_ptp_txtstamp_request and sparx5_inject (called inside
> sparx5_port_xmit_impl) returns -EBUSY (-16),

Yes, that seems off. IIUC error codes are treated as drops, 
but the driver doesn't free the frame. So it's likely a leak.

> when they should return NETDEV_TX_BUSY (16). If this is an issue then
> it also needs to be fixed.
