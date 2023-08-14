Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E0DDB7
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:02:14 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6459a873237so13729156d6.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692050533; x=1692655333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mwYC5y1w73XOQ+JQk9ab6pGT6BUQ0RtEcIvzv4bMiU=;
        b=dQh/oXzkAnSIrtDNcO6e5Rb9npBij+9Md2DDJpcMtgE5V8lMFH5fyRAzbjpcFej7ny
         cX6f8nkjPkuSyNj5VM+zEv3PTAUz1cC+taVXXaoZ0oS3wMR3Veesfh8jNGbx3l8U9MGF
         Dpxwc9pmNuy4v4KqYuUXV75tqbymxCExp0+zuG8YJ4erqXWQmWTUdjNvCCZkyDP0NgeY
         X0u4oa0AIVXaRRaVlJZWADjWzeknVdpAHD6sTaG8BzJoBAIcFze2JrJgFesxQULRYkzI
         smkBvJOcq9uvREbJklJeMrJQ8VEQ0TnnG2TwXZFtC2AKVNL27f2ThO/PQeAHZ9Xl9H5/
         zDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692050533; x=1692655333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mwYC5y1w73XOQ+JQk9ab6pGT6BUQ0RtEcIvzv4bMiU=;
        b=AQa1dfzMbbxhzglHpHyPzZUKbDykDOi76wLGiOKJb0/Ko11VoztmlPt4E8pAqqUufb
         j9Ss58WQ6QWezb3wHtc/WKVy+EeNLOKgM7XYV/oPWDZn5jH7lapNzmOYldPLDPbJLGiK
         b3HSn+b22cBra+IBNhZyEPNE+oCL0IOwYQowCHUn9Tw0NsFisCRedEZ3eafZfftwuekP
         urOd2OXfoWYG1r0MlSlMHxXoDgL2LpmlYwIa+pH5rlg39pTe3ds8mXDMYIHDxwSnXMp/
         y6cXY5gfFY4tqxs2f8X9q/3D+ozCw1lBFpqivEDJJIemKBmN16h972XySEWACLU48aZk
         jBiA==
X-Gm-Message-State: AOJu0YwQkKMj9ryHhdpWtYiEF2DW9wYWM2ZoDSRIWHrY8DWBwvCRuVfv
	fP2hP4DTQwrYl5AJnrEIZH8W7+3HjrjjdQ3JLWWbvQ==
X-Google-Smtp-Source: AGHT+IH6wivOZHs37QX+AYcNTOVvJhfdvZs2Fe6L0Y0X/5iqhnofg4KtZ94BhgTJQ2RzI2U8jlPbdkhVTSh/ljoySZ4=
X-Received: by 2002:a0c:f444:0:b0:647:27ee:4853 with SMTP id
 h4-20020a0cf444000000b0064727ee4853mr2741059qvm.5.1692050533527; Mon, 14 Aug
 2023 15:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Aug 2023 15:02:02 -0700
Message-ID: <CAKwvOdm5kiTho-b1yagjjCGX5-=HGKutGZR3NkDeYh5RRBHJ_A@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of aw88261_reg_update()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	llvm@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 3:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is a branch in if() clause where aw88261_reg_update() could return
> uninitialized value.  Pounted out by W=3D1 clang build:
>
>   sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uniniti=
alized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>                 if (aw_dev->prof_cur !=3D aw_dev->prof_index) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
>   sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its conditio=
n is always true
>                 if (aw_dev->prof_cur !=3D aw_dev->prof_index) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks for the patch!
I see this addressed already in -next:
https://lore.kernel.org/all/20230808125703.1611325-1-arnd@kernel.org/


>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/aw88261.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index 82923b454dd4..fddba2f2de41 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -636,7 +636,7 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
>  static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
>  {
>         struct aw_device *aw_dev =3D aw88261->aw_pa;
> -       int ret;
> +       int ret =3D 0;
>
>         if (force) {
>                 ret =3D regmap_write(aw_dev->regmap,
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
