Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC55811C;
	Thu, 14 Mar 2024 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421213; cv=none; b=Eovk79z0NR8IYrYhDPimBTPTJVcl43aKets7tlQ10CcbZiu/jdwSzl69H8uLS1abCSUxs5QQoIPHIUNWiVY2blBNAEDk2PO3Ocd5WOFWWFN8fG1ImnGaQBxfqgNeEvQLJclbYVB2ZDNmtEypxCfJlKit3ChMMCQhugKXC/MnXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421213; c=relaxed/simple;
	bh=mgHkcVjLaoO4hPQjqPg5rftEEMIaqQKNGW6YnHPqWPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuLBI8+bEBWSLvzboWZruE6FgktD6nrpnOPog4jltrfKmyyCjDR+aioMCKCE1TC5nlXVm6EFWwPEQWi/rnuJetdojD4byMDd4U4zdAETsf0M34GQEZWtCL9ulYJ+/nQaPnCrH5k82tUEVvMdkMB9XSize7dVjJwk7YDUhJMh4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN3svYFa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN3svYFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6F7C43390;
	Thu, 14 Mar 2024 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710421213;
	bh=mgHkcVjLaoO4hPQjqPg5rftEEMIaqQKNGW6YnHPqWPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iN3svYFasXkk8v+TRvpIsFZGrWIART3kQDWWT99DutxEO+EpWWz0+/JpUCAn6RJxj
	 gthpeyS4Lyyf0pFavlJpkAsgELb17Si0jhXdDv94Y3d89T4g6hQIVPtQV6kLEqi7Qv
	 wHsRCepbS2E5W0wANOR1IB+6+AijDjDUiZZ3JhxvCaQvaMT9ByZ/QHVUxjokX6nArN
	 SP7zS/hTMp8r4Auu31bB8s2GGGU80FlE+i9q4cCxj4f/mPszTjgOm1urukgBPOHItn
	 ImZQDg6ACUwHbU3jDbH87qsURbGXwPBn0e4jrEFlpumYsBzWlh2qzoQhmtRaSXhIWn
	 XoNy9o+XQpZzw==
Date: Thu, 14 Mar 2024 13:00:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	kernelci@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
Message-ID: <1060f9c5-f6cc-408f-85be-b5660bff1beb@sirena.org.uk>
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
 <20240307170516.GA1780841@dev-arch.thelio-3990X>
 <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
 <20240313175622.GA3091999@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PywV/zVylAMlyZwY"
Content-Disposition: inline
In-Reply-To: <20240313175622.GA3091999@dev-arch.thelio-3990X>
X-Cookie: WYSIWYG:


--PywV/zVylAMlyZwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 10:56:22AM -0700, Nathan Chancellor wrote:

> I am not aware of that. As far as I can tell, the TuxMake images are
> only lightly customized for TuxMake itself, so it is possible they are
> already usable by other entities (I maintain my own containers for other
> reasons). They recently added images for my kernel.org LLVM builds as
> well:

The toolchain installs in them are very standard and usable by others.

--PywV/zVylAMlyZwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXy9NgACgkQJNaLcl1U
h9Beewf/UftcSWHrQDH1Erjr5PQUuVqxskvJq9rltp/i+Z7XtOkFHLHzz+XYvNnq
ZN5L/3BRymlc3LzYXuJ1YJvRBhQ5uhJVyJ9DgARNd8sQm1iQ/W51j67c7nW5cH4w
9sOZcxF68eODMP1lxYE14ISYauLDduprn0LlL6Bl4XKbLFeumqQLy1CAHi5+Ys2Z
12ZLmoHIVTrm/rqiALn0XA5Ay/jK8MJ+vCv3XuwUVscJKGRzsWAmRYEc8vtO3X1C
J6aaLnVjoxy+diVF92ehwzTVBqpoFAGwKj1nRRb6f2uneItEUJn9+tmNFrsO9B2q
gJ6rAWLnIgEdNvhYP1/bEQy6DN1heg==
=FaK3
-----END PGP SIGNATURE-----

--PywV/zVylAMlyZwY--
