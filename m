Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7B4C74
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 19:59:47 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-33dbbf69b3dso62425887b3.1
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9BayX2iMxBiVznh3pmeqxcevUBf/Jj6vLcyG9kQaCps=;
        b=cV5ssXt0UElh5/1P6RF9tahnjlxXLp2tbEDga11kMa5HGC5KBLt3rnMwjMmeiMun9H
         T45QWVYWiuR6Vu5CsZaHT3JOIge2pywuReHzWGW/Nbt4rUwHdO5IMWMf5qtJ+Zqhdz/5
         gJ8DwkmdKPz9TVwgppm9pTg4XCUstc5/3yJTDgKjSTqneE1y97MLZYIuz2BVXAQH/Fcx
         9V5l6UV8IBPeqicTerooyiCQUISn9hhVHU9RMdntLKw6UybH/mUfDTgWyvhAtbZ/H1SO
         EtX1/tOzc7CBFzXpZNdYkUFnkxA3kOeSsllIwjcQk1mtBgp3sRAS5sbUULf7T2HdhF2X
         QU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9BayX2iMxBiVznh3pmeqxcevUBf/Jj6vLcyG9kQaCps=;
        b=lJ4xVOVkwcp5C0w2t9qCT7pQBkn61YwUd2YCSNuGoRssS4LFSbiIS0POGlC8s9xZjG
         cqRlVh3jtC7fm9wkDcARA6IUQnOwNOaNJ+vrIefW6+hcb3WH6x2IYAx0NxefU598F3aK
         zWld6PMQh71tgennG70ho4KXwwvzkwqTr4eLQw08229JaWQFEKcmgkfcrRCjH8EnbJjA
         RwlLGtBfc9y0+GSq57gh1i8xP//7lkxjqxAiYrVEYorEkTTnr325diCJ1aY2pVOVWE7C
         UHdFy+nXOAHYtJF1cfX8E3RyXKZ9JTgccDt8FnBcnejl2bhNd3ZNJ1edMrIoYzmSyuoT
         eFJg==
X-Gm-Message-State: ACgBeo05QQyunguPb6AawHwp9zCcgMtk9c0yhE+nhosuBlTafdABG3zU
	1WjGzkoRQCIrAUWE8HKVCp7Bj+OhcLS9yUUebvHkVQ==
X-Google-Smtp-Source: AA6agR6QjZNQelPJHf+PFxzLaUy40toWppbFWoUx2wzgkG5djmH3uMyeOC1COzMdJInnfrPOMYxZ/YBk8NYTsK3V+wk=
X-Received: by 2002:a25:db4e:0:b0:696:4b8a:71d9 with SMTP id
 g75-20020a25db4e000000b006964b8a71d9mr1268717ybf.220.1661543986348; Fri, 26
 Aug 2022 12:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208221506.0Lo051G4-lkp@intel.com> <CACRpkdYoesPenQizTc6_MRZ14THBSFwyHb7oWJdR+CYYiJYYpQ@mail.gmail.com>
 <CAD=FV=Vxdoo21OQJ-Ad57-gFVcJ7biQipoJqDE2bSpLC2NxrhQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vxdoo21OQJ-Ad57-gFVcJ7biQipoJqDE2bSpLC2NxrhQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 21:59:34 +0200
Message-ID: <CACRpkdaK+8bropqoRCaEw6KH7ZKRHUwNBPtc-cOojJZt+3S+yw@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: drm_gem_fb_get_obj
To: Doug Anderson <dianders@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 5:48 PM Doug Anderson <dianders@chromium.org> wrote:

> Unfortunately, fixing the error isn't the most trivial thing in the
> world. If you just do this:
>
>  config DRM_MIPI_DBI
>         tristate
> +       select DRM_KMS_HELPER
>         depends on DRM
>
> ...then you get a circular dependency:
>
> drivers/gpu/drm/Kconfig:76:error: recursive dependency detected!
> drivers/gpu/drm/Kconfig:76:     symbol DRM_KMS_HELPER is selected by
> DRM_MIPI_DBI
> drivers/gpu/drm/Kconfig:31:     symbol DRM_MIPI_DBI is selected by
> DRM_PANEL_ILITEK_ILI9341
> drivers/gpu/drm/panel/Kconfig:165:      symbol
> DRM_PANEL_ILITEK_ILI9341 depends on DRM_KMS_HELPER
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"

It turns out Randy Dunlap had made the right fixes, and I merged them
before you got the chance to reply!

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=84dfc46594b0167e5d3736273b0e0e05365da641
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eb7de496451bd969e203f02f66585131228ba4ae

But thanks!

Yours,
Linus Walleij
