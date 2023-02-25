Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8D17F2;
	Sat, 25 Feb 2023 07:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677309864; x=1708845864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YzAXIERXX3DHChf5jbOqlrdP6JuSIXd9dF3hP7ENI4o=;
  b=OkzemWogks5QVfbotPxbgHdiv5lMdnBKE0lBrHMBOAQRKGMzmctFSQdZ
   1RwY4vB+HaPUTorpcSYAtqhOuRXpBXmd9o2xq4TB4oLxLi1oA6/wGo9rf
   45/NszrpezYAqIvYmcvYdyn7V6KXaQSkJeZlnDQTr01yCshCfAVR4r3dK
   Qke/E8itd+qvGyXJs4fdcnlBOzyY4wuP+vn+soMRIr1XWnnnpkenwj16h
   S+7el/PLVcC01yWM/TApP3d6AyeX+2BgX3RjWS+HGR7kYfkCPFKjalsjz
   OkH34NABZB1s5vrGcJLSq2LPrteJVMQPyLYqiQsthFPigQ1z/6La9s5ib
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361151728"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361151728"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 23:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="762035494"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="762035494"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2023 23:24:21 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVour-00031L-0E;
	Sat, 25 Feb 2023 07:24:21 +0000
Date: Sat, 25 Feb 2023 15:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:af/dev.btrfs 10/11] fs/btrfs/super.c:352:19:
 error: array type 'cpumask_var_t' (aka 'struct cpumask[1]') is not
 assignable
Message-ID: <202302251526.XdMJnuk0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block af/dev.btrfs
head:   91361976f98a5766c0c00110ad28f6dd3b3a7de3
commit: 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2 [10/11] btrfs: Add wq_cpu_set mount option
config: arm64-randconfig-r012-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251526.XdMJnuk0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block af/dev.btrfs
        git checkout 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251526.XdMJnuk0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/super.c:352:19: error: array type 'cpumask_var_t' (aka 'struct cpumask[1]') is not assignable
           info->wq_cpu_set = mask;
           ~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +352 fs/btrfs/super.c

   323	
   324	static int parse_wq_cpu_set(struct btrfs_fs_info *info, const char *set)
   325	{
   326		cpumask_var_t mask;
   327		char *set_copy;
   328		int ret;
   329	
   330		set_copy = kstrdup(set, GFP_KERNEL);
   331		if (!set_copy)
   332			return -ENOMEM;
   333	
   334		if (!alloc_cpumask_var(&mask, GFP_KERNEL)) {
   335			ret = -ENOMEM;
   336			goto out_fail;
   337		}
   338	
   339		wq_cpu_set_fix_cpulist(set_copy);
   340		ret = cpulist_parse(set_copy, mask);
   341		if (ret) {
   342			btrfs_err(info, "failed to parse wq_cpu_set: %d", ret);
   343			goto out_fail_cpu;
   344		}
   345	
   346		if (cpumask_empty(mask)) {
   347			ret = -EINVAL;
   348			btrfs_err(info, "wq_cpu_set cannot be empty");
   349			goto out_fail_cpu;
   350		}
   351	
 > 352		info->wq_cpu_set = mask;
   353		info->wq_cpu_set_str = set_copy;
   354		btrfs_set_and_info(info, WQ_CPU_SET, "using wq_cpu_set=%s", set_copy);
   355		return 0;
   356	
   357	out_fail_cpu:
   358		free_cpumask_var(mask);
   359	out_fail:
   360		kfree(set_copy);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
