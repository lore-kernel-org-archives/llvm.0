Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A347E0;
	Wed, 30 Nov 2022 02:18:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMN5P71hBz4x1V;
	Wed, 30 Nov 2022 13:12:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669774362;
	bh=lAU1+45GzhTaAbjpR6WwYrHz3visWZr3L2Nqws4aD0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AGkd8UWSYohfQF/c+cAQQKY7tj8tMq1fLumC3fZqc5sQVlvZ3TtCoXSxK6bBIoOAm
	 VynPwsaHQlvYkuVAXBVN/9d86gJsZ0wvQdfiMg7jqbUSagWV8P2rZRe9pF1Hb5TWNQ
	 YtL+yG/GFyeqUHa3jKMrzCSXgCZLp3NKjubIRCCiE0J0ST4iihw/EmRBPLN7n/lSDH
	 uHPgszukhGfpSfMU2ePBL6dija5aW3Ka/218MQX0HzyBnTKjNSHe0xpg5bDlNbRhHF
	 eX+ULLD5+H9Kh+8jgGkgXvYoBETxzRhQCv0/LoQYY/0G5RNkYzFMfC6HBbF5axBn2f
	 hLcXiUBQz1K8Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, kernel test robot
 <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.10.y 499/9671]
 arch/powerpc/kernel/smp.c:1380:7: error: variable 'ret' set but not used
In-Reply-To: <20221124071317.GA4026779@linux.vnet.ibm.com>
References: <202211240721.HSkCm4aB-lkp@intel.com>
 <20221124071317.GA4026779@linux.vnet.ibm.com>
Date: Wed, 30 Nov 2022 13:12:38 +1100
Message-ID: <87h6yhb36x.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * kernel test robot <lkp@intel.com> [2022-11-24 07:11:15]:
>
>> Hi Srikar,
>> 
>> FYI, the error/warning still remains.
>> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
>> head:   38866e257e18dbc209f4c355fe57123b0c2e0e4a
>> commit: e91077cf1780108dc586cedf1d19f65b44fa3870 [499/9671] powerpc/smp: Update cpu_core_map on all PowerPc systems
>> config: powerpc-randconfig-r002-20221121
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project af8c49dc1ec44339d915d988ffe0f38da68ca0e7)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install powerpc cross compiling tool for clang build
>>         # apt-get install binutils-powerpc-linux-gnu
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e91077cf1780108dc586cedf1d19f65b44fa3870
>>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>         git fetch --no-tags linux-stable-rc linux-5.10.y
>>         git checkout e91077cf1780108dc586cedf1d19f65b44fa3870
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/
>> 
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> 
>
> Thanks for your report.
>
> 1st Commit c47f892d7aa6 ("powerpc/smp: Reintroduce cpu_core_mask") 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c47f892d7aa6
> in upstream which is Commit bf6476152a0a ("powerpc/smp: Reintroduce
> cpu_core_mask") in stable tree as is.
>
> 2nd Commit c1e53367dab1 ("powerpc/smp: Cache CPU to chip lookup") 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c1e53367dab1
>
> 3rd Commit c47f892d7aa6 ("powerpc/smp: Reintroduce cpu_core_mask") 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c47f892d7aa6
> is Commit e91077cf1780("powerpc/smp: Reintroduce cpu_core_mask")  in stable
> tree with some minor modifications.

I think you mean:

b8b928030332 ("powerpc/smp: Update cpu_core_map on all PowerPc systems")

which in stable is:

e91077cf1780 ("powerpc/smp: Update cpu_core_map on all PowerPc systems")

> However when the 3rd commit was picked, it mangled with the changes
> introduced in the 2nd commit. (Since 2nd commit is not present in Stable
> tree). 
>
> Relevant hunk from commit 2 (c1e53367dab1)
> @@ -1492,7 +1506,10 @@ static void add_cpu_to_masks(int cpu)
>         if (has_coregroup_support())
>                 update_coregroup_mask(cpu, &mask);
>  
> -       if (chip_id == -1 || !ret) {
> +       if (chip_id_lookup_table && ret)
> +               chip_id = cpu_to_chip_id(cpu);
> +
> +       if (chip_id == -1) {
>                 cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
>                 goto out;
>         }
>
> Relevant hunks from commit 3 (c47f892d7aa6)
> @@ -1544,11 +1545,6 @@ static void add_cpu_to_masks(int cpu)
>         if (chip_id_lookup_table && ret)
>                 chip_id = cpu_to_chip_id(cpu);
>  
> -       if (chip_id == -1) {
> -               cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
> -               goto out;
> -       }
> -
>         if (shared_caches)
>                 submask_fn = cpu_l2_cache_mask;
>
>
> The way it was applied in Stable tree combining hunks in Commit 2 and Commit 3.
>
> @@ -1399,11 +1400,6 @@ static void add_cpu_to_masks(int cpu)
>  	if (has_coregroup_support())
>  		update_coregroup_mask(cpu, &mask);
>  
> -	if (chip_id == -1 || !ret) {
> -		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
> -		goto out;
> -	}
> -
>  	if (shared_caches)
>  		submask_fn = cpu_l2_cache_mask;
>  
>
> Because of the above, we end up with this warning.
>
> Please let me know, how do we proceed on the same.

Can you send a fixup patch to the stable maintainers with the above
explanation.

cheers
