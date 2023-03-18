Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2900EDC
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 14:49:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdXa6-0000Li-1H; Sat, 18 Mar 2023 15:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdXa3-0051TQ-TX; Sat, 18 Mar 2023 15:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdXa3-005thE-2m; Sat, 18 Mar 2023 15:30:47 +0100
Date: Sat, 18 Mar 2023 15:30:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tom Rix <trix@redhat.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, nathan@kernel.org, ndesaulniers@google.com,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: imx: remove unused imx_uart_is_imx* functions
Message-ID: <20230318143041.n6rymackf6p776rq@pengutronix.de>
References: <20230317205710.1672232-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nda7clsxlnhkzioz"
Content-Disposition: inline
In-Reply-To: <20230317205710.1672232-1-trix@redhat.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--nda7clsxlnhkzioz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 04:57:10PM -0400, Tom Rix wrote:
> clang with W=3D1 reports
> drivers/tty/serial/imx.c:292:19: error:
>   unused function 'imx_uart_is_imx21' [-Werror,-Wunused-function]
> static inline int imx_uart_is_imx21(struct imx_port *sport)
>                   ^
> drivers/tty/serial/imx.c:297:19: error:
>   unused function 'imx_uart_is_imx53' [-Werror,-Wunused-function]
> static inline int imx_uart_is_imx53(struct imx_port *sport)
>                   ^
> drivers/tty/serial/imx.c:302:19: error:
>   unused function 'imx_uart_is_imx6q' [-Werror,-Wunused-function]
> static inline int imx_uart_is_imx6q(struct imx_port *sport)
>                   ^
> These static functions are not used, so remove them.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>

Funny, is_imx6q_uart() was introduced in
a496e6284c482555db8078190bb689594d129fa9 and never used. Since that
commit is_imx21_uart() also unused. And the imx53 variant was also never
used.

Looking at that a bit more, the following cleanup is also possible (only
compile tested):

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 8308a23c55a7..a38ee0ed2210 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -178,8 +178,6 @@
 enum imx_uart_type {
 	IMX1_UART,
 	IMX21_UART,
-	IMX53_UART,
-	IMX6Q_UART,
 };
=20
 /* device type dependent stuff */
@@ -241,30 +239,21 @@ struct imx_port_ucrs {
 	unsigned int	ucr3;
 };
=20
-static struct imx_uart_data imx_uart_devdata[] =3D {
-	[IMX1_UART] =3D {
-		.uts_reg =3D IMX1_UTS,
-		.devtype =3D IMX1_UART,
-	},
-	[IMX21_UART] =3D {
-		.uts_reg =3D IMX21_UTS,
-		.devtype =3D IMX21_UART,
-	},
-	[IMX53_UART] =3D {
-		.uts_reg =3D IMX21_UTS,
-		.devtype =3D IMX53_UART,
-	},
-	[IMX6Q_UART] =3D {
-		.uts_reg =3D IMX21_UTS,
-		.devtype =3D IMX6Q_UART,
-	},
+static const struct imx_uart_data imx_uart_imx1_devdata =3D {
+	.uts_reg =3D IMX1_UTS,
+	.devtype =3D IMX1_UART,
+};
+
+static const struct imx_uart_data imx_uart_imx21_devdata =3D {
+	.uts_reg =3D IMX21_UTS,
+	.devtype =3D IMX21_UART,
 };
=20
 static const struct of_device_id imx_uart_dt_ids[] =3D {
-	{ .compatible =3D "fsl,imx6q-uart", .data =3D &imx_uart_devdata[IMX6Q_UAR=
T], },
-	{ .compatible =3D "fsl,imx53-uart", .data =3D &imx_uart_devdata[IMX53_UAR=
T], },
-	{ .compatible =3D "fsl,imx1-uart", .data =3D &imx_uart_devdata[IMX1_UART]=
, },
-	{ .compatible =3D "fsl,imx21-uart", .data =3D &imx_uart_devdata[IMX21_UAR=
T], },
+	{ .compatible =3D "fsl,imx6q-uart", .data =3D &imx_uart_imx21_devdata, },
+	{ .compatible =3D "fsl,imx53-uart", .data =3D &imx_uart_imx21_devdata, },
+	{ .compatible =3D "fsl,imx1-uart", .data =3D &imx_uart_imx1_devdata, },
+	{ .compatible =3D "fsl,imx21-uart", .data =3D &imx_uart_imx21_devdata, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_uart_dt_ids);

If you feel like squashing that into your commit or put it into a
separate commit with a nice commit log (after convincing yourself that
the change is fine), feel free to do so.

If you don't:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nda7clsxlnhkzioz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQVywUACgkQj4D7WH0S
/k7Ivgf8CqZoIR6dodHsIoOkq2Ry2yHVlphhFQqAPbMfm2XigGZChWQAtPdXHfjN
cY/cjTOL8tG4PfggMmMKlc+NKawrhNamIRAyEEZEgI12iiLWsQBPcvPFZeXEq/0H
cGOl1fHMoxGDznajEdiGJpFEsBTTS9L2MH23F04btZpR4rZZR9aX9yOsktBhXy1Z
eaQOn7IaAY1fKeoaactX5N6ii4vJIOsiRVvNfyXePeOfg//FpDJdsFMmYS5qzjR7
TE0mAe8xU7l/JgA0AtiYwGDzN6mpGh46g47CKMHjPf8PnWXWPegGWgL00TkL7t64
1R3S34r1I6TZ+eIsCwM3EKY7JNiQCg==
=mOyR
-----END PGP SIGNATURE-----

--nda7clsxlnhkzioz--
