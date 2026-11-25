Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620864;
	b=hBlGAqvy2NaXSxbj2Rzh8a4QMjmw3WB2S4JtjcYS3edvF6sOVlgE1r6KCUqNlFCOboC4
	 FTbswa5w/PCK2ft2v45BUfJcFaJJshdKmx/RDAz6VHtg5+WWFqe2K+H5hisg7AL/ngOYS
	 OwMiQ4hHlNeq7llLi2cV4cA9a2LLSSG3k2JfhJt9GN8Xs3yQcj1HFdyK9oAlBtXvjkQ5G
	 vqMEqfejzKXUgZaRxyqp0OO5McNSXzRlS5jDVFDELSDTomkm/4shuYt03ZHA3poPz5w5E
	 R/jlXzOH2qQANlTUemjXbDmdqUbFoaOBFGD4KAlFlvJBIAmQyHy5cxzMMl/aw7JT7MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620864;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=25JXtbAlt2tLMVRfj7TuB23TMvAKMBRElClbTOOQe0U=;
	b=Ay05AEolkHh+k1GRt+P3b4dxE34fzeSikJk9ivjM7GeBydZaEftBcv+em/FVYgwwB7iR
	 jrExn9oDQchfDuQu4eZD8KJpeR1YTgaSHftdkE1Gus+xWCuTB7bF0jExKqrGh3Wy1QdRd
	 GCseFlGUy4fMdb/Dd6rtCDwvngW7j24J6odMFv8aD2yquGgm1VMDZrlpYEdG0WiK3rcG5
	 ieey7OCPmJSm8uXBI2jcCvwmM74ex3PkyObKZ1+3LyyMP2vnpwYvKjtUWKpXLLM1YvfC1
	 fDrV3z2JJve3ROPf0yTUYGNKAHDNurkSRDJGtk2eYuqJXoM0PH0kDPVd0q/vRN7aCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lkXkuPF5;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D6606A323;
	Wed, 25 Nov 2026 15:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lkXkuPF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620863; x=1827156863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BV2RRGKOn1EadqDTDRoU+tQK6IX9SzMJtTECBKgt5K8=;
  b=lkXkuPF5TkCAKLUari7Yhp1juJwVvRisbtqbx7PzgI94mEsr+8hHev0B
   KXqjOtixqzh/SKxHhGRNieFe9L/mPtzyptanqhlYP8oKPnIeRxcAi7oQ7
   /xFhk31wHkJQPuNOTHwgEvMuH7zCPJng7CFTdJJMN+/1dXA/JRK9CKhXN
   dlnIN/BiXk4rIB3jD/cvR72JkPOXvv/dl44ySG1f25pKpf5KSyD15DHK7
   glZ+ceDlekwVnFAWgjVmVLrp7Px9eZu2TkGLXaPz+xzyGoGkC7sz4+KX2
   Jbt6FdD5Pw8Aww1YYOP68KQ4PCgbKJkuzWPqxvvRdMRTPJ387GjZkMYk5
   w==;
X-CSE-ConnectionGUID: 6/JEkkCTStOJsabcFFALWA==
X-CSE-MsgGUID: CMBWHuVFSFunwR6h9FlcYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4407526"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4407526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:21:16 -0800
X-CSE-ConnectionGUID: Q+pQqTcHT0SgFJ9GdqkMqg==
X-CSE-MsgGUID: dF/d+D2RQNSKY8+qV++DWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12217261"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Nov 2026 07:20:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWEni-00000001RvW-3MHv;
	Wed, 25 Nov 2026 15:20:50 +0000
Date: Wed, 25 Nov 2026 23:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin@huaweicloud.com>, tytso@mit.edu, adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jack@suse.cz
Subject: Re: [PATCH v2 2/2] ext4: protect ext4_acquire_dquot against freezing
Message-ID: <20261125231648.ZdN8QBCN-lkp@intel.com>
References: <20261125111055.3672233-3-yebin@huaweicloud.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125111055.3672233-3-yebin@huaweicloud.com>

Hi Ye,

kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v7.4-rc4]
[cannot apply to brauner-vfs/vfs.all next-20261124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Bin/quota-Forbid-Q_XGETQUOTA-and-Q_XGETNEXTQUOTA-for-frozen-filesystem/20261125-191054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20261125111055.3672233-3-yebin%40huaweicloud.com
patch subject: [PATCH v2 2/2] ext4: protect ext4_acquire_dquot against freezing
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20261125/20261125231648.ZdN8QBCN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125231648.ZdN8QBCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125231648.ZdN8QBCN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ext4/super.c:7165:6: error: use of undeclared identifier 'freeze_protected'; did you mean 'freeze_processes'?
    7165 |         if (freeze_protected)
         |             ^~~~~~~~~~~~~~~~
         |             freeze_processes
   include/linux/freezer.h:84:19: note: 'freeze_processes' declared here
      84 | static inline int freeze_processes(void) { return -ENOSYS; }
         |                   ^
>> fs/ext4/super.c:7165:6: warning: address of function 'freeze_processes' will always evaluate to 'true' [-Wpointer-bool-conversion]
    7165 |         if (freeze_protected)
         |         ~~  ^~~~~~~~~~~~~~~~
   fs/ext4/super.c:7165:6: note: prefix with the address-of operator to silence this warning
    7165 |         if (freeze_protected)
         |             ^
         |             &
   1 warning and 1 error generated.


vim +7165 fs/ext4/super.c

  7144	
  7145	static int ext4_write_dquot(struct dquot *dquot)
  7146	{
  7147		int ret, err;
  7148		handle_t *handle;
  7149		struct inode *inode;
  7150	
  7151		inode = dquot_to_inode(dquot);
  7152		handle = ext4_journal_start(inode, EXT4_HT_QUOTA,
  7153					    EXT4_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
  7154		if (IS_ERR(handle))
  7155			return PTR_ERR(handle);
  7156		ret = dquot_commit(dquot);
  7157		if (ret < 0)
  7158			ext4_error_err(dquot->dq_sb, -ret,
  7159				       "Failed to commit dquot type %d",
  7160				       dquot->dq_id.type);
  7161		err = ext4_journal_stop(handle);
  7162		if (!ret)
  7163			ret = err;
  7164	
> 7165		if (freeze_protected)
  7166			sb_end_intwrite(dquot->dq_sb);
  7167	
  7168		return ret;
  7169	}
  7170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
