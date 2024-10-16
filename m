Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A36199944;
	Wed, 16 Oct 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071047; cv=none; b=RjEXEntuYUCBF7C2RLuUcMe9AvIwAXAgo9RypIpxj28OAM5YX+jhtNICAr8qZkJ7z5CJ9Io0tlzG9GQ+cnIW1fdv6YGm8KUqNcG1+hXzQOIlnCxYbyXvbOB27wR6gZTf++VCKWx9LAtT/G6kf/gcrpEvtd3XzECGqdwmmbU1dAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071047; c=relaxed/simple;
	bh=jWunuh+WAOu/m9kWPUPfgofOPJ7ITrkLr+y6tBmXkcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHNeRv07msLRkkXS2wwL1DQDyxjXt6icJyb526QWGz84L++uKX0FnrPswhWnyaTf02xHVnZEfIfPK7wpeq5Ue4tDW2pyd/LFK6iHxRlVpys6WCfiBX22mjdxNo8/6C+CEjz+9b7nfmY2sN2M0rQd+fcuBqdyIW9ZW7idCyMlR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=I95NIB25; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="I95NIB25"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1729071042; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=94ydymEXiNCQH8u0qLCo3od56nTu0QsdTRSZryzX7Jw=;
	b=I95NIB25xQzWGkqf34TRBtFWRwskwCMZgofasBjlQTc3AqsTxQg0bdWER7jF84EfHmipym41KcXTlSb8oLjRZ86Bzol1BNZBXikhaWpIx8728xgoOiHhcnPor378Kpaco3ojb9B1kf6gNt3CKyAu0NQCPNkZ6GJ8MmHvmi5gMpc=
Received: from 30.74.144.157(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WHGyp3d_1729071040 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Oct 2024 17:30:41 +0800
Message-ID: <452eb6d3-0b34-4bd6-b7b0-817bd3389efb@linux.alibaba.com>
Date: Wed, 16 Oct 2024 17:30:40 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/4] mm: shmem: change shmem_huge_global_enabled()
 to return huge order bitmap
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <b1804b973d3ee800a2f233be45732b71ce3917cb.1728548374.git.baolin.wang@linux.alibaba.com>
 <202410131132.b6FEas2V-lkp@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202410131132.b6FEas2V-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/10/13 11:30, kernel test robot wrote:
> Hi Baolin,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.12-rc2 next-20241011]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-factor-out-the-order-calculation-into-a-new-helper/20241010-175904
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/b1804b973d3ee800a2f233be45732b71ce3917cb.1728548374.git.baolin.wang%40linux.alibaba.com
> patch subject: [RFC PATCH v3 2/4] mm: shmem: change shmem_huge_global_enabled() to return huge order bitmap
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241013/202410131132.b6FEas2V-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131132.b6FEas2V-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410131132.b6FEas2V-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from mm/shmem.c:28:
>     In file included from include/linux/ramfs.h:5:
>     In file included from include/linux/fs_parser.h:11:
>     In file included from include/linux/fs_context.h:14:
>     In file included from include/linux/security.h:33:
>     In file included from include/linux/mm.h:2213:
>     include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>           |                               ~~~~~~~~~~~ ^ ~~~
>     In file included from mm/shmem.c:86:
>     In file included from mm/internal.h:13:
>     include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>        47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>           |                                    ~~~~~~~~~~~ ^ ~~~
>     include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>        49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>           |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>     mm/shmem.c:1608:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
>      1608 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
>           |                    ^~~~~~~~~~~~~~~
>>> mm/shmem.c:1174:10: error: call to '__compiletime_assert_405' declared with 'error' attribute: BUILD_BUG failed
>      1174 |             BIT(HPAGE_PMD_ORDER))
>           |                 ^

Thanks for reporting. Will fix in next version.
