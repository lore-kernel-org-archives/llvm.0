Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189B4C9D;
	Mon, 15 Apr 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713171763; cv=none; b=eEP/iCmou5vR0RfkAES/v+oAmF4gRfCSOx/ICsmEf4uPTSbt/ZswALn88QKFJCOForvo4VmZNneYflUoK4nEtAuYs3OWH7vDDtN2eaztaXlrcTzjaPj+e9u4XdmFmQZAwx9PME4PQInLheiaLJaPRiGMjn5WF1wu0nUs7xDT0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713171763; c=relaxed/simple;
	bh=E8lJOCdK8FQM0hhZ35cBmEj4c5+MymmDAJiq2PBQpTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdT0foQxLj/9iaW/axpyX3wZKKSBFXrnh+M5qSAP8hWfzXAzNDo5dULQcesB62iyf05d3LXMUPcXJPwTspYqUiKD7cNUVPbgpn0TdO82cM87Z2QZPO5fXUemlpwUKJoHXBOpBfN/vXgQQRsMf+/Maq1K7AhKwk5a0yDNMm8YjM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tWj1pOTe; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tWj1pOTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713171759;
	bh=E8lJOCdK8FQM0hhZ35cBmEj4c5+MymmDAJiq2PBQpTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWj1pOTeYoo2e1poeMd7fUBumJijr3GIjRVaNmA3eKDg1+7bT4cCckvRIkZBpqviG
	 aQJL5oEKhTq7USi6lGYuptOKJeub/lWSafDD1xq1DoDjom6FX+aKXmMdl1OqYNsWRs
	 pfQO92k0Vlg6fDqYy7RceA1bAFnHFpQSSFgAC2IDfhP2rldMpagnGfxYcZ7+pOqvT4
	 HqOXBoKaEVsXaKgpa9fo6E1LNmGOpT5cyEblmInn+g9ePZJmNyxG7AbHr1kEOuRck8
	 PIncnFPChH7TAQ/jk+SDQIOIuPoTdBbkMW11PhKFieMFv8T8D0Pz1YkGtBQkpJedhE
	 agLtQGw7VdPfw==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E5C1C3781FE9;
	Mon, 15 Apr 2024 09:02:38 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 8B32B10606FE; Mon, 15 Apr 2024 11:02:38 +0200 (CEST)
Date: Mon, 15 Apr 2024 11:02:38 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Kishon <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [phy:next 32/34]
 drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is true
Message-ID: <4b2coewj2ukn434e2adhxga4marvdi7rcwveuhhtaphmtllean@qmpdfr5l6x6u>
References: <202404141048.qFAYDctQ-lkp@intel.com>
 <x2ons6nqwuj4a56eskuf53n6736cmvjup3lxds7ngpnm6bte25@4tqfnkjg7okh>
 <ZhzY2-dN51EO03Tg@matsya>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjj6ef2zkm2aqerc"
Content-Disposition: inline
In-Reply-To: <ZhzY2-dN51EO03Tg@matsya>


--wjj6ef2zkm2aqerc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 15, 2024 at 01:05:55PM +0530, Vinod Koul wrote:
> On 14-04-24, 18:05, Sebastian Reichel wrote:
> > On Sun, Apr 14, 2024 at 10:31:04AM +0800, kernel test robot wrote:
> > > >> drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variabl=
e 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-=
uninitialized]
> > >     1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> > >          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > [...]
> >=20
> > > vim +1292 drivers/phy/rockchip/phy-rockchip-usbdp.c
> > >=20
> > >   1284=09
> > >   1285	static int rk_udphy_usb3_phy_init(struct phy *phy)
> > >   1286	{
> > >   1287		struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> > >   1288		int ret;
> >=20
> > I dropped the '=3D 0;' by your request. Based on the upper bug
> > report I will just send a patch readding it. Is that fine
> > with you?
>=20
> Yeah I missed the goto statement which would require this.. Btw
> looking at the code again, why would we not power on the phy in
> case of DP or hig speed?

rk_udphy_usb3_phy_init() only takes care of the USB side. The DP
side is handled through rk_udphy_dp_phy_power_on(). Also the USB
side is USB3 only. For USB2 support an additional PHY is required.

> Btw, yes patch to fix would be welcome

I will take care of it.

-- Sebastian

--wjj6ef2zkm2aqerc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmYc7ScACgkQ2O7X88g7
+povvQ/+JbFYb3PBHQ4hk13ZAqoH0HGyiXuC5U/3PRsbSFljBT2BuQppbrboEcdV
vHL2WQV2TvzdMpA8+24GT9B2/tL/VmxJUJFK0DibM4FGEnKk4jBIbzcr8w/48eWB
dJFv0ITSXSjB41lzzdRwDbicLt4paD3CEPavuIq8uPVRIPfDPIfoTQHO4/h4yO+Y
XKJspHNfASJrNQU4/NPrkWwUo5+aWA1ES+ZHaL2erm+MgKHWag0T94V0k/UMs0sR
6Tj17ZAUlPCrn5iFyydcHPwbniDuqusJEC1b/C5Mt345C1Wim83QE9bbe9UCqtn7
C3AY+scKaL+tUO3SXcCHG+m9M2s+XNFXvyjz0mOTBTIq/9slyKzYlYglvQRMqxS5
tI7x8AG3Sh8KmtRy7SYmdA82DU9S3U4dZ0hEP6FUzYXcJaTAOosiR9r9BqsWCERb
DkifY9TIUqbA3XdPHgGb1mPbNycRhsogUQHB8WJ/2SxZX+lPnhSEv4xfC4hxHQsU
yJNSyjnSC3p4dwqHVOJN7fDkGfx0oEm6MYaHsbuOeebq46TvnW3Ts73A9jhnvUAk
vf9qOSGIh/EDPJUIwVmusaIk5h4IKDDfmfP/l5bufou88PBIudvWOppWqB/YwYvu
lKfzZmMAfSE7SkPot4D29bFRaUBbjMLscyRZxno0QB6P+gh44QA=
=bzu0
-----END PGP SIGNATURE-----

--wjj6ef2zkm2aqerc--
