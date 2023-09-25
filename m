Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04715E80
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CZlIUfCEZAaduIab/BeYk1An+kVppDAcETHyx1HtxZE=; b=OLKk7KzHiiGpF1sqjWKSHcWnBZ
	92q6oAsLH8WkTJ+FhxjcGNaRuF+h8XwsCxZhYYqda0aMpb2cL4VmSVVm/BkygQ4pqREJW/O9PEsoH
	kGpcMhAXZLjcT2iGMbS73ooDgePc0V9S2npQoXjzsW/GmDP0nW9GDTZdiPVJ1Q+Xj+IX5wXMqaCtE
	IFO648RpE+win1TFMnfxg5RDgEfDQvFgtgXf418BDPcR5oid/G6hnWo9eDcna1Wz9Bxek/r6HC7XD
	jkiltcKNHN6SeLrlkuv6M8SpYywXLT+jiqcyO63cHS7K67XKjPSzn9pbj1sVAWbU/7SkZZB0a8LC0
	WSmJI7FQ==;
Received: from [195.181.170.235] (helo=[172.31.28.226])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qkjhM-001A2F-Jx; Mon, 25 Sep 2023 11:24:20 +0000
Message-ID: <cb5e785d19a15356d85bca11bebf7975c495e948.camel@infradead.org>
Subject: Re: [PATCH] virtio_console: Annotate struct port_buffer with
 __counted_by
From: Amit Shah <amit@infradead.org>
To: Kees Cook <keescook@chromium.org>, Amit Shah <amit@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, virtualization@lists.linux-foundation.org, 
	Nathan Chancellor
	 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
	 <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Date: Mon, 25 Sep 2023 13:24:19 +0200
In-Reply-To: <20230922175115.work.059-kees@kernel.org>
References: <20230922175115.work.059-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-09-22 at 10:51 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct port_buffer.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Amit Shah <amit@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/char/virtio_console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.=
c
> index 680d1ef2a217..431e9e5bf9c1 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -106,7 +106,7 @@ struct port_buffer {
>  	unsigned int sgpages;
> =20
>  	/* sg is used if spages > 0. sg must be the last in is struct */
> -	struct scatterlist sg[];
> +	struct scatterlist sg[] __counted_by(sgpages);
>  };

Reviewed-by: Amit Shah <amit@kernel.org>

Greg, please pick this up.

Thanks,

		Amit
