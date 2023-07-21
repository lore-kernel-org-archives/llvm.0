Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55B23BCC
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 20:27:17 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55b85b94bb0so1307920eaf.0
        for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689971237; x=1690576037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xPDzzCzi/QN7xILesfa0mVBVsGJvBpLORXGzKhvY7c=;
        b=4XmoJAYz55NB/L3U+DEUVJ9ui979+6Vz0rqBHHDkliqQXOMi6F+/ITB9aD9iN37wqO
         BgdGLtJssmT2r2CCaMdB6vTrlXmgl7CEI5eFL8Iy5qkECyULhvyVXE0OLtlJLWTWLWVe
         ujy4f/mAiGRut+DHYbvmdkcQlKKfluhe809jNINb8G6MffFgabAZ4L8IZbqwDIs/Dzml
         mrPigKZ7ueMy+J2wvjE1cevFAOpAnDkQ13SDfoATpvTQsVGhjDoy67xsuJDQ95pHpt0i
         9bZdbaLpFIDoRxE4Uk1HMABabIBI7CYqt4kN1YtFNOWaLkAec3SHAFyTZ54eD0gzUJSK
         atNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689971237; x=1690576037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xPDzzCzi/QN7xILesfa0mVBVsGJvBpLORXGzKhvY7c=;
        b=YCf+DmIGdJCHTJlys72SzYAxF1+Z8Kpdddn7d/OEDfOxGWDdhNdNbuAG9tBHXKG9DR
         p0jdpFI/040/AJ5WiJfcWgzCK0HRXFfPECSyR8V23Q2e6Idz+DG32DeDOeYHYQ5+3HQn
         N8/blpEDBF/iFLpawT6I2rshBkOwAxmJwsAP05ZiNjYUV9ch4iMqeWuCqr0a7PcTpPBw
         MH95KzOPr2OglHe+PAm3fVeiNQ1Gd775M2aOTsVTgTK0TN49i3O5QgaEjUxF3pSznVQq
         dJI9gtwKWBgGwz2WIMbUUbCVfYXELoU+TNAzjongFKFwr9n57W6S4nez7kN+yMBq+0cr
         X5Eg==
X-Gm-Message-State: ABy/qLY4+iS3YfNwI4yq+JpLvSBPolPCb+n5nB1h+dZdaUxmWja2Pysm
	hGJvHfSijCJmGD+m2EwDjTXxokFzNxrX40hFC2GDWw==
X-Google-Smtp-Source: APBJJlFV1pSwvieqS1OgnGFs6EJa3OMX3Q/AZhNSCm23Jd0179q/7NNdnOaSTeQWwXZbKc15/fFyeSnhcfBgqT1xvfc=
X-Received: by 2002:a05:6870:ac2b:b0:1ba:c3a2:fb66 with SMTP id
 kw43-20020a056870ac2b00b001bac3a2fb66mr3041987oab.5.1689971236868; Fri, 21
 Jul 2023 13:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
In-Reply-To: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 21 Jul 2023 13:27:05 -0700
Message-ID: <CAKwvOdmYC6WuapBkD+s6wYCBaUdiJxiLXwayoubTF0WCpdBoMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove the unused _groups variable build warning
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linus.walleij@linaro.org, quic_varada@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 3:13=E2=80=AFAM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:
>
> When building with clang toolchain and arm64-randconfig-r015-20230712
> kernel test robot reports the below warning.
>
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variable =
'_groups' [-Wunused-const-variable]
>    static const char * const _groups[] =3D {
>                              ^
>    1 warning generated.
>
>      static const char * const _groups[] =3D {
>              "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6=
", "gpio7",
>              "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "g=
pio14",
>              "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", =
"gpio21",
>              "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", =
"gpio28",
>              "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", =
"gpio35",
>              "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", =
"gpio42",
>              "gpio43", "gpio44", "gpio45", "gpio46",
>    };
>
> Fixing it by removing the variable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307120814.vWPY6URk-lkp@i=
ntel.com/
> Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qco=
m/pinctrl-ipq5018.c
> index ed58f75..e2951f8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> @@ -241,16 +241,6 @@ static const char * const atest_char_groups[] =3D {
>         "gpio0", "gpio1", "gpio2", "gpio3", "gpio37",
>  };
>
> -static const char * const _groups[] =3D {
> -       "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "g=
pio7",
> -       "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14=
",
> -       "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio=
21",
> -       "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio=
28",
> -       "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio=
35",
> -       "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio=
42",
> -       "gpio43", "gpio44", "gpio45", "gpio46",
> -};
> -
>  static const char * const wci_txd_groups[] =3D {
>         "gpio0", "gpio1", "gpio2", "gpio3",
>         "gpio42", "gpio43", "gpio44", "gpio45",
> --
> 2.7.4
>
>


--=20
Thanks,
~Nick Desaulniers
