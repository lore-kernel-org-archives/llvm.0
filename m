Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727B168B7
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 19:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3291C433C8;
	Fri, 30 Jun 2023 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688154305;
	bh=Gz3EGjK0wDfPFqqPSFx9EN34bJyDZae+TOOU/oFUqkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5/CBbIcmZzqWROpNGgc/CmzTwFgP9rZyUp8A1QdPu09GeFAvlgHUKihV/9/2Aw6u
	 R+PXolwZe2WHbRCTHJoUfCMuGRw0mDVGN66Yq88BTSVGEbUmY5EQv2I2QAFL9NJuDD
	 TH2dhHu7yOItVSw/NKDvESkPX/CnEiJC5zQ0SsvYhRXAZ5SDR4QeYW8w/FDFnf/pJw
	 zX0/cp+PhPwofjT0SfaQc9vFU3+4trABpM5XZGlQ8+exl/2CZO1QXVJtPmwhzp8tYm
	 sl0n+0EPVyol/zkeqcPIFHdVCTR4bOSZvgoU6Qkl+S/aFrSC4qVYiS7jyyCubZD0CF
	 SjJI/7ADIBSYQ==
Date: Fri, 30 Jun 2023 20:45:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: KCFI support
Message-ID: <20230630-imprecise-ibuprofen-98f70a8665da@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230630-phrasing-strung-12e53988ad81@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5RH3lh36f2f8cAFF"
Content-Disposition: inline
In-Reply-To: <20230630-phrasing-strung-12e53988ad81@spud>


--5RH3lh36f2f8cAFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 07:48:23PM +0100, Conor Dooley wrote:
> Hey Sami,
>=20
> On Thu, Jun 29, 2023 at 11:42:45PM +0000, Sami Tolvanen wrote:
> > This series adds KCFI support for RISC-V. KCFI is a fine-grained
> > forward-edge control-flow integrity scheme supported in Clang >=3D16,
> > which ensures indirect calls in instrumented code can only branch to
> > functions whose type matches the function pointer type, thus making
> > code reuse attacks more difficult.
>=20
> > base-commit: c6b0271053e7a5ae57511363213777f706b60489
>=20
> Could you please rebase this on top of v6.5-rc1 when that comes out?
> This base-commit is some random commit from Linus' tree, that because we
> are currently in the merge window has is not in the RISC-V trees yet,
> and means the series wasn't applied by our CI stuff.

In other news, I gave it a go with 03b118c7e456 ("[SLP] Fix crash on
attempt to access on invalid iterator state.") & have been running it
for a bit. All seems in order so far, nice :)

--5RH3lh36f2f8cAFF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8wvQAKCRB4tDGHoIJi
0n7sAPoCIPcrVQj6zFZMwpWtS5syPkfKJvsn7z+aOpGtLJuswgEA0cHVGWrRG5F/
7pkuFFiHmNuHKoATNB+0d+B3WOzhAAA=
=a0Pn
-----END PGP SIGNATURE-----

--5RH3lh36f2f8cAFF--
