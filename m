Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F767E4;
	Tue, 28 Mar 2023 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680043520; x=1711579520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+wEGh3Bcl16m1AShxxmsnd/Mwww9Np61zhGw8siEdM=;
  b=Ept7HxA9eLwphnK4kJrWxZo0ZPlntW9kSAJadtEDByx8Gck0Q1+Z1P9u
   D+cqjWly6J4wswiht0zYvJrmuXWcW2x4xH5cb2jNxU4MX6nOAuizQbk8v
   EsTTAzczpP+6Lf0ppFFFmTPmIee18xiiplwdzLuwsY9+do2jaqqrfnRxS
   SgrFhajfYZnKSXgHSMnlp4RZydjPCd0h5UPEXiPxc1Da1RSyfBVFGzjvs
   W3SNvpwxectYIHkzmkf+XvyRJrKr7BDfXBfZ8ntjxkUZl4zSoj+IzYqbB
   0Dz4+I2CseJovR3WH4+/ngXxL5ZwTd5tUmn0jAxXPFkpDcvcH7lIuqoLJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="329176660"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="329176660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 15:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="634252158"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="634252158"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Mar 2023 15:42:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phI1G-000Ivy-30;
	Tue, 28 Mar 2023 22:42:22 +0000
Date: Wed, 29 Mar 2023 06:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/5] fs: allow to mount beneath top mount
Message-ID: <202303290629.d046fvuG-lkp@intel.com>
References: <20230202-fs-move-mount-replace-v2-5-f53cd31d6392@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202-fs-move-mount-replace-v2-5-f53cd31d6392@kernel.org>

Hi Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 197b6b60ae7bc51dd0814953c562833143b292aa]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/fs-add-path_mounted/20230329-001618
base:   197b6b60ae7bc51dd0814953c562833143b292aa
patch link:    https://lore.kernel.org/r/20230202-fs-move-mount-replace-v2-5-f53cd31d6392%40kernel.org
patch subject: [PATCH v2 5/5] fs: allow to mount beneath top mount
config: x86_64-randconfig-a014-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290629.d046fvuG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/13451428e46188ad86767587daa736968e4cc62c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Brauner/fs-add-path_mounted/20230329-001618
        git checkout 13451428e46188ad86767587daa736968e4cc62c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290629.d046fvuG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:990: warning: expecting prototype for mnt_beneath(). Prototype was for attach_mnt_beneath() instead


vim +990 fs/namespace.c

   969	
   970	/**
   971	 * mnt_beneath - mount a mount beneath another one, attach to
   972	 *               @mount_hashtable and parent's list of child mounts
   973	 *
   974	 * @new_parent: the source mount
   975	 * @top_mnt:	the mount beneath which @new_parent is mounted
   976	 * @new_mp:	the new mountpoint of @top_mnt on @new_parent
   977	 *
   978	 * Remove @top_mnt from its current parent and mountpoint and mount it
   979	 * on @new_mp on @new_parent, and mount @new_parent on the old parent
   980	 * and old mountpoint of @top_mnt. Finally, attach @new_parent mount to
   981	 * @mnt_hashtable and @new_parent->mnt_parent->mnt_mounts.
   982	 *
   983	 * Note, when we call __attach_mnt() we've already mounted @new_parent
   984	 * on top of @top_mnt's old parent so @new_parent->mnt_parent will point
   985	 * to the correct parent.
   986	 */
   987	static void attach_mnt_beneath(struct mount *new_parent,
   988			     struct mount *top_mnt,
   989			     struct mountpoint *new_mp)
 > 990	{
   991		mnt_set_mountpoint_beneath(new_parent, top_mnt, new_mp);
   992		__attach_mnt(new_parent, new_parent->mnt_parent);
   993	}
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
