Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B86B178CC5;
	Wed,  9 Oct 2024 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462227; cv=none; b=Z+Z1nVNBTfxg+qKSoOmD71ricw5PgAEb1v2jQqNx8UmJt0jiHsWc0jppZEe1P2cYLHDDYv6zOwUaupbpQSOjv2uixOjNv8vEYzJCexdKRI6fnBM5DEUQnYlKVzKzeTdLmsAO7ImvJbnnsIAmeFteDgSmFt8GImgCQicg4OqWGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462227; c=relaxed/simple;
	bh=tf9M2MlC4GQ+rXRXyfjKzifuwRwBlSOhhIUUVgfhJ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRCRDTkfVIKtAd3r+Z52tWJ6UISFGN61DMLNhDa0kSqKNpeInEw1ftj11krU6KcnAT3pUOTBZY3zJd0SKTN+EjfSbQoyyqBSjkTgMSdeSM/pyRB5Are1o+h6BCR6lDjJ3raYYQloXgo1Y/0M9KUJPozCx/gCfJV92IvY3KvJdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDFaQMJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDFaQMJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F038DC4CEC5;
	Wed,  9 Oct 2024 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728462226;
	bh=tf9M2MlC4GQ+rXRXyfjKzifuwRwBlSOhhIUUVgfhJ7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDFaQMJOLjfxzs4l6rDWtLLI6a1AV4e4frrw90C0fI2R6dzfy6mfjd0Hg3yJkg81F
	 O/LI2Ij8ywLd2HySu6eZGd6n6JkdcxbLqYFwhgvE7r16SQtbFeQJ4QahSsYO9Gq6hU
	 oTsFWCaeoe8umjHXfR1lBOC0IhRQsLGeQ4/Wx5rEb7LaPSTzqfXc04ABgcsLtEspqa
	 /va7AE4H0AvL6m4kMBAPJA+mzgIplmrAU9pH0WgmEYux03H6cxrTwqkFZmCxTr9Leq
	 7ONUN6CjxA5PrPbr3qi1qgvLYqWsAOYDQuA+o/xzuy7WZY2TGkvfAO3jM2toZhrd+u
	 v+0uiY2Nbku1A==
Date: Wed, 9 Oct 2024 09:23:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Message-ID: <20241009-tamale-revisit-7d2606c5fdf3@spud>
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
 <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mdl99oyu/ETgEZlW"
Content-Disposition: inline
In-Reply-To: <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>


--Mdl99oyu/ETgEZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2024 at 10:10:14AM +0200, Alexandre Ghiti wrote:

> > > , it is better
> > > to disable gcc + rust builds to match the original intent, and
> > > subsequently support it when an appropriate set of extensions can be
> > > deduced from the version of libclang.
> > >=20
> > > Closes:
> > > https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.c=
om/
> > > [1]
> > > Link:
> > > https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@sp=
ud/
> > > [2]
> > > Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with
> > > rust support")
>=20
>=20
> I also fixed the Fixes tag ^, it contains 13 characters instead of 12 and
> added a cc: stable tag.

FYI, checkpatch is not an arbiter of truth, and I intentionally left the
13th character that git determined it needed to have there. Apparently
the kernel now has enough objects that there can be 12 character
collisions.

--Mdl99oyu/ETgEZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwY9jAAKCRB4tDGHoIJi
0jz9APsGDsRXizGa8lwr7kwUr5aboz4Zn4SpVJbVATWgXGgBFAD/aIl8X+A4kSNE
Zn3m0e/BumphE8b7xn/rF6HQW+zOywY=
=qF7b
-----END PGP SIGNATURE-----

--Mdl99oyu/ETgEZlW--
