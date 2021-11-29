Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966E72
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 17:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD2DC53FD0;
	Mon, 29 Nov 2021 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638208569;
	bh=lqJiiKekGdSFz0ooRlx6p12gniCHvJVjb280cnUkOVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTljZLxZHTdTwXKdiN3/LDqW+Iz2W21xldKn3X9Zw1ro+kM6cyQHo6KfQXP0mzevL
	 icvxQiPoWjTxVDla7lGkOtiomftwA05ocmRKZTcYgp+rQ0gZvNh5kz14ClYj/dGkdS
	 B2cKLDdhG4ne+f5oUElgvDxm3HxpKJgLtkZrNQeqW8+KJYBo9Tpuu7XGcP621DdP9b
	 mLCSK+uk56SyEuuVOw4ErcjZ+9ZbAypZ+AT5Jz2vuA/zVbW8js7Avd4PiBniVR+Bbr
	 Om+geqOaMnr43x/+ayitvhSlSfixG2oG9VsxvotvnTR1iptNrPOMD1ercEYp0+Vsrf
	 HmZqW+37wozgA==
Date: Mon, 29 Nov 2021 17:56:02 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci@groups.io, nathan@kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Tom Stellard <tstellar@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Message-ID: <YaUUMn6noJQRXp1q@sirena.org.uk>
References: <20211129165803.470795-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wC5KaXERvAzkp9VU"
Content-Disposition: inline
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
X-Cookie: Thank god!! ... It's HENNY YOUNGMAN!!


--wC5KaXERvAzkp9VU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> This patch series raises the minimum supported version of LLVM to
> 11.0.0.
>=20
> Patch #1 outlines the issue, goes over the potential impact of the
> change, and does the actual bump. Subsequent patches clean up the
> various checks that are always true after the bump.

Reviewed-by: Mark Brown <broonie@kernel.org>

--wC5KaXERvAzkp9VU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGlFDEACgkQJNaLcl1U
h9BjEwgAhdF9+7Ne92+Um8gDokv0S14rpQ9x/g0wU3cO0ktDZp5NMlriwkIG0FgQ
jnV8PvO9oWWvkK9BFr7d1IXGV9ZK1tFyrU6UzuUrPejstZX7vi2NGI21SESCaitj
OivGUpyOIMi0nsLYlDrvNojRKOh+bZwugAkJh5wGVy+tllvQAWiX8318K0YHipKT
52IlJ15xt4S7A/RzqLBoGHklutUK0WnFZoEQ7INb4Sdja+KEUeCAIQyuIP7c5TG4
H0Ys5k8PKegJ7c7u3wCXbBjwOKjz+WjBqzS1gSyILKBHMsBBy8tswwdZznPBceWl
jMB8V10GZDzyA+N9cGCx/NlKyxZDiA==
=CplQ
-----END PGP SIGNATURE-----

--wC5KaXERvAzkp9VU--
