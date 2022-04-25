Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFC7A
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 09:58:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nivTq-0000ya-E2; Mon, 25 Apr 2022 11:58:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nivTq-0057XY-CK; Mon, 25 Apr 2022 11:58:04 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nivTo-00057A-8s; Mon, 25 Apr 2022 11:58:04 +0200
Message-ID: <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
Subject: Re: [PATCH v17 13/21] drm/mediatek: add display merge async reset
 control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, 
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 25 Apr 2022 11:58:04 +0200
In-Reply-To: <20220416020749.29010-14-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
	 <20220416020749.29010-14-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev

On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do self
> reset on each sof signal(start of frame), so need to reset the async to
> clear the hw status for the next merge start.
>=20
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index 9dca145cfb71..177473fa8160 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -8,6 +8,7 @@
> =C2=A0#include <linux/of_device.h>
> =C2=A0#include <linux/of_irq.h>
> =C2=A0#include <linux/platform_device.h>
> +#include <linux/reset.h>
> =C2=A0#include <linux/soc/mediatek/mtk-cmdq.h>
> =C2=A0
>=20
>=20
>=20
> =C2=A0#include "mtk_drm_ddp_comp.h"
> @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
> =C2=A0	struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> =C2=A0
>=20
>=20
>=20
> =C2=A0	mtk_merge_stop_cmdq(dev, NULL);
> +
> +	if (priv->async_clk)
> +		device_reset_optional(dev);

To avoid the overhead of looking up the reset control in the device
tree every time, it would be better to request a reset control during
probe using devm_reset_control_get_optional_exclusive(). Here you'd
just call reset_control_reset().

regards
Philipp
