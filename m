Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73C7540E;
	Tue, 12 Dec 2023 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEfIG+fp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413F7C433CD;
	Tue, 12 Dec 2023 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702394469;
	bh=fPuUDXbvyQcdlGJVGtxadUQq7xMHYvrITxb/nuVFpzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEfIG+fp3V3eVe8VWoQtmtv+FXpOuNu3/MG6SEfZZ+KyCRN04C+P7+erYFvaQTgu9
	 eFPz0FROSykUvwNHpaprw6hk/xBHZSUxxTMeNeeFuGVg9fqOVwA6eRSAzr5D0ez7lS
	 3LKTuyn3OiGjvvCai7cPIr+AvhERotkqxzy2y8duCmo1F2SyuVevlyU/SdcrJBs+y+
	 fB1SptobaXSXxZ9of5YqHPKZW5qEA8zl+nnvZ6Yo1pmfdRArJx7NpFLopx40DOXhrf
	 24VPA4wdHtUwSiwBWsw5lljmlcASYmQSa71ZEL2gZ69mu+LMtwe0MPIT4VTGOETttN
	 ZEnEiZkxpELPA==
Date: Tue, 12 Dec 2023 15:21:04 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, lkp@intel.com,
	linux-mm@kvack.org, linux@weissschuh.net, llvm@lists.linux.dev,
	mcgrof@kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] drivers: perf: Fix build error by adding const to
 ctl_table argument of handler
Message-ID: <20231212-garage-pellet-c6a2bd34854c@spud>
References: <202312062242.RFPPozG9-lkp@intel.com>
 <20231207083512.51792-1-alexghiti@rivosinc.com>
 <877cljsbes.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u+TMTYDuzJdAB5mY"
Content-Disposition: inline
In-Reply-To: <877cljsbes.fsf@all.your.base.are.belong.to.us>


--u+TMTYDuzJdAB5mY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:11:55PM +0100, Bj=F6rn T=F6pel wrote:
> Alexandre Ghiti <alexghiti@rivosinc.com> writes:
>=20
> > The ctl_table argument of the proc_handler field was constified treewide
> > but somehow missed the occurrence in the riscv pmu sbi driver, so add t=
he
> > const to fix the build error.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp=
@intel.com/
> > Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument=
 of handlers")
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 16acd4dcdb96..97e345f7d25d 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *i=
nfo)
> >  		csr_write(CSR_SCOUNTEREN, 0x2);
> >  }
> > =20
> > -static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> > +static int riscv_pmu_proc_user_access_handler(const struct ctl_table *=
table,
> >  					      int write, void *buffer,
> >  					      size_t *lenp, loff_t *ppos)
>=20
> Adding linux-riscv.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

There's already a patch for this:
https://lore.kernel.org/linux-riscv/20231206084642.802053-1-m.szyprowski@sa=
msung.com/

The maintainer of the tree with the broken patch (Luis) has not deigned to
pick it up yet unfortunately. It can't go into Palmer's tree cos it will
break the build if applied there.

Cheers,
Conor.

--u+TMTYDuzJdAB5mY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXh6YAAKCRB4tDGHoIJi
0rA3AP45hqW77ceWdDa3OBX5lwstdHr3WTXrkkHheKfXIwqn3QEAnEtNdsZN1rp1
dMhZ39fGppXobCP3M3OQjxQjrt3cjQs=
=f5mp
-----END PGP SIGNATURE-----

--u+TMTYDuzJdAB5mY--
