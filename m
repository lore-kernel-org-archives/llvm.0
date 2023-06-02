Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5381B8FE
	for <llvm@lists.linux.dev>; Fri,  2 Jun 2023 15:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677FDC433D2;
	Fri,  2 Jun 2023 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685721057;
	bh=uB7RdhiqMXZj0Kk8iwK91jgxrux4B83iiv1sDrmQEb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgxhZO+CpHzVztd4Rlg2GqHIDY9LhuL7yIEBQkCSCluRAvLfeeRX7102ZG/WsC4la
	 3UoK5isDFzScpbDAi63KBAdyv0ferp4ed6A4Qh32p/lc9POgbh+WylP93SNvFa4RHQ
	 v08XTgyG51jddoSvkvxFnG7nQ+WyIvfwTD0cKxaRdGmLiIkBUSxq2NGnQn5MrSLH9i
	 2+Dwpk0o2081y9MX/lJCu7vVa5JQS2qT1jaHsEfWyo+XhN2CNay458l1L7z3QFg+NX
	 2ZBOosnbuEgzDi1420H2I8qIhhthbXe9jbAHfP7FJUXmEbTsQT4N+CsJQDC+EJQEvv
	 O+6EkxYGVI7dQ==
Date: Fri, 2 Jun 2023 16:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: sunilvl@ventanamicro.com, Bjorn Topel <bjorn@rivosinc.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, corbet@lwn.net,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	rafael@kernel.org, lenb@kernel.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, qianweili@huawei.com, wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	Marc Zyngier <maz@kernel.org>, luzmaximilian@gmail.com,
	hdegoede@redhat.com, markgross@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com
Subject: Re: (subset) [PATCH V6 00/21] Add basic ACPI support for RISC-V
Message-ID: <20230602-reformist-jet-9fd642b971d2@spud>
References: <168571787727.17224.6663458864222960682.b4-ty@rivosinc.com>
 <mhng-4fad860f-b5ff-4dc1-968e-219be1983acd@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Yq3pFkyoejdiFUi"
Content-Disposition: inline
In-Reply-To: <mhng-4fad860f-b5ff-4dc1-968e-219be1983acd@palmer-ri-x1c9>


--5Yq3pFkyoejdiFUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 02, 2023 at 08:11:04AM -0700, Palmer Dabbelt wrote:
> On Fri, 02 Jun 2023 07:57:57 PDT (-0700), Palmer Dabbelt wrote:

> I also don't yet have any testing for the ACPI stuff, but hopefully I'll get
> around to adding some.  We should probably add it to the patchwwork CI as
> well.

Yeah, just like DT testing should be added too! I am planning on doing
some work on that front next week, hopefully I make good on my word...

Cheers,
Conor.

Also, having ACPI support in means we now need
https://lore.kernel.org/all/tencent_B30EED51C7235CA1988890E5C658BE35C107@qq.com/
to be compliant with the ECR. It doesn't apply as-is, so I will add a
Fixes tag & rebase.

--5Yq3pFkyoejdiFUi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHoPwwAKCRB4tDGHoIJi
0oOjAP9bCWu1mHF0lnDALjWsfK3ipt7wNaQvkVtzWRvXSaAe+gEA8E5S7Doc/P7x
0QVi9g8WmJX7vWKUTklpsWiBLsEd8w0=
=ON4g
-----END PGP SIGNATURE-----

--5Yq3pFkyoejdiFUi--
