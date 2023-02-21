Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880121878
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676971007; x=1708507007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e0DmnT+SAfrNeMZkQPPGnVAjaAbuaGmqPifx6ERR0q4=;
  b=RbVELfIQkVQQMKFo4XsB6n2PVoWBmbUt92wXZjIf4rDSRs/vBdEObdaA
   tCsuRJC9+xbNplIaQz52e7a+mM9bMZ1HWj5m1MaYRTyRC5R0EIKWFYork
   UdmEfIDRrz9GrJxuSLSt1Gv7iudpN5ADyUE/efj52rD2oMDGSpCxu0R05
   QzCdVnJaf2SuZt91a468ymxfkPvVUs7rbbzV6MnmB/K7ib/Q1Vni2ojQB
   cjZnTmQx6ycnDnQF6MDVk/2SUGb7zo9E8U0iN6id6eFjR18mU3YDR74Sd
   PB4F5AQYtyIwOVyK4FBXXMHJ+2VrVcygutEya2M7V+H+8hiFqbSHJpZco
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="201861307"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 02:15:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 02:15:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 02:15:37 -0700
Date: Tue, 21 Feb 2023 09:15:11 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: <llvm@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>,
	linux-stable <stable@vger.kernel.org>, <lkft-triage@lists.linaro.org>, Nathan
 Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
	<conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
Message-ID: <Y/SLn5fto6+9xX0r@wendy>
References: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZNjPGu8Cs6BNE/xO"
Content-Disposition: inline
In-Reply-To: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>

--ZNjPGu8Cs6BNE/xO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 02:30:17PM +0530, Naresh Kamboju wrote:
> The riscv defconfig and tinyconfig builds failed with clang-nightly
> due to below build warnings / errors on latest stable-rc 5.10.
>=20
> Regression on riscv:
>   - build/clang-nightly-tinyconfig - FAILED
>   - build/clang-nightly-defconfig - FAILED

> Build log:
> ----
> make --silent --keep-going --jobs=3D8
> O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Driscv
> CROSS_COMPILE=3Driscv64-linux-gnu- HOSTCC=3Dclang CC=3Dclang LLVM=3D1
> LLVM_IAS=3D1 LD=3Driscv64-linux-gnu-ld
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/version.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/do_mounts.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/noinitramfs.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/calibrate.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'

> Build details,
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.=
10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tin=
yconfig/details/

binutils 2.35 by the looks of things, I **think** that zifencei didn't
land until 2.36. zicsr and zifence get added via cc-option-yn, which,
IIRC, doesn't do anything with the linker. I dunno if anyone in RISC-V
land cares this much about "odd" configurations back in 5.10, but while
a fix is outstanding, you could use a newer binutils?

--ZNjPGu8Cs6BNE/xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/SLngAKCRB4tDGHoIJi
0olNAP9pkXL0kx8+BxRgZp9LY/qvnZ8Syy0+IoxvNK9MFe7RwwD/cJs7I84iYgZK
0x0D1LlFErcbyUOzYd6ixFsxBUeugwo=
=q8mA
-----END PGP SIGNATURE-----

--ZNjPGu8Cs6BNE/xO--
