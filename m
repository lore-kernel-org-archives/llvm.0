Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683003C13
	for <llvm@lists.linux.dev>; Mon, 30 Jan 2023 16:24:30 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id k4so13074355vsc.4
        for <llvm@lists.linux.dev>; Mon, 30 Jan 2023 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TNjcl9ue4Yo+C3qXNF3I2IXLdPdV2VfDLb5UgrGwaNI=;
        b=WtpdVSeOyj3NqmS8x1J7iyhRv/V7ha9AnHL68DNjFluRRqNbJK88sYdxcMnhkY8t6X
         IFa4EfhuyatIkNKRKGkm9n+gDO0OX36QOSZ+tNcPWDzSffM3emrKCn8Da45DzuF8dJUT
         ZmZlwopPfGtyO1AJaR6YCWLepNYkHtk3IFMrqL8qZfnPi86PsUI6yQ0X3Z9Lf7Fdgw4B
         J6p5P3SBEf8maYUzvmVH64dIuvoot3NyC4rVF+MRJ+jiqD9lVJN7osAxX7oQ5ZEChSJX
         Fisw6C68uToeMVoQj26/eL1mp7XloiMme5kZB+/UcvnYm07/ovfa4VCRT31K7f3vvLZJ
         BrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNjcl9ue4Yo+C3qXNF3I2IXLdPdV2VfDLb5UgrGwaNI=;
        b=CLiBKnLbILj+NhO4tzhivUAWQv7Yj0enfYDjChaB5sSIdiHjqmNyYftptUTXL9HwJo
         PeRl8amXIuy5TCUGiMPU5XsLmNJMpSKnmHonqpFX0uXcYLvdONd0NF7eVxBZZe3AptFW
         AwWp2jtv2ipI9JFN4gzy4lMfk/7I6G8H4oYlRMkR4xZkbnEl/CesGiv7dYAbyeiXR38O
         SWSz2EDuOV9eim7i7m+X/hwUW9+NvdoslmpmEOtJVRT9npwfXhVBKIBHdPLdyk0YwdRX
         PWt26MICJ1KU1Pq+CVsjcGeFzPZZdIHnx/Zarp9DpEBZ+cSWGDp37Ikj1e+ZljtaktKu
         bq7Q==
X-Gm-Message-State: AFqh2kqeBtFOBFWI8bIFLMLjf88RNUaoVev3eNRmtn9s/mVLTEZmjtzm
	JSCzxVBSgyokgNzKva+/Qd2TiY/ilS0cwB//y0uwQw==
X-Google-Smtp-Source: AMrXdXvS2Xawh4TMY7nGcG42X6+jgpIxV+dRdppy1YUwAh+MSFiMtT/oSRraGGu4VgjT0QR7HOIsuVThWjRInNDG+YU=
X-Received: by 2002:a05:6102:5587:b0:3d1:2167:11ad with SMTP id
 dc7-20020a056102558700b003d1216711admr6493306vsb.2.1675095869214; Mon, 30 Jan
 2023 08:24:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com> <202301290803.ouS19eab-lkp@intel.com>
In-Reply-To: <202301290803.ouS19eab-lkp@intel.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 30 Jan 2023 11:24:18 -0500
Message-ID: <CADL8D3bxCOwXU7NJ+jvN530LQByJCMRCGrH+HrGzCxR3+imZ2Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled
 HPD status.
To: kernel test robot <lkp@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Michael Williamson <michael.williamson@criticallink.com>, Bob Duke <bduke@criticallink.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 28, 2023 at 7:47 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jonathan,
>
> Thank you for the patch! Perhaps something to improve:
Good bot.
>
> [auto build test WARNING on 93f875a8526a291005e7f38478079526c843cbec]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
> base:   93f875a8526a291005e7f38478079526c843cbec
> patch link:    https://lore.kernel.org/r/20230125-tfp410_i2c-v1-4-66a4d4e390b7%40criticallink.com
> patch subject: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled HPD status.
> config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230129/202301290803.ouS19eab-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/c4659fa4c02b62087c095ca99978e5eac8b490de
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
>         git checkout c4659fa4c02b62087c095ca99978e5eac8b490de
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/bridge/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpu/drm/bridge/ti-tfp410.c:111:6: warning: unused variable 'val' [-Wunused-variable]
>            u32 val;
>                ^
>    1 warning generated.
This has already been fixed in V2 of the patch series.
>
>
> vim +/val +111 drivers/gpu/drm/bridge/ti-tfp410.c
>
>    106
>    107  static enum drm_connector_status
>    108  tfp410_connector_detect(struct drm_connector *connector, bool force)
>    109  {
>    110          struct tfp410 *dvi = drm_connector_to_tfp410(connector);
>  > 111          u32 val;
>    112          unsigned int ret;
>    113
>    114          if (dvi->i2c) {
>    115                  ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
>    116                  if (ret < 0)
>    117                          dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
>    118                  else
>    119                          return ret ? connector_status_connected : connector_status_disconnected;
>    120          }
>    121
>    122          return drm_bridge_detect(dvi->next_bridge);
>    123  }
>    124
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
