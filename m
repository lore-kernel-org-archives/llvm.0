Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8E7C
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 13:42:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oprWd-0007cK-Ar; Tue, 01 Nov 2022 14:41:55 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oprWc-001ged-SZ; Tue, 01 Nov 2022 14:41:53 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oprWb-0009dA-48; Tue, 01 Nov 2022 14:41:53 +0100
Message-ID: <0ddbe44d4247cf888bf2d8585b7b20d21a89b9b8.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: imx-tve: Fix return type of
 imx_tve_connector_mode_valid
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,  Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 01 Nov 2022 14:41:53 +0100
In-Reply-To: <20220913205544.155106-1-nhuck@google.com>
References: <20220913205544.155106-1-nhuck@google.com>
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

On Di, 2022-09-13 at 13:55 -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
struct drm_display_mode *mode);
>=20
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>=20
> The return type of imx_tve_connector_mode_valid should be changed from
> int to enum drm_mode_status.
>=20
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
> =C2=A0drivers/gpu/drm/imx/imx-tve.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.=
c
> index 6b34fac3f73a..ab4d1c878fda 100644
> --- a/drivers/gpu/drm/imx/imx-tve.c
> +++ b/drivers/gpu/drm/imx/imx-tve.c
> @@ -218,8 +218,9 @@ static int imx_tve_connector_get_modes(struct drm_con=
nector *connector)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
>=20
> -static int imx_tve_connector_mode_valid(struct drm_connector *connector,
> -					struct drm_display_mode *mode)
> +static enum drm_mode_status
> +imx_tve_connector_mode_valid(struct drm_connector *connector,
> +			     struct drm_display_mode *mode)
> =C2=A0{
> =C2=A0	struct imx_tve *tve =3D con_to_tve(connector);
> =C2=A0	unsigned long rate;

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

and pushed to drm-misc-fixes.

regards
Philipp
