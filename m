Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD218F2FD;
	Sun, 22 Dec 2024 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734905624; cv=none; b=p1XLofUaeUY5M2aDoCYnCmRmZYmy4eE+vDMM5dRvTgdMsn8KdyFncoomZO6rrS/07R/20eiEkoAZC50Wc24VDEpyGw04XoNrtC6Vbg4N3/1wGIvPaxM3AJocjKAByoWxs9bP84qfDOGbYZOKxLLIVPh+fvVigzbHN/SM5Qq/ubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734905624; c=relaxed/simple;
	bh=dIyInAyBn5VgqyGLXSrE9uvHnGelyxEAItFMCSxM63k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ae5G4nGmltccZ4g05abiKTfybt/V3q0wtsR2kAdWSjjh9TywVBrFGzXCfLvuh5wI8W0oOAmstHIsbdQLIvQQ6MCy3d7S8XdggcLBRdNnYJqnIIf/5a+nkVjCUFGntbXyvcGDeN5ybpSZbFCjS7j7OERcwNFeFoUD89jGLNkeCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnP2xxMD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnP2xxMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734905622; x=1766441622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIyInAyBn5VgqyGLXSrE9uvHnGelyxEAItFMCSxM63k=;
  b=TnP2xxMD4Z2+0bCZGgFXZNJcUUOqfyI4hhoYR4DqYKIi0L51WGviU3fq
   VtOD4QbA60n+Vl8KDFt3MH+jOdU7wOPR7bHZeJIVhJIVljDESjl5WCysF
   pcObOELSBi5+rkbeyKzsphGw+4l+lqlS+OyeSXGKRzCfS65AQx+S4MWQ2
   nx5fQOk0ZXdXxP6EfLVGYmUwGIFdljiCzElnfnaRPVf6v0NhQKe4wtjik
   7hNE2G7D9MnzwFxIiI9OhSh1d/6bu7wMsFYam26ZZmjhz2uj9lUO+V6O8
   oK0fLOuIc/m0xeOB4bDlxba8Dc3/zRx4O562vSx+2iv0flsHSszQKeE7m
   g==;
X-CSE-ConnectionGUID: CLfo0bDhSbOZ5gVnALh1PA==
X-CSE-MsgGUID: zl5BlunkSzWnzYJsMiS1Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="34692265"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="34692265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 14:13:42 -0800
X-CSE-ConnectionGUID: gIO4qLbQSRq+TYr9cNINnA==
X-CSE-MsgGUID: S3KAUC9bRLqVSDA2XAekOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98890863"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2024 14:13:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPUCf-0003Cp-1N;
	Sun, 22 Dec 2024 22:13:37 +0000
Date: Mon, 23 Dec 2024 06:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>
Subject: drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function
 parameter or struct member 'fw_shm_pool' not described in
 'tee_bnxt_fw_private'
Message-ID: <202412230640.Xkdah4yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/firmware/Kconfig unconditionally
date:   3 years, 3 months ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241223/202412230640.Xkdah4yq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230640.Xkdah4yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230640.Xkdah4yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function parameter or struct member 'fw_shm_pool' not described in 'tee_bnxt_fw_private'
--
>> drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:49: warning: Function parameter or struct member 'nvram_start' not described in 'bcm47xx_nvram_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:49: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:73: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:73: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +62 drivers/firmware/broadcom/tee_bnxt_fw.c

246880958ac939 Vikas Gupta 2019-10-31  50  
246880958ac939 Vikas Gupta 2019-10-31  51  /**
246880958ac939 Vikas Gupta 2019-10-31  52   * struct tee_bnxt_fw_private - OP-TEE bnxt private data
246880958ac939 Vikas Gupta 2019-10-31  53   * @dev:		OP-TEE based bnxt device.
246880958ac939 Vikas Gupta 2019-10-31  54   * @ctx:		OP-TEE context handler.
246880958ac939 Vikas Gupta 2019-10-31  55   * @session_id:		TA session identifier.
246880958ac939 Vikas Gupta 2019-10-31  56   */
246880958ac939 Vikas Gupta 2019-10-31  57  struct tee_bnxt_fw_private {
246880958ac939 Vikas Gupta 2019-10-31  58  	struct device *dev;
246880958ac939 Vikas Gupta 2019-10-31  59  	struct tee_context *ctx;
246880958ac939 Vikas Gupta 2019-10-31  60  	u32 session_id;
246880958ac939 Vikas Gupta 2019-10-31  61  	struct tee_shm *fw_shm_pool;
246880958ac939 Vikas Gupta 2019-10-31 @62  };
246880958ac939 Vikas Gupta 2019-10-31  63  

:::::: The code at line 62 was first introduced by commit
:::::: 246880958ac93989c97c73ae1e60b78b4c4c88c5 firmware: broadcom: add OP-TEE based BNXT f/w manager

:::::: TO: Vikas Gupta <vikas.gupta@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
