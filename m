Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617192;
	b=Rb+Dn3SeNaW2iogOQMdx0llhqwaGWu8p9oFDvyfPVykDaZ0QSDkvUDk6izUkIe4/xrwX
	 pDEh1+EZXn1bcaFMKb4gqTKrNLjsn0BVSZDmeC6cOEbSSyxQiaXfT+Fe3Cxa+v1WEn09l
	 1pL/LeIqhXcJyXyefGtDAn8ZncU7fVJxiEVAvzA8Lcue5MWggmo1BB31Tnox6/y9G6QlI
	 yMSm4eIBQSr6dX1ldLBTYLF4WvJo4M3JH5kUgPdpkaWHAxcMm/XOmtW4rX+SJwZ2eZmaS
	 7PGbyXsNHXEQqpwqBslqRer4YVObjtPEi7wMgxcqHnqH3uQGoH9HlEpBTtN60sMxwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617192;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JTuzeFXaJ0CrgwY+VJsh1Zrm4GF5RUj+OFjSqoSpq5M=;
	b=DfxgensHzd/l7OabPssWFaurgI+HT67/leLsQvkVa+KfRw3x4kZg1Yvsl99klZM08PFu
	 BH62Da7TiqrBoyNbXpEez0XkZtXEy+yDWv+uQzFVngR9S9QeaU0wVXcTwRTJPYvWW34F8
	 +gFcBH7EwvN1EYQO1hLbT6Pz3LyNTR0AMjHgczB7RIWNH6HAYB2rIVjdw7D8zer/83PT0
	 yqn5HjtJ1FkXb42mLjYzJBZM0PS2eVN5qp8re00rLChs8xpsuFijzI0YC7qCRwN70v5ft
	 qYpaN60gxUlbPE3LOVAqz68Q84PSoR2Lb6Pj6Vgtc3Kp1mlf3Oe4g+AtxAir6nDzfSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=F5CiVjeQ;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F1606A326
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=F5CiVjeQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1795617186; x=1795876386;
	bh=JTuzeFXaJ0CrgwY+VJsh1Zrm4GF5RUj+OFjSqoSpq5M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F5CiVjeQhxUKomP2szkCl3AxCjmzQtv8kCXXwoN1vs1eV4d1vs8dP9Kui19EugwoB
	 eQrBWS51mV/XqcTAy0Dfhv3/Br3tnt+ZGb6EwanqMtbonx6/+bMkQyoBYq1YlxqMV1
	 gFSsJST0bakzUG2SiEdX5dpx0o1b36AL/7yChSu5kP9IGOQvoKqiujybGqYImuEke2
	 EhM+SxWntECLOcC5a5OogdEdNUkhXhpiG/GHgfaaQr8AnWmtY4+NjpdrA33P3DGQro
	 WgIWWy7jTNCPC0n0U75GUI0cbSVhffJEzZTVUVAmesWJIZ5pY+DoYljmTDuuyw8EmM
	 OKZdlsj/WcsKA==
Date: Wed, 25 Nov 2026 14:32:54 +0000
To: Echo Zhang <echo.zhang@mediatek.com>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Message-ID: <20261125143248.237422bc@ben-desktop>
In-Reply-To: <20261125060037.649659-5-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com> <20261125060037.649659-5-echo.zhang@mediatek.com>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 57888eaf1331de2550f94de46d07d4368ce17893
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 14:00:09 +0800 "Echo Zhang" <echo.zhang@mediatek.com> w=
rote:

> Add the VCP transport used by MMDVFS to map AP and firmware shared
> memory, manage feature power references and send IPI commands.
>=20
> Wait for VCP readiness and handle the selected MMUP or VCP READY
> notification to initialize firmware after boot and resume. Serialize
> IPI transactions while shared memory and acknowledgment state are in
> use.

[...]

> +static void mmdvfs_get_bootmode(void)
> +{
> +=09struct device_node *np_chosen;
> +=09struct tag_bootmode {
> +=09=09u32 size;
> +=09=09u32 tag;
> +=09=09u32 bootmode;
> +=09=09u32 boottype;
> +=09} *tag;
> +
> +=09if (bootmode < UNKNOWN_BOOT)
> +=09=09return;
> +
> +=09np_chosen =3D of_find_node_by_path("/chosen");
> +=09if (!np_chosen) {
> +=09=09bootmode =3D NORMAL_BOOT;
> +=09=09return;
> +=09}
> +
> +=09tag =3D (struct tag_bootmode *)of_get_property(np_chosen, "atag,boot"=
, NULL);
> +=09of_node_put(np_chosen);
> +
> +=09if (tag)
> +=09=09bootmode =3D tag->bootmode;
> +=09else
> +=09=09bootmode =3D NORMAL_BOOT;
> +}
> +

[...]

> +static int
> +mmdvfs_vcp_send_ipi_impl(struct mmdvfs_device *mmdvfs, void *data, u32 l=
en,
> +=09=09=09 const bool vcp)
> +{
[...]
> +=09mmdvfs_get_bootmode();
> +=09if (bootmode =3D=3D RECOVERY_BOOT) {
> +=09=09mmdvfs_err(mmdvfs->dev, "IPI skipped: bootmode=3D%d\n", bootmode);
> +=09=09return -EACCES;
> +=09}
> +

Allow me to give my two cents here, even if I am a nobody :)

Android bootmodes. Whilst I do respect the reason for Android bootmodes
existing, what I do not like to see is people checking for the *Android*
bootmode in their drivers.

Android kernels these days are *modular* thanks to GKI. I *do not*
understand why people still check for bootmodes in their drivers when
there is a much better option of *not loading them* if they are not
wanted in the current bootmode.

Having your driver depend on the behaviour of one specific userspace is
terrible. And tracking it in firmware (given that this code is checking
for an "atag,boot" property presumably added by the bootloader) is even
worse.

Aside from enabling these questionable bootmode checks in the drivers,
I have no idea why the bootloader needs to get involved with putting
non-standard state / boot info inside of /chosen (i.e. that "atag,boot"
property), when Android solved this problem by using bootargs, and more
recently, bootconfig.

I will acknowledge that "just not loading modules" does get a bit more
nuanced if you bring something like udev / Android init into the mix,
but there are still better solutions to this problem: either gracefully
handling the state where the hardware isn't ready in your driver, making
your bootloader set status =3D "disabled"; on the relavent DT node, or
blocklisting the module from userspace in boot modes where it can't
work.

Inter-driver dependencies are not a good excuse either (e.g. a core
clock driver depending on some DVFS driver that is a no-op in recovery,
forcing you to load it ANYWAY, even if the bootloader doesn't start the
required firmware on recovery boot). If that is the case, then there is
some serious refactoring work to do.

First I began seeing these sorts of checks in vendor touch screen
drivers, but now it seems to be infecting SoC side drivers as well.

*Kernel* drivers should work the same regardless of what *userspace*
environment is running (with the only real exception being the absence
of firmware or explicit configurations from userspace). And in situations
where they genuinely can't work, they should not be loaded at all.

There should be no such thing as "kernel drivers designed for Android",
only "kernel drivers designed for Linux".

Best regards,
Ben Grisdale

