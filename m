Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9B7FBB3;
	Thu, 28 Mar 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711630622; cv=none; b=DgotwKjrBWJPzww8N1UOZJttK82weLQfg01nYRUx/QZA1DEw73Z2fjDw+DzuZUCV7hPqQF1ZA333VBwk7IHyKlAPqdKKJZ1YU2Ep4LbNFumT7Q2Pv+PMOMgH04jIv19J03a46NNf8JM8qgq/nv4WYnuCUROw+KcFEjJVgrw1bTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711630622; c=relaxed/simple;
	bh=7Fc2f2taPu8F/E1+eeZWRcLoS6XcYuD22fmjyeCfJiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eiqk1vJ3fnYMxB4tYOcdNHprO0X5uFt72fZTO34unqse7olcKSq7JKVDRQjNUClGgWhExII4e2kxp0aKXkhMHwVNurAMebgBMSJBbKs+3/EyPDy5A+Ew0crHyxT8OfHRm7B0WgiGLUVkFSR1/AQ2AeEFTuZrPQDuyZRr1TdmEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V53SK2XWbz1wnbZ;
	Thu, 28 Mar 2024 20:56:01 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 2706F1A016C;
	Thu, 28 Mar 2024 20:56:51 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 20:56:50 +0800
Message-ID: <52f333be-9370-4865-b0fb-5ca6825ef39a@huawei.com>
Date: Thu, 28 Mar 2024 20:56:49 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mm: remove isolate_lru_page()
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Linux Memory
 Management List <linux-mm@kvack.org>, <willy@infradead.org>, Miaohe Lin
	<linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, David
 Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>, Zi Yan
	<ziy@nvidia.com>, Hugh Dickins <hughd@google.com>, Jonathan Corbet
	<corbet@lwn.net>, <linux-doc@vger.kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>
References: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>
 <202403282057.pIA3kJoz-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202403282057.pIA3kJoz-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/3/28 20:22, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.9-rc1]
> [cannot apply to akpm-mm/mm-everything next-20240328]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-migrate-add-isolate_movable_folio/20240327-221513
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240327141034.3712697-4-wangkefeng.wang%40huawei.com
> patch subject: [PATCH 3/6] mm: remove isolate_lru_page()
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240328/202403282057.pIA3kJoz-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282057.pIA3kJoz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403282057.pIA3kJoz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
This changed locally, but missing this when rebase on new branch, will fix.
> 
>>> mm/migrate_device.c:388:9: error: call to undeclared function 'isolate_lru_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       388 |                         if (!isolate_lru_page(page)) {
>           |                              ^
>     mm/migrate_device.c:388:9: note: did you mean '__isolate_free_page'?
>     mm/internal.h:487:12: note: '__isolate_free_page' declared here
>       487 | extern int __isolate_free_page(struct page *page, unsigned int order);
>           |            ^
>     1 error generated.
> 
> 
