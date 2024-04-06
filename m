Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C2139F;
	Sat,  6 Apr 2024 02:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712370978; cv=none; b=f7iULVgOLYW9EhbR6c9/rO+ZzaXOYI/GddHRp+IhhBM5pgtJfxJuMwhTqtmLdBOgS1a06mbWrf0YYiaD8Eu422GDgudDUd67IlV5J7IpmxOiS1rh69edzpkUh5gEgXssPsajsdoaiHWowq3rEhrrbct/DnQsQdaAhgDQtY5NsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712370978; c=relaxed/simple;
	bh=wtG/BFFRUTWQfUNrVlauEYgcDSe6Sh14QjXmTMbmLT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ER/jwwG6FU//lHn1Ir3STTMP0K68cFbP1QpYwVvaA7UMyYzBgF6uvyLQs9WnJdp/z7cJyQbTWZttM8i1fJecqrDPlV3O1lS6ulYltz/ATtkk+WHZe8AJN2/96dcPRNuQ8dY+FbkMF/d0/6/hfV4SBicrNyjUvB/rRiKOiN2W8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgWq8wed; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgWq8wed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712370976; x=1743906976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtG/BFFRUTWQfUNrVlauEYgcDSe6Sh14QjXmTMbmLT0=;
  b=kgWq8wedq7GgMZvUomMeh0OyCicOcVVkZJe2G0ZtzFTmuby1aMGGMZkp
   5QJWQipQPYku9Ebxar2BTu323uCJCaeiZ0HZIi/HCjwELtDIImtnm7U+b
   w31Jhp0O041MUuVie0ujMkLuiAlzKlfYz4WHK1Wy1nnu1ezG2vezdMI8Z
   NQkUd4H/VflpUAYG2oO9WGmNGdQzvkRJ0FWoWrlwqJcTYkEjLzEzWR9Dk
   GYfTjMIrOUO1EKC8U1VgeoOAK9tlpFDDs3d4wp4dYF51Cgeb8HOV6gMHD
   GISwc6XODp1Vr91NjtAgFjr7Z05RSuioIV3CPy1w4SOyaivPvDuf4mA5D
   A==;
X-CSE-ConnectionGUID: BuVIW/DiQSqV5gwG+DjTqw==
X-CSE-MsgGUID: NXAU1uU6SCKiKhtlGSqdiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7598482"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7598482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 19:36:16 -0700
X-CSE-ConnectionGUID: ieKIaqhwQdOxiMkfS+2XcQ==
X-CSE-MsgGUID: bcSGVifBR3G9G1jSEQj7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19784637"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2024 19:36:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsvue-00030m-1x;
	Sat, 06 Apr 2024 02:36:12 +0000
Date: Sat, 6 Apr 2024 10:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 93/93] arch/x86/kernel/tboot.c:408:3: error:
 field designator 'read' does not refer to any field in type 'const struct
 file_operations'
Message-ID: <202404061004.vwpaRjVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: 025d6230e73400e8c46ec29a297b9bca08f36f6f [93/93] REMOVE ->read() and ->write()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240406/202404061004.vwpaRjVh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061004.vwpaRjVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061004.vwpaRjVh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/tboot.c:408:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
     408 |         .read   = tboot_log_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/ras/amd/fmpm.c:947:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
     947 |         .read           = seq_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +408 arch/x86/kernel/tboot.c

13bfd47a0ef68f Qiaowei Ren 2013-06-24  406  
13bfd47a0ef68f Qiaowei Ren 2013-06-24  407  static const struct file_operations tboot_log_fops = {
13bfd47a0ef68f Qiaowei Ren 2013-06-24 @408  	.read	= tboot_log_read,
13bfd47a0ef68f Qiaowei Ren 2013-06-24  409  	.llseek	= default_llseek,
13bfd47a0ef68f Qiaowei Ren 2013-06-24  410  };
13bfd47a0ef68f Qiaowei Ren 2013-06-24  411  

:::::: The code at line 408 was first introduced by commit
:::::: 13bfd47a0ef68fc8b21e67873dbdf269c7db6b59 x86/tboot: Provide debugfs interfaces to access TXT log

:::::: TO: Qiaowei Ren <qiaowei.ren@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
