Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A916423A67;
	Wed, 27 May 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890312; cv=none; b=CeKDdCChgkNWv9z8ppmR/Nq8451WrKIjIwAOO9antATrb3V7ExmFDzfFeM/vfqjWvI5MjB3htgdf1W0q7RmHFVR2YKBVd0ieogtqYuND+MBUHwmbvbSIgtoddm8xHjAixlucv44nA/pZ1HDSX/ggAc06f8c1bvlybjFPfCRmLsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890312; c=relaxed/simple;
	bh=HtSfq1VPs9AMP26cxMF9avyydNGqum+AU/zKQ5ztens=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVe9n38HHMghGbjyb3PAXPzhl2JNsoV+MuaWqzuo3L3u83ZWqaOAsEQDNvjseyIAmVR13k9EQEvvxd6HRUdAx4Pt5+vEcq9oRCFgpALOTSDWd/MLjqM9hbbOMalVzmceeo69kZYmVNHBB1RgPbYFJkGXzR+E/JrIYdlhYKur7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgyQ8yrY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgyQ8yrY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB21B1F00A3D;
	Wed, 27 May 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779890310;
	bh=KuqFQwlEXxVURmtb9qRVFE2EZ//e5lQiwjh7+2MN4DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgyQ8yrYj5laqK22iHPL6Y/09F8TueBz9OgYoqSskBgvrZ4EKcJ/K875PW7DMTxY0
	 oxSn/jI347HLS/TRJ+M/CjZmChwC/zVUVD+R9Cj1CmIpLfwzfRhgF5M10dnoZe4G/p
	 1i01X8UUxtMXVU+a/dlrSZDZiSMMlg3rMN+ifvXrrlenUG6bGXSZ4MW1d9k8o/xgMb
	 h0OEOZ8SAW3iTgnzmsL2nR7tGTI0BkBuKc3DNf/PZ0SPBttO7a/S+0TpRvy3IgkV/+
	 Po7h0URqoXA0gqrEt92n+OZrEJKES18kChs1CnNiAZYDGtLwLF41coMcfnRf1dClsY
	 IYYhyM8FkEFPg==
Date: Wed, 27 May 2026 14:58:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
Message-ID: <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VR46wcgkWwqEKGEO"
Content-Disposition: inline
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
X-Cookie: Mene, mene, tekel, upharsen.


--VR46wcgkWwqEKGEO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 08:32:16AM +0000, Alice Ryhl wrote:
> Kernel KASAN involves passing various llvm/gcc specific arguments to
> the C and Rust compiler. Since these arguments differ between llvm and
> gcc, it's not safe to mix an llvm-based rustc with a gcc build when
> kasan is enabled.

FWIW this has the effect of turning off rust for an allmodconfig unless
you're using LLVM=1.  That's probably the right thing to do but it means
you might've lost a bunch of coverage.

--VR46wcgkWwqEKGEO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW+H8ACgkQJNaLcl1U
h9B2fQf+JuuwWKT7HJ/sduPGlYRYDoFCctj8jzyDwu7nLSrOJEaU6wwu+wWKSYsc
rfZ2f4UVYiJDXnVy3YwoYfUggqxatpkhD4G/8pUx+Qc02bcduclFw3iqQ2TuaG+0
oXInpcgNL9JGEWS3fQwFZLfyuGl6Amy/Oaqt0IvAdCtFjHAgqTgk7WIXG4pozqx/
TjM3WLmNnzSe5GR+DXYq0jZYvUeVpQkLVaYiwTLTmrFCm1PsUdnChpqih9ayIILz
D0jyuQBq5+yGY+BhvBKqECb4uu7r1lhVuzsH7hYXIrs29Yukvi4se2WZZNF1GI++
b4o5YwWBy8+j2uEgY+V1OiNZsC6P+w==
=R/4T
-----END PGP SIGNATURE-----

--VR46wcgkWwqEKGEO--
