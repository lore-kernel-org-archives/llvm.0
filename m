Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB22CA2
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639721283; x=1671257283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fHgp6vVwDbRgvIayqgjGiMTx1loNVDl0DI+FMBCQ7YA=;
  b=GgcaFY75abSBArBLTmYzkvQhg7YGVjADzbpR+EBlTx0ep1LBJcs6p0NB
   2TS6D8eGPS5H2j/RkyYXlC1TZgrNdaGqtb97DPygCUd/Zr6gy1GqkQsSK
   h7wBe/Ld1Nn9VmKZNGXAZLezcGJtryeMcuPD7IGG+eXKwUhrI5OQ+IJmp
   ZKtF5rxZJJ9W8WvNI5JZEMAYRHIYWZ65gmpAqmIhaMV5VCTkBaHXHXZKB
   Ahs4NcfFHnNQ71Ilhy1RejDhg7jou68RZFuSLc3CV0GkBZPpzcloxk2zC
   Bbjmal8v04J9R5/+Qk2UwIEajEm4Qr6xOKK0iI6AyZweJijez46p3HnAQ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300464050"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="300464050"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 22:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="506642284"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 22:07:55 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1my6PK-0004II-4P; Fri, 17 Dec 2021 06:07:54 +0000
Date: Fri, 17 Dec 2021 14:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 17/25] iomap: Convert iomap_write_begin() and
 iomap_write_end() to folios
Message-ID: <202112171400.vuSHf13n-lkp@intel.com>
References: <20211216210715.3801857-18-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216210715.3801857-18-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.16-rc5 next-20211216]
[cannot apply to xfs-linux/for-next djwong-xfs/djwong-devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox-Oracle/iomap-xfs-folio-patches/20211217-050934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-randconfig-r045-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171400.vuSHf13n-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2d3e5234105d9fb12c78cf6c09a20d65e5a55e2f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/iomap-xfs-folio-patches/20211217-050934
        git checkout 2d3e5234105d9fb12c78cf6c09a20d65e5a55e2f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:620:9: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof ((1UL << 14) - ((unsigned long)(pos) & ~(~((1 << 14) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   len = min(len, PAGE_SIZE - offset_in_page(pos));
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +620 fs/iomap/buffered-io.c

   602	
   603	static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
   604			size_t len, struct folio **foliop)
   605	{
   606		const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
   607		const struct iomap *srcmap = iomap_iter_srcmap(iter);
   608		struct folio *folio;
   609		unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
   610		int status = 0;
   611	
   612		BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
   613		if (srcmap != &iter->iomap)
   614			BUG_ON(pos + len > srcmap->offset + srcmap->length);
   615	
   616		if (fatal_signal_pending(current))
   617			return -EINTR;
   618	
   619		if (!mapping_large_folio_support(iter->inode->i_mapping))
 > 620			len = min(len, PAGE_SIZE - offset_in_page(pos));
   621	
   622		if (page_ops && page_ops->page_prepare) {
   623			status = page_ops->page_prepare(iter->inode, pos, len);
   624			if (status)
   625				return status;
   626		}
   627	
   628		folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
   629				fgp, mapping_gfp_mask(iter->inode->i_mapping));
   630		if (!folio) {
   631			status = -ENOMEM;
   632			goto out_no_page;
   633		}
   634		if (pos + len > folio_pos(folio) + folio_size(folio))
   635			len = folio_pos(folio) + folio_size(folio) - pos;
   636	
   637		if (srcmap->type == IOMAP_INLINE)
   638			status = iomap_write_begin_inline(iter, folio);
   639		else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
   640			status = __block_write_begin_int(folio, pos, len, NULL, srcmap);
   641		else
   642			status = __iomap_write_begin(iter, pos, len, folio);
   643	
   644		if (unlikely(status))
   645			goto out_unlock;
   646	
   647		*foliop = folio;
   648		return 0;
   649	
   650	out_unlock:
   651		folio_unlock(folio);
   652		folio_put(folio);
   653		iomap_write_failed(iter->inode, pos, len);
   654	
   655	out_no_page:
   656		if (page_ops && page_ops->page_done)
   657			page_ops->page_done(iter->inode, pos, 0, NULL);
   658		return status;
   659	}
   660	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
