Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F2C3FC2
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 16:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60921C433EF;
	Wed, 26 Apr 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682527644;
	bh=LQIlZBXyvbpRW/w7bY9aSuiYQzw21Inh3Gti8/6IHO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sKZvNectox1rW/0Kt+dYBwGPPJyiXg/4k6NvGpRI/m3H/I1ZyTCgo54bLncGXM15x
	 1AQ5mmloG8jT8XJd8KasLmwdRAm0lFLwFMG9Io4HoxUyA0rqXdOlBXI2zrxNazX81q
	 WKgBJBQ6k/Peg/xD7UpueXtlG1s4ySQovbI/kAsmeZAOEU2+nZQBXhZJPyj4ph2Sfe
	 ajKQQm31OtiPNfdz33ot6Y5A8HBt3UNngT3WVqjDNLSpv0L7cYv8dJhTI+f7bqnZZ6
	 DLunByvUsKVa91qD51NoR05GAJDp/UH86hcoNCzQYq4g6dMPlRBqmsSU8gSMCH5uPM
	 G4gwU3FQgRP/w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Weili
 Qian <qianweili@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "David S . Miller" <davem@davemloft.net>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
In-Reply-To: <20230404182037.863533-6-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-6-sunilvl@ventanamicro.com>
Date: Wed, 26 Apr 2023 18:47:20 +0200
Message-ID: <87a5yua8vb.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sunil V L <sunilvl@ventanamicro.com> writes:

> Without this, if the tables are larger than 4K,
> acpi_map() will fail.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/acpi/osl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
> index 3269a888fb7a..f725813d0cce 100644
> --- a/drivers/acpi/osl.c
> +++ b/drivers/acpi/osl.c
> @@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size si=
ze)
>  	return NULL;
>  }
>=20=20
> -#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
> +#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISC=
V)
>  /* ioremap will take care of cache attributes */
>  #define should_use_kmap(pfn)   0

An observation, which can be addressed later; The acpi_os_ioremap()
(called when the config above is enabled for RV), does not have an arch
specific implementation for RISC-V. The generic one calls
ioremap_cached(), which on RISC-V defaults to ioremap() -- caching
disabled/_PAGE_IO.

That is probably not what we want, but rather something similar that
arm64 does.


Bj=C3=B6rn
