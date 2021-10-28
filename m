Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5B2C82
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 06:32:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mfyy1-00078i-7l; Thu, 28 Oct 2021 08:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mfyxy-0001q6-J6; Thu, 28 Oct 2021 08:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mfyxy-000331-Ht; Thu, 28 Oct 2021 08:32:46 +0200
Date: Thu, 28 Oct 2021 08:32:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	thierry.reding@gmail.com, lkp@intel.com, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2] backlight: lp855x: Switch to atomic PWM API
Message-ID: <20211028063246.p5mvij3653wg7nm4@pengutronix.de>
References: <YXmeVPIroq96BXfm@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjgubidvytdfc23f"
Content-Disposition: inline
In-Reply-To: <YXmeVPIroq96BXfm@fedora>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--mjgubidvytdfc23f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:45:40PM -0300, Ma=EDra Canal wrote:
> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
>=20
> Signed-off-by: Ma=EDra Canal <maira.canal@usp.br>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> V1 -> V2: Initializing variable and simplyfing conditional loop
> ---
>  drivers/video/backlight/lp855x_bl.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backligh=
t/lp855x_bl.c
> index e94932c69f54..a895a8ca6d26 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
> =20
>  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  {
> -	unsigned int period =3D lp->pdata->period_ns;
> -	unsigned int duty =3D br * period / max_br;
> -	struct pwm_device *pwm;
> +	struct pwm_device *pwm =3D NULL;
> +	struct pwm_state state;
> =20
>  	/* request pwm device with the consumer name */
>  	if (!lp->pwm) {
> @@ -244,19 +243,15 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int =
br, int max_br)
>  			return;
> =20
>  		lp->pwm =3D pwm;
> -
> -		/*
> -		 * FIXME: pwm_apply_args() should be removed when switching to
> -		 * the atomic PWM API.
> -		 */
> -		pwm_apply_args(pwm);
>  	}
> =20
> -	pwm_config(lp->pwm, duty, period);
> -	if (duty)
> -		pwm_enable(lp->pwm);
> -	else
> -		pwm_disable(lp->pwm);
> +	pwm_init_state(pwm, &state);

This is broken. If lp->pwm is already set at function entry, pwm is
NULL.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mjgubidvytdfc23f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmF6RAoACgkQwfwUeK3K
7Anebgf9HGhfhTpcJqWOKkxvlVftY0zDg637KqLVbPRkC58by+y66DVocHuCj+jp
TrtP5OyEmMYYdvSK1LA6lFuDjxje3mHlACG8TwZWrDyoWGkTtqP1o4dsuQ6QAJMk
1qea6fyvPF9dKhlsHYKd8z3/Z7dDGoPTCY6fZlYhYMTsJtBJhCMdCgHyte+vvi0f
AOiXy6xo6p2qLwUz3U+Pp13eu3Xjbw2CDr1XVxuSc+0qjvSPg3Xc6RQyi7nEscmA
MDJCRq6bRkC5BF00b1D2Fxdz/dQvlJlCbIl4PA8lcmdLOQJLgvlXGHGvPIKOWhVr
AfP46DAQVB192zi4YO2uegiRV45P2Q==
=obWM
-----END PGP SIGNATURE-----

--mjgubidvytdfc23f--
