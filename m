Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4BD17FFF
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4991C433C8;
	Tue, 20 Jun 2023 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687291990;
	bh=Up7OY2tx2Bu7OREXkSV0cO4hmudyAUm7ranaZzjRagc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRhUHZZ65pqJtvqL9yGGffR5fAed0s7h9/Adr7f9XAnI6s0nvTGO2xtSL9IAQEaht
	 e0OdeMajo3Mhx6E4yZ+Rhulm/rixmS+fQenrM/3qlmVG8pNpAvgQCkxcZnitFog+dY
	 3bP8Wx2Zr57SS5IcaNEOTknP7mvaIdIeKLDJH2xWgmwioCrZxZhRP1Te/GN5IgdKnC
	 40wkS47hnmAZZGBQEwok8w94MqAUJfMTHNp2kWiR9/ggLaA7sfbeRh3OGpKCs/AojC
	 MkO4vvCFv4kl7zW8q2HDxiNcZyKFFy5HtEVzVENIuzECMDev3Iw8OZLgr032l38/A2
	 XmSKSaGRx1oxw==
Date: Tue, 20 Jun 2023 21:13:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, Fangrui Song <maskray@google.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230620-gibberish-unblended-f4b50c7fe369@spud>
References: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
 <mhng-57559277-afaa-4a85-a3ad-b9be6dba737f@palmer-ri-x1c9>
 <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnIKHjmO/IECDseO"
Content-Disposition: inline
In-Reply-To: <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com>


--qnIKHjmO/IECDseO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
> On Mon, Jun 19, 2023 at 6:06=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.co=
m> wrote:
> > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
> > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
> > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
> > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:

> > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
> > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
> > >> series is based on 6.4-rc2.
> > >
> > > Thanks.
> >
> > Sorry to be so slow here, but I think this is causing LLD to hang on
> > allmodconfig.  I'm still getting to the bottom of it, there's a few
> > other things I have in flight still.
>=20
> Confirmed with v3 on mainline (linux-next is pretty red at the moment).
> https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinylab=
=2Eorg/

Just FYI Nick, there's been some concurrent work here from different
people working on the same thing & the v3 you linked (from Zhangjin) was
superseded by this v2 (from Jisheng).

Cheers,
Conor.

--qnIKHjmO/IECDseO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJIIUQAKCRB4tDGHoIJi
0pwKAPwN0fl/0BvxzqWUorGfL8WNfDjmU0SS2DfTLOj65jF6NgD+OGR2qRbVJjsn
RR7ojSY2OsUPffu6ghob8ys0ss+XpgI=
=V3r5
-----END PGP SIGNATURE-----

--qnIKHjmO/IECDseO--
