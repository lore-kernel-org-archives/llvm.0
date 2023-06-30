Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435016413
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FB7C433C0;
	Fri, 30 Jun 2023 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688150907;
	bh=iuRNxaXfE0hUWrCc8jY/81IkxCwuytrd8/XvpwaVu6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSJFSftluH4KmiUDWiOewcAUukuOlg3ZaBy+fEu+ERsPmoQ7HwqsUuuYQQwtrpEfM
	 9xoYylr1alx5yEcQuEZngcKqPOqjGb4mua0CpzzQWdPjrr/v91o73OyG1ekO+hdltO
	 34WfGqdxbR910l37Q6oOCToZ/ZZc8fNok8+IO0nyb4YKQpourdOpRjC7ub6bKSOqoA
	 ixYRE2FEuj1RhDEjkuqZrLvFe+A70VijEZ1QmbBx7p3BCAScW4avRblxU+WJTL5+mU
	 Hi3HWMB8eypHeo3RIa22CYfgABMW1+TDKl1nNAAFPa0CzWJYCO2DNBHknVOyD+y090
	 ycA9304ka+mMA==
Date: Fri, 30 Jun 2023 19:48:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: KCFI support
Message-ID: <20230630-phrasing-strung-12e53988ad81@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KeUX9Ea1q/FPEBvY"
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>


--KeUX9Ea1q/FPEBvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Sami,

On Thu, Jun 29, 2023 at 11:42:45PM +0000, Sami Tolvanen wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.

> base-commit: c6b0271053e7a5ae57511363213777f706b60489

Could you please rebase this on top of v6.5-rc1 when that comes out?
This base-commit is some random commit from Linus' tree, that because we
are currently in the merge window has is not in the RISC-V trees yet,
and means the series wasn't applied by our CI stuff.

Cheers,
Conor.

--KeUX9Ea1q/FPEBvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8jdwAKCRB4tDGHoIJi
0nEcAP0SWfLV19tIw/6zGm0BC+jgnl2WaOsvVsv9zVtGh5HT+wD/bgxhWiw2uj+3
wv6NCmZKlo3MNdMi7qK+Q07sMmgBKwg=
=3kM+
-----END PGP SIGNATURE-----

--KeUX9Ea1q/FPEBvY--
