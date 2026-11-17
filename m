Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878285;
	b=J2rQdXjQPAs/W3v7NRLQA3Q5A9YDBfMWteucpWwnHOs/ZM/qbEKlX+MCH9rLqXyJmoyN
	 vuloEl/nehStM27aRJt7mYKcrpdYVcR3aVD3DyBoDQsj4eeWbqSa421zk3N0NlbTSThaX
	 XsYyut4ZG75a7PVyLR1qgNwgYh1hBj4Wd/JjNJRJk3PXtLPYBTBn4zuS8pjhklEMHPy/g
	 pfaoFowCB6mci/AWL3B92JyEIfFpJicApbH937G48Gw9w+Fy6OsOVyaqaG05TZZxVWczx
	 fWYiFsLCWja3hoKRSVm/HoM1lKWRRzFbjkNPfyiytsxhzYei/NQKzCP57LCQib3g7Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878285;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=61ack//M3d+D7JPg06FUc5JZIHX54/ysb+G+Mp/HZyc=;
	b=4gj8T7P0wTq6s2xQrwq/6zYouDFA3fowAQWqV5fVaieGFhzYIIVTBYFFMVS6feDpEU6V
	 65pgTnDK+KOhPPByowwyxGxNMx6aiE0GRcOQI9q/aI8GB/lwOmX4gqcP1hkrglhApdSRy
	 88gYMwQnC02PPEEYh5z3vqDHMzb7FIu1rO/Oq/Ead/6wpR4pIsUPxtK/GaWG1LgHOLFFM
	 vGveBfuHOF4/EpBzrDDFIf+aXBspb6WCwTKBMJqFw3bvtBav4A6Va9AhS2KQvq7VJXnAo
	 tNdlVLpKz3W1aLTu1NdxcbcuCLSpI5vzVJqpuLbU6aHzfsZKrokIjboF+c82leRHNXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JqDj5LsT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AA606A323
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 01:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3AA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JqDj5LsT
ARC-Seal: i=1; a=rsa-sha256; t=1794878282; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kYMse+5fBHMkBsJri9HfaYd096tYnEq4+2soI3XlGj7fX93M4jmefBGSto6pgioAuuGpu8Xp5LGb5KBH//rR8M4XDUxFV2KMB7Jsm5oEkMSy1Op1XVqiTeUMkZT/ZLxz/9Q7Ig0wPTHpYeRkeAhlEtn3Evl52rlXJYDkyTbw2pE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794878282; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=61ack//M3d+D7JPg06FUc5JZIHX54/ysb+G+Mp/HZyc=; 
	b=TxEr+94Dv8AGdjZr/wSD4epilVutpShwdXqNcAcvyKQp8Ax8fMjEiLG/X5jaRaCmJjIPAd7Z4yim65CIASl8L2BMqGhJUJ39ovC+AvqNRdUrqE38jdUVGg0LR7aNz9KqvHslykrPDhodinddXG+XHCjcb179OQBHru7ijA+TOmY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JqDj5LsTHF3MWwTjeKXOkPiDxLTPRAdw1ryA+ZRjPQiAAVtQdEKe8vOitHQRg1oPOhMdhmxkJ1cmN2DALRnAK8KJdhsC5Id/A9WOwxmhYEsGAH0aVafVM8n3CgcngVFM23Nk7Jp1p5q4+UHbZU89/rGEPc0Ewn1YDwq4/ZhcMJE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=61ack//M3d+D7JPg06FUc5JZIHX54/ysb+G+Mp/HZyc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794878279180276.31937103910366;
	Mon, 16 Nov 2026 17:17:59 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id B1814180855; Tue, 17 Nov 2026 02:17:55 +0100 (CET)
Date: Tue, 17 Nov 2026 02:17:55 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Xu Rao <raoxu@uniontech.com>, 
	linux-pm@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: gpio-charger: mark
 gpio_charger_properties as __maybe_unused
Message-ID: <avuq0TzByLWAn4f1@venus>
References: <20261116124117.2922333-1-sashal@kernel.org>
 <20261116185144.GA1036192@ax162>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpjfyacu4rxcxhce"
Content-Disposition: inline
In-Reply-To: <20261116185144.GA1036192@ax162>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.853.92
X-ZohoMailClient: External


--lpjfyacu4rxcxhce
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] power: supply: gpio-charger: mark
 gpio_charger_properties as __maybe_unused
MIME-Version: 1.0

Hi,

On Mon, Nov 16, 2026 at 11:51:44AM -0700, Nathan Chancellor wrote:
> On Mon, Nov 16, 2026 at 07:41:17AM -0500, Sasha Levin wrote:
> > Commit fad4655224f60 ("power: supply: gpio-charger: Keep properties per
> > device") keeps gpio_charger_properties[] only to size the per-device ar=
ray
> > with ARRAY_SIZE(). clang sees that the array itself is never emitted and
> > warns, which fails the build with CONFIG_WERROR:
> >=20
> >   drivers/power/supply/gpio-charger.c:26:35: error: variable 'gpio_char=
ger_properties' is not needed and will not be emitted [-Werror,-Wunneeded-i=
nternal-declaration]
> >=20
> > Mark the array __maybe_unused.
> >=20
> > Fixes: fad4655224f60 ("power: supply: gpio-charger: Keep properties per=
 device")
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> > fad4655224f60 is the tip of power-supply's for-next.
>=20
> Since the Fixes has 'Cc: stable', this one should too (unless this is
> just going to be squashed in).
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks, I indeed just squashed this into the original commit. It's
the tip anyways and compile errors are always annoying in git
bisect.

Greetings,

-- Sebastian

>=20
> >  drivers/power/supply/gpio-charger.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/power/supply/gpio-charger.c b/drivers/power/supply=
/gpio-charger.c
> > index c90c824382c62..647f5bde38c7c 100644
> > --- a/drivers/power/supply/gpio-charger.c
> > +++ b/drivers/power/supply/gpio-charger.c
> > @@ -23,7 +23,7 @@ struct gpio_mapping {
> >  } __packed;
> > =20
> >  /* This list ensures, that the array is big enough for all optional fe=
atures. */
> > -static enum power_supply_property gpio_charger_properties[] =3D {
> > +static enum power_supply_property gpio_charger_properties[] __maybe_un=
used =3D {
> >  	POWER_SUPPLY_PROP_ONLINE,
> >  	POWER_SUPPLY_PROP_STATUS,
> >  	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
> >=20
> > base-commit: fad4655224f60328cc9bcf4399eda8f6d7a587a6
> > --=20
> > 2.53.0
> >=20
>=20
> --=20
> Cheers,
> Nathan

--lpjfyacu4rxcxhce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr7qzsACgkQ2O7X88g7
+ppIwA/9FFhIIGipBEm3R+cq8MV3POcRUxP4Mb2gvFxl1vlCEQqAkt1iqEegb8Ns
Ou2E+CI/RUhzhkdIM8I81pu0cxbt676lj34TTcf2LmTZHWdm8OZLFR8f+pf0RVyg
n5C5kg98M03NzZoOMFW2WQg3LfGyaxFzU61EQt5gXtsitgOPke0zp7sCiMJgusql
V7DUWpR9rIlbQs0HvOnbqGrwfnNenIO+6Rd3Xcm75cHPW4gdvq6PfjHDjdapJRVw
CGFEYNW0dd1OoS95iTTazIE0oexUQ5bWiVFodHFGuRScCkF72VgmNw8erevvfRKP
3Soetk6gRYfb4MMkcy0nyKqvOPV+6RO9C2NkeItLzfbX5BFkbvMsbF+f/zPRdZGE
1yN+ih1darnbghItwAHOj8aBv1vG4WjE1Wo1hAWcSV4oYcwZDdAzbGuavAXl1ng8
SKaYGX9GBYg/OO6FsW6ZO+qVSn3g5hO/lB/Jzyiw/rb+VmDcVRNn9pKg6PYBPNpM
guOYutN2f4XcX1uRKfFC3mXlIepISA14HKbYzUOXhPe01bRmPGFnYh2FtmVeJKG+
WLM0mXRCqrlSbRU5lwrcvY6Y1F92rmx3OhxX6zsMsne95CI1FgSadPiJu89H1Vuy
EBcbsPyfAJY8lQlQvUoz2cmjTlcJPoFZ/hRDpRhnapmhB8pzihM=
=+QFC
-----END PGP SIGNATURE-----

--lpjfyacu4rxcxhce--
