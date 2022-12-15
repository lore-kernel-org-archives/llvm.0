Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBE257B
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 07:57:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5j7m-0004vJ-2X; Thu, 15 Dec 2022 08:57:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5j7i-004eZQ-9e; Thu, 15 Dec 2022 08:57:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5j7i-005Dkf-4E; Thu, 15 Dec 2022 08:57:46 +0100
Date: Thu, 15 Dec 2022 08:57:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 15112/15174]
 drivers/rtc/rtc-ds1307.c:1717:35: error: call to undeclared function
 'i2c_client_get_device_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <20221215075745.r2fclxb2plqh53uc@pengutronix.de>
References: <202212151358.BAYk9OKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qepaqt7fb6sjiqmd"
Content-Disposition: inline
In-Reply-To: <202212151358.BAYk9OKz-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--qepaqt7fb6sjiqmd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Thu, Dec 15, 2022 at 01:31:15PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   459c73db4069c27c1d4a0e20d055b837396364b8
> commit: ad6d474d82dfb346573146d1bb0d818a720314fd [15112/15174] rtc: ds130=
7: Convert to i2c's .probe_new()
> config: hexagon-buildonly-randconfig-r004-20221214
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98b1=
3979fb05f3ed288a900deb843e7b27589e58)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit/commit/?id=3Dad6d474d82dfb346573146d1bb0d818a720314fd
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout ad6d474d82dfb346573146d1bb0d818a720314fd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/rtc/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> Note: the linux-next/master HEAD 459c73db4069c27c1d4a0e20d055b837396364b8=
 builds fine.
>       It may have been fixed somewhere.

This is fixed by commit 662233731d66 ("i2c: core: Introduce
i2c_client_get_device_id helper function") which should be an ancestor
of the blamed commit.

FTR: This is currently the only commit with this problem (i.e. a new
user of i2c_client_get_device_id that isn't an ancestor of
662233731d66):

	$ git log --pretty=3Doneline --abbrev-commit --ancestry-path 662233731d66.=
=2Enext/master > l
	$ git log --pretty=3Doneline --abbrev-commit linus/master..next/master -Si=
2c_client_get_device_id | grep -F -x -v -f l
	ad6d474d82df rtc: ds1307: Convert to i2c's .probe_new()

(If someone knows a single command to get this information, let me
know.)

The idea was to pull

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

before applying the patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qepaqt7fb6sjiqmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOa03YACgkQwfwUeK3K
7Am9sgf+M2AH3ZTTL8hy27zjN6uBZPbpcOIePxw/n0FU/96G+DAZw//bMKNKihy/
mZBSQ+B+aDOWfSdp7RIIW7P26MQ3zkJSLloNUCmhPimgXTQfH0AK9L6Y8/hdFpAq
bV8VVCXZg1diohdM+Ttfs0WQ86WQ1o1VprLFf5tDPrIkaFXQ2//zAwELYWxCyJQV
NSI2Y3W/kOhWM8WeGtBYkfEcav0M7XNMhp2b15gq90IAfBFqbxXLkJpovsZLbri4
0LjisVdaQInlpYyjUodhy60FkFPq2JcFOPg7OVJHOzQPhPjWtsnLwZ43SDeQ7Nib
YETj2FUhmKgvcH9uLAzLsB45FCeP6g==
=yHyV
-----END PGP SIGNATURE-----

--qepaqt7fb6sjiqmd--
