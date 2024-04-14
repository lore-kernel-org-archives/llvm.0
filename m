Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC632537E6;
	Sun, 14 Apr 2024 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713110748; cv=none; b=XQwPuEiBdONhIcAdRyDdCvDhhdY7wynGoC7Q5YIUSWVpeyeQebKbIWgkrjcng+NnjHyPoC7O+OcraUlWy4y3Kh1ecKRMZPBEz4U8p1k3zf1Fv/xBcGr6lfzN6p6a1GUiu26gj9zDeyeFdpCL95867AzV94xp1GS4U5HRm8Fv+nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713110748; c=relaxed/simple;
	bh=4VfQoOm2z1dpXaZ7yz33l4o4LbkhvwecxbeEZ3DjSBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH3In4G3Cg4ye0xq5iuhokV7Vc2jFmwIgnk8nTZfhJfsprRLBuYSkWMwV5BVT9Mr3BHA3tFU7S8V0ALvIfITOJRweaIb6ZtlDz49D2p5+dJQVmJhfqO1wru1dqNNeo4XlCm5Swqd6lHqnJjxupJ8ucsedomj7KZV9jzVlo7w5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=43PeKPyu; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="43PeKPyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713110745;
	bh=4VfQoOm2z1dpXaZ7yz33l4o4LbkhvwecxbeEZ3DjSBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=43PeKPyuO+6GyOOJk8yDx35K+lXjrPlIsH/IDfYTqZJya7gvdZe9ZlgJbFieo5/Lb
	 9NmWh0nesAI4OWOkwPm2u6K+sngkLbG/W45IlPKGD0dXSoOPO1YBXV8aS/ptU67mhl
	 /x+LLVbn6tHKBXWg1nYKtdM7Am+tZmrmjvfqvVATo1U/T9XNYyl+rZqeul1yzCEGYE
	 9Jkx4/ZnROanm4+3my8zPtISlwoEUwP7+snoxRt3VF1Q87SgrOYlcXP/0by6N6SuLN
	 9vs+jumZextpTG8y4DKWXvBv80Fp5GThRTf7qIbhLHLlwOog4LRdgBjMrCETrHtFJ9
	 D+af6Umrql4rw==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C65643780BFE;
	Sun, 14 Apr 2024 16:05:44 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id A374110608FB; Sun, 14 Apr 2024 18:05:42 +0200 (CEST)
Date: Sun, 14 Apr 2024 18:05:42 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [phy:next 32/34]
 drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is true
Message-ID: <x2ons6nqwuj4a56eskuf53n6736cmvjup3lxds7ngpnm6bte25@4tqfnkjg7okh>
References: <202404141048.qFAYDctQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5qbwyk7b7jvtt6v"
Content-Disposition: inline
In-Reply-To: <202404141048.qFAYDctQ-lkp@intel.com>


--i5qbwyk7b7jvtt6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Vinod,

On Sun, Apr 14, 2024 at 10:31:04AM +0800, kernel test robot wrote:
> >> drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'r=
et' is used uninitialized whenever '||' condition is true [-Wsometimes-unin=
itialized]
>     1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[...]

> vim +1292 drivers/phy/rockchip/phy-rockchip-usbdp.c
>=20
>   1284=09
>   1285	static int rk_udphy_usb3_phy_init(struct phy *phy)
>   1286	{
>   1287		struct rk_udphy *udphy =3D phy_get_drvdata(phy);
>   1288		int ret;

I dropped the '=3D 0;' by your request. Based on the upper bug
report I will just send a patch readding it. Is that fine
with you?

Greetings,

-- Sebastian

>   1289=09
>   1290		mutex_lock(&udphy->mutex);
>   1291		/* DP only or high-speed, disable U3 port */
> > 1292		if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
>   1293			rk_udphy_u3_port_disable(udphy, true);
>   1294			goto unlock;
>   1295		}
>   1296=09
>   1297		ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_USB);
>   1298=09
>   1299	unlock:
>   1300		mutex_unlock(&udphy->mutex);
>   1301		return ret;
>   1302	}
>   1303=09
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--i5qbwyk7b7jvtt6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmYb/swACgkQ2O7X88g7
+po1nQ//dC11ktvFvoQ++fAGw/OTZZCEaKkteyM9DFQMWv1BwRGIXskaR0nqhxll
ZwR2Bj1zjAk4JfoABRist6ZrIv1W4laJGnIfmSb3dUxmoqxHQqc/SsulENgKk7+U
gA+2Ph80peaffe9VZtqG8r2y3VWE0rylROdnFnLWmexkRM3HlsAubbPiHURXVfdi
OGqmIDpI+F4B3+olBh/8J1Lp9dRi+LieHDOEhh0RvbE1RC7MXYOTwC6XKfa2aesG
zdn0FHtE84sAUlB5NNheFo7bX6WW+vJwAE/MhDJe8rLjlsJgnjLFO87XCdd2st2p
tsOu+h1/Yx0dMnN6nSUVrRCMEhy2K6ifp33G+raooe//AL6Xa8UJxS3GpNDq8Gtf
ZA072IK25d7hpoNIP3ecaZ6QZ37KMCHOg6tiL5+sPRWJGMsNPwygYgvy9mB3RtkL
yOmEcgSMlhOSTRHTBMRmp/eA6o1R/xGL9CCAf9kBy+2f4A8NF8PRuTvfTbKjCAqO
O+eurZ54qQalx0Tre8/c4kXKgwyWQDITChwucbjEA70VjCX3+iu64c2e3scsEn5f
OFAJUPQbePxRBoEewV/tUJ70ayz8FU8PRPkrYrVkMqM0ekx/JCVDj7+a5p6D8No6
9FjYlgxKmQD3twwzsqiZQc+SxR2D+DYxtYzjOfRc0jcB5fGJKus=
=75QF
-----END PGP SIGNATURE-----

--i5qbwyk7b7jvtt6v--
