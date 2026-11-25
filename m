Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595925;
	b=pF6C0f93vbMA3yz1MBRkJgJWj16eEFnxt417LMHkaXu/CqTQtmOVA2dj4GQbT+zd9kZT
	 9CvkeHNjrHgZkwiwp6i/DieXEpIWHv/DJqcLy4vE43nevkRCfDvgq4kH97v6vqnY+fGvg
	 P2BCnwdzvCl1swslc/gq70XPtlKseA7NWuw99yG20bjNeciaY/6uqKOfwEym5QbHMf7/3
	 zIbsGHuwMp9bktdusLZ9MJ7SR+1r92lQ1mvkOPf/8M0/mj57rTv1wDKi9DtmwsvA5zyBD
	 KhlEJ2EX01WXiceFdj7lY6ev9wutDW9b02o89JUbdSWKuWjKjGXjGcp4weJXsG2F1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595925;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4YzY4WJKyDUbWHVlGl0s8qGvd0UyDejmOQrF5G0LCls=;
	b=Wm7IbSgpnW5JzOUeJb0NGp39LtNBdhbMkE0boPDVY3+BQZAHJVWm2J2xH0vcLxf+wPvi
	 lpk/dIjdJZdy0HDcTYyEIYeFn2IGACh3GEWe9EAUallHskE4O2eDMgmoVrC0oAX2o0lFf
	 71nsDoF5vzwf4fQRBnfVZ00SDIq7oTzWEk5joOtSSHwzPBqVLQLNwkOIh4Oc8kBR7d0Oe
	 MvRVqUVgqCJLkj59BQ7S0w2EvWPb7l17OkUS0tBqyIF330HVavh3IKsaxdGW0WLK9wG3i
	 yxGbxkx74rdcBVk6Abh0zKTCrjtN8gaasBrT/rZ05DXgO2eOv8k42v6ba2RC77drplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=HdnA5d57;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D62606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=HdnA5d57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795595922; x=1795855122;
	bh=4YzY4WJKyDUbWHVlGl0s8qGvd0UyDejmOQrF5G0LCls=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HdnA5d576cKuFuxHoiZ4Hu7obya801qlk6sLJXM01eKQLgQOHbkFthulLKoKtONif
	 h/HGHOfe+j1HTSjWhXkKAnJ+JP+fdDm4dQGLRV5N6GcRbUF0sod8hl6Pmj+jdAIjju
	 74+14l1hl1dYw04tSZUfs0n6WId4JmAoGNNCtVdkMd5IIj5A8jqePN1dhmPmaw2lF7
	 yOiyqkZHO4c0LFUH7SAVHn0txg/uwVdnV5YfKLE7z4VBNp++seW9N5tGoW3/Lxn73t
	 Isw3hdOGJgo07yMcWZHa/fQDtf25ThJPta9wmCoSjsilHW7Pgc8suqHuG+ytKOqzic
	 3D55QOpJDolqw==
Date: Wed, 25 Nov 2026 08:38:37 +0000
To: Echo Zhang <echo.zhang@mediatek.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Message-ID: <qeucziSyhF2pTX6WmMWtCC6hbkD8BswMX4f-7Z5uWErS2OSaeHCBs9zq4xay6j24-RAdQuYERZCgItKMSJLwmbFxY_LslGm3K3mvjdqiKRI=@protonmail.com>
In-Reply-To: <20261125060037.649659-5-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com> <20261125060037.649659-5-echo.zhang@mediatek.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 96f5a9583a374cf2313c4937580c2b1a80dc05fa
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

On Wednesday, November 25th, 2026 at 8:01 AM, Echo Zhang <echo.zhang@mediat=
ek.com> wrote:

> Add the VCP transport used by MMDVFS to map AP and firmware shared
> memory, manage feature power references and send IPI commands.
>=20
> Wait for VCP readiness and handle the selected MMUP or VCP READY
> notification to initialize firmware after boot and resume. Serialize
> IPI transactions while shared memory and acknowledgment state are in
> use.
>=20
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---

...

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/medi=
atek/mmdvfs/mmdvfs-core.c
> index c32fa11557af..3388a5a3a145 100644
> --- a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
> @@ -7,22 +7,23 @@
>=20
>  #include <linux/atomic.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/kthread.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/notifier.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
>  #include <linux/sched/clock.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> -#include <linux/suspend.h>
> -#include <linux/workqueue.h>
>=20
>  #include "mmdvfs-internal.h"
> +#include "mmdvfs-up-priv.h"
>=20
>  static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs);
>  static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs);
> @@ -34,14 +35,13 @@ struct mmdvfs_device *mmdvfs_find_device_any(void)
>  {
>  =09return mmdvfs_find_device_by_version(MMDVFS_VERSION_HWCCF_DVFS_VOTER)=
;
>  }
> -EXPORT_SYMBOL_GPL(mmdvfs_find_device_any);
>=20
>  /**
>   * mmdvfs_get_version - Get MMDVFS voting mechanism type
>   *
>   * Return:
>   *   0 - No hardware voter
> - *   1 - HWCCF DVFS voter
> + *   1 - HWCCF DVFS voter (VCP IPI with MMUP SRAM)
>   */
>  u32 mmdvfs_get_version(void)
>  {
> @@ -96,7 +96,8 @@ static int mmdvfs_validate_topology(struct mmdvfs_devic=
e *mmdvfs)
>  =09=09=09return -EINVAL;
>  =09=09}
>=20
> -=09=09if (mux->freq_num =3D=3D 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
> +=09=09if (mux->freq_num =3D=3D 0 || mux->freq_num > rc->level_num ||
> +=09=09    mux->freq_num > MMDVFS_MAX_LEVELS) {
>  =09=09=09mmdvfs_err(mmdvfs->dev,
>  =09=09=09=09   "MUX %d (%s): invalid freq_num: %d\n",
>  =09=09=09=09   i, mux->name, mux->freq_num);
> @@ -112,10 +113,11 @@ static int mmdvfs_validate_topology(struct mmdvfs_d=
evice *mmdvfs)
>  =09=09=09}
>=20
>  =09=09=09if (j > 0 && mux->freq[j] <=3D mux->freq[j - 1]) {
> -=09=09=09=09mmdvfs_warn(mmdvfs->dev,
> -=09=09=09=09=09    "MUX %d (%s): freq not ascending: freq[%d]=3D%llu <=
=3D freq[%d]=3D%llu\n",
> -=09=09=09=09=09    i, mux->name, j, mux->freq[j],
> -=09=09=09=09=09    j - 1, mux->freq[j - 1]);
> +=09=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09=09   "MUX %d (%s): freq not ascending: freq[%d]=3D%llu <=3D=
 freq[%d]=3D%llu\n",
> +=09=09=09=09=09   i, mux->name, j, mux->freq[j],
> +=09=09=09=09=09   j - 1, mux->freq[j - 1]);
> +=09=09=09=09return -EINVAL;

Why this can't be in the previous patch?

...

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c b/drivers/soc/media=
tek/mmdvfs/mmdvfs-vcp.c
> new file mode 100644
> index 000000000000..fc6db1c89294
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c

...

> +/*
> + * mmdvfs_get_bootmode - Get system boot mode
> + *
> + * Query boot mode from device tree /chosen node
> + */
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

No. Please don't add your downstream code.

I'll stop here. This patch modifies too many things from the previous
one, and the series overall needs more cleanup.

Best regards,
Roman
