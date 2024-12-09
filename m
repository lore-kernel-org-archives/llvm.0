Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E539155345;
	Mon,  9 Dec 2024 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733768829; cv=none; b=YieHbMwqd4DkQ2xlyGpKokb9iL4vmEURkbKevvaAII/p+FFYPM6QjDKkdu+ibQUSQWp7AD8Om1RunEqXDE+yX8uSWdcIrRwfpKJ/j0Jv0gS4/u1cl/ajtJGbzAkxGOH9iHC9nYNBbUi0Squ65O9MiiRl+fAelY6jJEfOzSxffKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733768829; c=relaxed/simple;
	bh=f9qJTFyXFyyNKKG3cYnLGjDTXRWksWJ5bSdnCn8V8zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eluIxJIdNYFQr3I1CRrCI69UIxRvUZSufPXdrAKc3E9s/fNRORghwloiWA5Gt7eptyxXN1Mk8I9vjDgwZVyDCZRsoWefrTtSSk6e/5IsElHzMP48k99iXWI+/IuhBidKT2xTP0wuFR0tHe0FiHmrRuGSItFZPvFiwECxDEZeQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8iTdejB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8iTdejB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7F4C4CED1;
	Mon,  9 Dec 2024 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733768828;
	bh=f9qJTFyXFyyNKKG3cYnLGjDTXRWksWJ5bSdnCn8V8zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8iTdejBzdvu/wVU9GQDf821juswSbAj+Kfty+fr+4OzKsrJMZ9YRNXO3iQbzuQfj
	 mZfFYNYf0FtEGlIbXlwbLIqZeELF6wUKmBg0fRQwn0+y4U/jPJFUVwqZxrn31EIB8E
	 LwQLak6Tqlj7R/aPkX3aQijB484s1iCbBaALj/Ql1SmwprhUZ/DD3WHs0AAj3K/FEQ
	 0q6bvO70Yo6FV/tJHqSzroTSQoFbaQrEdNzZpE9LzIpWiniyfEc5Bss3IhUg4ocfxa
	 35eApdPBewEEA+tWGhI6P7RzDyzb7KiVtEdkvfX6RW6qqRxJEwAE4Aa7+M3mt3zcfX
	 z9YUeH/bUtGUA==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 76/76] mm/damon/paddr.c:493:3: warning: variable 'applied' is uninitialized when used here
Date: Mon,  9 Dec 2024 10:27:05 -0800
Message-Id: <20241209182705.10593-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202412071433.DgqslKRN-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 9 Dec 2024 12:10:42 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   25b6468a712e65fa59ad8724e87ed32fb3e1d0c3
> commit: 25b6468a712e65fa59ad8724e87ed32fb3e1d0c3 [76/76] mm/damon: add a new DAMOS action for fine-grained filter-aware stat
> config: i386-buildonly-randconfig-004-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071433.DgqslKRN-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071433.DgqslKRN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412071433.DgqslKRN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from mm/damon/paddr.c:12:
>    In file included from include/linux/pagemap.h:8:
>    In file included from include/linux/mm.h:2223:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/damon/paddr.c:17:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
> >> mm/damon/paddr.c:493:3: warning: variable 'applied' is uninitialized when used here [-Wuninitialized]
>      493 |                 applied += folio_size(folio);
>          |                 ^~~~~~~
>    mm/damon/paddr.c:482:29: note: initialize the variable 'applied' to silence this warning
>      482 |         unsigned long addr, applied;
>          |                                    ^
>          |                                     = 0
>    4 warnings generated.

Thank you for this kind report!  Just pushed a fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=48b4e032de1655313ff3cdf08d36bd6633993f93


Thanks,
SJ

[...]
