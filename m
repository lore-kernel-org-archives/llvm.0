Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEE1E5B6D;
	Sun,  2 Mar 2025 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740934668; cv=none; b=cnNFPC1pDun80xi1OoKy2mpsinTsn8KbLiFbQYGTybZwEMB8Ei9yiOf//902MinsZjUhOtzU6U6jS2ShKWSFH/CYVLqIdy8y3vLwdk/HXefHqcCm7SyLMjIQI1aETNlvqQrXEB/4qMWvXANr5x5ZaH5SXQfFYcTUe9kHVf8yDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740934668; c=relaxed/simple;
	bh=eXIFigcw2v1l0erJyvVdgrCZxj+gl/c5C+aENFzukPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=havloo8S4Guh1iztg33K1RYn4zY+p77GfIyuT0bc4WYVIY7HvtMK55uKaJ0qmyPqkUJIx15kw7Hqe7gJErv4NkqZCVH00wQQ4WLvFZiTlC29LK9BET81EewmksF364LUt4vasINqWV+XpmzgoqGz95kKNJaECJOmDoQ5Ij92QIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Flye+ceY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Flye+ceY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BdhUxgZQyYSaxCMjUUfFB40V7qLBLiDr0YrQlK0U/f0=; b=Flye+ceYOqu8AECHGRU2ak4hIW
	Qd4mqblJcQpkCy9IhlJ/JEF2V53sDFWmdou971t+zeXIBACqqtlvwpJ0543vrieYUw7UPRqlQx149
	0LYhLzy4cF3wd3PiDO2ablmr1X3qOTNkmFurAdhHvTqIX1N3oWUvMsn0E9IC0IknnNOyQbBdLhasc
	6MT7E8gNJ0BtgDvSGHzlBHxJJlSYxW/83kxjLlM8szUXs7ipAOwZ221GQin52VdnMNj3o/nzc+UW8
	I9i3/n1r4YO5jJk5Zx50j+HQfNpHg3G7pnstz2SusI+aW2XnQxe26eqDlQXhBcWWeIcWGT5okwrQZ
	e9A8IvXw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tomdJ-0004JL-0R; Sun, 02 Mar 2025 17:57:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Tao Huang <huangtao@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject:
 Re: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of
 type 'struct platform_device'
Date: Sun, 02 Mar 2025 17:57:39 +0100
Message-ID: <870511149.0ifERbkFSE@diego>
In-Reply-To: <202503021302.FjsycBI2-lkp@intel.com>
References: <202503021302.FjsycBI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 2. M=C3=A4rz 2025, 06:53:23 MEZ schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip.git v6.15-clk/next
> head:   36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a
> commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a [10/10] clk: rockchip: A=
dd clock controller for the RK3562
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250=
302/202503021302.FjsycBI2-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250302/202503021302.FjsycBI2-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503021302.FjsycBI2-lkp=
@intel.com/

I've "fixed" the error by moving this new driver to how we handle all
other clock drivers already - not allowing them to build as module.

I've amended the original commit for that and also included the lkp report.


Heiko


