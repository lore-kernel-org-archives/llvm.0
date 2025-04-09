Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66E29A0;
	Wed,  9 Apr 2025 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159201; cv=none; b=C157Olr9MpFryc9TT8tEehnsjwlxbqG927KLfNCkMtngsgKGmTFR1r03ii7UcjKUNk+8/pJBip6a9mt5gFcGv52V1UnLZJwX2Y1T5vCki85XLiD0BhzCQv3JxtsYMWyYak2Dy/RnPum0oYn25h45I7/jxMqLxb1nKX8jvAE4hUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159201; c=relaxed/simple;
	bh=ePBmpq2a4DMQiWyTZzEf6l0GwjldfvvKxuZRaNZTn0o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ntn5M+/Hb2/epvvT7MoXVuCajbs3Xxjx0I4oOoNjkLL+iVkOc2l2tJFPN6cmOG0pMaI5y/VqPvkV5ZtKkEI9b5yTXL9RHL1uxf4Oe0oc3vqbll66BCKgCRsQW9THqt7vIPw56tyKFipvGfOiNQ+RQBuYn9GWfco44BH0TKpyc6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QjYyByEc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QjYyByEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7727BC4CEE5;
	Wed,  9 Apr 2025 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744159200;
	bh=ePBmpq2a4DMQiWyTZzEf6l0GwjldfvvKxuZRaNZTn0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QjYyByEc3E3N6AkWFipwvkl3ysx8PP88WA19yKHQ3uCvmPIHVE9v8I4X7XILpSQ17
	 5puxONq23M0m5yAKXPRkXTudz++lyihLCuT61Oyk1olPZKGBlUlG9jryQAWz1saNcr
	 cngyuLl06Qgx4WelEHGYQewj8nH9XHRxiqiT7f0I=
Date: Tue, 8 Apr 2025 17:39:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Tim Chen <tim.c.chen@linux.intel.com>, Baoquan He
 <bhe@redhat.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Message-Id: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
In-Reply-To: <202504081841.jbL7yL0r-lkp@intel.com>
References: <202504081841.jbL7yL0r-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Apr 2025 18:06:11 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
> commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
> config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]

It's annoying that gcc warns about this.

>     1517 | static inline bool swap_is_last_ref(unsigned char count)
>          |                    ^~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> 
> vim +/swap_is_last_ref +1517 mm/swapfile.c
> 
>   1512	
>   1513	/*
>   1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
>   1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
>   1516	 */
> > 1517	static inline bool swap_is_last_ref(unsigned char count)
>   1518	{
>   1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
>   1520		       (count == SWAP_MAP_SHMEM);
>   1521	}
>   1522	

: static inline bool swap_is_last_ref(unsigned char count)
: {
: 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
: 	       (count == SWAP_MAP_SHMEM);
: }
: 
: static void swap_entries_free(struct swap_info_struct *si,
: 			      struct swap_cluster_info *ci,
: 			      swp_entry_t entry, unsigned int nr_pages)
: {
: 	unsigned long offset = swp_offset(entry);
: 	unsigned char *map = si->swap_map + offset;
: 	unsigned char *map_end = map + nr_pages;
: 
: 	/* It should never free entries across different clusters */
: 	VM_BUG_ON(ci != offset_to_cluster(si, offset + nr_pages - 1));
: 	VM_BUG_ON(cluster_is_empty(ci));
: 	VM_BUG_ON(ci->count < nr_pages);
: 
: 	ci->count -= nr_pages;
: 	do {
: 		VM_BUG_ON(!swap_is_last_ref(*map));


And it's annoying that VM_BUG_ON() doesn't reference its arg when
CONFIG_DEBUG_VM=n.

I'll add this:

--- a/mm/swapfile.c~mm-swap-enable-swap_entry_range_free-to-drop-any-kind-of-last-ref-fix
+++ a/mm/swapfile.c
@@ -1514,11 +1514,13 @@ fallback:
  * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
  * caller have to ensure all entries belong to the same cgroup and cluster.
  */
+#ifdef CONFIG_DEBUG_VM
 static inline bool swap_is_last_ref(unsigned char count)
 {
 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
 	       (count == SWAP_MAP_SHMEM);
 }
+#endif
 
 static void swap_entries_free(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
_

Kemeng, can you please review that comment "Drop the last ref...". 
From its positioning it appears to be describing swap_is_last_ref(),
but swap_is_last_ref() doesn't do those things.

