Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3D14F8B
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 19:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9640FC433C8;
	Thu, 24 Aug 2023 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692905141;
	bh=jEfkfgs0aKOqTCnO3DDjeR9s2ybfkgNwsK/nTFdREhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaOAzGCngsNJWzL66wyi9S7WZ9MMLDckwysviiAp0KE9iiLZ+g3WOBXinsOLuFLK0
	 AqS6ONsSFnmcvDeFCoUBJaK0BI7LYxHqfahIMWMLJiNIOM+ssorreHU+yk3+hPJzRK
	 kBLKSeYQl9fZaqT9GsYshE7/naeOhbUS0iP4sq2swvmHSJXtTLfZE6mEr1CSP0Q8p7
	 qVNoYnrXkheBfcyt8Gco/pZq4oeGqoq9ZDOXDxgEDsnuULcuq8X6h3TCg6CxR2PVXr
	 OLnu5JWDFSQEUb+u8c9UJUB4yjjcCNF4EiQTGxUzmJb+XbgcEfZ6YRPrSlEYJOAhrB
	 ED3I0N82+ztIA==
Date: Thu, 24 Aug 2023 20:25:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
Message-ID: <20230824-wimp-unvocal-c27df1798ae8@spud>
References: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jQ+UZp7/dg4EBiG4"
Content-Disposition: inline
In-Reply-To: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>


--jQ+UZp7/dg4EBiG4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 03:08:52AM +0800, Mingzheng Xing wrote:
> When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
> the following error occurs:
>=20
>   Assembler messages:
>   Error: cannot find default versions of the ISA extension `zicsr'
>   Error: cannot find default versions of the ISA extension `zifencei'
>=20
> The above error originated from this commit of binutils[0], which has been
> resolved and backported by GCC-12.1.0[1] and GCC-11.3.0[2].
>=20
> So fix this by change the GCC version in
> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC to GCC-11.3.0.
>=20
> Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Df0b=
ae2552db1dd4f1995608fbf6648fcee4e9e0c [0]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dca2bbb88f999f4d=
3cc40e89bc1aba712505dd598 [1]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dd29f5d6ab513c52=
fd872f532c492e35ae9fd6671 [2]
> Fixes: ca09f772ccca ("riscv: Handle zicsr/zifencei issue between gcc and =
binutils")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>

Closes: https://lore.kernel.org/all/20230823-captive-abdomen-befd942a4a73@w=
endy/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

--jQ+UZp7/dg4EBiG4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeusAAKCRB4tDGHoIJi
0oBmAQDo7sJ4ojm9tmxKm4KGCv3FjyjHaCsrz+wMyIn7OZswQgEAtaP5mxU/333o
1sFUBgYMQgZ41XVmUpLzlEn+X+/AlwY=
=5ZDM
-----END PGP SIGNATURE-----

--jQ+UZp7/dg4EBiG4--
