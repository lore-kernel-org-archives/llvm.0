Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D76105
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677252497; x=1708788497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=poxQTqgWSLciAThNe/zOfrINHkOB6ILahmpb3aOL6ts=;
  b=SZl8yiBJwxYtSuB087VUyrSHa9U+WrEMcZgEjSUTvL+QgK5y+Oe+Gq3z
   XgxlbClSGFzM1wFbqd80BZVdGiZ/3z2drPdEeM/5DyXkqPfhu6Geyn5oa
   aGIUmpqLBkgi0cCfCrpHwFw6EOoOcI8akvtZgBHMpMSpPopo05weso0N+
   QXAvv8+IiNkSS8u1qfwzgcYz5UR6kfrI/pWo4Lx/OK3JSUSAry/T9FH8v
   EbrD9Zj0ltCKWnbjJ2GPRx8/rbaOfLevbbZvTf6xkrRMy6J5yOMj7KtPe
   P+kTUcsyI5pOrT2DocNgvqN79x3IjzNrBImwIPPmkNUkW3K84fp/qelWE
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,325,1669100400"; 
   d="asc'?scan'208";a="202114504"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 08:28:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:28:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 08:28:06 -0700
Date: Fri, 24 Feb 2023 15:27:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
Message-ID: <Y/jXayJucRFxzJGA@wendy>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
 <20230224135044.2882109-3-conor.dooley@microchip.com>
 <Y/jQSUpXH5XwQTqg@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z2lFv5ndM+uKjjaZ"
Content-Disposition: inline
In-Reply-To: <Y/jQSUpXH5XwQTqg@dev-arch.thelio-3990X>

--z2lFv5ndM+uKjjaZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 07:57:13AM -0700, Nathan Chancellor wrote:
> Hi Conor,
>=20
> On Fri, Feb 24, 2023 at 01:50:44PM +0000, Conor Dooley wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> >=20
> > The rust modules work on 64-bit RISC-V, with no twiddling required.
> > Select HAS_RUST and provide the required flags to kbuild so that the
> > modules can be used.
> > 32-bit is broken in core rust code, so support is limited to 64-bit
> > only: ld.lld: error: undefined symbol: __udivdi3
> >=20
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/rust/arch-support.rst | 2 ++
> >  arch/riscv/Kconfig                  | 1 +
> >  arch/riscv/Makefile                 | 3 ++-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/a=
rch-support.rst
> > index 6982b63775da..197919158596 100644
> > --- a/Documentation/rust/arch-support.rst
> > +++ b/Documentation/rust/arch-support.rst
> > @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAIN=
ERS`` file.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Architecture  Level of support  Constraints
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +``riscv``     Maintained        ``rv64`` only.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  ``x86``       Maintained        ``x86_64`` only.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 81eb031887d2..73174157212d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -115,6 +115,7 @@ config RISCV
> >  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> >  	select HAVE_REGS_AND_STACK_ACCESS_API
> >  	select HAVE_RSEQ
> > +	select HAVE_RUST if 64BIT
>=20
> Just a small drive by comment, you have 'if 64BIT' here...
>=20
> >  	select HAVE_STACKPROTECTOR
> >  	select HAVE_SYSCALL_TRACEPOINTS
> >  	select IRQ_DOMAIN
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 76989561566b..0d6fc4e25221 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -29,8 +29,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
> > =20
> >  	KBUILD_CFLAGS +=3D -mabi=3Dlp64
> >  	KBUILD_AFLAGS +=3D -mabi=3Dlp64
> > -
> >  	KBUILD_LDFLAGS +=3D -melf64lriscv
> > +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv64
> >  else
> >  	BITS :=3D 32
> >  	UTS_MACHINE :=3D riscv32
> > @@ -38,6 +38,7 @@ else
> >  	KBUILD_CFLAGS +=3D -mabi=3Dilp32
> >  	KBUILD_AFLAGS +=3D -mabi=3Dilp32
> >  	KBUILD_LDFLAGS +=3D -melf32lriscv
> > +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv32
>=20
> but also add KBUILD_RUSTFLAGS for the !64BIT case. Seems like one of
> those can be removed.

Yeah & it's ditto for the rv32 handling in 1/2 as well. Ideally there
wouldn't be implicit 64-bit division and the "if 64BIT" could go
away. I just left things as-lifted, but I'll go drop anything 32-bit
related if this series looses the RFC prefix ;)

--z2lFv5ndM+uKjjaZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/jXawAKCRB4tDGHoIJi
0pNGAP4zIxU9hWDGRLAc9v31P3IiCujj/BIkSl5SxfXQyqJseAD/VlqTDGyws2G0
0Yvnyz+H9GhDgw8F2jUNxhK9REZOLgM=
=Stuu
-----END PGP SIGNATURE-----

--z2lFv5ndM+uKjjaZ--
