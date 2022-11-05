Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57B7C
	for <llvm@lists.linux.dev>; Sat,  5 Nov 2022 12:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1667651877; bh=GtMx5VstEy61vrzIUASE+KC+AT3zTaHsHrHD2w3tP/k=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HucCY67VaIu0on7RDF1CjxBYyZ5K4fOsh1jre9HaWPUEGCFupceKfrvOaTKUnvi9v
	 VfhwgyUFrP2mruGMF6aFK2TvlJgMm5RmhG88WnWKrMNaqpnJh2bc19cLChHFSWxS9W
	 WlnsAxtVEV6/CsCWlwQevZ/Ycj/r0vfSQkARp26M=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via proxy.mailoo.org [213.182.55.207]
	Sat,  5 Nov 2022 13:37:57 +0100 (CET)
X-EA-Auth: UMfo2Qe/JnqzwN5ERAoWxYpcmCoJbQswsmnrVgTU93l0comRXwpP3OSZeJ6Ema/mzBFBynJuA581D2XsSp12iwPkcKsCi/xeqW5+fQUaf6A=
Message-ID: <5f1a31ba4a53f8461bad7747ae09e73fcfe0af1c.camel@mailoo.org>
Subject: Re: [PATCH v1 1/1] leds: is31fl319x: Wrap mutex_destroy() for
 devm_add_action_or_rest()
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pavel Machek
	 <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, kernel test robot
	 <lkp@intel.com>
Date: Sat, 05 Nov 2022 13:37:55 +0100
In-Reply-To: <20221104235940.74044-1-andriy.shevchenko@linux.intel.com>
References: <20221104235940.74044-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le samedi 05 novembre 2022 =C3=A0 01:59 +0200, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> Clang complains that devm_add_action() takes a parameter with a wrong typ=
e:
>=20
> warning: cast from 'void (*)(struct mutex *)' to 'void (*)(void *)' conve=
rts to incompatible function type [-Wcast-
> function-type-strict]
> =C2=A0=C2=A0=C2=A0 err =3D devm_add_action(dev, (void (*)(void *))mutex_d=
estroy, &is31->lock);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0=C2=A0 1 warning generated.
>=20
> It appears that the commit e1af5c815586 ("leds: is31fl319x: Fix devm vs.
> non-devm ordering") missed two things:
> - while mention devm_add_action_or_reset() the actual change got
> =C2=A0 devm_add_action() call by unknown reason
> - strictly speaking the parameter is not compatible by type
>=20
> Fix both issues by switching to devm_add_action_or_reset() and adding a
> wrapper for mutex_destroy() call.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e1af5c815586 ("leds: is31fl319x: Fix devm vs. non-devm ordering")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0drivers/leds/leds-is31fl319x.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319=
x.c
> index 52b59b62f437..6f94ad83e066 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -494,6 +494,11 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return dezibel / IS31FL31=
96_AUDIO_GAIN_DB_STEP;
> =C2=A0}
> =C2=A0
> +static void is31f1319x_mutex_destroy(void *lock)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_destroy(lock);
> +}
> +
> =C2=A0static int is31fl319x_probe(struct i2c_client *client)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct is31fl319x_chip *i=
s31;
> @@ -510,7 +515,7 @@ static int is31fl319x_probe(struct i2c_client *client=
)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&is31->lock);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D devm_add_action(dev, (=
void (*)(void *))mutex_destroy, &is31->lock);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D devm_add_action_or_res=
et(dev, is31f1319x_mutex_destroy, &is31->lock);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return err;
> =C2=A0

LED still works fine after applying this patch,
also after rmmod'ing and modprobe'ing again.
Please let me know if something else should be tested.
Thank you !

Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>


