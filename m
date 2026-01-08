Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DA2DE200;
	Thu,  8 Jan 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894980; cv=none; b=COowdNqhd/9cfonSTFxBDURRccvuLSzmHp7Mn3koC5896Hvm+FbvrfyYQ3u7exTyt3SX53F4yaYzGq94px3Mx/AZE0aoo8H2Z+vT73bZRX8hiXkNUXuH35AV0i05VcwhaUhKjDGl8+M4hs3yPUW5toL+aE32XyRwlhqd2Y06wu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894980; c=relaxed/simple;
	bh=fVFKoDSGtu/m8fcssWWh1M0gKpmCnRC4+ap+lVdeYB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1dwzscvd2qY1zkDo4WYt7AbsrxyHeZan4K3rD89YZOjlMy5qZ5/+yLLyTKPPuURbJcp1m6pj8klqBfd8thWteIJkqVLZjPN/OHNk8PsY8vfWqqicBr4s8Cl3PrTqtR4E+eI6c/DrsVC1w6yLznYAqqaLIUhfM8RurR7wzYTbks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuoOgmof; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuoOgmof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767894979; x=1799430979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVFKoDSGtu/m8fcssWWh1M0gKpmCnRC4+ap+lVdeYB0=;
  b=cuoOgmofuMOssEpyvh8W/eYGO2Kw8tHj3H8N9qon5YGlrNBOoujMC3xt
   OuWr8AVGcHSm0XQBEj5MORMRdxlmi+s9kxhjbBF+Rkhxru+sULETDTFyI
   uhKOINJSq5WCfCLVRufqAIwbdrOHFYNQJ2+R2A9FQHMo90V9LX3+4dRpX
   fpVm2ChAkMWbSRd7vVSvyOiQflVBDSncBfL+o/t7dkQ6nGz4uM+31Axfk
   vhyCKy4X3AqMyEjZYlgczf7BItXRi/gFqr2CeIKVbo651f3K0VtcSL5ZC
   0zgbk8WdmS6SOD/o9MHKAEQUKJtzinlK9MAsiqFbODOqO4UAg6FHzttWa
   A==;
X-CSE-ConnectionGUID: TF4N3eEAQVGrv3uGTW47vA==
X-CSE-MsgGUID: VcGdbxvZTAmzotOt1V1MtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86695398"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="86695398"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 09:56:19 -0800
X-CSE-ConnectionGUID: 09hYryXbTDywVNcrXWvL1A==
X-CSE-MsgGUID: BFN3ZKRIRLapNvoSYo54WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203285622"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 09:56:11 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vduEz-000000001pc-1EmA;
	Thu, 08 Jan 2026 17:56:09 +0000
Date: Thu, 8 Jan 2026 18:55:54 +0100
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>
Subject: Re: [PATCH V3 04/21] dax: Add dax_operations for use by fs-dax on
 fsdev dax
Message-ID: <202601081822.Ww7CSgov-lkp@intel.com>
References: <20260107153332.64727-5-john@groves.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107153332.64727-5-john@groves.net>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.19-rc4 next-20260108]
[cannot apply to mszeredi-fuse/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dax-add-fsdev-c-driver-for-fs-dax-on-character-dax/20260108-013232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260107153332.64727-5-john%40groves.net
patch subject: [PATCH V3 04/21] dax: Add dax_operations for use by fs-dax on fsdev dax
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260108/202601081822.Ww7CSgov-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081822.Ww7CSgov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081822.Ww7CSgov-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/fsdev.c:97:9: error: call to undeclared function '_copy_from_iter_flushcache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         return _copy_from_iter_flushcache(addr, bytes, i);
         |                ^
   drivers/dax/fsdev.c:97:9: note: did you mean '__copy_from_user_flushcache'?
   arch/x86/include/asm/uaccess_64.h:166:1: note: '__copy_from_user_flushcache' declared here
     166 | __copy_from_user_flushcache(void *dst, const void __user *src, unsigned size)
         | ^
   1 error generated.


vim +/_copy_from_iter_flushcache +97 drivers/dax/fsdev.c

    93	
    94	static size_t fsdev_dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
    95			void *addr, size_t bytes, struct iov_iter *i)
    96	{
  > 97		return _copy_from_iter_flushcache(addr, bytes, i);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
