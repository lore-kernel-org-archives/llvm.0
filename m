Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A563040313F;
	Wed, 27 May 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894835; cv=none; b=nsxdhlTq13/cmynUuzs0Rs0MDVeXENklLp/iRN4TCXPVvyM/nmWyG8Dc4A9mMew7styVYu6lgy0dO3nhA0WJ9FTMrlSRffNnB+DaUpr4mwzXjE89TQ6kSCmnNhzNbz2/UejD0BGwQPpj0EWJf1ZY33GwCae0lrIyOf+n55RCDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894835; c=relaxed/simple;
	bh=1fsWjelT7KO9sq7FuY7uYLXRIVv4CEtXuDDVdl4LPZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT8hcA3IpNcLE1b+0ZQmeEProRe8VBCMKSysyTkbDSxVZn4pivfOa8bJAYCbtVuN4v7JBl3w63En3QL/Ob3Fn1EBnhz9nXIRkyoww3WZeJrRhmMjF29V2Di0R1vyjMi9jWta3N2L7igo+Dz3G7zewFZ2WYVo8TsKwYgJZybuCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fli+sTEf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fli+sTEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140F01F000E9;
	Wed, 27 May 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779894834;
	bh=TujEvKiW2piIl5ohOBgK6J2fe8BSjckrruUVfApQKfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fli+sTEfX8HJFIsEvDE9hM/3AonaKYnIP4c5IQN0iTEHO+n2Q1znlBaUL5pQx31NR
	 v6osyo1dGxB3ACjYUbVEkcurQEIq2YToeWNRJCtoe+vfDNcnNpqzTne8nL8Votlg3u
	 SjAAq2eQ3Yj3K62QPfQf1NNCghhU/FckZfWNKI8oBMLOqOQAH9EEtWW1vEsWNNOm4C
	 cv5rkH7BaJv2ji8dJwbvG4AQcSDzwSCqpqonY+kl2qMZiWtQFVRydugLPty0vs2kNO
	 3/ml5yW7rMyKWkxeokeMT4X1BC5s2vCG3/ZIceX1ypQnqCoCHsKKXJu6Ho1G9JbpPn
	 LVtWnMvvuc9sA==
Date: Wed, 27 May 2026 16:13:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
Message-ID: <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
 <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
 <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4PSTG2tb7HAazQOH"
Content-Disposition: inline
In-Reply-To: <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
X-Cookie: You are fairminded, just and loving.


--4PSTG2tb7HAazQOH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 05:07:30PM +0200, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > FWIW this has the effect of turning off rust for an allmodconfig unless
> > you're using LLVM=3D1.  That's probably the right thing to do but it me=
ans
> > you might've lost a bunch of coverage.

> Yeah :/ Thanks for the warning.

> Hmm... Do you happen to have "exceptions to allmodconfig" for
> linux-next? i.e. configs that you disable after `make ...
> allmodconfig`?

No, I just started building it with LLVM=3D1 though.  We'll see if
anything fun happens with the different set of diagnostics, it's
currently clean so we're OK right now.

--4PSTG2tb7HAazQOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXCioACgkQJNaLcl1U
h9AHwQf/bO94dyOnawqwp150xg8KzKHNUtmeyAT3o4e80tKFnQ/sm0jZwlozFrbr
vWkgg4xlBkvXUBvf2/ZxUNuCJcEKPx1m6kqUDHE5xi6Qj9WYxY8NSTDD1Iv8ZL+C
Pt42rVIh1W3y04OwrRnodQxrOQ+EdVl1zKoXXNP0+KwR7kZiaxcmoXJwmWFqNycp
KSXF4kuopRkXD/6cwEy0fnrjNnOgrdrzIR2A2+lCYHf1PQOoqildT11cWbuZ0veB
pwq+ahY2zpXVi78hf3zAbewcvws+B8AAwBB9FjsA8gT4OFlS5LjlTK1lHGNrEVzU
VcbtNvveWlklk9fL0jZ49sl6gXUUEg==
=8WGP
-----END PGP SIGNATURE-----

--4PSTG2tb7HAazQOH--
