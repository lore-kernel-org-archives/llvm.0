Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368B3208
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 21:01:15 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id v65so4133818oig.10
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Liqad/zEjO4owGRvsF06yHturrZoCWiadtMW9YDcK7c=;
        b=ZqfBOUlvhs6OKpanNWcJHJd8Ui2ebmZ56D/ffy3DR05BcxnHuF8MUze2jfyF76+1PO
         w+EOxIOnno5zi8LdsZOqAv4uHy5zULFOpBzfiYPF+khaq2NEp0/xwgLX0VDEMmyTCk2D
         cxCT/tL5T6qKRRM7Bzg/OJl2yaaBvLQXt5/eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Liqad/zEjO4owGRvsF06yHturrZoCWiadtMW9YDcK7c=;
        b=xWwgkaLsTfxHM+inv0fl/f8gzz+pybm84r2J8x8EKM670kOtS11BIVtQ+oAG7YXbiD
         zj/lkslSkpyfbp6MacRjjsmtTZJbK9SSQbAItmuaCfnWb416RTyTbUh5FKd3an9ntv9t
         gGk3FdG2KhdZBQmCYAni+PeGiYcffwlg7Hmkt7tLgw3Y6l4pZgUP3cVCprsf0kOzLZd3
         SuSZ4J1+xAn/o1uyGeCal3qgPZt+F31dsu4SkJiDxTDyhBHO6uAaSjPv1053fS4uNus1
         Z2Xd2lEmC/yd7Xt5AWRCcvUSFG9A0Zxgubn2+95ttmDrxkRy38W9dkEICZm60C4VUItk
         FFkA==
X-Gm-Message-State: AOAM532hOGoNsYMa/rwr1W1oGt4EeJOWHzRJOJauOXBd2tIwTstrahYu
	XDVN1yosOSboQfWYDGua1V0cEFDNRxWUiw==
X-Google-Smtp-Source: ABdhPJy7M12ZbEBg/K5yd8IZfz5mzHj/cKw792pj0qt2zFZICczEjejnQwFaNO8h5rAJFUkc+/EVuQ==
X-Received: by 2002:aca:3854:0:b0:325:137:453 with SMTP id f81-20020aca3854000000b0032501370453mr3419552oia.178.1652302874254;
        Wed, 11 May 2022 14:01:14 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id z18-20020a056808065200b00325cda1ffacsm1111249oih.43.2022.05.11.14.01.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 14:01:13 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id z15-20020a9d65cf000000b00605f064482cso1315696oth.6
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 14:01:13 -0700 (PDT)
X-Received: by 2002:a9d:22e9:0:b0:605:d008:c1d7 with SMTP id
 y96-20020a9d22e9000000b00605d008c1d7mr1549783ota.186.1652302872756; Wed, 11
 May 2022 14:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205120335.LzAksOZI-lkp@intel.com>
In-Reply-To: <202205120335.LzAksOZI-lkp@intel.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 11 May 2022 14:01:01 -0700
X-Gmail-Original-Message-ID: <CA+ASDXO1JDKf-vBB0gWdYKD9vMMoMXYRL2E42HJtnbOvMP7jPA@mail.gmail.com>
Message-ID: <CA+ASDXO1JDKf-vBB0gWdYKD9vMMoMXYRL2E42HJtnbOvMP7jPA@mail.gmail.com>
Subject: Re: [linux-next:master 9518/11094] ERROR: modpost:
 "rockchip_pmu_unblock" [drivers/devfreq/rk3399_dmc.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 12:53 PM kernel test robot <lkp@intel.com> wrote:
> Note: the linux-next/master HEAD 6107040c99d5dfc920721c198d45ed2d639b113a builds fine.
>       It may have been fixed somewhere.

Indeed, I think it has been. That's what this was for:

add9f6f30e54 soc: rockchip: Fix compile-testing SoC drivers
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v5.19-armsoc/drivers&id=add9f6f30e54b5c07e7a0260cda459ef1d9646b7

I discovered it in parallel to this submission, so they weren't queued
together as preparation or Fixes.

Brian

> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "rockchip_pmu_unblock" [drivers/devfreq/rk3399_dmc.ko] undefined!
> >> ERROR: modpost: "rockchip_pmu_block" [drivers/devfreq/rk3399_dmc.ko] undefined!
