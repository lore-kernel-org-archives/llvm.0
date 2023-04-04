Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EF7D2F2
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 21:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79E2C433EF;
	Tue,  4 Apr 2023 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680644590;
	bh=PjJPojfcUjqJJox/x1lbJeILeHhYrsUho9i6rxGtkMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvtcrlyDyrJgbyP/hU+1naLzCdpe+w1xMfRtWKIN0ZDFDyd0ejQiqOsFkXOu9YyRe
	 K6PtKVGQoDF15fbosO3sdi+OhH4Tt7WsxsGIIkoEB7mpzZwpeCjn7HnPbInjoBO/R9
	 H64WH5iJJWA0ER+4zFBrnNPzh9370zzAKJUWncbprk9frzeakUAEj3n2y4T4cW3On2
	 w0kDLgKYqonRvtSWt0WqiRV90dSrOLEd7ukF9AuhtwcM5/sXb27HwygJ08xZ57A9rA
	 6sbcT3wxM//hefzbHCRKL/IjR5clWX+bJ0K4er2zhrUJXY1Xy3L5PDTPd4PQeEqTgd
	 coU9lvXtoVNBA==
Date: Tue, 4 Apr 2023 22:43:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Message-ID: <20230404-dimmed-verbally-3597dcaaf106@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-21-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytcuK2YeaS0BDwL+"
Content-Disposition: inline
In-Reply-To: <20230404182037.863533-21-sunilvl@ventanamicro.com>


--ytcuK2YeaS0BDwL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:50:34PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Dropped another R-b?
https://lore.kernel.org/linux-riscv/91cf4ebd-f22c-4cf9-9fb4-fa6349ea00ab@sp=
ud/

That said...

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..8822b49ddb59 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=3Dy
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=3Dy
> +CONFIG_ACPI=3Dy

=2E..this is not where savedefconfig puts this for me.
Please move it there & then:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ytcuK2YeaS0BDwL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCyZ5gAKCRB4tDGHoIJi
0m1qAQDX9mpCl/eYsoI1vETpvGNq/isf52jwbJv77xDmWnc+BAD+N6jSxPyUDZnh
yfzLVxZyMNfyuaCMv86iHjbrd/BpSwo=
=xVWT
-----END PGP SIGNATURE-----

--ytcuK2YeaS0BDwL+--
