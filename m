Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034710EA;
	Sun, 11 Jun 2023 02:09:04 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VknHnDH_1686447481;
Received: from 30.213.168.230(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VknHnDH_1686447481)
          by smtp.aliyun-inc.com;
          Sun, 11 Jun 2023 09:38:03 +0800
Message-ID: <58aa95c5-f66a-0768-2e7d-aa2270852d8e@linux.alibaba.com>
Date: Sun, 11 Jun 2023 09:38:19 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] mm: compaction: skip memory hole rapidly when isolating
 migratable pages
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 mgorman@techsingularity.net, vbabka@suse.cz, david@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <8cc668b77c8eb2fa78058b3d81386ebed9c5a9cd.1686294549.git.baolin.wang@linux.alibaba.com>
 <202306092250.cp65gzkn-lkp@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202306092250.cp65gzkn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/9/2023 10:48 PM, kernel test robot wrote:
> Hi Baolin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-compaction-skip-memory-hole-rapidly-when-isolating-migratable-pages/20230609-174659
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/8cc668b77c8eb2fa78058b3d81386ebed9c5a9cd.1686294549.git.baolin.wang%40linux.alibaba.com
> patch subject: [PATCH] mm: compaction: skip memory hole rapidly when isolating migratable pages
> config: arm-randconfig-r025-20230609 (https://download.01.org/0day-ci/archive/20230609/202306092250.cp65gzkn-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build):
>          mkdir -p ~/bin
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm cross compiling tool for clang build
>          # apt-get install binutils-arm-linux-gnueabi
>          git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>          git fetch akpm-mm mm-everything
>          git checkout akpm-mm/mm-everything
>          b4 shazam https://lore.kernel.org/r/8cc668b77c8eb2fa78058b3d81386ebed9c5a9cd.1686294549.git.baolin.wang@linux.alibaba.com
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306092250.cp65gzkn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> mm/compaction.c:235:27: error: call to undeclared function 'pfn_to_section_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>             unsigned long start_nr = pfn_to_section_nr(start_pfn);
>                                      ^
>>> mm/compaction.c:237:6: error: call to undeclared function 'online_section_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>             if (online_section_nr(start_nr))
>                 ^
>>> mm/compaction.c:240:19: error: call to undeclared function 'next_online_section_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>             next_online_nr = next_online_section_nr(start_nr);
>                              ^
>>> mm/compaction.c:242:10: error: call to undeclared function 'section_nr_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                     return section_nr_to_pfn(next_online_nr);
>                            ^
>     4 errors generated.

Thanks for report. I should provide a dummy function if CONFIG_SPARSEMEM 
is not selected.
