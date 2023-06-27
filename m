Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CE679F2;
	Tue, 27 Jun 2023 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687849856; x=1719385856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKOdJctQb5N8L2XnCI2A0MC/l6kXHY7vFjxyPcKQSa0=;
  b=RmbfWIUF9ILDF+DXoLp7Jaf49RYt65Ub44qjUFTXW76lD9f8zmpWmmmA
   qYm4XFOOkXAXYKDU837GF6DrfvRwjdR8/ssDQqmdGSgbPOIKu9wOOez6T
   1wU/U6hRLAcQ72sijHrfOCIzVrs34AxbdGNrr9uzmJRfPRvkl17tz1xLI
   0sEzcIpKBX/qPeeH7rOBfrqhpBrXH41v1WU13UaWE/MxwOuK0Hk8WLqiR
   x13OX85G+zPQ50wovBXmKuF8Rlu7U5k0mpLNPj+/0xEG+cYWpu5iwWSGY
   kCHj3grgshSB2/jBIxBt/KV6Ir/Gh2dWny46v6kPYoz3NQwOlIebn7I0c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="425163269"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="425163269"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 00:10:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="829553701"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="829553701"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2023 00:10:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE2pr-000Bmf-1S;
	Tue, 27 Jun 2023 07:09:59 +0000
Date: Tue, 27 Jun 2023 15:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 17/26] error[E0405]: cannot find trait
 `Tuple` in module `core::marker`
Message-ID: <202306271558.b4TYkBnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   8bad6a3027f8f281867a06f8fa01642cd5f7a98b
commit: 49e57e6eb761f760944a91c621cac881d45523dc [17/26] rust: Fixes for 1.67.0
config: x86_64-buildonly-randconfig-r002-20230626 (https://download.01.org/0day-ci/archive/20230627/202306271558.b4TYkBnI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271558.b4TYkBnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271558.b4TYkBnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1872:26
   |
   1872 | impl<Args: core::marker::Tuple, F: FnOnce<Args> + ?Sized, A: Allocator> FnOnce<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1881:26
   |
   1881 | impl<Args: core::marker::Tuple, F: FnMut<Args> + ?Sized, A: Allocator> FnMut<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1888:26
   |
   1888 | impl<Args: core::marker::Tuple, F: Fn<Args> + ?Sized, A: Allocator> Fn<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
