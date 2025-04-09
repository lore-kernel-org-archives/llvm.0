Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149191D63E8;
	Wed,  9 Apr 2025 06:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179945; cv=none; b=Fe9HejQbGsEsVBKnaMktH3ol7jiInoGwWi8w9FHEPB6e0cHPhVcOff7XHX1aqWvSyJmAZgdQE4XJ4jnLVF539WZUQ0VkpHE/sx3IZ/FjOOg0Vn1M7RKQDWLDJmCIfi9tRNOjkb7vpXgYCmU4RmAYtg5Hfk5/zBTfEkJZ0PZF+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179945; c=relaxed/simple;
	bh=yArbNZeBDimqLdfvP/PeizsT9PWQf15IAXIy4fxbdmA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=akfqDo7YaZVmmru0OzL2/posVxy+Zd8L5MczcjgT26iKP9K01asthtnaW6YhWgLgZ9sM8B2xtrvjbfE/dJl8Mz6LAWuJp5iVObkrSLBBYxmlitpSOpRuQLKtmPEnI1EoiLHlwj2tHwYdVDhAwjJEBTP88d1BavK23QaerVcVMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZXXxJ1pJgz4f3jM1;
	Wed,  9 Apr 2025 14:25:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id AE6101A0AD9;
	Wed,  9 Apr 2025 14:25:31 +0800 (CST)
Received: from [10.174.178.129] (unknown [10.174.178.129])
	by APP4 (Coremail) with SMTP id gCh0CgDnR1zCEvZndqnLIw--.31042S2;
	Wed, 09 Apr 2025 14:25:27 +0800 (CST)
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
To: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, Baoquan He <bhe@redhat.com>
References: <202504081841.jbL7yL0r-lkp@intel.com>
 <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <5560cc75-c219-2f8b-7296-0bfb904172e7@huaweicloud.com>
Date: Wed, 9 Apr 2025 14:25:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgDnR1zCEvZndqnLIw--.31042S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45WFyDAF13Jr47Gr1rJFb_yoWrWF4xpF
	W8Wwn8GF48JryxKa9rW3Z8XrySgws3Gw15JFyDKry8ZasrJrWagF9a9rWYkFnrAw1v9FWY
	vFsFga13ua1qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UK2N
	tUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 4/9/2025 8:39 AM, Andrew Morton wrote:
> On Tue, 8 Apr 2025 18:06:11 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
>> commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
>> config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
> 
> It's annoying that gcc warns about this.
> 
>>     1517 | static inline bool swap_is_last_ref(unsigned char count)
>>          |                    ^~~~~~~~~~~~~~~~
>>    1 warning generated.
>>
>>
>> vim +/swap_is_last_ref +1517 mm/swapfile.c
>>
>>   1512	
>>   1513	/*
>>   1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
>>   1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
>>   1516	 */
>>> 1517	static inline bool swap_is_last_ref(unsigned char count)
>>   1518	{
>>   1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
>>   1520		       (count == SWAP_MAP_SHMEM);
>>   1521	}
>>   1522	
> 
> : static inline bool swap_is_last_ref(unsigned char count)
> : {
> : 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
> : 	       (count == SWAP_MAP_SHMEM);
> : }
> : 
> : static void swap_entries_free(struct swap_info_struct *si,
> : 			      struct swap_cluster_info *ci,
> : 			      swp_entry_t entry, unsigned int nr_pages)
> : {
> : 	unsigned long offset = swp_offset(entry);
> : 	unsigned char *map = si->swap_map + offset;
> : 	unsigned char *map_end = map + nr_pages;
> : 
> : 	/* It should never free entries across different clusters */
> : 	VM_BUG_ON(ci != offset_to_cluster(si, offset + nr_pages - 1));
> : 	VM_BUG_ON(cluster_is_empty(ci));
> : 	VM_BUG_ON(ci->count < nr_pages);
> : 
> : 	ci->count -= nr_pages;
> : 	do {
> : 		VM_BUG_ON(!swap_is_last_ref(*map));
> 
> 
> And it's annoying that VM_BUG_ON() doesn't reference its arg when
> CONFIG_DEBUG_VM=n.
> 
> I'll add this:
Thanks for fixing this.
> 
> --- a/mm/swapfile.c~mm-swap-enable-swap_entry_range_free-to-drop-any-kind-of-last-ref-fix
> +++ a/mm/swapfile.c
> @@ -1514,11 +1514,13 @@ fallback:
>   * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
>   * caller have to ensure all entries belong to the same cgroup and cluster.
>   */
> +#ifdef CONFIG_DEBUG_VM
>  static inline bool swap_is_last_ref(unsigned char count)
>  {
>  	return (count == SWAP_HAS_CACHE) || (count == 1) ||
>  	       (count == SWAP_MAP_SHMEM);
>  }
> +#endif
>  
>  static void swap_entries_free(struct swap_info_struct *si,
>  			      struct swap_cluster_info *ci,
> _
> 
> Kemeng, can you please review that comment "Drop the last ref...". 
>>From its positioning it appears to be describing swap_is_last_ref(),
> but swap_is_last_ref() doesn't do those things.
> 
The comment was originally for swap_entries_free() where swap_is_last_ref()
is factored out from. The swap_is_last_ref() is only used in swap_entries_free(),
so I treat these two functions as a single unit and placed the comment in front
of swap_is_last_ref().
If this introduces confusion, I think we can simply move this comment to front of
swap_entries_free() to address this.

Thanks,
Kemeng

