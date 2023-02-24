Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F53D8F
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 22:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCF8C433EF;
	Fri, 24 Feb 2023 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677277930;
	bh=YU/s+bH/87E9Dfu8eF0TeGeix3GsbNFybjbH2XtskK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mETyRECgSZPUhMAritaTsInlHW3NQ4KmoWnrKDW8rS8CnpxXcUUfVFtdyBTM0UsWM
	 ULYYEhVvw2B9jJvjiYxBo61zDJuK11jrTAdkWcvI+iSmmmbbZLO0Y9m9cR5d1/eJBw
	 P+hhL2hV62T8SzCEecVzG2WK105xkYVvinC4Uk67aVNJ7IVKRoVtnCsiyTIusVCxX0
	 vBKFG0G9Rus8tg8ZWgFCompCXIv5nbVFC18hZ7KDtNI4lgGthc56FoLkjYQ7GA+GsY
	 UzMeWMgs9UNdJCZ9xSSQHXhtcR//sTcfUPeEWigqUl9EupAJxazfWXjwDsFS23prUf
	 8MbqQy2knLp/w==
Date: Fri, 24 Feb 2023 22:32:04 +0000
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
Subject: Re: [RFC 0/2] RISC-V: enable rust
Message-ID: <Y/k65INC1//tXe2U@spud>
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
 <Y/kldmYcl7+2FBRB@spud>
 <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GPqby4BNY/8U4z3W"
Content-Disposition: inline
In-Reply-To: <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>


--GPqby4BNY/8U4z3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 11:20:34PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 24, 2023 at 10:00 PM Conor Dooley <conor@kernel.org> wrote:

> > That's what I did! Unless I missed something that was non-obvious, the
> > only name on the commits I lifted was you. Is there somewhere else I
> > should have looked for that information?
>=20
> I would have traced the commits back a bit more. For instance, in the
> first commit you mention above, one may see the RISC-V target files
> were removed, so that means something was already there. Checking who
> added those files leads to a few commits from Gary (and one from
> Daniel).

> And then it is about making a judgement call trying to be fair :)

It was a few hours ago that I looked properly, but, IIRC, it was a
conversion from config files to code? My understanding was that
config files were not copyrightable, hence I looked only at the
authorship of the code. I'm usually on the anal side about SoB stuff,
so it is not a matter of me not bothering!

--GPqby4BNY/8U4z3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/k65AAKCRB4tDGHoIJi
0iCIAQD8yWuiYHTGurcMVu0pSePa/9gxWTaY2XNdYA6jLb5JhgEA+VVYS7bt0vzO
rAr5s4NsXOudIsskOkB30k8ueF8CJwQ=
=IIrm
-----END PGP SIGNATURE-----

--GPqby4BNY/8U4z3W--
