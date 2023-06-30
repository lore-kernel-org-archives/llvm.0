Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79120F1;
	Fri, 30 Jun 2023 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688109379; x=1719645379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPlTEoRvLPdtiM7QmevtpXxE1s/I7bz8Wr3DJatvhw4=;
  b=HdnpbmbyGMhwXyBw5//pPhidhgS90/U1Iu7FYd43J0a9PYQZIqHKRJHi
   LRpbCp7Ee1VYJwJur9TiGBr5ow6ZAjDsVrYHuubi+hrogRzUVEcvz1L/p
   3x0ONl+vOVtRg57KWMzu4SMQGLzK9OAuyIn2hYVdJc047Bog61OTzREB/
   CkNvXZ7AJITvQ9ou8RQiubBzwFlH6OzAtS6KqEitD3419jqAVn+rNDP8D
   ltcXBuvcIoNRpwREfrN3xgqwEFyhPDoyZaBGEOPWx6JD4wBYtU1fAeDkn
   1HPzrrsBk0WbLp9ZXbnl+iIFRa33VdlpFqi6fS8leUOFrNC77uy3TtTa4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="347114770"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="347114770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 00:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694934919"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="694934919"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2023 00:16:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF8Ma-000En3-2W;
	Fri, 30 Jun 2023 07:16:16 +0000
Date: Fri, 30 Jun 2023 15:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Qingsong Chen <changxian.cqs@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 8/8] samples: rust: add a device mapper linear target
Message-ID: <202306301458.mlsxCJLl-lkp@intel.com>
References: <20230625121657.3631109-9-changxian.cqs@antgroup.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230625121657.3631109-9-changxian.cqs@antgroup.com>

Hi Qingsong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qingsong-Chen/rust-kernel-add-basic-abstractions-for-device-mapper/20230625-201850
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20230625121657.3631109-9-changxian.cqs%40antgroup.com
patch subject: [RFC PATCH 8/8] samples: rust: add a device mapper linear target
config: x86_64-randconfig-x001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306301458.mlsxCJLl-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301458.mlsxCJLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301458.mlsxCJLl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `core::ops::Range`
   --> samples/rust/rust_dm_linear.rs:7:5
   |
   7 | use core::ops::Range;
   |     ^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `kernel::bindings::PAGE_SECTORS_SHIFT`
   --> samples/rust/rust_dm_linear.rs:9:5
   |
   9 | use kernel::bindings::PAGE_SECTORS_SHIFT;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
