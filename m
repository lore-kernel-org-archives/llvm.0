Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2C1DFFC;
	Wed,  9 Apr 2025 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217696; cv=none; b=r4cwvGPLS7zcJPXgyTBoLj7p/SD0qjhEn9Vxe4XrBmJP7SNFjf8LhZm05zbI71QG1b8wWJ+UcxyxD0FMQ/LPc4vqWqzRIqwzxWlGCRkGr0rI7s1/VNOGLWdZPg7SVaA/eEVhdHC8cJm0wNKUrTFOvSPLI/RzcHV9tOXAGyzgmaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217696; c=relaxed/simple;
	bh=bn99SfcJAYqnAykVhl5TJzlvHLeMgsMboKs4HfISh8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dofzZpbKK96k371Fz8VoryMUcZuvmmU9wZbWw7fiSMJKIeSdJVWapKBpPVdXQvsZyskOxZ9PHPYF3Wb+8miM8vKmZ0fl94pn7XwOlqmgpRUbqhTt6B1lbcT4CqfqP0vaH2cx+Ie5+swH8CuNunr5GAQHBn1rUybzkUSV/LRRS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6+i0Hqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6+i0Hqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5C9C4CEE9;
	Wed,  9 Apr 2025 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744217695;
	bh=bn99SfcJAYqnAykVhl5TJzlvHLeMgsMboKs4HfISh8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6+i0HqbWhsp0jdV6uYv+1WdMNxt5e7/3fsO8gn1cw48xntVqhFmlWTw+O+6GwdFK
	 4QZUJgzUNH9kMblti6zwtkj0CVuaDiez4U2WDeUvovgt0DfYMgQwpG5jWkRcT1nj/Q
	 ydyS/S0Zkq7HkyxHPDLvb6Rl+LR/631lhmnReQy4LxjKMK10V/q0bVyjfjcGJSscAZ
	 WwVRL1iv3l3cx8ZrHXUp4SBqGat3Y80J9UF7jgNqaNdlo5ybuYmvnyzg1q0HADx7dA
	 FlDZmPGv2J0QAeye1pNIAYCYJHFGDcPvKFh7CzNIyPgxLAVs6z5m2dmf/ZrnFzTvjr
	 03KxELUtEkIlg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Baoquan He <bhe@redhat.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted
Date: Wed,  9 Apr 2025 09:54:52 -0700
Message-Id: <20250409165452.305371-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On Tue, 8 Apr 2025 17:39:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 8 Apr 2025 18:06:11 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
> > commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
> > config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
> 
> It's annoying that gcc warns about this.
> 
> >     1517 | static inline bool swap_is_last_ref(unsigned char count)
> >          |                    ^~~~~~~~~~~~~~~~
> >    1 warning generated.
> > 
> > 
> > vim +/swap_is_last_ref +1517 mm/swapfile.c
> > 
> >   1512	
> >   1513	/*
> >   1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
> >   1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
> >   1516	 */
> > > 1517	static inline bool swap_is_last_ref(unsigned char count)
> >   1518	{
> >   1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
> >   1520		       (count == SWAP_MAP_SHMEM);
> >   1521	}
> >   1522	
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

This makes my build fails when CONFIG_DEBUG_VM is unset as below.

    linux/mm/swapfile.c: In function ‘swap_entries_free’:
    linux/mm/swapfile.c:1565:28: error: implicit declaration of function ‘swap_is_last_ref’; did you mean ‘swap_is_last_map’? [-Werror=implicit-function-declaration]
     1565 |                 VM_BUG_ON(!swap_is_last_ref(*map));
          |                            ^~~~~~~~~~~~~~~~
    linux/include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
       30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
          |                                                               ^
    linux/mm/swapfile.c:1565:17: note: in expansion of macro ‘VM_BUG_ON’
     1565 |                 VM_BUG_ON(!swap_is_last_ref(*map));
          |                 ^~~~~~~~~
    cc1: some warnings being treated as errors

Maybe we can open-code the condition, or add a macro implementation of
swap_is_last_ref() for !CONFIG_DEBUG_VM case?


Thanks,
SJ

[...]
