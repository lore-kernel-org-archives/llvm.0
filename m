Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6648F4E
	for <llvm@lists.linux.dev>; Mon,  1 Apr 2024 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711952658; cv=none; b=Dkrmlovfq6AHGUWqGkwIbas50jkQ9DJoSlIkUS4Roa1yKNbpg7r0/qac0QsmFb7nhKtP+3Wz5QYScF0ajQUXPNSU1PU2CSRwBL9v0E7eJQ2PbpCh+fRlG6QExC21kdpCQA+3HT7KZ+8OI/w5XM9049TMGteXCFdj4BKu58zYoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711952658; c=relaxed/simple;
	bh=tNXqN5M71+tjw6FpcPPDIY/Rszo4GvwiHe9uN7gj2b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfYE1pq1DfSM/QpCx63W9xE3LBugiUL+cLWbK/nqBHhJLoAtn77ECyEQvLedPfDRv+NNVN+Bj84j9wOZsS0p0aZY+QA9ghxB0VWZMIGj/YltEc03KcVMH6KO7cTrHmD2/5MkugjL8tS+bSyeXXVxYJfunFQCC0DSTuEGNLiDMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrB5a-0000GP-Mi; Mon, 01 Apr 2024 08:24:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrB5Z-009k0b-D4; Mon, 01 Apr 2024 08:24:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrB5Z-00Dx64-0z;
	Mon, 01 Apr 2024 08:24:13 +0200
Date: Mon, 1 Apr 2024 08:24:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] surface3_power: avoid format string truncation
 warning
Message-ID: <yiqdxzxtcw4dpths24sl4x2qwmuf2bj5lnayd3pclk5zf4h3mm@oc4l3ojar2i4>
References: <20240326223825.4084412-1-arnd@kernel.org>
 <20240326223825.4084412-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v26yt34kxi4ilpyq"
Content-Disposition: inline
In-Reply-To: <20240326223825.4084412-6-arnd@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--v26yt34kxi4ilpyq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

just a nitpick:

On Tue, Mar 26, 2024 at 11:38:04PM +0100, Arnd Bergmann wrote:
> Change the format string two print two less bytes so it always fits. The =
string

s/two/to/

> is still truncated, so there is no change in behavior, but the compiler no
> longer warns about it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--v26yt34kxi4ilpyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYKUwwACgkQj4D7WH0S
/k69qwgAo8++BQ8OE5ajtNU6wrlQxb07HGXRy3w/Nb7iL0ELQ6yDY51J7dRFylDo
/hmKPWn6X+ybKlK1W1VXlA1Qm+UbMHaj3KhHMUR9rFAC2r1SLzxJ1DpP0zdXe1Qw
h/rErFvH2tgtF/C9ZeNNWputJhMsSlTkJJUJYACkEb8hdEDDbv/wB0y/wBsl3uBi
KFdxlCFmr54MtZbQ+khq31iVIrmbAqHKL8VAVPiiuB16I0OJwsOzL5C0mr/w1t6F
C2Ijqcy2kHwcdzzNQYRwAJR48nwZNc6Vp3G2jD2FlhuptBMngX1RrFpUeYkAgjbt
04h9y2wTPfVkwMUViYBW/huM0Fgi+g==
=VQ95
-----END PGP SIGNATURE-----

--v26yt34kxi4ilpyq--
