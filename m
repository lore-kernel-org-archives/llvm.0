Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDCBA48
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692791578; x=1724327578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P+msHyqhyTgIowePgGmJTm4oqKwwJ9h/OkrOjGnPZWA=;
  b=tlSEI8L9nZ/wextej2IThSyBR97Z8yqm4jZBjt8PvhUAJ2u+8als9xyZ
   ozoB0NgUCbyyv3BUFLB75KIkzzB6tm89BuN1TbHJ4Nj/gmbppRz4ukHr1
   AQQsIMQr3IzqYiZyNuC26Bl2ZVtvvVBpZmL0B4Mpjqt9Vr6B/67qKfxOK
   zqifNQpaXI+DRjq0vaGDU0NwSK4iuVTQA6tVU8AiAMQexNe4cVA3KOGOq
   Im4NtHh1GkBIx4nPSavIKZhy8QWJtq6+fCUQ6V2dUTFG+a422DyaqSPed
   kI1ZxM57aFWnNfWE9OipQhKdgJED+ddN/2zjkyiyLwEXutkgfQGfhHW2k
   A==;
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="asc'?scan'208";a="231293047"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Aug 2023 04:52:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 23 Aug 2023 04:51:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 23 Aug 2023 04:51:54 -0700
Date: Wed, 23 Aug 2023 12:51:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <patchwork-bot+linux-riscv@kernel.org>
CC: Mingzheng Xing <xingmingzheng@iscas.ac.cn>,
	<linux-riscv@lists.infradead.org>, <conor@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<nathan@kernel.org>, <ndesaulniers@google.com>, <trix@redhat.com>,
	<bmeng@tinylab.org>, <guoren@kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <stable@vger.kernel.org>
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230823-captive-abdomen-befd942a4a73@wendy>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W7NS5WMbXWdulCbP"
Content-Disposition: inline
In-Reply-To: <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>

--W7NS5WMbXWdulCbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 03:20:24PM +0000, patchwork-bot+linux-riscv@kernel.=
org wrote:
> Hello:
>=20
> This patch was applied to riscv/linux.git (fixes)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>=20
> On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> > Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the n=
ewer
> > 20191213 version which moves some instructions from the I extension to =
the
> > Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
> > that version, we should explicitly specifying Zicsr and Zifencei via -m=
arch
> > to cope with the new changes. but this only occurs when binutils >=3D 2=
=2E36
> > and GCC >=3D 11.1.0. It's a different story when binutils < 2.36.
> >=20
> > [...]
>=20
> Here is the summary with links:
>   - [v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
>     https://git.kernel.org/riscv/c/ca09f772ccca

*sigh* so this breaks the build for gcc-11 & binutils 2.37 w/
	Assembler messages:
	Error: cannot find default versions of the ISA extension `zicsr'
	Error: cannot find default versions of the ISA extension `zifencei'

I'll have a poke later.

--W7NS5WMbXWdulCbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOXysQAKCRB4tDGHoIJi
0umKAPsHfU8Vxgef4+lOhFoGQMmuEDZ660fUifAWXoqFaCjwlQD/dLrrEsJhYReV
cosGU4uWW2+SuNH9+QHMozew2ttVyAk=
=9H5F
-----END PGP SIGNATURE-----

--W7NS5WMbXWdulCbP--
