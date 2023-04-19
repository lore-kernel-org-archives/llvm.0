Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE600C977
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 19:58:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwR-0005x6-CV; Wed, 19 Apr 2023 21:58:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwM-00CPGS-AB; Wed, 19 Apr 2023 21:58:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ppDwL-00Eat3-Ez; Wed, 19 Apr 2023 21:58:05 +0200
Date: Wed, 19 Apr 2023 21:58:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	David Lin <CTLIN0@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Tom Rix <trix@redhat.com>, Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: nau8825: fix delay time range check
Message-ID: <20230419195805.fpil775pw2wsrav4@pengutronix.de>
References: <20230419114546.820921-1-arnd@kernel.org>
 <c6bc42c6-4a98-4bb6-9639-acf4c2010b68@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7olzqvscnyzsee5"
Content-Disposition: inline
In-Reply-To: <c6bc42c6-4a98-4bb6-9639-acf4c2010b68@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--k7olzqvscnyzsee5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 12:48:52PM +0100, Mark Brown wrote:
> On Wed, Apr 19, 2023 at 01:45:39PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > clang points out that the recently added range check is nonsensical:
>=20
> Someone already sent a patch for tihs.

FTR: https://lore.kernel.org/r/20230418120955.3230705-1-trix@redhat.com

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k7olzqvscnyzsee5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRAR8wACgkQj4D7WH0S
/k4TkQf/T0DEUGoTk9H/hfDu9v/xHFjLghN1ZIsuA02IHW/nDmfHyCGX1I51xV/d
5zX4GHGk4AyO+qJ27KYo9K0Fj/TJKQEuR8cws86p8uqLztxDuRSLFhusRKpCjcpU
33uann83bN3tSs3cvFUuRLt/bJ/Juc4SHKKWicYvraDRHnLCKgKTZwEQDBhBFa1f
TfVZ7m1RnqSLvv4dpJ+I1IwMCVh7Q01wBM1EHSDDoit/OeyVlrkdQb13Ojz1sYs2
yzhWzY+pEEY/X+1pHmsOZUO+IWHDnlQRf2AsqDhFbA3DEf1QTqb0SWZBZeIeffeE
T7gPx9FOH5kgFoPxHly+IWO1SLLXLg==
=SxS9
-----END PGP SIGNATURE-----

--k7olzqvscnyzsee5--
