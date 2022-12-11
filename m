Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92D1107;
	Sun, 11 Dec 2022 03:27:41 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NV98Y3WjJzJp94;
	Sun, 11 Dec 2022 11:23:57 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sun, 11 Dec 2022 11:27:31 +0800
Message-ID: <50506c8a-71c1-9c68-aa47-7e8dc68a3c52@huawei.com>
Date: Sun, 11 Dec 2022 11:27:31 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 71/161] mm/ksm.c:2605:7:
 error: implicit declaration of function 'copy_mc_user_highpage' is invalid in
 C99
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Ammar Faizi
	<ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
References: <202212101658.opz53ZV8-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202212101658.opz53ZV8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected

Hi,  the patch "[PATCH -next v2] mm: hwposion: support recovery from 
ksm_might_need_to_copy()" is

based on next-20221208,  relay on Tony Luck's Patch series 
"Copy-on-write poison recovery".

On 2022/12/10 16:19, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   4661cf99c1e4946297434595994227e47f33c014
> commit: b7edf4b1cdb10106ea63ff2a416b5680d8392dcb [71/161] mm: hwpoison: support recovery from ksm_might_need_to_copy()
> config: i386-randconfig-a002
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/ammarfaizi2/linux-block/commit/b7edf4b1cdb10106ea63ff2a416b5680d8392dcb
>          git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>          git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
>          git checkout b7edf4b1cdb10106ea63ff2a416b5680d8392dcb
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> Note: the ammarfaizi2-block/akpm/mm/mm-unstable HEAD 4661cf99c1e4946297434595994227e47f33c014 builds fine.
>        It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
>>> mm/ksm.c:2605:7: error: implicit declaration of function 'copy_mc_user_highpage' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                     if (copy_mc_user_highpage(new_page, page, address, vma)) {
>                         ^
>     mm/ksm.c:2605:7: note: did you mean 'copy_user_highpage'?
>     include/linux/highmem.h:307:20: note: 'copy_user_highpage' declared here
>     static inline void copy_user_highpage(struct page *to, struct page *from,
>                        ^
>     1 error generated.
>
>
> vim +/copy_mc_user_highpage +2605 mm/ksm.c
>
>    2577	
>    2578	struct page *ksm_might_need_to_copy(struct page *page,
>    2579				struct vm_area_struct *vma, unsigned long address)
>    2580	{
>    2581		struct folio *folio = page_folio(page);
>    2582		struct anon_vma *anon_vma = folio_anon_vma(folio);
>    2583		struct page *new_page;
>    2584	
>    2585		if (PageKsm(page)) {
>    2586			if (page_stable_node(page) &&
>    2587			    !(ksm_run & KSM_RUN_UNMERGE))
>    2588				return page;	/* no need to copy it */
>    2589		} else if (!anon_vma) {
>    2590			return page;		/* no need to copy it */
>    2591		} else if (page->index == linear_page_index(vma, address) &&
>    2592				anon_vma->root == vma->anon_vma->root) {
>    2593			return page;		/* still no need to copy it */
>    2594		}
>    2595		if (!PageUptodate(page))
>    2596			return page;		/* let do_swap_page report the error */
>    2597	
>    2598		new_page = alloc_page_vma(GFP_HIGHUSER_MOVABLE, vma, address);
>    2599		if (new_page &&
>    2600		    mem_cgroup_charge(page_folio(new_page), vma->vm_mm, GFP_KERNEL)) {
>    2601			put_page(new_page);
>    2602			new_page = NULL;
>    2603		}
>    2604		if (new_page) {
>> 2605			if (copy_mc_user_highpage(new_page, page, address, vma)) {
>    2606				put_page(new_page);
>    2607				new_page = ERR_PTR(-EHWPOISON);
>    2608				memory_failure_queue(page_to_pfn(page), 0);
>    2609				return new_page;
>    2610			}
>    2611			SetPageDirty(new_page);
>    2612			__SetPageUptodate(new_page);
>    2613			__SetPageLocked(new_page);
>    2614	#ifdef CONFIG_SWAP
>    2615			count_vm_event(KSM_SWPIN_COPY);
>    2616	#endif
>    2617		}
>    2618	
>    2619		return new_page;
>    2620	}
>    2621	
>
