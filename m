Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58719BD8
	for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 19:21:45 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-345db6c12b4so5944795ab.0
        for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689880904; x=1690485704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FZ6SubRIeZ4k0ML1ha4iOHMnlI2c5uKQpXEuDc5R/0=;
        b=A6SkHKCBcEZmDKQnyiNHkX1gL/BwiwSpSj3GTHbNNeZcqEc8ndS1Q3v7BSE8XPV10i
         ZmtBYGPk/drb+NB9U66L1zbgHWNPPaTQPQgZ26Ep/cBYAixKQckkP3zA9cL7u9zSIn7V
         IJibuObOY34z01S0N3p/Z2xVvv43KhdhVzXl/C5aGmJvxvwnEUB3S5ehIhoxsSkC+k8K
         lhuZnWGHavjNrxUJ3dCaobjEG3tAsnGOCTDd5coUVzoTCnYuLe3XYAD36e0CMCpoW6o6
         VOWUOQMBZubjrZmesYyeOPDI1gUDuKopru18nKMK09Tltcszudq8Hti49Bjjh0IcnCbB
         FJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689880904; x=1690485704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FZ6SubRIeZ4k0ML1ha4iOHMnlI2c5uKQpXEuDc5R/0=;
        b=h5C6jNjG+7dPjtHuTuIKOzUJ1OQnSsNMo8zkwCx7Slem0YGK4Nj1ZgeVkuyHA08tJF
         zelyzjuCPRBenMgOon/d9288Y9sLoSPnuduvJBiKHWYm91blTcwPRs9b+Am8omZYyrMs
         aA5zuu2kg8CvAc+ha63RxJA6yRtn9PFeAKoTtNnSb3jeLVNU8QHqo6v9opdPWYEw/ZV6
         HbZLmTFbQImy9A4R87yaDI2sGP5ILnZM98D43lYMhFPYBbpvBKTbMpUYWf+HKsRiKg2W
         gCiAJs341i74jjMuniPS1q3M6xx5Upy+qcnKrxttPoV4ppePSIHMjKm3ldri8/F3aixr
         Fk+Q==
X-Gm-Message-State: ABy/qLaQTHzOm9MidOgjnj/uS7+O3SAGUscFoMoq8FKVLubAvVF9EKt6
	bnNEg0lqj5NN7IGklinQQ02WOuonKdErX4HfdWyklw==
X-Google-Smtp-Source: APBJJlGxEtg0om++OPbPp6XITjhWUGx5iJ2sJL4w7NeCt+/U0OI2O5WFKshSFtO9z9SGejOHXLmG0i0Shy9Ny97+9S0=
X-Received: by 2002:a05:6e02:12c7:b0:348:7d73:20a8 with SMTP id
 i7-20020a056e0212c700b003487d7320a8mr11306545ilm.1.1689880904399; Thu, 20 Jul
 2023 12:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307120814.vWPY6URk-lkp@intel.com>
In-Reply-To: <202307120814.vWPY6URk-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Jul 2023 21:21:33 +0200
Message-ID: <CACRpkdbYPAiOa4QU+PUxVjcOtkBT2O7fogh51VvSEbFPutH7ng@mail.gmail.com>
Subject: Re: drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused
 variable '_groups'
To: kernel test robot <lkp@intel.com>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Nitheesh Sekar <quic_nsekar@quicinc.com>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srirachan, Bjorn,

is this warning valid or something I should ignore?

Yours,
Linus Walleij

On Wed, Jul 12, 2023 at 2:32=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Sricharan,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
> commit: 725d1c8916583f9c09e5f05e5a55dd47fdca61c1 pinctrl: qcom: Add IPQ50=
18 pinctrl driver
> date:   5 weeks ago
> config: arm64-randconfig-r015-20230712 (https://download.01.org/0day-ci/a=
rchive/20230712/202307120814.vWPY6URk-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120814=
.vWPY6URk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307120814.vWPY6URk-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variabl=
e '_groups' [-Wunused-const-variable]
>    static const char * const _groups[] =3D {
>                              ^
>    1 warning generated.
>
>
> vim +/_groups +244 drivers/pinctrl/qcom/pinctrl-ipq5018.c
>
>    243
>  > 244  static const char * const _groups[] =3D {
>    245          "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gp=
io6", "gpio7",
>    246          "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13",=
 "gpio14",
>    247          "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20=
", "gpio21",
>    248          "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27=
", "gpio28",
>    249          "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34=
", "gpio35",
>    250          "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41=
", "gpio42",
>    251          "gpio43", "gpio44", "gpio45", "gpio46",
>    252  };
>    253
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
