Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14DBA4F
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 19:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C17C433EF;
	Tue,  7 Mar 2023 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678216498;
	bh=NBoYj03m/N/5JXP/eUAG+iOaCqvhQKVMr77J4rNfHlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSBKIWVtDGUKvDX1KW4nuwVauqFVidsbWphhPpmSxCnd7Kx9yMTpnI7ctnrhCYJ5u
	 xph5vWf9YpUX6h60UkzXWaiieIp45uDW0Q+lHUlEECZNjTaFi1lU7GO6EW69VltYaR
	 oPmQvSs16tF9pL0sK6t0NQ1UopU7oaq4rPrRypj56XNdqnUhAl2oBiHuv1ocZ5Jk62
	 jJ70506CDO1wi+nz0yOwvZWeKaT2X8ACYlVBrKixWkJN9QliKWtC2aOCYlpV2AOf+x
	 D/LGXPLtqJZ+hgrUNm4xa7ibblavYO1OfPpLaJG34LOB1YFu7FD+V3td/XwIOLZvMs
	 MpLJvscBzTL2A==
Date: Tue, 7 Mar 2023 19:14:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to
 Kconfig
Message-ID: <299f2b9c-d72b-4b2c-9f42-f5b71a9d05e6@spud>
References: <Y/jtGRrBfKxO6s0c@spud>
 <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rExin57s/Ed36ADq"
Content-Disposition: inline
In-Reply-To: <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>


--rExin57s/Ed36ADq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 03:52:27PM -0800, Palmer Dabbelt wrote:
> On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
> > On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
> > > On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
> >=20
> > > > ---
> > > >  arch/riscv/Kconfig  | 10 ++++++++++
> > > >  arch/riscv/Makefile |  5 +----
> > > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index cebf0c5f8824..4eb0ef8314b3 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -288,6 +288,16 @@ config ARCH_RV64I
> > > >  >  endchoice
> > > >  > +config TOOLCHAIN_NEEDS_SPEC_20191213
> > >=20
> > > This symbol's name is a little confusing to me, how does the toolchain
> > > need spec version 20191213. Maybe 'SPEC_20191213' should be something
> > > like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be somethi=
ng
> > > like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed bu=
t I
> > > think most Kconfig symbols should be self describing.
> >=20
> > Yah I can do that. I actually had this as the DEFAULT_SPEC variant
> > before and changed it - I'll switch it to the EXPLICIT one.
> > Thanks for taking a look Nathan :)
>=20
> Another option here would be to use the `-misa-spec` argument for GCC, to
> make it match LLVM's spec version.

I'm not entirely sure what you're getting at.
You're the toolchain guy, but my understanding was that gas and gcc have
that option, but not ld, which rules out my initial interpretation.=20
Are you suggesting that we always pass -misa-spec=3D<pre-zicsr_zifencei> to
gcc so that we are using the same misa-spec for both gnu and llvm
toolchain bits?

My instinctive thought was that that is kinda fragile to things
misaligning between gcc/llvm, but given I seem to end up looking at this
every month, we're really fragile to changes in either camp anyway...

I can go spin an alternative v2 of this up if I have understood you
correctly.

Thanks,
Conor.

--rExin57s/Ed36ADq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAeNLgAKCRB4tDGHoIJi
0hO9AQD1Jmahe2QH2Ut2VER3lj6scl0TUWfEGnTwb4k5nAOAJAD/cyA0B3Nr8Zbj
eO538ug3fIfT+/1dSiMwHJCj4XRdIgw=
=qp8l
-----END PGP SIGNATURE-----

--rExin57s/Ed36ADq--
