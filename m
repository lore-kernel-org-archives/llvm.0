Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC4197
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB098C433D2;
	Fri, 24 Feb 2023 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677258013;
	bh=gW/G9XqMxmjk7RG//AkqL5Zd/Wmt8/O+cgdvVZcoB38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML47rDkd+91GwS2zABfAuenxg7v8dnYd2N+ZISXlzCTzk3Ho+ZFV3dgGB6ahetVnu
	 Ga69sV746c7KRkDg88IifQYynXSQjkWZp+gIPzUPnIqRD+Yf4D3bf2t/LZaB2AVDQC
	 EEKca/aSHwPwpnJomPQvN3iMhv7POYVJhhjD9tiNZ97LuDVYcJ2U47fHKwqO54h5yG
	 DkiBK0XOaUDhmQUCuUTKAGmT1q3je+3++zpswaYqjw0Ukt744Rd/CVu63FyvLMH4jo
	 AARmUkEjrbTjxyz9bTeJt8qhrZDwfLhbIgB+WdRQxcV2WZQj6MLnQpFA9CclLm/ijL
	 dsWsFpLB2lQDQ==
Date: Fri, 24 Feb 2023 17:00:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to
 Kconfig
Message-ID: <Y/jtGRrBfKxO6s0c@spud>
References: <20230223220546.52879-1-conor@kernel.org>
 <20230223220546.52879-2-conor@kernel.org>
 <Y/jnyJZNZC1X6IO8@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6Y/AvbWBMFP9Gx2"
Content-Disposition: inline
In-Reply-To: <Y/jnyJZNZC1X6IO8@dev-arch.thelio-3990X>


--e6Y/AvbWBMFP9Gx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
> On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:

> > ---
> >  arch/riscv/Kconfig  | 10 ++++++++++
> >  arch/riscv/Makefile |  5 +----
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index cebf0c5f8824..4eb0ef8314b3 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -288,6 +288,16 @@ config ARCH_RV64I
> > =20
> >  endchoice
> > =20
> > +config TOOLCHAIN_NEEDS_SPEC_20191213
>=20
> This symbol's name is a little confusing to me, how does the toolchain
> need spec version 20191213. Maybe 'SPEC_20191213' should be something
> like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
> like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
> think most Kconfig symbols should be self describing.

Yah I can do that. I actually had this as the DEFAULT_SPEC variant
before and changed it - I'll switch it to the EXPLICIT one.
Thanks for taking a look Nathan :)

Conor.

--e6Y/AvbWBMFP9Gx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/jtFgAKCRB4tDGHoIJi
0q00APwKPs2CYWlCVoaTE6znMU7L2RaGmGaEc0yJ5DnM3NwLygEA60UYgLmVCd/w
FvPGizVLIEObLTuG5YKMddsgylgb1AY=
=xi0j
-----END PGP SIGNATURE-----

--e6Y/AvbWBMFP9Gx2--
