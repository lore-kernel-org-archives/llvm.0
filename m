Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28928C12
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 15:37:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMsQZ-00005l-Dn; Tue, 31 Jan 2023 16:20:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMsQZ-001igC-Fs; Tue, 31 Jan 2023 16:20:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pMsQX-00HMbM-Vg; Tue, 31 Jan 2023 16:20:05 +0100
Date: Tue, 31 Jan 2023 16:20:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>, Lee Jones <lee@kernel.org>
Subject: Re: [lee-mfd:for-mfd-next 36/37] drivers/mmc/host/tmio_mmc.c:141:12:
 error: no member named 'enable' in 'struct mfd_cell'
Message-ID: <20230131152005.6wy5vbzzcouiofee@pengutronix.de>
References: <202301312253.oUVq9cys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vwjathqydnubcy3a"
Content-Disposition: inline
In-Reply-To: <202301312253.oUVq9cys-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--vwjathqydnubcy3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 31, 2023 at 10:48:48PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-m=
fd-next
> head:   a561a980c024193e342b6878f62e02ff9d018285
> commit: 78e7ccec94380519919267670174cbf1711b7963 [36/37] mfd: Remove .ena=
ble() and .disable() callbacks
> config: hexagon-randconfig-r041-20230130 (https://download.01.org/0day-ci=
/archive/20230131/202301312253.oUVq9cys-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196=
ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/com=
mit/?id=3D78e7ccec94380519919267670174cbf1711b7963
>         git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kerne=
l/git/lee/mfd.git
>         git fetch --no-tags lee-mfd for-mfd-next
>         git checkout 78e7ccec94380519919267670174cbf1711b7963
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/mmc/host/ drive=
rs/video/fbdev/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> [...]
> >> drivers/mmc/host/tmio_mmc.c:186:12: error: no member named 'disable' i=
n 'struct mfd_cell'
>            if (cell->disable)
>                ~~~~  ^

This driver doesn't exist in next any more (commit ecb92c1f4752). So I'm
unsure what to do here.

The obvious (to me) options are:

 a) ignore the problem
 b) merge ecb92c1f4752 into mfd before applying "mfd: Remove .enable()
    and .disable() callbacks"
 c) drop "mfd: Remove .enable() and .disable() callbacks" for now and
    reapply when ecb92c1f4752 is in Linus' tree (variant of b))

Lee, what's your take here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vwjathqydnubcy3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPZMaIACgkQwfwUeK3K
7Ak5Ggf9FY4MIZnNjmJs1PVawSIY2mnjyQ+0uS2AiGSmZrMRXUO9GJ50wBUPy2Wx
Mf4poXR8bw0J+A7uU1XzPUH071US0R3mmrysNDZlk1Vwn3a2styDb3U0RgrDa0Km
YXuEoFov9VXTFFZS4RSfIAuEMGJUdjPkPfMXNpbfq55+/CIpNXLGIVUEIYHB4KBs
5RJWpeMTEGc9uTQKUNIYd9qowYDvYOjd3DWhJbZPP8rGdxrJV52/61YY+Wf8Cqo3
e9/IguW7osvPP/8A6N/jNZr9tPMzSfHW+wc/LxhC2wjE7MSCJo9F3pwhOJY3fC1u
fpBNyXra9kKsNigy2XxAOJyXfOd80A==
=6mw0
-----END PGP SIGNATURE-----

--vwjathqydnubcy3a--
