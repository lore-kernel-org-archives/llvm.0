Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCAF2C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 00:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641602490; x=1673138490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6vCjkxfypDZ46PUGfUFNmvkQwbFhK18DPg6PuvsKwI=;
  b=lVU5alYo55tNBh9RnG1Um6SCPN8jYgM0lFbi+AGYHgqGFmu0vTf+2q4u
   VVM3pI5Ay2FFJyeXVm3LP++Va3gTjTNZDw4hV3uBiapFMka95b4+ip3xD
   EyV7McGwzLJYJ4/X5wFn0cDE8XnHTc2rX7o+sikizLIPpZ3mP1xdtUJ3t
   T5L7EKvQ8xOkYqFXMYaxLa5tSPunKrie4HmSZGR1FkN/FSV3pAaior9hW
   txDC7rQsIb2SIeGKROXuNAUwkO9E+OEGjKHXpSm0jCdMx4jRGE3vIyorO
   0lL7RFcjCFrTsx0IW13LAfLWFL5m5RfWiBaVDfRHBvpWqDq/uwxJUh4oK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="243165542"
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="243165542"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 16:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="689969789"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2022 16:41:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5znT-00006s-Mi; Sat, 08 Jan 2022 00:41:27 +0000
Date: Sat, 8 Jan 2022 08:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Luo <haoluo@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC bpf-next v1 1/8] bpf: Support pinning in non-bpf file
 system.
Message-ID: <202201080655.vV6uEYqH-lkp@intel.com>
References: <20220106215059.2308931-2-haoluo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106215059.2308931-2-haoluo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Pinning-bpf-objects-outside-bpffs/20220107-055252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm64-buildonly-randconfig-r006-20220106 (https://download.01.org/0day-ci/archive/20220108/202201080655.vV6uEYqH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7c6dacd226b9d48b0c2bcc226bf890776267de90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Pinning-bpf-objects-outside-bpffs/20220107-055252
        git checkout 7c6dacd226b9d48b0c2bcc226bf890776267de90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/inode.c:83:5: warning: no previous prototype for function 'handle_inode_event' [-Wmissing-prototypes]
   int handle_inode_event(struct fsnotify_mark *mark, u32 mask,
       ^
   kernel/bpf/inode.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int handle_inode_event(struct fsnotify_mark *mark, u32 mask,
   ^
   static 
   1 warning generated.


vim +/handle_inode_event +83 kernel/bpf/inode.c

    81	
    82	/* Handler for any inode event. */
  > 83	int handle_inode_event(struct fsnotify_mark *mark, u32 mask,
    84			       struct inode *inode, struct inode *dir,
    85			       const struct qstr *file_name, u32 cookie)
    86	{
    87		return 0;
    88	}
    89	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
