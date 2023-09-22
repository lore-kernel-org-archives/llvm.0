Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824F44495
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76D0820008;
	Fri, 22 Sep 2023 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695405341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCGVOgvY4s16fxeT66XA9Eh5rDl/9HDtlmqeH6RjkoU=;
	b=Y0LRVQDLcKtDrLDqeMHV0I1ZNxm+9zhyWjyvX375eWeEiVtm0HXDIM8ut4QJLyJLBpXfka
	32b9my3qGADpbERF9o+hkOvhW/E3A/Yi3TseGMlOMBBa7EFGBJhpBlEiG1Bdy1YSLIuckJ
	Tr5vva1tYdbcVQcTL/oGESCbOrKuY9wMptDbuKQh8MFB7L6XYYIhv5UlcuWabGjqMC2iEj
	/33Oo/gA6G2cEFLDvrPofAfgT0hE04e4+2DnHjUAKhgQufQE7CklUQLaOzAgAlu+UnA23i
	o1ONnbR2G4Be7ak2dHtQtHG/w37nsEQ2kb9f8KzL+shsZI515TDZvrp6gGljmA==
Date: Fri, 22 Sep 2023 19:55:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with
 __counted_by
Message-ID: <20230922195537.2ed8c479@xps-13>
In-Reply-To: <20230922175023.work.239-kees@kernel.org>
References: <20230922175023.work.239-kees@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

keescook@chromium.org wrote on Fri, 22 Sep 2023 10:50:23 -0700:

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Conor Culhane <conor.culhane@silvaco.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
