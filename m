Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBD376E9;
	Mon, 15 Apr 2024 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713166560; cv=none; b=eJ3XdW3PBXy4HzDzjAjhCn5bGY4/k9pqImWP2Hd3q90kVbFw/wPeMbTfeJNwuX2fpO5OMeezRW9vmal7U43kCWhNZMOQ7132Tk6c7JThtk0eNDYuEwUztCmY9l50gXFBOJ3LvGfAxgWrqZxE7Waf+TMJLIwMX57p2g62KEQh+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713166560; c=relaxed/simple;
	bh=B342rMQ0719+eCQ3qHAYsQnAwp+61E7/n6KrpLCj7zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEpJoYHFIHQHi6Cd3KoraC86pRQEcsKK3WDDnYc/37v86Y6ZWYyx8ox8P/mhi7a67AUKknFTCa0x79bzv3ciUEuBCofNUDPu7/Rp1jSRX6Bcutk5Sp9Jgle0ijgBV0izF6qciXU4pKu3FYxuNBkPGA/QfkO4GlREcqtl8fQcaqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uacRelQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uacRelQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4120BC113CC;
	Mon, 15 Apr 2024 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713166559;
	bh=B342rMQ0719+eCQ3qHAYsQnAwp+61E7/n6KrpLCj7zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uacRelQ16G1z2+CdW5JjyZRM31+2DmGFjyJlesTcLtupcXWhDEjmyQwpPzCjRjLdw
	 ShrutRkWDc6Ee5nnBAnwT/LbFdh35NXrM6y2hO/cpGQHo0siE2n1hSKbTSV9byk7ff
	 QtZQXH05fIiZIWWSVZ35doISGZVezc2+0EcEqBtRylH127thmP3WjN45tJJV25weKS
	 uIFlAwh7CVEhJi+DF4hm3UbEhI6xg6zqiOC9tKaAqDH6llr7Z7iq2g4MnLInT5gtv0
	 h3KcyoYsKwcSI8V9sUE7POVHDBHugPd1aL0K5D9TgpjSFNpKr0wRpi8a1sYyNqmvwL
	 yMpS11t0qvpYw==
Date: Mon, 15 Apr 2024 13:05:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Kishon <kishon@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [phy:next 32/34]
 drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is true
Message-ID: <ZhzY2-dN51EO03Tg@matsya>
References: <202404141048.qFAYDctQ-lkp@intel.com>
 <x2ons6nqwuj4a56eskuf53n6736cmvjup3lxds7ngpnm6bte25@4tqfnkjg7okh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x2ons6nqwuj4a56eskuf53n6736cmvjup3lxds7ngpnm6bte25@4tqfnkjg7okh>

On 14-04-24, 18:05, Sebastian Reichel wrote:
> Hello Vinod,
> 
> On Sun, Apr 14, 2024 at 10:31:04AM +0800, kernel test robot wrote:
> > >> drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
> >     1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> >          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]
> 
> > vim +1292 drivers/phy/rockchip/phy-rockchip-usbdp.c
> > 
> >   1284	
> >   1285	static int rk_udphy_usb3_phy_init(struct phy *phy)
> >   1286	{
> >   1287		struct rk_udphy *udphy = phy_get_drvdata(phy);
> >   1288		int ret;
> 
> I dropped the '= 0;' by your request. Based on the upper bug
> report I will just send a patch readding it. Is that fine
> with you?

Yeah I missed the goto statement which would require this..
Btw looking at the code again, why would we not power on the phy in case
of DP or hig speed?

Btw, yes patch to fix would be welcome

-- 
~Vinod
