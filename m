Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF09C79E2
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 21:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D2CC433D2;
	Wed,  5 Apr 2023 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680729527;
	bh=3D9E+zdKhNeQGnjhKiuzQ19pZBm6xsFwUsG365Tt6ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxd9rkpLlhpRHvuHej02a/ljQ7E2IhvWw4PRSohdHqzr07nUTrDc6/7mhB56fWJQ1
	 HyL8aJUYbWe20NBolux+V8BSGnhstCF6OqBiXigTMuqc40pabYt8K9h43c6WMi3/H1
	 nM1RoPJXZ+xHVWn+HzqZT4StTdKeVfJAbchdq0Y3ZNI/T5Pqi7KJtxLg3MIpuxjomy
	 oth9ep9SrIwkscxszAgLpKX8FMNHkYN1DUd641YcCGcve8XIzlEU2EwSlTETMDfe1t
	 KKq2rkwW6ib2OJChbu9pDYDPStgwkSYeTQaKTPdVBT7mbJf4LX3kb/UgLQjqH2ViLn
	 OenrK9xcqtGaw==
Date: Wed, 5 Apr 2023 22:18:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20230405-itinerary-handgrip-a5ffba368148@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
 <a6220e52-9934-422b-9b05-95705b8fd684@spud>
 <b5fba6b3-177c-4325-905a-8f9f633a592a@spud>
 <CANiq72mip7Xs5vnS4KccxCmBmRbKGki7AYTTHxwaeyr3amvSWw@mail.gmail.com>
 <20230403-repose-cartwheel-c3e10c231cae@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FcRyeZL+VScw/Opu"
Content-Disposition: inline
In-Reply-To: <20230403-repose-cartwheel-c3e10c231cae@spud>


--FcRyeZL+VScw/Opu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 06:14:57PM +0100, Conor Dooley wrote:
> On Mon, Apr 03, 2023 at 06:35:45PM +0200, Miguel Ojeda wrote:

> > As long as bindgen generates things with the right ABI etc., yeah.
> > But, in principle, enabling one extension one side but not the other
> > could be wrong if it ends up in something that Rust uses, e.g. if the
> > C side does:
> >=20
> >     #ifdef __ARM_ARCH_7R__
> >         int x;
> >     #else
> >         char x;
> >     #endif
> >=20
> > and Rust attempts to use it, then particular `-march` builds could be b=
roken.
>=20
> To be on the safe side then, we should really disable the extensions
> across the whole kernel. I don't *think* we have any madness at the
> moment like in the above, but it is better to be on the safe side.

So I am still of this opinion. I don't want to silently have a mismatch
between one side of the kernel and the other. Recipe for disaster.
If it's off for the Rust side of things, it should be off for C too.

> > but since the GCC+Rust builds are so experimental, I
> > think as long as something is tested from time to time, it would be
> > great (to at least know not everything is completely broken).
> >=20
> > But if you think that would be too much effort to maintain, or even
> > GCC builds in general, then please feel free to ignore it for the time
> > being, i.e. it is better to have LLVM builds rather than nothing! :)
>=20
> Yeah, it may be worth getting just the LLVM bits in. I abhor the -march
> handling and it may end up looking like shite with the zicsr &
> zifencei handling.
> Worst comes to worst, can permit gcc builds by just removing all the
> extensions that get passed in -march for RUST && CC_IS_GCC type
> scenarios. The only one of those at the moment is zihintpause & I don't
> suppose too many tears will be shed over that.

Been thinking about this some more, and I don't really like where this
is going. I think I am gonna explicitly disable gcc support if
anything.
I wrote out a list of issues I have with all of this, but I then had
second thoughts about some of them, so I've deleted that section of this
mail.
I need to think long and hard about the mixing and matching of support
between several versions of the tools (bindgen/llvm, rustc, gcc) for
different extensions & potentially different versions of the ISA spec.

I'll revisit this when my thoughts have settled down.

> For now it's safe to assume that LLVM doesn't require zicsr or zifencei
> [1], we don't need to do a version dance right away.

I also needed to remove `-mno-riscv-attribute` from bindgen's cflags
for things to work. That's probably not something yous have to deal with
as you're on an old kernel for the rust branch. Or maybe it got
backported to v6.2.n, idk.

Oh and bindgen doesn't actually seem to succeed with the hacks anyway:
thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/__/inc=
lude/linux/compiler_types_h_146_2)" is not a valid Ident'
I had a quick check on lore but didn't see a fix for that one.

And there's also the code model that doesn't yet seem to be handled.
The script looks to always use medany. Writing that here lest I forget
about it.

Either way, I marked the series as "Changes Requested" on patchwork :)

Cheers,
Conor.

--FcRyeZL+VScw/Opu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC3lsQAKCRB4tDGHoIJi
0pGOAQCeaM10rBdEcndRndqlaTF3FEa+T27gVhKcLhUC1A/dPgEA4f8S9UEUIK+6
uLp00YAput5xzfDJIKKH5PE3oMmd/gE=
=b9VZ
-----END PGP SIGNATURE-----

--FcRyeZL+VScw/Opu--
