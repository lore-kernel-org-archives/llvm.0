Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC417588;
	Sat, 13 Apr 2024 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713012405; cv=none; b=enFELz5w20zqVif8bUDegW0BBsMgIHHgpjxQ4MCcj42UC5wskspL4Vz9e//xfuyzhFgwtxn/gtyQzA87L6aVq/C883tK85jDwj2vlqY/GEoQCJKF81gwB40X/iazllS6WSJwNu1TB052qK+Wd24v9ARTW3iuOXOv4jIVINVtUJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713012405; c=relaxed/simple;
	bh=Ws69FffE8xqfnv1+sklH0b291ABSQPR7ZRmm94DMIkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPYrV03HkPnsg6k4PW6ip+TiDP1elZHimPGSr1x14z8HOUr0D8C96AdW4LeiuWI1CW8CM5NGheygr/xW3LmY91R2zhWr49a65WmkXLXHcYK3Kq+bLSjVslDxLr1YquKE95mkSv03AltQqTxRVGDNUg5jh8IuMOdlxBIDotLT5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eip9JbrA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eip9JbrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713012403; x=1744548403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ws69FffE8xqfnv1+sklH0b291ABSQPR7ZRmm94DMIkQ=;
  b=eip9JbrAr+yWOgkJZnbX9vuUkgpzbuh9tN8gR8W9w66S7BHUzv89nL8z
   UkQYF3Jq2vrkRPEsmEr7beP8+gm5mCws3N6x6EUNhvYWljSNGGSvJOL2M
   ediuBPvpBKi9AZjhsCnwM8KqqbEEAn2GR8xuHszbz4XhO8PWAmsA0cv0D
   6dzSGMnLdBiA/3w/5FwDVlPljRIhP1x7FgWcm2P3QRaBBvSM1+tPJXdAv
   ruHsTRbKNYKTyhnb1vjosGMghpM15Iivw76ofzhfvfxbiQkgt4D3cmTKc
   whh4es8/rknvW/1p5Hkuz1MZQquLfH5hx0GQQPJKS/jB74br0+ibcb0l7
   w==;
X-CSE-ConnectionGUID: kQueLDzhSkafHerxcPRtdA==
X-CSE-MsgGUID: 1nvBzGyHR+KEHvidIqWqxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8567124"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="8567124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 05:46:43 -0700
X-CSE-ConnectionGUID: SLFJGOI1RiCDdDudmK5uXA==
X-CSE-MsgGUID: 7Mfx9/eKTJmD2bj2afXb6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="58900858"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Apr 2024 05:46:42 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvcmF-0002XZ-14;
	Sat, 13 Apr 2024 12:46:39 +0000
Date: Sat, 13 Apr 2024 20:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 427/438]
 drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Function parameter or
 struct member 'iocb' not described in 'zynqmp_pm_debugfs_api_write'
Message-ID: <202404132052.QTmdhOwq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   320301899c4ff72871d71dd55bebea97f4a3a63e
commit: 364564d3dba6ce3f6aca6b7702c55df53a27ec5b [427/438] firmware: xilinx: convert to read/write iterators
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240413/202404132052.QTmdhOwq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404132052.QTmdhOwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404132052.QTmdhOwq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Function parameter or struct member 'iocb' not described in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Function parameter or struct member 'from' not described in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Excess function parameter 'file' description in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Excess function parameter 'ptr' description in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Excess function parameter 'len' description in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:148: warning: Excess function parameter 'off' description in 'zynqmp_pm_debugfs_api_write'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Function parameter or struct member 'iocb' not described in 'zynqmp_pm_debugfs_api_read'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Function parameter or struct member 'to' not described in 'zynqmp_pm_debugfs_api_read'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Excess function parameter 'file' description in 'zynqmp_pm_debugfs_api_read'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Excess function parameter 'ptr' description in 'zynqmp_pm_debugfs_api_read'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Excess function parameter 'len' description in 'zynqmp_pm_debugfs_api_read'
>> drivers/firmware/xilinx/zynqmp-debug.c:206: warning: Excess function parameter 'off' description in 'zynqmp_pm_debugfs_api_read'


vim +148 drivers/firmware/xilinx/zynqmp-debug.c

b321725257c173 Rajan Vaja 2018-09-12  131  
b321725257c173 Rajan Vaja 2018-09-12  132  /**
b321725257c173 Rajan Vaja 2018-09-12  133   * zynqmp_pm_debugfs_api_write() - debugfs write function
b321725257c173 Rajan Vaja 2018-09-12  134   * @file:	User file
b321725257c173 Rajan Vaja 2018-09-12  135   * @ptr:	User entered PM-API string
b321725257c173 Rajan Vaja 2018-09-12  136   * @len:	Length of the userspace buffer
b321725257c173 Rajan Vaja 2018-09-12  137   * @off:	Offset within the file
b321725257c173 Rajan Vaja 2018-09-12  138   *
b321725257c173 Rajan Vaja 2018-09-12  139   * Used for triggering pm api functions by writing
b321725257c173 Rajan Vaja 2018-09-12  140   * echo <pm_api_id>	> /sys/kernel/debug/zynqmp_pm/power or
b321725257c173 Rajan Vaja 2018-09-12  141   * echo <pm_api_name>	> /sys/kernel/debug/zynqmp_pm/power
b321725257c173 Rajan Vaja 2018-09-12  142   *
b321725257c173 Rajan Vaja 2018-09-12  143   * Return: Number of bytes copied if PM-API request succeeds,
b321725257c173 Rajan Vaja 2018-09-12  144   *	   the corresponding error code otherwise
b321725257c173 Rajan Vaja 2018-09-12  145   */
364564d3dba6ce Jens Axboe 2024-04-09  146  static ssize_t zynqmp_pm_debugfs_api_write(struct kiocb *iocb,
364564d3dba6ce Jens Axboe 2024-04-09  147  					   struct iov_iter *from)
b321725257c173 Rajan Vaja 2018-09-12 @148  {
b321725257c173 Rajan Vaja 2018-09-12  149  	char *kern_buff, *tmp_buff;
b321725257c173 Rajan Vaja 2018-09-12  150  	char *pm_api_req;
b321725257c173 Rajan Vaja 2018-09-12  151  	u32 pm_id = 0;
b321725257c173 Rajan Vaja 2018-09-12  152  	u64 pm_api_arg[4] = {0, 0, 0, 0};
b321725257c173 Rajan Vaja 2018-09-12  153  	/* Return values from PM APIs calls */
b321725257c173 Rajan Vaja 2018-09-12  154  	u32 pm_api_ret[4] = {0, 0, 0, 0};
364564d3dba6ce Jens Axboe 2024-04-09  155  	size_t len = iov_iter_count(from);
b321725257c173 Rajan Vaja 2018-09-12  156  
b321725257c173 Rajan Vaja 2018-09-12  157  	int ret;
b321725257c173 Rajan Vaja 2018-09-12  158  	int i = 0;
b321725257c173 Rajan Vaja 2018-09-12  159  
b321725257c173 Rajan Vaja 2018-09-12  160  	strcpy(debugfs_buf, "");
b321725257c173 Rajan Vaja 2018-09-12  161  
364564d3dba6ce Jens Axboe 2024-04-09  162  	if (iocb->ki_pos != 0 || len <= 1 || len > PAGE_SIZE - 1)
b321725257c173 Rajan Vaja 2018-09-12  163  		return -EINVAL;
b321725257c173 Rajan Vaja 2018-09-12  164  
364564d3dba6ce Jens Axboe 2024-04-09  165  	kern_buff = iterdup(from, len);
b9472f7d822446 Jann Horn  2019-02-18  166  	if (IS_ERR(kern_buff))
b9472f7d822446 Jann Horn  2019-02-18  167  		return PTR_ERR(kern_buff);
b321725257c173 Rajan Vaja 2018-09-12  168  	tmp_buff = kern_buff;
b321725257c173 Rajan Vaja 2018-09-12  169  
b321725257c173 Rajan Vaja 2018-09-12  170  	/* Read the API name from a user request */
b321725257c173 Rajan Vaja 2018-09-12  171  	pm_api_req = strsep(&kern_buff, " ");
b321725257c173 Rajan Vaja 2018-09-12  172  
b321725257c173 Rajan Vaja 2018-09-12  173  	ret = get_pm_api_id(pm_api_req, &pm_id);
b321725257c173 Rajan Vaja 2018-09-12  174  	if (ret < 0)
b321725257c173 Rajan Vaja 2018-09-12  175  		goto err;
b321725257c173 Rajan Vaja 2018-09-12  176  
b321725257c173 Rajan Vaja 2018-09-12  177  	/* Read node_id and arguments from the PM-API request */
b321725257c173 Rajan Vaja 2018-09-12  178  	pm_api_req = strsep(&kern_buff, " ");
b321725257c173 Rajan Vaja 2018-09-12  179  	while ((i < ARRAY_SIZE(pm_api_arg)) && pm_api_req) {
b321725257c173 Rajan Vaja 2018-09-12  180  		pm_api_arg[i++] = zynqmp_pm_argument_value(pm_api_req);
b321725257c173 Rajan Vaja 2018-09-12  181  		pm_api_req = strsep(&kern_buff, " ");
b321725257c173 Rajan Vaja 2018-09-12  182  	}
b321725257c173 Rajan Vaja 2018-09-12  183  
b321725257c173 Rajan Vaja 2018-09-12  184  	ret = process_api_request(pm_id, pm_api_arg, pm_api_ret);
b321725257c173 Rajan Vaja 2018-09-12  185  
b321725257c173 Rajan Vaja 2018-09-12  186  err:
b321725257c173 Rajan Vaja 2018-09-12  187  	kfree(tmp_buff);
b321725257c173 Rajan Vaja 2018-09-12  188  	if (ret)
b321725257c173 Rajan Vaja 2018-09-12  189  		return ret;
b321725257c173 Rajan Vaja 2018-09-12  190  
b321725257c173 Rajan Vaja 2018-09-12  191  	return len;
b321725257c173 Rajan Vaja 2018-09-12  192  }
b321725257c173 Rajan Vaja 2018-09-12  193  
b321725257c173 Rajan Vaja 2018-09-12  194  /**
b321725257c173 Rajan Vaja 2018-09-12  195   * zynqmp_pm_debugfs_api_read() - debugfs read function
b321725257c173 Rajan Vaja 2018-09-12  196   * @file:	User file
b321725257c173 Rajan Vaja 2018-09-12  197   * @ptr:	Requested pm_api_version string
b321725257c173 Rajan Vaja 2018-09-12  198   * @len:	Length of the userspace buffer
b321725257c173 Rajan Vaja 2018-09-12  199   * @off:	Offset within the file
b321725257c173 Rajan Vaja 2018-09-12  200   *
b321725257c173 Rajan Vaja 2018-09-12  201   * Return: Length of the version string on success
b321725257c173 Rajan Vaja 2018-09-12  202   *	   else error code
b321725257c173 Rajan Vaja 2018-09-12  203   */
364564d3dba6ce Jens Axboe 2024-04-09  204  static ssize_t zynqmp_pm_debugfs_api_read(struct kiocb *iocb,
364564d3dba6ce Jens Axboe 2024-04-09  205  					  struct iov_iter *to)
b321725257c173 Rajan Vaja 2018-09-12 @206  {
364564d3dba6ce Jens Axboe 2024-04-09  207  	return simple_copy_to_iter(debugfs_buf, &iocb->ki_pos,
364564d3dba6ce Jens Axboe 2024-04-09  208  				       strlen(debugfs_buf), to);
b321725257c173 Rajan Vaja 2018-09-12  209  }
b321725257c173 Rajan Vaja 2018-09-12  210  

:::::: The code at line 148 was first introduced by commit
:::::: b321725257c17335b6a8388530366caa2c581084 firmware: xilinx: Add debugfs interface

:::::: TO: Rajan Vaja <rajanv@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
