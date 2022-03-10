Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92335A38
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 21:59:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so4244171wms.4
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ATGsKfsEtSYY26wkV1+kYw4dYxXJQNfEMLPoJWHhAhM=;
        b=l2ib4k03ezr3E+w+uSGlgSZaXyowvxEhVU+P6ySILubSAD8FmOhnXsPkzfP0JT0JQT
         nCz7H55yKli6hwWPXrpKClt0qWQokGsHGBViNX3SDqVd9Sgj5L115cMM7IOSHauaHQbl
         LEkjN/PDy2CKlM9IxPEWsp8LiG3MNg0d2M4R9C5/5zbJrbLMKFFjgayJTCXJD5izB8RX
         LY7H8i49u9b9wzRTSUOeVI4EQ24/6LJGtvAqkJz5GzADkEeb0hcHGZWyXsXPxgZFpmD6
         /ZMiJ9KwSON1RQJEwLmUKp7XAoxY67j++ehaQEr5YCkE8Nj/Utc4udnOOTYDMSef/Wsp
         TR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ATGsKfsEtSYY26wkV1+kYw4dYxXJQNfEMLPoJWHhAhM=;
        b=KEuBrg0tQajzdIq0nvG971XySrsAgpDiCQv+GF0BwzcZnub47MdLsHmBIafh3ggf6/
         bisTOAZcOeIilNVGpq+/GuVXPsfdkNryHLgrCszfPEUBglJlfsCDiSOJgboNFE9jK3IH
         YganP2qeUyUpXVcYUJ2t4lM1qmlDE8jYVl7/ouuGXtnblKaisMbJ+o+OWSnhkTSNbxk/
         FXkHURX+YBcvouooioH4yZzUgAHyZ0XqQ3HljiztGyGySYxPBj06Upr+iZ96JDJp4z7I
         F+RN0+vueNKCC2tfFCfE8hOC6tUBbK0z3/RCDmBLJ4r6xUrjpEAPFOdr9ysi386lCsYA
         cnSg==
X-Gm-Message-State: AOAM5302mW4Ihj6m7WyZRSTK/S/Dj8exnPEaft3MTuHidcJjdfKUPIRh
	oXm2l1MCAL5ymAEW3/NRlB0=
X-Google-Smtp-Source: ABdhPJyFmW0nbFLa/DkX7XyMVXKmus0uuq3D6mmfhOwRhVHwnKbgAncpyTTWuKNzBGM01KrULtLFdw==
X-Received: by 2002:a05:600c:21d1:b0:381:4fed:159a with SMTP id x17-20020a05600c21d100b003814fed159amr5265987wmj.143.1646949590579;
        Thu, 10 Mar 2022 13:59:50 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it. [93.42.71.246])
        by smtp.gmail.com with ESMTPSA id o12-20020adfa10c000000b001efb97fae48sm5378277wro.80.2022.03.10.13.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:59:50 -0800 (PST)
Date: Thu, 10 Mar 2022 22:59:49 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jonathan McDowell <noodles@earth.li>
Subject: Re: [PATCH v3 10/18] ARM: dts: qcom: add saw for l2 cache and
 kraitcc for ipq8064
Message-ID: <Yip01cebik6drIbT@Ansuel-xps.localdomain>
References: <20220309190152.7998-11-ansuelsmth@gmail.com>
 <202203101733.hkbTGp6Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203101733.hkbTGp6Y-lkp@intel.com>

On Thu, Mar 10, 2022 at 05:46:31PM +0800, kernel test robot wrote:
> Hi Ansuel,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linux/master linus/master v5.17-rc7 next-20220309]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Ansuel-Smith/Multiple-addition-to-ipq8064-dtsi/20220310-031750
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20220310/202203101733.hkbTGp6Y-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/0day-ci/linux/commit/52c3b4af226c7a50772c40012b3789b5348e49b5
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Ansuel-Smith/Multiple-addition-to-ipq8064-dtsi/20220310-031750
>         git checkout 52c3b4af226c7a50772c40012b3789b5348e49b5
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: Input tree has errors, aborting (use -f to force output)
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Just as an info this error comes from the fact that we require
pxo_board, introduced by another series already merged in linux-arm-msm.

I didn't find how to propose this series directly to the linux-arm-msm
branch.

-- 
	Ansuel
