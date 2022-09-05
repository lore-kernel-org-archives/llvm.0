Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F64C7E
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 21:20:48 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id fy31so19233520ejc.6
        for <llvm@lists.linux.dev>; Mon, 05 Sep 2022 14:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LrFK3sv1yLWXXRop9N9W2BNtE+QQcBNo40/879n1p7g=;
        b=gVYUCaCZZZ8vc932Ks3Yj2eV4y60SOf5pUjwI29d7txH4bOCZeoKxYMlfpIrfuaAY2
         kpmxPba01Tf/B1neU76n1/vD+9GzeyVUDxVxl54VnzZFEF4kZKSNoJNIJ4FBXthxPSY6
         TyM6kROi9CPMiFdOTw/ZJnO1J4s9HQj7jEcUPBFr30IXnZ4sVvZEAt7ddGIxMBbJ5S41
         ILVXUjNEly4vSAs3PJ0DIJvMGVV2LZe6FRWJUEkMVZNNN8vr1aI+1wnMGc26LVOZ40/B
         6DeWjNmRiZr5vJi5Qwvp98VDnyMyxpZ82Vi1doQS4wvbxaNjTao43402KjtpBflc+E01
         bZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LrFK3sv1yLWXXRop9N9W2BNtE+QQcBNo40/879n1p7g=;
        b=XnYmpQ+FC90OlS/yOrUwR21t2m3Wj+rahfftCHeY1T8wBJKOPrcd7yc+6xyhFff582
         8xPQqk2XTcOISWEVk03h6Cxlzn87e8t33vQHoE5h9CLO2u2ADuTeijrJCjd8o0P5AAeZ
         lGu0B4khRdunrITEsAGmu1KaoQK6BfM1X5ysCscuvqVtWMpNWRoPMDGM261Bt4YybCBJ
         ymqc/fPYV9YldWkVqm0Gct/cH1nac5LXdHsATjGbgBmmcS6YdxM4FzZFpAcxXEyw6DJO
         Gui1YhC2LRZxv/+wbQFusmM7AgBfFgj+0sjSLolNWI5ctzT4C6tNxM2JzO62gS+MLm2g
         E99A==
X-Gm-Message-State: ACgBeo1LTJuTCYc7Vk23ogK1C6TzuZYkRrbQNMWEY2WLCiUsNqnOuMtu
	DMJmi8j/pZcSqleCJaEmmH99DHGAggwQlLKajdUtcw==
X-Google-Smtp-Source: AA6agR5JKr56AZfrz3ucB42qH+KkybOStT4MADJpu40ui59bLa2C5SluhHQ3ad8/pSUnRhcHmbrXoiuIlIJSeW15xvM=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr25646345ejk.690.1662412846354; Mon, 05
 Sep 2022 14:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209050605.fezJUgFH-lkp@intel.com> <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
 <20220905133040.GB6496@francesco-nb.int.toradex.com> <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
 <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
In-Reply-To: <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 23:20:35 +0200
Message-ID: <CACRpkdYGHMMD5ti0m9nyk6VV_sNsyptgpULPDzQcV3A9aRd5Jg@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] drivers/pinctrl/freescale/pinctrl-imx.c:260:9:
 error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and
 later do not support implicit function declarations
To: Arnd Bergmann <arnd@arndb.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 3:53 PM Arnd Bergmann <arnd@arndb.de> wrote:

> so s390 should work both with and without IOMEM here, as long
> as drivers do the usual 'depends on ARCH_MXC || COMPILE_TEST'
> dance.

Hm OK

> The only problem I see is a missing 'select GENERIC_PINMUX_FUNCTIONS'.
> There may be other drivers that have the same issue. Would it
> make sense to just always build these into the pinctrl
> subsystem?

That's the thing:
drivers/pinctrl/freescale/Kconfig:

config PINCTRL_IMX
        tristate
        depends on OF
        select GENERIC_PINCTRL_GROUPS
        select GENERIC_PINMUX_FUNCTIONS
        select GENERIC_PINCONF
        select REGMAP

So that is selected, and what we changed was e.g.:

 config PINCTRL_IMX8MM
        tristate "IMX8MM pinctrl driver"
-       depends on ARCH_MXC
+       depends on SOC_IMX8M
        select PINCTRL_IMX
        help
          Say Y here to enable the imx8mm pinctrl driver

so it selects PINCTRL_IMX and that selects GENERIC_PINMUX_FUNCTIONS.

I have a kismet warning that sometimes this selecting PINCTRL_IMX
is inconsistens since it depends on OF and apparently there are
now non-OF configs compiling it. So could the real problem be
that everything selecting PINCTRL_IMX should depend on OF
too?

Yours,
Linus Walleij
