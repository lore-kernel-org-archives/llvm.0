Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322879C2;
	Sun,  2 Jun 2024 04:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717301822; cv=none; b=iWCyL0gF4oqLwXiEb3xrdxAY/05bTrov0d+k4/lK3uLcK8haW82fxX746S2bZJnyztVGPgeXQHpwZ+qSFrIQGA0TEXkSMEe6tpB1TNSp4KxdNM41uCP7OxSvvSa//g0LEFEGKxTtTnoJJqGOa/RG0s1ukDkJznWxRBpcuQFMBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717301822; c=relaxed/simple;
	bh=JNWq8IPKk7PrsPl7hktkVKNVpVOyMrlNF/BTNAohg/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opWcOG05uKalUHZbTHWF1sX+c0XoCWpbscKbd+Dhwe5GR/rlHfNNPd39zf85wIAdSEdVP5/pSD6N4wLzvnwcPRS8Zt7+Y5zva0kW1TXdOTJyVKMo1I1Vs+Yvjj+VhRoqp1A0E2pw3zMM/R5yondkoahzqqvSPufVcEnaUWZeQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=B+LFdWBs; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="B+LFdWBs"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1717301811; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BBVFMf4e3TqS0Oa0nQR45WmAiVghu2BOQgzSAUs3Mfg=;
	b=B+LFdWBs7e0bE9/DvHVGnqAT2ocpAzPlEKdQRZ932UHa2TWaALI1//NhyIn4U6u+32POh8Ux2SJ0FJNNzfKrtQln9KRrykxPsoiVhlGvdcKfvMzQncxCgX4P5kavoprtdCOItRtBLU0vS2NyNRmPCD9XbNhXJGWeRSro+DbTNIE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0W7do2aW_1717301742;
Received: from 192.168.0.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W7do2aW_1717301742)
          by smtp.aliyun-inc.com;
          Sun, 02 Jun 2024 12:16:49 +0800
Message-ID: <515fba2a-342e-4d8b-85c2-a89038a0c4e0@linux.alibaba.com>
Date: Sun, 2 Jun 2024 12:16:48 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] mm: shmem: add mTHP support for anonymous shmem
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, willy@infradead.org,
 david@redhat.com, wangkefeng.wang@huawei.com, ying.huang@intel.com,
 21cnbao@gmail.com, ryan.roberts@arm.com, shy828301@gmail.com,
 ziy@nvidia.com, ioworker0@gmail.com, da.gomez@samsung.com,
 p.raghav@samsung.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <ec35a23026dd016705d211e85163cabe07681516.1717033868.git.baolin.wang@linux.alibaba.com>
 <202405301430.0NRLTOWU-lkp@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202405301430.0NRLTOWU-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/5/30 14:36, kernel test robot wrote:
> Hi Baolin,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on next-20240529]
> [cannot apply to linus/master v6.10-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-memory-extend-finish_fault-to-support-large-folio/20240530-100805
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/ec35a23026dd016705d211e85163cabe07681516.1717033868.git.baolin.wang%40linux.alibaba.com
> patch subject: [PATCH v3 4/6] mm: shmem: add mTHP support for anonymous shmem
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240530/202405301430.0NRLTOWU-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301430.0NRLTOWU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405301430.0NRLTOWU-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from mm/shmem.c:28:
>     In file included from include/linux/ramfs.h:5:
>     In file included from include/linux/fs_parser.h:11:
>     In file included from include/linux/fs_context.h:14:
>     In file included from include/linux/security.h:33:
>     In file included from include/linux/mm.h:2245:
>     include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>           |                               ~~~~~~~~~~~ ^ ~~~
>>> mm/shmem.c:1748:14: warning: variable 'suitable_orders' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>      1748 |                 } else if (orders & BIT(HPAGE_PMD_ORDER)) {
>           |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     mm/shmem.c:1766:25: note: uninitialized use occurs here
>      1766 |                 order = highest_order(suitable_orders);
>           |                                       ^~~~~~~~~~~~~~~
>     mm/shmem.c:1748:10: note: remove the 'if' if its condition is always true
>      1748 |                 } else if (orders & BIT(HPAGE_PMD_ORDER)) {
>           |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     mm/shmem.c:1736:31: note: initialize the variable 'suitable_orders' to silence this warning
>      1736 |         unsigned long suitable_orders;
>           |                                      ^
>           |                                       = 0
>     2 warnings generated.

Thanks for reporting. Will fix the warning in next version.
