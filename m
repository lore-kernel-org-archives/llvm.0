Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BE17CD
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 03:46:49 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-10.nifty.com with ESMTP id 28F3ew0P010809
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 12:40:58 +0900
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 28F3eXIA003477
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 12:40:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 28F3eXIA003477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1663213234;
	bh=hjA7FMHCTPj8QN/oNLJjC/6iGpvzmvRcDcniFoiPpGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pAQF8pmD1dJZdby7WfsAkSohbv1wNXbMifHBZ4X0L26WO5aoAugxt7Q24z1kMfrvU
	 qPDTmj1HzlCGLMAczjTyzGIlguBO6Well0qb5WCND/oT9YgVCezUhKAqZXq7IhSXvl
	 ANVZ4m9H1uNDFEy6afDawIl2ILx1migeih7rhBl0sY29+W1eez6ZStoQXZFmVepQqb
	 DhEPxuNuNYRKqGyr1ld/hGoaoWSqEdcEshwXN537nWIZpl/EEFeAFmVlmWV7f0m7tm
	 ONcNnDUsvgN0lCE2o6VY0OOnMF2C9IdN8VJChZPqUACAh1cD1UVjmCNJ1oxbH88Lvw
	 PKWP9tWLrAxfw==
X-Nifty-SrcIP: [209.85.167.169]
Received: by mail-oi1-f169.google.com with SMTP id u131so739278oie.5
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 20:40:34 -0700 (PDT)
X-Gm-Message-State: ACgBeo1T6ysbD62QC1LXXmU5yw5rWUf26tKdqd71goMCYMOwSmz7S660
	RT117IC0kLsh67z6Z0BqagNA714hAFLvHreJ/aI=
X-Google-Smtp-Source: AA6agR68oWrtPS/bi5qJgXW2eBS1Mah/R01IFPFr8t3oEBXTSd8MCcf9P5/MlzL/FWLjz+BSY6Hd/3DJDGnQG8hFdv8=
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id
 cj5-20020a0568081b8500b0034d8ce1d5b0mr3247532oib.194.1663213233388; Wed, 14
 Sep 2022 20:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209150959.hEWCNjXH-lkp@intel.com>
In-Reply-To: <202209150959.hEWCNjXH-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 Sep 2022 12:39:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
Message-ID: <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
Subject: Re: [linux-next:master 6296/7172] ERROR: modpost: "kvm_spurious_fault"
 [arch/x86/kvm/kvm-intel.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 15, 2022 at 10:37 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f117c01187301a087412bd6697fcf5463cb427d8
> commit: 6676e2cdd7c339dc40331faccbaac1112d2c1d78 [6296/7172] kbuild: use obj-y instead extra-y for objects placed at the head
> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220915/202209150959.hEWCNjXH-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6676e2cdd7c339dc40331faccbaac1112d2c1d78
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 6676e2cdd7c339dc40331faccbaac1112d2c1d78
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
> >> ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
> WARNING: modpost: suppressed 34935 unresolved symbol warnings because there were too many)





Sorry, I cannot reproduce this.
Seeing the full log might be helpful.





> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



-- 
Best Regards
Masahiro Yamada
