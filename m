Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11632142E86;
	Wed,  9 Oct 2024 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728447514; cv=none; b=pONiqAWgfuN6XLMrA6DeLO8via1579KrcqmP/zfEoeoMihKTmbtvclyYi1umc046ZS0XhmtZbeOF2rPzJvHFccOCVXGr69IGE6I3I7FHr2Jy9SmDYwXktNSdyuimbVAMx24s5dSCqi7oLWU7cY3w7JqKb7RLZX+bJAUx6uX5jQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728447514; c=relaxed/simple;
	bh=yoWXUzKELCa1ksBE1m9NnlpRMB8vPRwuVFS2etPOcXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO+Tfv0WbxiXZ3K2u/VW5PAlUfImZesf4CA+9zTjqtlZgZ/j2ktspYVu5OJepmS41ysNY3zrJB5koXG9F7nv3lpMYTTvF8MBq0F/+t3VP3LGvR4mFINZpTtpZM1hp5KM3P6wJF27XGDx/o0vUgjaSWuI6AF+RiWFFSMRrrRcTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fw+L4QGI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fw+L4QGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728447513; x=1759983513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yoWXUzKELCa1ksBE1m9NnlpRMB8vPRwuVFS2etPOcXY=;
  b=Fw+L4QGIprCYCJEjbBc66fRI+4TDcnPxF0VYU22zEwffTwuICz/ncJhi
   DTxF+gCs19crbkiG5hAHlxlrwCZRBQ5+aEqhLJx2pkiRZRMCMFfYG3L2e
   5MRR9YGYLDuLJ13Ri+N6bJZn+KYZHVsmzco0B+NNguWXQwrKyjDZjhe2T
   5gmkf3QT51zK67/2vPwoYwtrtTbZvE6yxQsczqzoff4lDs+yo3nsF/hRs
   FVlco5komaAWLwGaNJSQoWWsh601/kPLpHbBLy970Lj77TRzhPfRTXQYP
   79V+uOl081IQcMViA23YWR1XWP9RrrvO5uf4r5AUK3RrCmE7rfkCURyH2
   A==;
X-CSE-ConnectionGUID: S8QhlqzFQZaUtXFUJ+CLLA==
X-CSE-MsgGUID: NwPMn3nYQkWVLi1XsoTYvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27173137"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27173137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 21:18:29 -0700
X-CSE-ConnectionGUID: OBiRs9b/R3aXTMzbTWGMrw==
X-CSE-MsgGUID: SwDcFjEbTfqsS3f1KfH6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80909189"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 21:18:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syO9Y-0008iA-1d;
	Wed, 09 Oct 2024 04:18:24 +0000
Date: Wed, 9 Oct 2024 12:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: fnic: Use vzalloc() instead of vmalloc() and
 memset(0)
Message-ID: <202410091146.J4aNjGEe-lkp@intel.com>
References: <20241008095152.1831-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008095152.1831-2-thorsten.blum@linux.dev>

Hi Thorsten,

kernel test robot noticed the following build errors:

[auto build test ERROR on jejb-scsi/for-next]
[also build test ERROR on mkp-scsi/for-next linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/scsi-fnic-Use-vzalloc-instead-of-vmalloc-and-memset-0/20241008-175453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20241008095152.1831-2-thorsten.blum%40linux.dev
patch subject: [PATCH v2] scsi: fnic: Use vzalloc() instead of vmalloc() and memset(0)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241009/202410091146.J4aNjGEe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091146.J4aNjGEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091146.J4aNjGEe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/fnic/fnic_trace.c:559:27: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'typeof (vzalloc_noprof(size_mul(((1UL) << 12), fnic_fc_trace_max_pages)))' (aka 'void *') [-Wint-conversion]
     559 |         fnic_fc_ctlr_trace_buf_p =
         |                                  ^
     560 |                 vzalloc(array_size(PAGE_SIZE, fnic_fc_trace_max_pages));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +559 drivers/scsi/fnic/fnic_trace.c

abb14148c0f850 Hiral Shah         2014-04-18  537  
abb14148c0f850 Hiral Shah         2014-04-18  538  /*
abb14148c0f850 Hiral Shah         2014-04-18  539   * fnic_fc_ctlr_trace_buf_init -
abb14148c0f850 Hiral Shah         2014-04-18  540   * Initialize trace buffer to log fnic control frames
abb14148c0f850 Hiral Shah         2014-04-18  541   * Description:
abb14148c0f850 Hiral Shah         2014-04-18  542   * Initialize trace buffer data structure by allocating
abb14148c0f850 Hiral Shah         2014-04-18  543   * required memory for trace data as well as for Indexes.
abb14148c0f850 Hiral Shah         2014-04-18  544   * Frame size is 256 bytes and
abb14148c0f850 Hiral Shah         2014-04-18  545   * memory is allocated for 1024 entries of 256 bytes.
abb14148c0f850 Hiral Shah         2014-04-18  546   * Page_offset(Index) is set to the address of trace entry
abb14148c0f850 Hiral Shah         2014-04-18  547   * and page_offset is initialized by adding frame size
abb14148c0f850 Hiral Shah         2014-04-18  548   * to the previous page_offset entry.
abb14148c0f850 Hiral Shah         2014-04-18  549   */
abb14148c0f850 Hiral Shah         2014-04-18  550  
abb14148c0f850 Hiral Shah         2014-04-18  551  int fnic_fc_trace_init(void)
abb14148c0f850 Hiral Shah         2014-04-18  552  {
abb14148c0f850 Hiral Shah         2014-04-18  553  	unsigned long fc_trace_buf_head;
abb14148c0f850 Hiral Shah         2014-04-18  554  	int err = 0;
abb14148c0f850 Hiral Shah         2014-04-18  555  	int i;
abb14148c0f850 Hiral Shah         2014-04-18  556  
abb14148c0f850 Hiral Shah         2014-04-18  557  	fc_trace_max_entries = (fnic_fc_trace_max_pages * PAGE_SIZE)/
abb14148c0f850 Hiral Shah         2014-04-18  558  				FC_TRC_SIZE_BYTES;
42bc47b35320e0 Kees Cook          2018-06-12 @559  	fnic_fc_ctlr_trace_buf_p =
c9ff42f1a76c7b Thorsten Blum      2024-10-08  560  		vzalloc(array_size(PAGE_SIZE, fnic_fc_trace_max_pages));
abb14148c0f850 Hiral Shah         2014-04-18  561  	if (!fnic_fc_ctlr_trace_buf_p) {
abb14148c0f850 Hiral Shah         2014-04-18  562  		pr_err("fnic: Failed to allocate memory for "
abb14148c0f850 Hiral Shah         2014-04-18  563  		       "FC Control Trace Buf\n");
abb14148c0f850 Hiral Shah         2014-04-18  564  		err = -ENOMEM;
abb14148c0f850 Hiral Shah         2014-04-18  565  		goto err_fnic_fc_ctlr_trace_buf_init;
abb14148c0f850 Hiral Shah         2014-04-18  566  	}
abb14148c0f850 Hiral Shah         2014-04-18  567  
abb14148c0f850 Hiral Shah         2014-04-18  568  	/* Allocate memory for page offset */
42bc47b35320e0 Kees Cook          2018-06-12  569  	fc_trace_entries.page_offset =
c9ff42f1a76c7b Thorsten Blum      2024-10-08  570  		vzalloc(array_size(fc_trace_max_entries,
42bc47b35320e0 Kees Cook          2018-06-12  571  				   sizeof(unsigned long)));
abb14148c0f850 Hiral Shah         2014-04-18  572  	if (!fc_trace_entries.page_offset) {
abb14148c0f850 Hiral Shah         2014-04-18  573  		pr_err("fnic:Failed to allocate memory for page_offset\n");
abb14148c0f850 Hiral Shah         2014-04-18  574  		if (fnic_fc_ctlr_trace_buf_p) {
abb14148c0f850 Hiral Shah         2014-04-18  575  			pr_err("fnic: Freeing FC Control Trace Buf\n");
abb14148c0f850 Hiral Shah         2014-04-18  576  			vfree((void *)fnic_fc_ctlr_trace_buf_p);
abb14148c0f850 Hiral Shah         2014-04-18  577  			fnic_fc_ctlr_trace_buf_p = 0;
abb14148c0f850 Hiral Shah         2014-04-18  578  		}
abb14148c0f850 Hiral Shah         2014-04-18  579  		err = -ENOMEM;
abb14148c0f850 Hiral Shah         2014-04-18  580  		goto err_fnic_fc_ctlr_trace_buf_init;
abb14148c0f850 Hiral Shah         2014-04-18  581  	}
abb14148c0f850 Hiral Shah         2014-04-18  582  
abb14148c0f850 Hiral Shah         2014-04-18  583  	fc_trace_entries.rd_idx = fc_trace_entries.wr_idx = 0;
abb14148c0f850 Hiral Shah         2014-04-18  584  	fc_trace_buf_head = fnic_fc_ctlr_trace_buf_p;
abb14148c0f850 Hiral Shah         2014-04-18  585  
abb14148c0f850 Hiral Shah         2014-04-18  586  	/*
abb14148c0f850 Hiral Shah         2014-04-18  587  	* Set up fc_trace_entries.page_offset field with memory location
abb14148c0f850 Hiral Shah         2014-04-18  588  	* for every trace entry
abb14148c0f850 Hiral Shah         2014-04-18  589  	*/
abb14148c0f850 Hiral Shah         2014-04-18  590  	for (i = 0; i < fc_trace_max_entries; i++) {
abb14148c0f850 Hiral Shah         2014-04-18  591  		fc_trace_entries.page_offset[i] = fc_trace_buf_head;
abb14148c0f850 Hiral Shah         2014-04-18  592  		fc_trace_buf_head += FC_TRC_SIZE_BYTES;
abb14148c0f850 Hiral Shah         2014-04-18  593  	}
1dbaa379a41934 Greg Kroah-Hartman 2019-01-22  594  	fnic_fc_trace_debugfs_init();
abb14148c0f850 Hiral Shah         2014-04-18  595  	pr_info("fnic: Successfully Initialized FC_CTLR Trace Buffer\n");
abb14148c0f850 Hiral Shah         2014-04-18  596  	return err;
abb14148c0f850 Hiral Shah         2014-04-18  597  
abb14148c0f850 Hiral Shah         2014-04-18  598  err_fnic_fc_ctlr_trace_buf_init:
abb14148c0f850 Hiral Shah         2014-04-18  599  	return err;
abb14148c0f850 Hiral Shah         2014-04-18  600  }
abb14148c0f850 Hiral Shah         2014-04-18  601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
