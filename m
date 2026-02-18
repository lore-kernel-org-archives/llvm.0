Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF02EF64F;
	Wed, 18 Feb 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411254; cv=none; b=GNWCzihi/ykpZxlbE46OtPnXH/n0xYAnH5WC6Qki9eLUYdMvmd4nQLiPWaQ+QnAhic9ZMniR61wIPOePP/NImIVqPFWFz6x/NHvvHqlnFPRYTM1ndcN8wOaAyD8MqcQ8K1QpvXNl7w3kDVD4JlG9QD7a2ul77nyS4lk+90a5kPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411254; c=relaxed/simple;
	bh=Cd26PjeVkqMJVQiI+SjBkCnU4JV9CmmiLOsGMTatUp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edJFAW0uLeldlQoO74YxrYbFu0U6vk8FNcFDLpj9P8aLVinTfc2NNqEkjN+P/tDEUce5SQpX0RFUniuX3EbO395prksjtR6UOog7SXjjrKpcm754QWySIifyE3Es8jbKPRPXZuv6ZcjEgyNZHj4JDeyK3BVAiqdnIhS+UePyBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYkR/aFr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYkR/aFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771411252; x=1802947252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cd26PjeVkqMJVQiI+SjBkCnU4JV9CmmiLOsGMTatUp4=;
  b=BYkR/aFrfIECyzKPDgkxPgpJ4vHRzJeIr+zTCr6XHumDPzSrNZneQG8r
   6qI6lefpqgXPvr2TCMBBreSHXnNu5xDp3xOym1yuRm2NCDzKnd4M4Jkvz
   J0hE32B61q5GoyQQB9agQEICVL2XgmvtSu8W07mmHjIKfOsTH3/uEu3hO
   lL+cyDQw/C98k1T5TLgl8dw+euKTbA47nn0gdJYTR1N4Eyz9Neb5qIat9
   Whz++mNq/6dVW9oqXRBeU+UAdhRcMWoQAoiZcb63yk0CtBsujah7Eoq9S
   rbRaTHvfNNwQdTd7tRicG6Qq+Wv7a9Ea6Tvh95njFNESAaNdIJTDJdCiw
   g==;
X-CSE-ConnectionGUID: vWdceIIqRhKC880jWLfxBg==
X-CSE-MsgGUID: JYyWM/LWQQW/5yz+KHk94Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76344980"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="76344980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 02:40:51 -0800
X-CSE-ConnectionGUID: d6xlXNzzQI+9kyepzCAGCw==
X-CSE-MsgGUID: 2I4IkMg5TO6l4UKmR3Hdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="214148730"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Feb 2026 02:40:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsez6-000000012HG-27wy;
	Wed, 18 Feb 2026 10:40:44 +0000
Date: Wed, 18 Feb 2026 18:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v3 09/12] mm, swap: use the swap table to track the swap
 count
Message-ID: <202602181835.58TEynxc-lkp@intel.com>
References: <20260218-swap-table-p3-v3-9-f4e34be021a7@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-swap-table-p3-v3-9-f4e34be021a7@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-swap-protect-si-swap_file-properly-and-use-as-a-mount-indicator/20260218-040852
base:   d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad
patch link:    https://lore.kernel.org/r/20260218-swap-table-p3-v3-9-f4e34be021a7%40tencent.com
patch subject: [PATCH v3 09/12] mm, swap: use the swap table to track the swap count
config: i386-buildonly-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181835.58TEynxc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181835.58TEynxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181835.58TEynxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:1627:6: warning: shift count >= width of type [-Wshift-count-overflow]
    1626 |                 VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1627 |                                 (BIT(BITS_PER_TYPE(ci->extend_table[0]))) - 1);
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^
   include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                     ~~~~~~~~~~~~~^~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +1627 mm/swapfile.c

  1596	
  1597	/* Increase the swap count of one slot. */
  1598	static int __swap_cluster_dup_entry(struct swap_cluster_info *ci,
  1599					    unsigned int ci_off)
  1600	{
  1601		int count;
  1602		unsigned long swp_tb;
  1603	
  1604		lockdep_assert_held(&ci->lock);
  1605		swp_tb = __swap_table_get(ci, ci_off);
  1606		/* Bad or special slots can't be handled */
  1607		if (WARN_ON_ONCE(swp_tb_is_bad(swp_tb)))
  1608			return -EINVAL;
  1609		count = __swp_tb_get_count(swp_tb);
  1610		/* Must be either cached or have a count already */
  1611		if (WARN_ON_ONCE(!count && !swp_tb_is_folio(swp_tb)))
  1612			return -ENOENT;
  1613	
  1614		if (likely(count < (SWP_TB_COUNT_MAX - 1))) {
  1615			__swap_table_set(ci, ci_off, __swp_tb_mk_count(swp_tb, count + 1));
  1616			VM_WARN_ON_ONCE(ci->extend_table && ci->extend_table[ci_off]);
  1617		} else if (count == (SWP_TB_COUNT_MAX - 1)) {
  1618			if (ci->extend_table) {
  1619				VM_WARN_ON_ONCE(ci->extend_table[ci_off]);
  1620				ci->extend_table[ci_off] = SWP_TB_COUNT_MAX;
  1621				__swap_table_set(ci, ci_off, __swp_tb_mk_count(swp_tb, SWP_TB_COUNT_MAX));
  1622			} else {
  1623				return -ENOMEM;
  1624			}
  1625		} else if (count == SWP_TB_COUNT_MAX) {
  1626			VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=
> 1627					(BIT(BITS_PER_TYPE(ci->extend_table[0]))) - 1);
  1628			++ci->extend_table[ci_off];
  1629		} else {
  1630			/* Never happens unless counting went wrong */
  1631			WARN_ON_ONCE(1);
  1632		}
  1633	
  1634		return 0;
  1635	}
  1636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
