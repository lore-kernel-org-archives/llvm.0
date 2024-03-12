Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A2811;
	Tue, 12 Mar 2024 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710249097; cv=none; b=rdeFFCHhUuqqQC1hBqyj1MEWIj3n9tu8v37rsEmgt3d8Gt5TO90WInT+2E70DOjuXAiVqrA8ZZaZgLMDAUXMsqYpEZgLuINn/uew1THNPLLhTnOQ2V9tlT5DG+zoUela6tqxE78coDY/NK2bztuHeJrql73AjnSpa4HP5HtoNdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710249097; c=relaxed/simple;
	bh=8zzR6UFQjZG3d8i4dZKcRIyjxUHlVKUF6u57bQEkJ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB/NvINAhiK9vkZu5rcBtjrafu5x/SbhTY5bnUzAwgwK1aUic1p7lsj9Xe4dFFAVUeL/EZsD03ev6W7c4t3UURBSWpZYBGnuptny6JPuoy+DRoZbZtu6oOKEHvSgx+32y+7+POVHrML/JcMFBOoUglgyiSkdCsKa8dKpHlUEZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sx41+pCY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sx41+pCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67744C433C7;
	Tue, 12 Mar 2024 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710249097;
	bh=8zzR6UFQjZG3d8i4dZKcRIyjxUHlVKUF6u57bQEkJ6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sx41+pCYhQJj8GXcUXm5rxyjpm4RUFPpfKJNVmz79C1081lI9rCxIl8R1yLlmCEmS
	 65QhX9HQQ/gsbuoVb2p0mEkEsIwCPYLhfFiEV3Qa1kGSd12O8/xGEy02V35b1H1QyS
	 pr3EjJe0yDMfjYpGaFYHsdiEg4iGqeXC39PAMnhinrew1lLHhkY0tr+qDTDpk55ILb
	 S6yYW02Al9AijbGUJZin3brABcLKdijBZMGA1GvuRsdYczmW4r9VueVxl2KlKbzPIx
	 Utbzn8MEZJJ0EgVx/wnlIxbeQpaaExbmb5BKPh5UOXYKi3Uc6Gb6LHOiNrFt2kmnC3
	 xWtRKurP3o/zQ==
Date: Tue, 12 Mar 2024 13:11:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	kernelci@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
Message-ID: <1eeec744-10e3-4769-b031-485f11e0d253@sirena.org.uk>
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
 <20240307170516.GA1780841@dev-arch.thelio-3990X>
 <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKpNZVUdnAyG6n4r"
Content-Disposition: inline
In-Reply-To: <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
X-Cookie: Oh, so there you are!


--kKpNZVUdnAyG6n4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 11, 2024 at 08:10:31PM +0100, Guillaume Tucker wrote:

> Then in addition to the tarballs, one thing that was discussed
> with Linaro in the very early days of tuxmake was to have a
> reference set of Docker image with the toolchains already
> installed - to save everyone creating their own like in Nathan's
> GitHub link.  Has anyone done that already?

Providing you don't mind ignoring the tuxmake install in them (or using
it) the tuxmake images kind of do that.  The KernelCI ones similarly
though they're only built when actually used so it's a much smaller set
of toolchains.

> I started looking into it while I was writing my tutorial to
> build a kernel last month but didn't find anything, so it's kind
> of going up on my TODO list now.  It would greatly help unify
> kernel builds across CI systems in particular and improve
> reproducibility.  The TuxBuild / tuxmake Docker images were
> forked from the KernelCI ones so that's already something that
> could be reunited at some point.

It is pretty sensible if you're doing a CI tool to put any tool specific
bits you need into the core docker image and then layer the specific
toolchains on top of that so I'm not sure how that scales in terms of
the actual images.  From a source code point of view you could do
something easily enough though with templating or a light fork for each
user that wants to customise the images.

--kKpNZVUdnAyG6n4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwVIMACgkQJNaLcl1U
h9AmCwf/cdw3pTmIrmp1VvUI9jZbn4/3Y2QNN/p6+b0p4Wp8SPZdlwyduM4+ObtS
YXSTR0KslILFDgLXkK9wfxDfjEuiNrfmoiwUFV7gxPt+9TsWhALNU/GB5M0BXeuV
XogkV93JkMAZ+7neQMQeanALnyAij6V0KokOuJOajz6qGyxQVrfUdIC+3yuC9iEk
Zm7zt5Fplm6tJtk+EcPtbDQ28fqdJQFwS24gr+xgWoKf60bXI3u7JoQ17b/DrbAY
UKBDjJwt+R7otLS7Cw+OwO7AyK6zpxhzvNW+x1KF1jBRfY/wC9hnY8HYgm7sJ/JA
VheI1RQf7HQQVV5z/t2imhMRFoxBww==
=ebNh
-----END PGP SIGNATURE-----

--kKpNZVUdnAyG6n4r--
