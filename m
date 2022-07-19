Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074643D62
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658250385; x=1689786385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsJls4KRRqMsihgdj/1B2WwrHafjlZ5+4bCu3VElhgw=;
  b=M0LCJ6MkG4iSHqTTIoyxCk6LItN6CzDE3mZ3BVK84IdrLo5w2I0fnSjF
   0Ehak9Fks/qWRdtu8SMT63ZRyN1LbqLGMlo/vrcDmjC7FjuSFS9mK9qO+
   YC/g07HAd7g/xmKmCA8XKquWLumiJ3ieFmweXFNTllxxm/3mb2O3/ctwi
   gjYLLip5GzmyN4MaIHC7RfIPMeqk6yFmWHfuwCzKVq42nkmgOcxPOzTHg
   v2BJMgoBon4CIkomqok8oHZjE1yIbZxCsa2iW/UlxDelXtadMdTXEPqf3
   zSKE8koKmHlLyMP1Yt3OSx2QZzQQehesGomBT2Vi9fuaj5X4qKha1V5d9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="286557709"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="286557709"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 10:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="665514274"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2022 10:06:22 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDqft-0005qE-ME;
	Tue, 19 Jul 2022 17:06:21 +0000
Date: Wed, 20 Jul 2022 01:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Bongio <bongiojp@gmail.com>, Ted Tso <tytso@mit.edu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jeremy Bongio <bongiojp@gmail.com>
Subject: Re: [PATCH v3] Add ioctls to get/set the ext4 superblock uuid.
Message-ID: <202207200113.9R6VYmdT-lkp@intel.com>
References: <20220719065551.154132-1-bongiojp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719065551.154132-1-bongiojp@gmail.com>

Hi Jeremy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v5.19-rc7 next-20220719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Bongio/Add-ioctls-to-get-set-the-ext4-superblock-uuid/20220719-145724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: i386-randconfig-a005-20220718 (https://download.01.org/0day-ci/archive/20220720/202207200113.9R6VYmdT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d53b0a271606a7f5c7b0f1a1f3fec9a34e771205
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeremy-Bongio/Add-ioctls-to-get-set-the-ext4-superblock-uuid/20220719-145724
        git checkout d53b0a271606a7f5c7b0f1a1f3fec9a34e771205
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ext4/ioctl.c:1149:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret = 0;
               ^
   1 warning generated.


vim +/ret +1149 fs/ext4/ioctl.c

  1145	
  1146	static int ext4_ioctl_getuuid(struct ext4_sb_info *sbi,
  1147				struct fsuuid __user *ufsuuid)
  1148	{
> 1149		int ret = 0;
  1150		struct fsuuid fsuuid;
  1151		__u8 uuid[UUID_SIZE];
  1152	
  1153		if (copy_from_user(&fsuuid, ufsuuid, sizeof(fsuuid)))
  1154			return -EFAULT;
  1155	
  1156		if (fsuuid.fsu_len != UUID_SIZE || fsuuid.fsu_flags != 0)
  1157			return -EINVAL;
  1158	
  1159		lock_buffer(sbi->s_sbh);
  1160		memcpy(uuid, sbi->s_es->s_uuid, UUID_SIZE);
  1161		unlock_buffer(sbi->s_sbh);
  1162	
  1163		if (copy_to_user(&ufsuuid->fsu_uuid[0], uuid, UUID_SIZE))
  1164			return -EFAULT;
  1165		return 0;
  1166	}
  1167	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
