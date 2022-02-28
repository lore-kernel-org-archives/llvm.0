Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521007C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 14:44:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id g6-20020a9d6486000000b005acf9a0b644so9634362otl.12
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 06:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OL1oYRALM1tU0+ck2GbF2CLS3TSRjG8HptZtWVZs1vg=;
        b=qUiMNtZTCv5HCAIbbv5dCslfJj7CzJUzCym9vd2xSvDIK2mPdGfCHD1VWW7OtU2iZO
         7H6qSBQZiK127V1YY/cud6IpFVtd0WwPOw6C8paop1IIydLVUCCvq5WbA5B3fx9RXP5K
         1pYsDesBNlgbHF/Pw5Kmge9F/DChRYHQ+4A0mDTLGdHDx0C2UiF95nn2RIZjlvQSIvnv
         kUHJlfcsEasPtCsFVIRz2BZKNeCo+8+RsLyag5G/RJ7C5CumX1qoZ6F8kZevJvFOS7Kg
         HKHj0q+jvQ5QvifGZzrM0jKvMIh0qn6IFbv5uz2FlbmpbBi/bekw9gt5m4AT3ZI38d5+
         KykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OL1oYRALM1tU0+ck2GbF2CLS3TSRjG8HptZtWVZs1vg=;
        b=EcSEtcfCj+WzyqJzq5fM/HeYDr0bNkz1D+oPQS1ORs+5C3Sa5z2UDMqMnd8XqGnBME
         FMrNTraZKXYK1gdbKL1lz0zsLviR9VN/AgC60sF8J4SBGa4p51iz+VU6o5wU593I6DHV
         LKICkDZw879yHOgH9082Q3ejiO9LJ38XHG852QsLQTLWc0Ztv+00QXKOwKIAM5CJS+ir
         Z9+NgeMcJOzA9SgpYRxXYcrysI9r+tBVFIKePxeDQYXBlIN58gVT4zTd4AV3R49b54AS
         GX7i1+CzYgT1jKAb+xbNcc8vbHPYSP1V10meMZfAhZNtZN73SXOOdMTjRULO8y1UZjdc
         P5BQ==
X-Gm-Message-State: AOAM533iBi1Njf7DS7i9vxHd5D4a310cxluchxWywlm28PB/IHz9XjkV
	Z/+Eww70nRcchyj2MNBgrsywj1EWWqlQ0wdkzWBjVg==
X-Google-Smtp-Source: ABdhPJwIxxGDlahWJ4MmXDsiIS/mYt9bXQiZeWXnDp2ulHdmvAk7LFambAI2X+SdjS9LhxVJh1gzw8xOxhBRfQzM9bg=
X-Received: by 2002:a05:6830:55d:b0:5ac:ebf8:6d95 with SMTP id
 l29-20020a056830055d00b005acebf86d95mr9453248otb.162.1646059484269; Mon, 28
 Feb 2022 06:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220120082803.15535-1-bhupesh.sharma@linaro.org> <202201220442.bMRI74m1-lkp@intel.com>
In-Reply-To: <202201220442.bMRI74m1-lkp@intel.com>
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Mon, 28 Feb 2022 20:14:33 +0530
Message-ID: <CAH=2Ntx1jcWQFKCjyEqipEzK-8C6AGb5gULjhBeMotmUpHSnyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add ufs power-domain entries
To: kernel test robot <lkp@intel.com>
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, bhupesh.linux@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, 
	bjorn.andersson@linaro.org, agross@kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 22 Jan 2022 at 02:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bhupesh,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v5.16 next-20220121]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Bhupesh-Sharma/arm64-dts-qcom-sm8150-Add-ufs-power-domain-entries/20220120-162925
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm64-randconfig-r011-20220120 (https://download.01.org/0day-ci/archive/20220122/202201220442.bMRI74m1-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/e9cea3a4d3c4706f9cef18f55b07d3bc389a051a
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bhupesh-Sharma/arm64-dts-qcom-sm8150-Add-ufs-power-domain-entries/20220120-162925
>         git checkout e9cea3a4d3c4706f9cef18f55b07d3bc389a051a
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> Error: arch/arm64/boot/dts/qcom/sm8150.dtsi:1641.26-27 syntax error
>    FATAL ERROR: Unable to parse input tree

Ack.
Sending out the v2 shortly - which fixes this issue.

Regards,
Bhupesh
