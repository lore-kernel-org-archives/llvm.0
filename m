Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798F481B7;
	Sun, 17 Dec 2023 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfL5uOM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702846071; x=1734382071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eZIxiJSEvNyjpRN+GYJ8iYwwLuZF5RbS/QCpSmdUGU=;
  b=KfL5uOM66WCx2+4RpZNKymx1IyPj7pYdcpIQyQzrdiJaQdsw8Um+EIBk
   x7pe3cFMgRR6s0mFxX8U94cpQaO8UyyxUVeUSe3SBtW/c9Np3Tdom8Hyd
   JPVlnQ6nirC1UbQUAsrmfx0yhtk9qrfSzbYGp2zX0DgESP2Itk8jqGqu+
   IYnDIz7uBs6EIO5HQUnm1tyMLafErKsFAo8FkNDLmwXeq/CDegoYCXXk1
   RX9lgOvO3Kde15MutfQZjHTTPHxSGMccYjfM8kzRQN6OV6iNZe6WoB5O9
   roVp8oBZPd/LSU67vr1mGWqxANJq2XbiJ0Y+okbfowffw3H6ght1aLkub
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2283679"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2283679"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 12:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898748133"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898748133"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 12:47:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEy36-0003PW-1j;
	Sun, 17 Dec 2023 20:47:44 +0000
Date: Mon, 18 Dec 2023 04:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:bcachefs-testing 154/174] scripts/kernel-doc:
 fs/bcachefs/btree_update_interior.c:1670: warning: Function parameter or
 struct member 'path_idx' not described in 'bch2_btree_insert_node'
Message-ID: <202312180414.OfsSw6NX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   16609653d3eeb730d5a4b5d19266d52f9e7b8ea3
commit: d85fddfb75eb24146c01c54a313f57635d0c0f48 [154/174] bcachefs: Fix interior update path btree_path uses
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231218/202312180414.OfsSw6NX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180414.OfsSw6NX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180414.OfsSw6NX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: fs/bcachefs/btree_update_interior.c:1670: warning: Function parameter or struct member 'path_idx' not described in 'bch2_btree_insert_node'
>> scripts/kernel-doc: fs/bcachefs/btree_update_interior.c:1670: warning: Excess function parameter 'path' description in 'bch2_btree_insert_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
