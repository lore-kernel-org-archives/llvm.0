Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C407B
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 08:23:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z13so866858wro.13
        for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 01:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7X5K+T96rgSLK+mmlpazkDAcgZDkSBonVuWx17I6Ccs=;
        b=GS6mdKSR+0quKUj2eMDDfKMGPE7Zjk0K17G06W1Ntrdyfk3RlU4AhDP+uHHxe9pUgL
         58J5pzIrTtauQMY0zG1PBGWBWqkrxvaRcb/+QoyV+LUXJgE0Uq3fsnza/QxzOpn3jxs2
         PC2vzHkMsv2dqykdHF8povbTS5Y3m191LLyTYWLHM0x6H4rN377uusmnbpxhOFetMMBI
         L03l1KxQS0wPGmCl920Z2G6F/pTd6dAVnkP0i/26TvrZBzYLCFmy8BYLQp3L1WPdhMKu
         kwcitFd3PU797obVaa5hUtBH8KqpSQHRfo4ak/U6dC1szzaVTDY6OSxIs+Hx/YmTVdYR
         tuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7X5K+T96rgSLK+mmlpazkDAcgZDkSBonVuWx17I6Ccs=;
        b=8G0K+emG8reVC34A0h6OK/kpd+XDPDc68vyInSves0iiYq8oKPtZCwowlXhsd/Vg3J
         NB34R0TygPAckT7GFpXPPHISQQB8FFl7pvIfc4LD7ViJHVYyGBs1+/ASDsLBFZO9yd3z
         LUFmhyirjmA9WyRK7LAPrcOl2GHMma68cKDydIXdFEMCDjm15mTneVHcq91Lb3hU+yWw
         1OneURNx/siDmbaAZYscC3eWEK6FyCB8QILiOz4qzDpSdu0Ux7/7gEhK1EQ0lXwPykrr
         gtSEWKRQJVxFU2qcPauopQ2X+RK9DgR0wnOTNzmWwDXfoQNAhfcHJhG1IY68SiLu1mGY
         htPg==
X-Gm-Message-State: AJIora+qRzPK8G9USWPCXI6R2ZCJesKa1lTNooZZnOkPd2j+2dP9Iq5R
	Kvp+xYJY+JtWZMGvyVpfSBnXlg==
X-Google-Smtp-Source: AGRyM1u/plpK1QG/6ku/2AHzx3R5eooXs8S9LoGQjeatM4xGBQxHEg31xEiiryvp3CfYxfsIpbw2/w==
X-Received: by 2002:a5d:64ed:0:b0:21d:af70:3515 with SMTP id g13-20020a5d64ed000000b0021daf703515mr24764295wri.101.1658219001830;
        Tue, 19 Jul 2022 01:23:21 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id p26-20020a1c545a000000b0039c454067ddsm19117712wmi.15.2022.07.19.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 01:23:21 -0700 (PDT)
Message-ID: <b4202dde-eb28-2ffd-1cdf-98e97ee25c47@sifive.com>
Date: Tue, 19 Jul 2022 09:23:20 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [linux-next:master 8797/11208] reset-simple.c:undefined reference
 to `devm_ioremap_resource'
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <202207190150.mf4rb4VG-lkp@intel.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <202207190150.mf4rb4VG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/07/2022 18:31, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   036ad6daa8f0fd357af7f50f9da58539eaa6f68c
> commit: 18d1909be3451e1a2e322e9035f03d0a18f7bee8 [8797/11208] reset: allow building of reset simple driver if expert config selected
> config: s390-randconfig-r032-20220718 (https://download.01.org/0day-ci/archive/20220719/202207190150.mf4rb4VG-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install s390 cross compiling tool for clang build
>          # apt-get install binutils-s390x-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=18d1909be3451e1a2e322e9035f03d0a18f7bee8
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 18d1909be3451e1a2e322e9035f03d0a18f7bee8
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/reset/reset-simple.o: in function `reset_simple_probe':
>>> reset-simple.c:(.text+0x3aa): undefined reference to `devm_ioremap_resource'
> 

I think the reset-simple may need to depend on CONFIG_HAS_IOMEM
