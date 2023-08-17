Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EC8F73
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 08:43:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A5A1BF20D;
	Thu, 17 Aug 2023 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZTPzGWR823YG5jFJrtbSl0SkHcpjEiMeVAQSp30Zyg=;
	b=AXCaItneDiKmQZVzmSpvvVUGf/dhoyBk23IuegiE10XZWy/0yMUgAyYaoC7FPkhcDpLQv5
	KPgswpVotS+ApFCCfTjOz1oKns26teIl1mvr/mvXRlVbm2UXc96N7FIhh/3HKVkeT8b9Ai
	mjQ45ai64+wazBScB76VV5fmQacVd9MXJM2jFHyzhWNHNcgkZfPhDy6beiwYw75yRb4V9X
	gENUL2m3FBeh+k7506ftz7X/52ysnNTgrF6t+VbruaaVszkz5L/ao83cBdNCKW96K5GoPq
	aIlueyUYxwkChF4XXUc8g5a79Ay90iySe6Bgg3mNICpvSFXYqxq7TSxFoOvWig==
Date: Thu, 17 Aug 2023 10:43:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230817104316.0ac684d0@xps-13>
In-Reply-To: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
References: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
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

Hi Justin,

justinstitt@google.com wrote on Tue, 15 Aug 2023 20:58:47 +0000:

> When building with clang 18 I see the following warning:
> |       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller=
 integer
> |               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid=
-pointer-to-enum-cast]
> |         853 |         nfc->variant =3D (enum vf610_nfc_variant)of_id->d=
ata;
>=20
> This is due to the fact that `of_id->data` is a void* while `enum
> vf610_nfc_variant` has the size of an int. This leads to truncation and
> possible data loss.

Can you please update this commit log to what Krzysztof suggested in
the "mtd: maps: fix -W<foo> warning" thread?

> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: There is likely no data loss actually occurring here due to the
> fact that `enum vf610_nfc_variant` only has a few fields which are not
> nearly large enough to cause data loss. This patch helps towards the
> goal of eventually enabling this warning.
>=20
> Also, should we use `unsigned long` here instead of `uintptr_t`? I've
> seen maintainers request both and I'm flipping a coin here.

I'm fine with uintptr_t.

Thanks,
Miqu=C3=A8l
