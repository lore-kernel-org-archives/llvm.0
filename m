Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981DF1CCB41;
	Tue,  1 Oct 2024 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810847; cv=none; b=n+2HF5JFGj8okPVY9d/NBCmGIbe4wqwBAsrz2CNQo9//hyY34UwIiCL+pcFKybc4ck8OInQLS/FyEGuLb7HXzPeWuqZFR9vNiVJ+NSgml8B36LAay4caHD21fXUqAmDBTnOzrcXUJvaUKGipLqFe8yUi/rKUugeNoI4lCe6SNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810847; c=relaxed/simple;
	bh=rnSA/NcPwgiGLvd5BCxGGNZTwr+1d1IAzw2KM2zG7Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcB7bg4lXtvlGl9CFDQrqYWq3yDdzolDrzXonHstfQMCcTrJlkq4UEoE8grVhqKsVtRt5tiaop1EjFTNFg9Z1tRLWFvDIY3LdHMCYZNAJgDOBOeF2mzQe+50J0k4OORmkrklQjG8+7KkY+dcKYalou8/dYQTzdq0Z9H/eW6T23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwgIKIHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwgIKIHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A20C4CEC6;
	Tue,  1 Oct 2024 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727810847;
	bh=rnSA/NcPwgiGLvd5BCxGGNZTwr+1d1IAzw2KM2zG7Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwgIKIHKQ8gxnjk6yl03Fc57ZAwxs4tQG19jwmNWWTxQx/6X33+tJAQHASUbE3bB3
	 dTAWiKzf6KJrCmfrkzm5XsIniZYRr79WWH/RMHfM8D7fhbxwb6McpFQdx+qxMvPGSY
	 6Ur+HZBuryDNDBXt4wa7tcNUvVZrIS//nVz9AQdoAgvWTDmeH5Xt9lZXT+m6lCy2RR
	 Y2EsVTgKQjUx+udH1OkFp01q486BP50GQFJlzKHq/dOwTdE2ZT0XGQC5DkghfiBVSS
	 DIp64nx2d88V1L7h4PavVuiMK6HJ6GMihBHwuxlpapfedsp7/spq9O+UKMTXeSnqOC
	 xALIDja8pMong==
Date: Tue, 1 Oct 2024 20:27:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Message-ID: <20241001-partition-family-e862797bad1e@spud>
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <20241001185525.GA29379@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TarOnJ84/zi/70vf"
Content-Disposition: inline
In-Reply-To: <20241001185525.GA29379@thelio-3990X>


--TarOnJ84/zi/70vf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 11:55:25AM -0700, Nathan Chancellor wrote:
> On Tue, Oct 01, 2024 at 12:28:13PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > During the discussion before supporting rust on riscv, it was decided
> > not to support gcc yet, due to differences in extension handling
> > compared to llvm (only the version of libclang matching the c compiler
> > is supported). Recently Jason Montleon reported [1] that building with
> > gcc caused build issues, due to unsupported arguments being passed to
> > libclang. After some discussion between myself and Miguel, it is better
> > to disable gcc + rust builds to match the original intent, and
> > subsequently support it when an appropriate set of extensions can be
> > deduced from the version of libclang.
> >=20
> > Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@re=
dhat.com/ [1]
> > Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413=
e@spud/ [2]
> > Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust=
 support")
> > Reported-by: Jason Montleon <jmontleo@redhat.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Seems like a reasonable restriction to me.
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>=20
> I assume the difficulty is not in getting the libclang version itself
> but actually mapping extensions to the versions and then deciding how to
> make that available to the build system? Or is it more that a solution
> is somewhat known but someone has to actually implement it? Sorry if
> this has been talked about before.

It's mostly that someone has to take the time to go and do it. Miguel
and I discussed getting the libclang version a bit in [2] and mapping
the versions to extensions is no different (AFAIU) to mapping the
versions to extensions for Clang, so the work in figuring that out is
mostly done. It's a matter of going off and doing it, and testing the
various mixed tool configurations and versions to make sure it works
correctly.

--TarOnJ84/zi/70vf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvxNGQAKCRB4tDGHoIJi
0lE1AQDWWqq75fBmjONd1vkgn14O3Ry+Wd+YV+mwWrrx2ih/VwEA7vd7SwSL8noq
/GLsbc3JYDiN4dXJvAyG4VB4ih0/oQk=
=Yf0+
-----END PGP SIGNATURE-----

--TarOnJ84/zi/70vf--
