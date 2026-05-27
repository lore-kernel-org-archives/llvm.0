Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581F37F721;
	Wed, 27 May 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898109; cv=none; b=tVHXb+Dr0n0Eeq0SMn/9Xihq5pMMykCaX4zLBsW5IAOt0zbc9v5Q/afVE3I2DL4WoBzb5jDGEJ+prTWUAqUjJKBsVEfffXhb12Kis8kopwL2yl7NPaM9oVpWyu+fCynn/hsoUx9Pvbvf5qlgbfI3ahV1/PSZftj6jqe78IUunT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898109; c=relaxed/simple;
	bh=BC9N9k8SRMALsFsPxmhJdauzLxrQ9KofATfEMzlgHxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4mUr3pSWXvWy0INzEjJmrZPnKIUGnFt/P4CCLDWXprQf5L7ll8svtUIFLngEkH/JfQM9FiSZev19eybhefHy5YyDIKRcgJNDGOem8KdZnlhM7hAhE6JtyhQA0bTo+MiE46HA23uCvLxC4E71Ljy5OngbxtkK/17AFPEm16K/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTgECryX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTgECryX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79E31F000E9;
	Wed, 27 May 2026 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779898108;
	bh=W++JFnJYVCp2nWK57aBxyot7UUshxGmMXwQKjPm/cJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTgECryXug3Yn/g8wfIggS9uyKEw+yIWh2MBZmA1KBdWBBE7nxF75W9tyuYRri57F
	 HaDRvSJs52JHIVqTkU5u02+9rVp75wwYqK7tKkEVwtNSJThIXMkFERgcbOH2RlQ9HN
	 rbIl+B0DNiD2MxTaIpvxy7pyupCet4aolnLV9iNmbAr0wq/0Gt6yYm3Feez0rlZuEL
	 sda+eO+We0zQaPkKLhsHIsnD6zHfGlS27DJNcoMv9liLriZa2+hlaG4+owI1TkYHoV
	 E2zpyke7xa+UKI6q2mKJrplav+4ySFSIsA4Mxm/e8rTmz8YrHxUci8EY0OqQSEbKE2
	 U51/PoZethw3Q==
Date: Wed, 27 May 2026 17:08:21 +0100
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
Message-ID: <0487e080-12b7-42e5-af19-459c4795ba5f@sirena.org.uk>
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
 <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
 <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
 <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
 <CANiq72mbeCMzS2gReTMzb=KF4fSezp_FZWQ60HodiuwAeOkjKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="My+UWFBam8Ojd44b"
Content-Disposition: inline
In-Reply-To: <CANiq72mbeCMzS2gReTMzb=KF4fSezp_FZWQ60HodiuwAeOkjKQ@mail.gmail.com>
X-Cookie: You are fairminded, just and loving.


--My+UWFBam8Ojd44b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 05:27:18PM +0200, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 5:13=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > No, I just started building it with LLVM=3D1 though.  We'll see if
> > anything fun happens with the different set of diagnostics, it's
> > currently clean so we're OK right now.

> Sounds good, thanks!

> (`LLVM=3D1` is what we (or at least I) test the most by far, but it is
> true that Linux distributions out there use the GCC (and thus, for
> now, mixed GCC+LLVM) builds...)

Yeah, plus I'm not aware of comparable build coverage for GCC to what we
have for clang which makes me a bit worried about doing something that
lowers coverage.

--My+UWFBam8Ojd44b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXFvQACgkQJNaLcl1U
h9DOiAf+MsBuCvQqjTK746qzHi416gY2pWCoR8TbU+Aqv10hxyhMvG7dE4UwSDeL
SsH3lYm/2chqNa0yfBxBAb80NTE4IG/VAF1pgnta9HiyftGfEOCmhKcwFye/tCcU
Ufg+H2UoXYiKUpF5Gcs4odwf7389e/r3I7foxFL+f0iA7lJ9U/9SOoBlPI9i+fiL
03euQH/+AwX99le/NyAgJq7Wbmf2CVgt4B8qVeFvMju4zfCS7vfosDqjpRQMQBsB
53EktyBeWVDq9nrB2R1+ScgG3roahoWxwY5mU39mxN0eeTDEfKyPdqoVY2/s8jB4
EpZ4aEmL4CjpzDg1rYxxNvR9f2Unyw==
=3Aee
-----END PGP SIGNATURE-----

--My+UWFBam8Ojd44b--
