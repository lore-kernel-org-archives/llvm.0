Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFA23AE
	for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 21:19:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d82so2046817pfd.11
        for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1XuZDapnjW9x4Ghmr7KHURBx8GumvQG8SWx8tKBnug=;
        b=kDPBXCPtqAzPt9K2Cxdc7BpsZhYbJlVuULaLsYtgogy/zPL0zbqKUzqoLew6ss4gWZ
         2f/55pQ4Z2AAkb+Q7NjIrH0Kjsu9W/DBE1ZT0PEuZsqIOF+tu1xfeFCGgme+V4v8XAKd
         mWj+bUQaGKxlnzFCd6o+L/66VjB853amOw9bj9zHynKJNznntVq4MApMQQwqQhGhDbZ1
         VkzzQ15IQG327I3FWcP27kBuYjyQ55BEl6gf07f8fxLnRx6lCl9aO2JGJbomtm8e9mqf
         XwSNcEf8OHUzGnDmds2ge2jfE5gLwmFGa3s7SUauOsT3gzwDB7o+swHik5F9Tm8gBXut
         qlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1XuZDapnjW9x4Ghmr7KHURBx8GumvQG8SWx8tKBnug=;
        b=2PKV6kXaSp06jjhe9+v/XV7TF3w89IBDhNGbYHCqPKmrLM7Qm446RhoP2vb2FXhbza
         b1G6h1acRNvt2OuHiqDPDxGf5YjNKfc5x5b79wqIsEosaw7OB6n/gTAmejiBkkLRSUeY
         1zqLnJceqcnAjB90A0EGQZzWmvJy+e3GP9am3L+1eAdnFN63iO5CFHKKFTCSYd9aBrTL
         dJqsg8ESQOV1kQ6k/FAInPLD0BkFgEIDEssJDJTt4ZKngm70ltuMtts3eW7sM55GN1PG
         LhPJwVwzbK3R5PKXpD5YMdPSLxlKFaQ0VG0MqXLZYGRvEpb47YjSQTQtGtjQxR7NEF0T
         UhNw==
X-Gm-Message-State: AFqh2ko6nvFZhwifhx2jd4f1wYkvgOu2Qd5MGuzDc78ie1WBRE0o7r+s
	kXeHU+7YIrFM4sGsQuFAqle6Nb4KyUJ8aL2SD0TfUw==
X-Google-Smtp-Source: AMrXdXtTlZFbTsfe2pzy5yWcHLwYYlm3Z+chhRbUSUK6FyW470BH2knm3VuEKbn8szORGY8WSwjcfke9zV3jvLgb7MI=
X-Received: by 2002:a63:131d:0:b0:492:703:3f03 with SMTP id
 i29-20020a63131d000000b0049207033f03mr551755pgl.403.1671743949272; Thu, 22
 Dec 2022 13:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212230026.gBHQvZbI-lkp@intel.com> <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
In-Reply-To: <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Dec 2022 13:18:58 -0800
Message-ID: <CAKwvOdmzEn27Un5ayucWcT6W0JddS6Tgg-Z3D4d_3sBqjSs=DA@mail.gmail.com>
Subject: Re: [hid:for-6.3/hid-sensor 2/4] drivers/hid/hid-sensor-custom.c:960:12:
 warning: stack frame size (1104) exceeds limit (1024) in 'hid_sensor_custom_probe'
To: Philipp Jungkamp <p.jungkamp@gmx.net>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 22, 2022 at 1:16 PM Philipp Jungkamp <p.jungkamp@gmx.net> wrote:
>
> Hello,
>
> does this mean the problem lies in 'hid_sensor_custom_probe' itself or
> could this also be caused by local variables in nested functions.
>
> I suspect the problem lies in 'hid_sensor_custom_get_known' where I put
> an instance of 'struct hid_sensor_custom_properties' on the stack.
>
> This struct is way too large (I didn't know there was a upper stack
> limit of 1024). It's current size is sizeof(u16) * 3 *
> HID_CUSTOM_MAX_FEATURE_BYTES = 384.
>
> Would allocating it for the scope of 'hid_sensor_custom_get_known' make
> sense?

Yes.

>
> Which kind of kernel allocation functions should I use here?

kmalloc, kcalloc? GFP_KERNEL

>
> Regards,
> Philipp Jungkamp
>
> On Fri, 2022-12-23 at 01:07 +0800, kernel test robot wrote:
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-
> > 6.3/hid-sensor
> > head:   c8aca355bdd56e5dad55897cc419ea5d3e4c0e58
> > commit: 48c79bb0abc0429751c0de6616224f8e4aa891cf [2/4] HID: hid-
> > sensor-custom: Add LISS custom sensors
> > config: i386-allyesconfig
> > compiler: clang version 14.0.6
> > (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e3
> > 7457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> >  -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         #
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=48c79bb0abc0429751c0de6616224f8e4aa891cf
> >         git remote add hid
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> >         git fetch --no-tags hid for-6.3/hid-sensor
> >         git checkout 48c79bb0abc0429751c0de6616224f8e4aa891cf
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=i386 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/
> > drivers/net/wireless/mediatek/mt76/mt7915/ drivers/video/backlight/
> >
> > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > > > drivers/hid/hid-sensor-custom.c:960:12: warning: stack frame size
> > > > (1104) exceeds limit (1024) in 'hid_sensor_custom_probe' [-
> > > > Wframe-larger-than]
> >    static int hid_sensor_custom_probe(struct platform_device *pdev)
> >               ^
> >    1 warning generated.
> >
> >
> > vim +/hid_sensor_custom_probe +960 drivers/hid/hid-sensor-custom.c
> >
> > 239319670e2a7c Ye Xiang            2020-12-15   959
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  @960  static int
> > hid_sensor_custom_probe(struct platform_device *pdev)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   961  {
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   962     struct
> > hid_sensor_custom *sensor_inst;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   963     struct
> > hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   964     int ret;
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   965     const struct
> > hid_sensor_custom_match *match;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   966
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   967     sensor_inst =
> > devm_kzalloc(&pdev->dev, sizeof(*sensor_inst),
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 968                                GFP_KERNEL);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   969     if
> > (!sensor_inst)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 970             return -ENOMEM;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   971
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   972     sensor_inst-
> > >callbacks.capture_sample = hid_sensor_capture_sample;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   973     sensor_inst-
> > >callbacks.send_event = hid_sensor_send_event;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   974     sensor_inst-
> > >callbacks.pdev = pdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   975     sensor_inst-
> > >hsdev = hsdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   976     sensor_inst-
> > >pdev = pdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 977     mutex_init(&sensor_inst->mutex);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 978     platform_set_drvdata(pdev, sensor_inst);
> > 239319670e2a7c Ye Xiang            2020-12-15   979
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   980     ret =
> > hid_sensor_custom_get_known(hsdev, &match);
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   981     if (!ret) {
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 982             sensor_inst->custom_pdev =
> > 98c062e8245199 Philipp Jungkamp    2022-11-25
> > 983                     hid_sensor_register_platform_device(pdev,
> > hsdev, match);
> > 239319670e2a7c Ye Xiang            2020-12-15   984
> > 239319670e2a7c Ye Xiang            2020-12-15   985             ret =
> > PTR_ERR_OR_ZERO(sensor_inst->custom_pdev);
> > 239319670e2a7c Ye Xiang            2020-12-15   986             if
> > (ret) {
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 987                     dev_err(&pdev->dev,
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 988                             "register_platform_device failed\n");
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 989                     return ret;
> > 239319670e2a7c Ye Xiang            2020-12-15   990             }
> > 239319670e2a7c Ye Xiang            2020-12-15   991
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 992             return 0;
> > 239319670e2a7c Ye Xiang            2020-12-15   993     }
> > 239319670e2a7c Ye Xiang            2020-12-15   994
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   995     ret =
> > sensor_hub_register_callback(hsdev, hsdev->usage,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 996                                        &sensor_inst->callbacks);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   997     if (ret < 0)
> > {
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 998             dev_err(&pdev->dev, "callback reg failed\n");
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 999             return ret;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1000     }
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1001
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1002     ret =
> > sysfs_create_group(&sensor_inst->pdev->dev.kobj,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1003                              &enable_sensor_attr_group);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1004     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1005             goto
> > err_remove_callback;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1006
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1007     ret =
> > hid_sensor_custom_add_attributes(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1008     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1009             goto
> > err_remove_group;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1010
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1011     ret =
> > hid_sensor_custom_dev_if_add(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1012     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1013             goto
> > err_remove_attributes;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1014
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1015     return 0;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1016
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1017
> > err_remove_attributes:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1018     hid_sensor_custom_remove_attributes(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1019
> > err_remove_group:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1020     sysfs_remove_group(&sensor_inst->pdev->dev.kobj,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1021                        &enable_sensor_attr_group);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1022
> > err_remove_callback:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1023     sensor_hub_remove_callback(hsdev, hsdev->usage);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1024
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1025     return ret;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1026  }
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1027
> >
> > :::::: The code at line 960 was first introduced by commit
> > :::::: 4a7de0519df5e8fb89cef6ee062330ffe4b50a4d HID: sensor: Custom
> > and Generic sensor support
> >
> > :::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > :::::: CC: Jiri Kosina <jkosina@suse.cz>
> >
>


-- 
Thanks,
~Nick Desaulniers
