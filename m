Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4D524F
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 21:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FD6C433EF;
	Fri, 24 Feb 2023 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677272595;
	bh=GOPRgmEm/tLlo164VtO08+QtLf9+r2oLkH7o65afRmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt82xGw08+pWQPYenM8GbR0Qn4nQY7XCUDyzCsd556SIZ/mqaZKCxmuMq43nL5sM2
	 YfIhiPwNX+MqauE34NbgOcdxgCE1VDhPmNmRe7Gw5I5NMbJcUjPVWG0rjzsUpEbFZu
	 5wQVKGJY41UTW8GI/u19czDbFT9Hzx9F21e7LadYjUkzgvDjG/o4GMtd1JkoDsPlXE
	 /TNvh8GXartMwOlt9911MkoCWLO1VmPnIe2TazBqh5zPwerPtSXHPlUO9vGvxTYkFw
	 FSCDzkXMYBQXStWUeFQO6sufgUyGj5wxPA+E/iOmye4S57Zdix2f0paxXAu4DwWiaU
	 aTuqaHZpN9kaQ==
Date: Fri, 24 Feb 2023 21:03:09 +0000
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
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
Message-ID: <Y/kmDcMBcZ2PzcKR@spud>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
 <20230224135044.2882109-3-conor.dooley@microchip.com>
 <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WdAygoFJPXezUehP"
Content-Disposition: inline
In-Reply-To: <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>


--WdAygoFJPXezUehP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 09:45:05PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 24, 2023 at 2:51 PM Conor Dooley <conor.dooley@microchip.com>=
 wrote:

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
>=20
> I think this separator between rows should not be here (it is not in
> `rust-for-linux/rust`). Please see
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple=
-tables.

That's what the "let the automation tell me if I messed up rst" approach
gets you ;)


--WdAygoFJPXezUehP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/kmDQAKCRB4tDGHoIJi
0nPaAP4scKJyUoodTh1VeLDzWnq6wVMqx2ag5tPkur6OL8OPSwD+J4ShZHdTHo7f
F5jmK7nrKyOomF7iNe21+bCUkCg/qAs=
=fdgN
-----END PGP SIGNATURE-----

--WdAygoFJPXezUehP--
