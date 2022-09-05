Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E27E
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 12:36:33 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e17so3584738edc.5
        for <llvm@lists.linux.dev>; Mon, 05 Sep 2022 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=900qLev0HP2fBH7rq575LnJFZP9jyPqICwWUhKfzk+U=;
        b=y1JfjI3xJ3OCyS31b8gIKIU19z+rKq7VQH1FHcnAULKSopUIS4K9cwKzPg8qtXMyml
         qsXU/5UoBTYbc6ZoPeodmzhT1zCnJkv9V8R/33XqmE6eXG9SxAeuXiyU8NuJQVymb1GL
         COKJL+9MPKIN2pknhJMad3dPzYbp4DEYsu503JfjNdE1FZd5cGRakisitFmdPsWTjrHb
         JrO8uE4zj9JreLLNneTSzuuuD0OM3ojs8udWihb1BvbDs9uTsIjJnu1UMAWRiwSV+lwB
         WahO29XKp16EC676NMqm0iqWYlqk86lGVS6ckV/MQWLncJLqvIVI/yyS1+e7pXOHfa13
         RZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=900qLev0HP2fBH7rq575LnJFZP9jyPqICwWUhKfzk+U=;
        b=ch/vop8kgkJn2pgI7D93PrFnJOAJ6i/z9KzRuC/roAuaWg4yCxA9wyRxJDBR0cWY9j
         gaw1JdtwHdoKiEqgXYBWnNZOQ1HAOF4gjXfCos36grvprZWMC8mzOjqPp4J5cyqAJkMR
         zw3EV/bc4zdzh1FbQuecJRUbJjgvynTI6typJ809jimhvr6fej8AokKRdFXa8n60YmDs
         aSXQFzpUgTRATIr/ebTkTPuMFJ8/076Stx7dk28ee73uyYgPKVPENGj+nYrQ5UzKkxAY
         cIF3l8du0JtN+0TznON3hq7J0n++cjcW5fGD8v4J4TYHkVXWV9Gp/wdnKgAsEKfxalmd
         a3FA==
X-Gm-Message-State: ACgBeo2GMeaCJONGC18WDiFNkZgRUCkAbFw8OIKWAuQ944cPkDgIQukg
	BzEvFg5ftUWuPUabYt6PzSQB9aJ/xIDR1ScblDfXrw==
X-Google-Smtp-Source: AA6agR5cCLDRgOKuhd4hgd5RaH7+P8RYaBOTkQOYqiCq+Ki7426Pt4njNv60Bl748xkUzYSiDI20q8VRfWs7AkPoZm8=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr42938602edb.46.1662381392019; Mon, 05
 Sep 2022 05:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209050605.fezJUgFH-lkp@intel.com>
In-Reply-To: <202209050605.fezJUgFH-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 14:36:21 +0200
Message-ID: <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] drivers/pinctrl/freescale/pinctrl-imx.c:260:9:
 error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and
 later do not support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, linux-gpio@vger.kernel.org, 
	Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 12:25 AM kernel test robot <lkp@intel.com> wrote:


> >> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
>            .get_function_name = pinmux_generic_get_function_name,
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                 pinmux_generic_free_functions

I don't understand this at all, tried to look at it.

Francesco, do you have ideas?

Yours,
Linus Walleij
