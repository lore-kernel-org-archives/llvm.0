Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45839134CC
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 17:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE88C433C7;
	Thu, 24 Aug 2023 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692898408;
	bh=ahEjFBYYn126N0UBbCJdKmoqregzZPS84OaeQ8V68E4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=MXSsxmDumlM+ixPupdlHnUccUgS+qacYjlPhe1eE7R9NtwNhBNjCqoH/TgbgiV49j
	 YU/J1HoY8sqEeTsqWK6/MvRlDmhN/Sk1lvcv/DojsmAjGl0yw08cu187CrHNcAHhPk
	 xDnPGJuq6sLHqtKO4nv6IYKKMghUH8QIUKEGbQNCN/aJvJzozoymRHlywEYYdTknPY
	 egWgPqM8GhIo69Anz9ekGsFxsW7SYuyNEosNtbMbpil6XoucfFXVanC3iOFToDHiH9
	 hzgEHWQJaRKewpSP9QILXZQJjYScInAdz9/jW0/2djeBpixVKvferjRsfeN+ILRFyL
	 IIx8haZFMVXkw==
Date: Thu, 24 Aug 2023 18:33:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
List-Id: <linux-riscv.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	patchwork-bot+linux-riscv@kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
	guoren@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230824-stick-neutron-839dfdfa0538@spud>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
 <20230823-facelift-ovary-41f2eb4d9eac@spud>
 <4677fc33-6e76-21e6-2a7f-f12670bc1ce2@iscas.ac.cn>
 <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GzRpdPN9dHzG3R55"
Content-Disposition: inline
In-Reply-To: <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>


--GzRpdPN9dHzG3R55
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 01:30:36AM +0800, Mingzheng Xing wrote:
> On 8/24/23 19:32, Mingzheng Xing wrote:
> > On 8/23/23 21:31, Conor Dooley wrote:
> > > On Wed, Aug 23, 2023 at 12:51:13PM +0100, Conor Dooley wrote:
> > > > On Thu, Aug 17, 2023 at 03:20:24PM +0000,
> > > > patchwork-bot+linux-riscv@kernel.org wrote:
> > > > > Hello:
> > > > >=20
> > > > > This patch was applied to riscv/linux.git (fixes)
> > > > > by Palmer Dabbelt <palmer@rivosinc.com>:
> > > > >=20
> > > > > On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> > > > > > Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default
> > > > > > ISA spec to the newer
> > > > > > 20191213 version which moves some instructions from the
> > > > > > I extension to the
> > > > > > Zicsr and Zifencei extensions. So if one of the binutils
> > > > > > and GCC exceeds
> > > > > > that version, we should explicitly specifying Zicsr and
> > > > > > Zifencei via -march
> > > > > > to cope with the new changes. but this only occurs when
> > > > > > binutils >=3D 2.36
> > > > > > and GCC >=3D 11.1.0. It's a different story when binutils < 2.3=
6.
> > > > > >=20
> > > > > > [...]
> > > > > Here is the summary with links:
> > > > > =A0=A0 - [v5] riscv: Handle zicsr/zifencei issue between gcc and =
binutils
> > > > > =A0=A0=A0=A0 https://git.kernel.org/riscv/c/ca09f772ccca
> > > > *sigh* so this breaks the build for gcc-11 & binutils 2.37 w/
> > > > =A0=A0=A0=A0Assembler messages:
> > > > =A0=A0=A0=A0Error: cannot find default versions of the ISA extensio=
n `zicsr'
> > > > =A0=A0=A0=A0Error: cannot find default versions of the ISA extensio=
n `zifencei'
> > > >=20
> > > > I'll have a poke later.
> > > So uh, are we sure that this should not be:
> > > -=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000=
) ||
> > > (CC_IS_GCC && GCC_VERSION < 110100)
> > > +=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000=
) ||
> > > (CC_IS_GCC && GCC_VERSION <=3D 110100)
> > >=20
> > > My gcc-11.1 + binutils 2.37 toolchain built from riscv-gnu-toolchain
> > > doesn't have the default versions & the above diff fixes the build.
> >=20
> > I reproduced the error, the combination of gcc-11.1 and
> > binutils 2.37 does cause errors. What a surprise, since binutils
> > 2.36 and 2.38 are fine.
> >=20
> > I used git bisect to locate this commit[1] for binutils.
> > I'll test this diff in more detail later. Thanks!
> >=20
> > [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Df0b=
ae2552db1dd4f1995608fbf6648fcee4e9e0c
> >=20
>=20
> Hi, Conor.
> The above error does originate from link[1] mentioned above, which was
> resolved in gcc-12.1.0[2], and gcc-11.3.0 made the backport[3].
> So gcc-11.2.0 combined with binutils 2.37 produces the same error.
> I think we should do the following diff to fix it:
> -=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000) ||=
 (CC_IS_GCC &&
> GCC_VERSION < 110100)
> +=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000) ||=
 (CC_IS_GCC &&
> GCC_VERSION < 110300)

That sounds good to me. Can you make that a real patch please?

Thanks for working on it :)

--GzRpdPN9dHzG3R55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeUYwAKCRB4tDGHoIJi
0shAAPwPF6Ho7GmV1QqOqCxaLs5lrfrMuUqsTg0UQOkhrKmXagD/SB/pACU1o7NB
wwud4O1QrkkA0shYDsylGNjF0UCUgwo=
=y6Et
-----END PGP SIGNATURE-----

--GzRpdPN9dHzG3R55--
