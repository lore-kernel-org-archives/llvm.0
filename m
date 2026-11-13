Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530243;
	b=F+u+BviT1M4y4vhWD3J2ecBHdvWPI3vnH45qA4mJKWSjqsJzrDLlC6TciF5MuJ9SUgAo
	 6tMSV5djJgfDDgfNq8fHt23C+2SyDlwfLUJLebNFRwTR9Wl02wCrHV+rCXJ9VIs8LbapR
	 1Kiecl971vT1lKYvWPRX+fcCyN2qoA5OFv8hBFMATy/I3VTnnqSkDRxg/aQM76rk/RFcw
	 GdyCfTih1fXaqCfuBg9WmH8SCflx3k5KJOMXOoRzvwmLgapA0tQ+yi8dZh3iOYp7XdTNZ
	 BLRqQ0zOmvAYrqrfu74rNDPy9gZ49B4Z1wg5Mcnn3tgXvd8V8YHGq+CcaCZGv9WCZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530243;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l7MhL6IcO7Jrgv5XFQU6sPXtGn5wO987cBmV16uz/QE=;
	b=TAUzVB/nEf6BKRI32b+kq1giEXj1s7k1Ak8UvTwbmpYVjkOw0w8F6x8+OlKNj6N4Que0
	 PCNeZhJhF4RqFiZj7tDFsm6fIMO38q+YK+NVgtKr8EUFYEp1blA2BYt6itFntAPQWZXJt
	 Pf575O0ZtfkdhVBUtQKwTFgR5PEH3Z7Wd14SS+aT+TEC5KiuaatwK16D8zuVooe8fxfcV
	 E6aigtVq6FnPECdBJEBAeciwjaWvsgvV51zE/WNqJT9wEPJIWEQEc/fk0Ae1422P+FV+k
	 aXzjpoYCO6FYbJvSCcxLBEBaqrfpO2DnKVx+mzFt6k51yU+bT22tS0//Jvt6l9yYlqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Hc9o/Wfl";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B1606B554;
	Fri, 13 Nov 2026 00:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198B1606B554
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hc9o/Wfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530243; x=1826066243;
  h=date:from:to:cc:subject:message-id;
  bh=RTEs1gc2pp2CktgztcuHQmscz2g/1ZoJzZXArKEY+8k=;
  b=Hc9o/WflDKfbHxsqLvaEK47hGob04gMaZLYKST+yhGEIzlnbrMK9fTQm
   uEMk+cG5lX1RYjlCJ2528Ng8Vj3+TvMWuS0PrF19jSwHZ5rVmLqCDkneo
   8IO2RgN0oAJDxh98L5wbSD50YlEQFyfYNhUEZvjwgiEQkSCREhYP7v8ll
   TjR3EllLyovAhIrcMwtRqbZxgHMM6RBGot6fZCVuhmXbnEhLHa9bhraj5
   NZflCrV1SbwEbALNe7ypLyzK8i4d32iZaaaCrPF+jNe5/LOcYRXdya5zK
   k+7Fi/gGAYQq+OLEcyK9tasxFzos9xhMP7Cw19EB3Ii1faknpgxyjO6z+
   A==;
X-CSE-ConnectionGUID: nFdLDyP3Q+SXMYxx761uIg==
X-CSE-MsgGUID: pm4bNQQrRBKoi8WeTKBymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3328845"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3328845"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:37:23 -0800
X-CSE-ConnectionGUID: KHM2znktQ9akuiNdtdWGSA==
X-CSE-MsgGUID: UnuxrdfESvGTN+GTrqP3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8866386"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2026 16:37:21 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfI6-000000012Ej-12OM;
	Fri, 13 Nov 2026 00:37:18 +0000
Date: Fri, 13 Nov 2026 08:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 1192/1490]
 drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202611130817.iOSit0sS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   964e4db09c78beb79bace2b636061cb3261b0512
commit: aca361011ad63d263f0022639c724c45866489c8 [1192/1490] drm: xlnx: bridge: fix debugfs command parsing
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130817.iOSit0sS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130817.iOSit0sS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130817.iOSit0sS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     366 |                 if (w && h && bus_fmt) {
         |                     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:372:7: note: uninitialized use occurs here
     372 |                 if (ret) {
         |                     ^~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:366:3: note: remove the 'if' if its condition is always true
     366 |                 if (w && h && bus_fmt) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     366 |                 if (w && h && bus_fmt) {
         |                     ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:372:7: note: uninitialized use occurs here
     372 |                 if (ret) {
         |                     ^~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: note: remove the '&&' if its condition is always true
     366 |                 if (w && h && bus_fmt) {
         |                     ^~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     366 |                 if (w && h && bus_fmt) {
         |                     ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:372:7: note: uninitialized use occurs here
     372 |                 if (ret) {
         |                     ^~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:366:7: note: remove the '&&' if its condition is always true
     366 |                 if (w && h && bus_fmt) {
         |                     ^~~~
   drivers/gpu/drm/xlnx/xlnx_bridge.c:359:10: note: initialize the variable 'ret' to silence this warning
     359 |                 int ret;
         |                        ^
         |                         = 0
   3 warnings generated.


vim +366 drivers/gpu/drm/xlnx/xlnx_bridge.c

49e728aa293130f Hyun Kwon       2018-01-23  332  
49e728aa293130f Hyun Kwon       2018-01-23  333  static ssize_t xlnx_bridge_debugfs_write(struct file *f, const char __user *buf,
49e728aa293130f Hyun Kwon       2018-01-23  334  					 size_t size, loff_t *pos)
49e728aa293130f Hyun Kwon       2018-01-23  335  {
49e728aa293130f Hyun Kwon       2018-01-23  336  	struct xlnx_bridge *bridge = f->f_inode->i_private;
aca361011ad63d2 Rohit Visavalia 2026-09-01  337  	char *cmd;
49e728aa293130f Hyun Kwon       2018-01-23  338  
49e728aa293130f Hyun Kwon       2018-01-23  339  	if (*pos != 0 || size <= 0)
49e728aa293130f Hyun Kwon       2018-01-23  340  		return -EINVAL;
49e728aa293130f Hyun Kwon       2018-01-23  341  
49e728aa293130f Hyun Kwon       2018-01-23  342  	cmd = kzalloc(size, GFP_KERNEL);
49e728aa293130f Hyun Kwon       2018-01-23  343  	if (!cmd)
49e728aa293130f Hyun Kwon       2018-01-23  344  		return -ENOMEM;
49e728aa293130f Hyun Kwon       2018-01-23  345  
aca361011ad63d2 Rohit Visavalia 2026-09-01  346  	cmd = memdup_user_nul(buf, size);
aca361011ad63d2 Rohit Visavalia 2026-09-01  347  	if (IS_ERR(cmd)) {
49e728aa293130f Hyun Kwon       2018-01-23  348  		kfree(cmd);
aca361011ad63d2 Rohit Visavalia 2026-09-01  349  		return PTR_ERR(cmd);
49e728aa293130f Hyun Kwon       2018-01-23  350  	}
49e728aa293130f Hyun Kwon       2018-01-23  351  
aca361011ad63d2 Rohit Visavalia 2026-09-01  352  	if (sysfs_streq(cmd, "enable")) {
aca361011ad63d2 Rohit Visavalia 2026-09-01  353  		xlnx_bridge_enable(bridge);
aca361011ad63d2 Rohit Visavalia 2026-09-01  354  	} else if (sysfs_streq(cmd, "disable")) {
aca361011ad63d2 Rohit Visavalia 2026-09-01  355  		xlnx_bridge_disable(bridge);
aca361011ad63d2 Rohit Visavalia 2026-09-01  356  	} else if (str_has_prefix(cmd, "set_input")) {
aca361011ad63d2 Rohit Visavalia 2026-09-01  357  		char *w, *h, *bus_fmt, *tmp;
aca361011ad63d2 Rohit Visavalia 2026-09-01  358  		u32 width = 0, height = 0, fmt = 0;
aca361011ad63d2 Rohit Visavalia 2026-09-01  359  		int ret;
aca361011ad63d2 Rohit Visavalia 2026-09-01  360  
aca361011ad63d2 Rohit Visavalia 2026-09-01  361  		tmp = cmd;
aca361011ad63d2 Rohit Visavalia 2026-09-01  362  		strsep(&tmp, " ");
aca361011ad63d2 Rohit Visavalia 2026-09-01  363  		w = strsep(&tmp, " ");
aca361011ad63d2 Rohit Visavalia 2026-09-01  364  		h = strsep(&tmp, " ");
aca361011ad63d2 Rohit Visavalia 2026-09-01  365  		bus_fmt = strsep(&tmp, " ");
49e728aa293130f Hyun Kwon       2018-01-23 @366  		if (w && h && bus_fmt) {
49e728aa293130f Hyun Kwon       2018-01-23  367  			ret = kstrtouint(w, 0, &width);
49e728aa293130f Hyun Kwon       2018-01-23  368  			ret |= kstrtouint(h, 0, &height);
49e728aa293130f Hyun Kwon       2018-01-23  369  			ret |= kstrtouint(bus_fmt, 0, &fmt);
49e728aa293130f Hyun Kwon       2018-01-23  370  		}
49e728aa293130f Hyun Kwon       2018-01-23  371  
49e728aa293130f Hyun Kwon       2018-01-23  372  		if (ret) {
49e728aa293130f Hyun Kwon       2018-01-23  373  			pr_err("%s %d invalid command: %s\n",
aca361011ad63d2 Rohit Visavalia 2026-09-01  374  			       __func__, __LINE__, cmd);
49e728aa293130f Hyun Kwon       2018-01-23  375  			return -EINVAL;
49e728aa293130f Hyun Kwon       2018-01-23  376  		}
49e728aa293130f Hyun Kwon       2018-01-23  377  		xlnx_bridge_set_input(bridge, width, height, fmt);
49e728aa293130f Hyun Kwon       2018-01-23  378  	}
49e728aa293130f Hyun Kwon       2018-01-23  379  
aca361011ad63d2 Rohit Visavalia 2026-09-01  380  	kfree(cmd);
49e728aa293130f Hyun Kwon       2018-01-23  381  	return size;
49e728aa293130f Hyun Kwon       2018-01-23  382  }
49e728aa293130f Hyun Kwon       2018-01-23  383  

:::::: The code at line 366 was first introduced by commit
:::::: 49e728aa293130f0265670e3c92bc9bfd780bb85 drm: xlnx: drv: Add Xilinx bridge support

:::::: TO: Hyun Kwon <hyun.kwon@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
