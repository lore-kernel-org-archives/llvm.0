Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8211CB6
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 17:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105EEC433C7;
	Thu, 31 Aug 2023 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502228;
	bh=ctnELOgyQiFdisjCzaGZrbZlVVWK6L94DyJWQq4uLSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXGDXcRbRklyijnB0xq0n66yj7zD1aCY5u4Dh4NJ9YVklMLzmQhhPLsmQ2dnNEdO2
	 V1nFrBwPE2qoTpdOgcBaSbQJVc7z9zI6jRE4+s0E93dI4mc4SzmrLCBM2ep+JrFJpj
	 Sel9YB+cOyO3fViQqqo1+IesSZyCZ6yORGJbbdoPi42FGWq44ug9kzoWYwya+wGm3n
	 lxk/f2X937vYErph9qfQe+m7qdc3ygxuf872mvRLVKMhTxd+uPlO36DKk42+nWPPHh
	 jxWSuYC+FYCwnKgjEEt02n90A2qXJSCwXnJ2ZjMZFFXPvcPHaiQKM2VSMYe8ncvqaK
	 h0SG/PH4GTTTA==
Date: Thu, 31 Aug 2023 18:17:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
	llvm@lists.linux.dev, nathan@kernel.org, regressions@leemhuis.info
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Message-ID: <20230831-resize-spherical-4f46639097b8@spud>
References: <20230825050248.32681-1-andy.chiu@sifive.com>
 <ZPDIQEVaEJHXR5IW@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="swMVnOXyUbYix+/e"
Content-Disposition: inline
In-Reply-To: <ZPDIQEVaEJHXR5IW@google.com>


--swMVnOXyUbYix+/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:05:04AM -0700, Nick Desaulniers wrote:
> On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
> > This patch add back the ptrace support with the following fix:
> >  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
> >    conflicting with gdb's NT_RISCV_CSR.
> >  - Use struct __riscv_v_regset_state to handle ptrace requests
> >=20
> > Since gdb does not directly include the note description header in
> > Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> > sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> > conflicts.
> >=20
> > Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>=20
> Hi Andy, this is causing an instance of -Wunused-variable. PTAL.
>=20
> Please use the following tags on the fix:
>=20
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@m=
x.google.com/
>=20
> Let's see if I can get the regzbot tag correct; first time trying it.
>=20
> #regzbot introduced dbe46b094026

See <20230830203754.24940-1-palmer@rivosinc.com> for the fix.

That has you gave regzbot prob won't be stable though, branch needs a
rebase to add missing SoB tags from its committer.

--swMVnOXyUbYix+/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPDLDQAKCRB4tDGHoIJi
0tfeAQDVIHp/ifcftmYU7QsT5+rY3ORU6jMEj3oR+KGcIj0GJwEA7mOVDivJ0S1v
JzsoPGnjIrDjrndpdzti4vZ5lHwiogc=
=TZpH
-----END PGP SIGNATURE-----

--swMVnOXyUbYix+/e--
