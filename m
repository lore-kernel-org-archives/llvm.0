Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FCB28F3
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 15:18:23 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-777b1b5ff50so24296039f.3
        for <llvm@lists.linux.dev>; Thu, 08 Jun 2023 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686237502; x=1688829502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
        b=DbiGdt/oX7arO3iWcipj6bejJlBT8uppJCEgpZwaoeIw8a20LnBcuRhnAu4V80z3WR
         axKAjsS/3fS3jg4TZj6pmy1cwMtO9if6j6Xz6qiqDSQgL/JgYQv+45jJefZwuvAuImj+
         /3IDcFI/UylAC13MbTvszj0MKy07hp697fs/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686237502; x=1688829502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
        b=DdmqNGUsA7P8EUf+zf9OjTOcfkVCBBZVnozUfsXBAhnSuHIWppDweeBBrl7VOeQ6lu
         izTiRCfd8rUiTMyjgcFEbhkrHKrPnsglqYRf5UqfgngPsKExYlCgRs3JwkZCopeDB1iV
         sw4V96js/FhQX9+IccrKuR0llLyEX73j0Aj86q+pIR1OQNMbKdo9iRo63ICW3yaN9dr6
         WgOCYa4mkUQAGxsaKpJtMfcrRJj+AdT3dYki6s/K/vNWeKwgiMwODZqQGh3RgvCOOknH
         +TTRy1PI9TTeIvWj+4uL9u9b4wcDH/qDyL6yTfzz22VVmJlkXKw9RIc3LcJzn/xMWy2x
         rmmQ==
X-Gm-Message-State: AC+VfDwXGZOuOuZ+5OYoeqqWzyfZHG7N5xE/7Kh2tf14OuDNsEwJ9Huw
	Jyi8PIZ8G19UFoMkVP7iJ81psN5q8zTpHfNntRE=
X-Google-Smtp-Source: ACHHUZ5dwKgZmRPYjMR773xFgupjMjvS+B7IAXaZd/DaRK2P7Z0J8frp53s1S+SP0i7qG13OSrttTQ==
X-Received: by 2002:a6b:fd18:0:b0:76c:6c78:5144 with SMTP id c24-20020a6bfd18000000b0076c6c785144mr9919761ioi.17.1686237501975;
        Thu, 08 Jun 2023 08:18:21 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id y10-20020a5ec80a000000b0076c70f8c4d1sm420788iol.45.2023.06.08.08.18.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 08:18:21 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-33d928a268eso131235ab.0
        for <llvm@lists.linux.dev>; Thu, 08 Jun 2023 08:18:21 -0700 (PDT)
X-Received: by 2002:a92:c549:0:b0:33d:929c:af67 with SMTP id
 a9-20020a92c549000000b0033d929caf67mr120694ilj.17.1686237051541; Thu, 08 Jun
 2023 08:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <202306081419.Dzz0T4iW-lkp@intel.com>
In-Reply-To: <202306081419.Dzz0T4iW-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 08:10:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To: kernel test robot <lkp@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>, 
	linux-input@vger.kernel.org, hsinyi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 8, 2023 at 12:15=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Douglas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on hid/for-next dtor-input/next dtor-input/for-lin=
us drm-misc/drm-misc-next linus/master v6.4-rc5 next-20230607]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/d=
t-bindings-HID-i2c-hid-Add-panel-property-to-i2c-hid-backed-touchscreens/20=
230608-055515
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309c45=
5cd7e26b931c69993d4fba33bbe15%40changeid
> patch subject: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follo=
wer
> config: i386-randconfig-i003-20230607 (https://download.01.org/0day-ci/ar=
chive/20230608/202306081419.Dzz0T4iW-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add robh https://git.kernel.org/pub/scm/linux/kernel/g=
it/robh/linux.git
>         git fetch robh for-next
>         git checkout robh/for-next
>         b4 shazam https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309=
c455cd7e26b931c69993d4fba33bbe15@changeid
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306081419.Dzz0T4iW-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: drm_panel_add_follower
>    >>> referenced by i2c-hid-core.c:1159 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1159)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_pro=
be) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_panel_remove_follower
>    >>> referenced by i2c-hid-core.c:1218 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1218)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_rem=
ove) in archive vmlinux.a

Thanks for the report! Ugh, I guess I forgot that even though
DRM_PANEL is bool, it gets bundled up into all of DRM which can be a
module. Assuming that this series looks mostly the same in the next
version, I'll plan to add this:

depends on DRM || !DRM # if DRM=3Dm, this can't be 'y'

...to each of the i2c-hid subclasses.

-Doug
