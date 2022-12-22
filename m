Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E9D23AE
	for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 22:08:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p8Tjb-0000tk-IJ; Thu, 22 Dec 2022 23:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p8TjZ-0016BI-7L; Thu, 22 Dec 2022 23:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p8TjY-007Dm3-Hp; Thu, 22 Dec 2022 23:08:12 +0100
Date: Thu, 22 Dec 2022 23:08:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 15112/15174]
 drivers/rtc/rtc-ds1307.c:1717:35: error: call to undeclared function
 'i2c_client_get_device_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <20221222220812.c5c5azlcl64ewkbc@pengutronix.de>
References: <202212151358.BAYk9OKz-lkp@intel.com>
 <20221215075745.r2fclxb2plqh53uc@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72spbp2uad73wpda"
Content-Disposition: inline
In-Reply-To: <20221215075745.r2fclxb2plqh53uc@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--72spbp2uad73wpda
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Thu, Dec 15, 2022 at 08:57:46AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Dec 15, 2022 at 01:31:15PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit master
> > head:   459c73db4069c27c1d4a0e20d055b837396364b8
> > commit: ad6d474d82dfb346573146d1bb0d818a720314fd [15112/15174] rtc: ds1=
307: Convert to i2c's .probe_new()
> > config: hexagon-buildonly-randconfig-r004-20221214
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98=
b13979fb05f3ed288a900deb843e7b27589e58)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Dad6d474d82dfb346573146d1bb0d818a720314fd
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout ad6d474d82dfb346573146d1bb0d818a720314fd
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/rtc/
> >=20
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >=20
> > Note: the linux-next/master HEAD 459c73db4069c27c1d4a0e20d055b837396364=
b8 builds fine.
> >       It may have been fixed somewhere.
>=20
> This is fixed by commit 662233731d66 ("i2c: core: Introduce
> i2c_client_get_device_id helper function") which should be an ancestor
> of the blamed commit.
>=20
> FTR: This is currently the only commit with this problem (i.e. a new
> user of i2c_client_get_device_id that isn't an ancestor of
> 662233731d66):
>=20
> 	$ git log --pretty=3Doneline --abbrev-commit --ancestry-path 662233731d6=
6..next/master > l
> 	$ git log --pretty=3Doneline --abbrev-commit linus/master..next/master -=
Si2c_client_get_device_id | grep -F -x -v -f l
> 	ad6d474d82df rtc: ds1307: Convert to i2c's .probe_new()
>=20
> (If someone knows a single command to get this information, let me
> know.)
>=20
> The idea was to pull
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client=
_device_id_helper-immutable
>=20
> before applying the patch.

The patch for ds1307 didn't make it into Linus' tree yet. Do you still
have it on your radar for the next merge window? Would it help you if I
resent it?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--72spbp2uad73wpda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOk1UkACgkQwfwUeK3K
7AkKYAf/Ro8c2/efmBFELLOcvxIEuJoxKvhK4pGe2D+F7ybIAmpGa4mxf+yZ9Tok
VfwyobIb/cDbg/+ayaKFhCeh24bAKApNMoftbmYkhQyebJJEBBA7unFb4MxCuwAK
X05xpLKezDeWSiQv+l+56nNAQ7AWpRI6p/BV0YdcajizxTLLPtAYCdYBzFpDcdKu
DAB4LnJR9DxJwt/ZHLyKpZNBCayOL5DUY/eZM0pVXGhFIt/qPCAaUsluEG1m+I2V
Q1/IQHEyCht/z/QQrBjZxdDKuCWA/4zT+WJNd5Tlv5K1nal3fYK4/pj+EYkkAPp8
cWrZjLkEaakZ41VL3QOioZotABun8A==
=P+JM
-----END PGP SIGNATURE-----

--72spbp2uad73wpda--
