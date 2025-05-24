Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B642F24;
	Sat, 24 May 2025 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071113; cv=none; b=TycnzDK3pkuo0DOHkTREuDGDrOnbD8OkyXHLaZgwp3ncZit3HjBVtbV5vDKdMV93uNTYf7V5zpniyppnPpElCuj3KWpj3+rxGV9qMTRkBTtN3fJAW1qh/lKSFgVvfzSvAaEjL6qzgt6pGgce8AlMtBXhPMsIxJxGhynkHHETQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071113; c=relaxed/simple;
	bh=t5TavSZ6J85il8nB00rn7dx7HhiRKXDWahswCYT4ots=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8g9WP9uCYNZG5lAur+KlDaVZM9551c3vhklObNfTIOJgecsPGnB5Fr2Tx4e7cqn8gQgR373wvzdH9rGsf9yELcuIguCR1qXisB974XmnQnFdNfncHnIJHtS9Jfrm9uvfgJaDrSXksYKR3PR/YrLNClwh9ZAsnXeFnVYNn776jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+3FR5ZW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+3FR5ZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748071111; x=1779607111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5TavSZ6J85il8nB00rn7dx7HhiRKXDWahswCYT4ots=;
  b=Q+3FR5ZWhjvDn4iaqBRa6s09Q8U42vVMFrtU50tDK4JCX2f4h4UlE+L9
   WvMyBysj11wXD7CicPIDCw4pGwL03Uoxa4ZgVdW7PNxfuhZ9WSOUN9rbD
   O/jzs7oB49qxsYFp1gSASVjqpPStM9K1oFdPkB4PatcM7di8i/HwQ7hXe
   5bZ6UQIggIwwC7SRDr0Y6tjf0T9fhHDPPzMs9cM+kZ2BxKckdyQtcB3Ko
   kT6QZFJklVkvyqoaFWS9sJuTHsK8w+DFhvKoMwCc0rXNd8D6k36gAp98c
   xJuS79aG+TwTBoFPTZXNLAXllH+vwGHY9CQCQagidLdBH32o6JbkNUe7M
   g==;
X-CSE-ConnectionGUID: 00ZFPwgNRh238x1YTXKboA==
X-CSE-MsgGUID: x02c19uYTyKE35KtmZzV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61473935"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61473935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:18:31 -0700
X-CSE-ConnectionGUID: EQLqxRuOSoqxCxr996kTeQ==
X-CSE-MsgGUID: ii2nzGrbRAyAwiCEif87Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146460445"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2025 00:18:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIj9H-000R12-0L;
	Sat, 24 May 2025 07:18:27 +0000
Date: Sat, 24 May 2025 15:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Francesco Valla <francesco@valla.it>, linux-embedded@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] drivers: misc: add driver for bootstage stash
Message-ID: <202505241547.wVTtLz71-lkp@intel.com>
References: <20250522224223.358881-3-francesco@valla.it>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522224223.358881-3-francesco@valla.it>

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-linus]
[also build test WARNING on robh/for-next linus/master v6.15-rc7]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Valla/drivers-misc-add-driver-for-bootstage-stash/20250523-122757
base:   char-misc/char-misc-linus
patch link:    https://lore.kernel.org/r/20250522224223.358881-3-francesco%40valla.it
patch subject: [PATCH 1/1] drivers: misc: add driver for bootstage stash
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250524/202505241547.wVTtLz71-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241547.wVTtLz71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241547.wVTtLz71-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/bootstage.c:164:24: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     163 |                 dev_err(dev, "invalid declared stash size %u (expected: <= %llu)\n",
         |                                                                            ~~~~
         |                                                                            %u
     164 |                         drvdata->hdr->size, size);
         |                                             ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/bootstage.c:168:4: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     167 |                 dev_err(dev, "invalid calculated stash size %llu (expected: <= %llu)\n",
         |                                                             ~~~~
         |                                                             %u
     168 |                         calc_size, size);
         |                         ^~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/bootstage.c:168:15: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     167 |                 dev_err(dev, "invalid calculated stash size %llu (expected: <= %llu)\n",
         |                                                                                ~~~~
         |                                                                                %u
     168 |                         calc_size, size);
         |                                    ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +164 drivers/misc/bootstage.c

   143	
   144	static int bootstage_parse(struct device *dev, struct bootstage_drvdata *drvdata,
   145				   resource_size_t size)
   146	{
   147		const char *str_ptr = (const char *)(drvdata->records + drvdata->hdr->count);
   148		const resource_size_t calc_size = (resource_size_t)((void *)str_ptr - (void *)drvdata->hdr);
   149		struct bootstage_record *rec;
   150		u32 r;
   151	
   152		// Sanity checks on bootstage header
   153		if (drvdata->hdr->magic != BOOTSTAGE_MAGIC) {
   154			dev_err(dev, "wrong bootstage magic number %08Xh\n", drvdata->hdr->magic);
   155			return -EINVAL;
   156		} else if (drvdata->hdr->version > BOOTSTAGE_MAX_VERSION) {
   157			dev_err(dev, "bootstage version %u not supported\n", drvdata->hdr->version);
   158			return -EOPNOTSUPP;
   159		} else if (drvdata->hdr->size == 0) {
   160			dev_err(dev, "invalid bootstage stash (declared size is zero)\n");
   161			return -EINVAL;
   162		} else if (drvdata->hdr->size > size) {
   163			dev_err(dev, "invalid declared stash size %u (expected: <= %llu)\n",
 > 164				drvdata->hdr->size, size);
   165			return -EINVAL;
   166		} else if (calc_size > size) {
   167			dev_err(dev, "invalid calculated stash size %llu (expected: <= %llu)\n",
   168				calc_size, size);
   169			return -EINVAL;
   170		} else if (drvdata->hdr->count == 0) {
   171			dev_info(dev, "bootstage stash has no records\n");
   172			return 0;
   173		}
   174	
   175		// Set start time to invalid
   176		drvdata->start_time_us = 0xFFFFFFFF;
   177	
   178		// Associate names to records, which are placed at the end of the record area
   179		for (r = 0, rec = drvdata->records; r < drvdata->hdr->count; r++, rec++) {
   180			// Save minimum time, will be used as bootloader enter time
   181			if (rec->start_us < drvdata->start_time_us)
   182				drvdata->start_time_us = rec->time_us;
   183	
   184			// Save maximum time, will be used as bootloader exit time
   185			if (rec->time_us > drvdata->end_time_us)
   186				drvdata->end_time_us = rec->time_us;
   187	
   188			if (str_ptr > ((const char *)drvdata->hdr + size)) {
   189				dev_err(dev, "name for record %u is corrupted\n", r);
   190				return -ENODATA;
   191			}
   192	
   193			rec->name = str_ptr;
   194			str_ptr += strlen(rec->name) + 1;
   195		}
   196	
   197		return 0;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
