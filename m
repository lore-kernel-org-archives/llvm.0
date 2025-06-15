Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E9D261594;
	Sun, 15 Jun 2025 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749969988; cv=none; b=g847yYZeOhx/GhhUkTMkvr3A/gxNIM5Kyp++eToa0+mkMuVmJQb9CDTBR4HRTmXHikS6zC3vN6+l9RNRwrEX8zT9uu6mWDD7eUlkBhSQE5QjTgoaubizFhvdBsG1FBaKJJCWOrgobWVaLBcPhW3gsm9mrPl1L+867H/YKlgQsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749969988; c=relaxed/simple;
	bh=JjB1jVSppunW0xdA6ALMtZWkebeD988Ayx7XVCdJesQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzdAL62WCDsf2lEoZ0t+yu0d54MsU+ENQUd35Z/Dv9OQHyNOYZpUHpJ7biJ0RGmPYT6p/ZRbduZW3l8Df+JDqK8RJv1nvAm1+vtkMRf6CXPUQ3a1c/mucxrkuOAx6Og6cuEYFo8OG9pFpvnoTNjApY6tuVwqXa40dj50S8pgUfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGLkAhe0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGLkAhe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749969987; x=1781505987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjB1jVSppunW0xdA6ALMtZWkebeD988Ayx7XVCdJesQ=;
  b=aGLkAhe0dOiJKU9WuoQuxlw76DLzh+G6+V6x0MSU6hX+EWTT1+5n8CbH
   iNVtvUOp7wjyp06gNCBwl1bRQtfFNPPRYKC2r4Qcl8V1PC8CWimjkb+Vm
   2Kqn3quACRQzU0BCgxOcivMfj2+vk33kLcUKT3YxgfOzHL1gXbBCb9lhr
   2r47mvUQR8E3lG/QpSaxTqqNl600ZDjYT85PlIHPSOK5T7PM0i8AU3lgi
   mJKfjwAXL+F5n8ujzPxH1RhsIbdRwubs6zqbjEMEDjKQzhmTdkhQdI68s
   Gm/OYuG8egeIErv0wrm/Lox3wjKRKlvjiw/uaEVSJwXqQIBJAjqKt8A2C
   A==;
X-CSE-ConnectionGUID: cCespwqLSiSPSsZahOkgOw==
X-CSE-MsgGUID: McqcGIsYQpapAVBl0w5USw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52278557"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="52278557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 23:46:24 -0700
X-CSE-ConnectionGUID: NAG8V3PYR1q9jopA8dvQ7A==
X-CSE-MsgGUID: Gu7CQvcnSJWIffF3scUHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148071400"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2025 23:46:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQh8G-000EAs-0K;
	Sun, 15 Jun 2025 06:46:20 +0000
Date: Sun, 15 Jun 2025 14:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.debugfs 9/9] block/blk-mq-debugfs.c:524:8: error:
 initializing 'void *' with an expression of type 'const void *' discards
 qualifiers
Message-ID: <202506151407.6kH54qkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.debugfs
head:   dadb85bad8e5007cbd0e52309e3a8d8e2d125544
commit: dadb85bad8e5007cbd0e52309e3a8d8e2d125544 [9/9] blk-mq-debugfs: use debugfs_aux_data()
config: x86_64-buildonly-randconfig-006-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151407.6kH54qkk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151407.6kH54qkk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151407.6kH54qkk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq-debugfs.c:524:8: error: initializing 'void *' with an expression of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     524 |         void *data = debugfs_get_aux(m->file);
         |               ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-debugfs.c:534:8: error: initializing 'void *' with an expression of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     534 |         void *data = debugfs_get_aux(file);
         |               ^      ~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-debugfs.c:549:8: error: initializing 'void *' with an expression of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     549 |         void *data = debugfs_get_aux(file);
         |               ^      ~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +524 block/blk-mq-debugfs.c

   520	
   521	static int blk_mq_debugfs_show(struct seq_file *m, void *v)
   522	{
   523		const struct blk_mq_debugfs_attr *attr = m->private;
 > 524		void *data = debugfs_get_aux(m->file);
   525	
   526		return attr->show(data, m);
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
