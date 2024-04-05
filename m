Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28408339A8;
	Fri,  5 Apr 2024 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712358913; cv=none; b=ZpNbTF4bVXXq5NqaSbuNMMMCuX0Hc5IEs4f1J712OLLdKl56adyhUfHt/lOMhIWbu2BcJCUJRK62zaPTWJfSaWMhabR1LfjI0W6Us5QC7SvRv/0jaAhu/HT1I3e4bVhhb5WXTe8QR1DY9Klw9FN5Cw+DqxLFN8ijA56E97uHfZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712358913; c=relaxed/simple;
	bh=C1O9VZnScaqkNB0JJ20d8b5E01/VrnEywyvofbh4XMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUqUlqan4fwsRy29/BcUjBzx2ENdrJn1QQoXIaE5ZGLERQxEAcVFbdClSYDAs91L2xiJG5vVs6MRHT/gDb9BGgPsJaajZbBuBl4i0J8hgbBI3gQwAFhZYbaOHYcCzCMDKutIhrc+QqaYPbonu4TaplyYlSzkDGKnNn/eEa5z500=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/LcjBOd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/LcjBOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712358911; x=1743894911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1O9VZnScaqkNB0JJ20d8b5E01/VrnEywyvofbh4XMI=;
  b=E/LcjBOdzfQzKWaqRDjXYo5Do7O3hi3HZfMeFTr/2RlsTb7omae0D1GZ
   mwd/xDkhExZd489zu4FA9WRuLUH/FYVryLz+I6sCrQ7+/sYDPcbUFmJhF
   ViYiwsKnFQOpxjcvXJWI03yyfkSE9jSKTy8DfwDAS7KRFFh+JLVXN1Ecl
   dsRSlcAGBL+4rMxbrDnhT1j8+IFemkAAwKgupMIyYeFxfSi5mKor3TRmL
   GFiD6cu8Ttji/3LXWbbPPUDKBpf3aoECDqJXE3ZZacB8yPMk7GYFqUxph
   +eligWPLPWgT/QtNAOYODZFTyXTrKf9PDg4BwfJI8aJT7vcsyYPiwHBsx
   g==;
X-CSE-ConnectionGUID: zS2jUK/5RimAktP+kKT6mw==
X-CSE-MsgGUID: WxqcmTW6Qz2dC66aEnEYtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19142148"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19142148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 16:15:11 -0700
X-CSE-ConnectionGUID: jGKWSQFQTc2G2kQiGsHuCA==
X-CSE-MsgGUID: DrVfDeLBSk2XMOXWRFFEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19156157"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Apr 2024 16:15:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rssm2-0002qq-2p;
	Fri, 05 Apr 2024 23:15:06 +0000
Date: Sat, 6 Apr 2024 07:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:large_mapcount 24/27] fs/proc/page.c:73:23: error:
 use of undeclared identifier 'page'; did you mean 'ppage'?
Message-ID: <202404060712.jTR2otML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux large_mapcount
head:   7e8a03fbcd6b8b5a7e2b6ea60f620c5d816cb44b
commit: efed85936fb7a152c58898dce59efa55105f78f9 [24/27] fs/proc/page: expose folio_mapcount() instead of page_mapcount()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060712.jTR2otML-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060712.jTR2otML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060712.jTR2otML-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/page.c:73:23: error: use of undeclared identifier 'page'; did you mean 'ppage'?
                           folio = page_folio(page);
                                              ^~~~
                                              ppage
   include/linux/page-flags.h:267:35: note: expanded from macro 'page_folio'
   #define page_folio(p)           (_Generic((p),                          \
                                              ^
   fs/proc/page.c:51:15: note: 'ppage' declared here
           struct page *ppage;
                        ^
>> fs/proc/page.c:73:23: error: use of undeclared identifier 'page'; did you mean 'ppage'?
                           folio = page_folio(page);
                                              ^~~~
                                              ppage
   include/linux/page-flags.h:268:60: note: expanded from macro 'page_folio'
           const struct page *:    (const struct folio *)_compound_head(p), \
                                                                        ^
   fs/proc/page.c:51:15: note: 'ppage' declared here
           struct page *ppage;
                        ^
>> fs/proc/page.c:73:23: error: use of undeclared identifier 'page'; did you mean 'ppage'?
                           folio = page_folio(page);
                                              ^~~~
                                              ppage
   include/linux/page-flags.h:269:49: note: expanded from macro 'page_folio'
           struct page *:          (struct folio *)_compound_head(p)))
                                                                  ^
   fs/proc/page.c:51:15: note: 'ppage' declared here
           struct page *ppage;
                        ^
>> fs/proc/page.c:74:28: error: use of undeclared identifier 'dolio'; did you mean 'folio'?
                           pcount = folio_mapcount(dolio);
                                                   ^~~~~
                                                   folio
   fs/proc/page.c:50:16: note: 'folio' declared here
           struct folio *folio;
                         ^
   4 errors generated.


vim +73 fs/proc/page.c

    39	
    40	/* /proc/kpagecount - an array exposing page counts
    41	 *
    42	 * Each entry is a u64 representing the corresponding
    43	 * physical page count.
    44	 */
    45	static ssize_t kpagecount_read(struct file *file, char __user *buf,
    46				     size_t count, loff_t *ppos)
    47	{
    48		const unsigned long max_dump_pfn = get_max_dump_pfn();
    49		u64 __user *out = (u64 __user *)buf;
    50		struct folio *folio;
    51		struct page *ppage;
    52		unsigned long src = *ppos;
    53		unsigned long pfn;
    54		ssize_t ret = 0;
    55		u64 pcount;
    56	
    57		pfn = src / KPMSIZE;
    58		if (src & KPMMASK || count & KPMMASK)
    59			return -EINVAL;
    60		if (src >= max_dump_pfn * KPMSIZE)
    61			return 0;
    62		count = min_t(unsigned long, count, (max_dump_pfn * KPMSIZE) - src);
    63	
    64		while (count > 0) {
    65			/*
    66			 * TODO: ZONE_DEVICE support requires to identify
    67			 * memmaps that were actually initialized.
    68			 */
    69			ppage = pfn_to_online_page(pfn);
    70	
    71			pcount = 0;
    72			if (ppage) {
  > 73				folio = page_folio(page);
  > 74				pcount = folio_mapcount(dolio);
    75			}
    76	
    77			if (put_user(pcount, out)) {
    78				ret = -EFAULT;
    79				break;
    80			}
    81	
    82			pfn++;
    83			out++;
    84			count -= KPMSIZE;
    85	
    86			cond_resched();
    87		}
    88	
    89		*ppos += (char __user *)out - buf;
    90		if (!ret)
    91			ret = (char __user *)out - buf;
    92		return ret;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
