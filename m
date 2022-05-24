Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D747C
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653394834; x=1684930834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W0u2zlXAT8KFsGuWp7OUOFfzrjssYjy5werD9urAYe8=;
  b=A81U41xsMF/94DC+Ai1xoGi5te2xtQ8xK6LzJaJbHxFm1yg0TVFudqEn
   LhMrhEXFWV6CRpb9JoIwBmhU7hyu+8UM83ZfOBP13aTrAI5SSyWbcDvPb
   LWW3AlcsL2pYBTytfOHfxpjX9NxKDgTpoUpDksJga9fQCZcTfFfObmMsr
   j9RjvhWewAG7Ord2k3I1z3Hlni6Ex4+8h+uR8Rpy2eBEu90y+zqECzUxq
   I9qZQ8Fi08IzBn99xMu7RnUh/QYYzehunZ0FWGod45XD+Vxh7Fx+T38U2
   +26CMK0ZUGWFB9Y+xiU+78jxiX5zMtwfSQRNDB34K+Ivz3R7rivJvoR7P
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="254014757"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="254014757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="526382658"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 May 2022 05:20:31 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntTWY-00021O-QF;
	Tue, 24 May 2022 12:20:30 +0000
Date: Tue, 24 May 2022 20:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH DRAFT] btrfs: RAID56J journal on-disk format draft
Message-ID: <202205242033.I6ix2WkH-lkp@intel.com>
References: <f6679e0b681f9b1a74dfccbe05dcb5b6eb0878f6.1653372729.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6679e0b681f9b1a74dfccbe05dcb5b6eb0878f6.1653372729.git.wqu@suse.com>

Hi Qu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on v5.18 next-20220524]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-RAID56J-journal-on-disk-format-draft/20220524-141549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220524/202205242033.I6ix2WkH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/695dee41baee3a72c39396cb548088e91472d04d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qu-Wenruo/btrfs-RAID56J-journal-on-disk-format-draft/20220524-141549
        git checkout 695dee41baee3a72c39396cb548088e91472d04d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/btrfs_tree.h:1156:2: error: unknown type name 'u8'
           u8 __reserved[4];
           ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
