Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3115B8;
	Tue, 18 Apr 2023 04:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681791451; x=1713327451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5lZgqi3haM74WGprs2woDGHUNCvW9iRyntwDy2oUvL0=;
  b=V0gM5q1ksHItyoGJa5x113VDyB7lzdAn8q6kEHo5ocdn4MuX7Du6tZPU
   JCq3hXm1CUSxaHhddFWM86eSq3dqrwWaF8DO6t8cnv16CfsEfILGv6fXy
   trIDscMbCtwQn9jNKjRArtpL37ddVTihsEoCBrbzuMXuuC/IceAC9m+g7
   cShntiQQUBxPAf0QGAcdFS79R3OwqiukFx+8lLdU2Ri+r84exqNXkUeUx
   GqvLrHskxqZdorilBo8A66NK2tEBrlHFM/vUvDi10MQ/M0gSxRo0s809C
   boqNdSiTHnawiB4itTMuc6pyA3YgBh/BuM+FO/MT6lndLb5AFJRsZ6Knw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325409654"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="325409654"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 21:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668353354"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="668353354"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 21:17:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pocmN-000cyF-1H;
	Tue, 18 Apr 2023 04:17:19 +0000
Date: Tue, 18 Apr 2023 12:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 30/37] fuse: Provide registration functions for
 fuse-bpf
Message-ID: <202304181216.vm8kB0N7-lkp@intel.com>
References: <20230418014037.2412394-31-drosen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418014037.2412394-31-drosen@google.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 49859de997c3115b85544bce6b6ceab60a7fabc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
base:   49859de997c3115b85544bce6b6ceab60a7fabc4
patch link:    https://lore.kernel.org/r/20230418014037.2412394-31-drosen%40google.com
patch subject: [RFC PATCH v3 30/37] fuse: Provide registration functions for fuse-bpf
config: x86_64-randconfig-a012-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181216.vm8kB0N7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff2c02ca675655ec88e525c51defda64d7774b0d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
        git checkout ff2c02ca675655ec88e525c51defda64d7774b0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181216.vm8kB0N7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/dev.c:9:
>> fs/fuse/fuse_i.h:1400:5: warning: no previous prototype for function 'init_fuse_bpf' [-Wmissing-prototypes]
   int init_fuse_bpf(void)
       ^
   fs/fuse/fuse_i.h:1400:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_fuse_bpf(void)
   ^
   static 
>> fs/fuse/fuse_i.h:1404:6: warning: no previous prototype for function 'uninit_fuse_bpf' [-Wmissing-prototypes]
   void uninit_fuse_bpf(void)
        ^
   fs/fuse/fuse_i.h:1404:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void uninit_fuse_bpf(void)
   ^
   static 
>> fs/fuse/fuse_i.h:1407:18: warning: no previous prototype for function 'find_fuse_ops' [-Wmissing-prototypes]
   struct fuse_ops *find_fuse_ops(const char *key)
                    ^
   fs/fuse/fuse_i.h:1407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct fuse_ops *find_fuse_ops(const char *key)
   ^
   static 
>> fs/fuse/fuse_i.h:1411:18: warning: no previous prototype for function 'get_fuse_ops' [-Wmissing-prototypes]
   struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
                    ^
   fs/fuse/fuse_i.h:1411:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
   ^
   static 
>> fs/fuse/fuse_i.h:1415:6: warning: no previous prototype for function 'put_fuse_ops' [-Wmissing-prototypes]
   void put_fuse_ops(struct fuse_ops *ops)
        ^
   fs/fuse/fuse_i.h:1415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void put_fuse_ops(struct fuse_ops *ops)
   ^
   static 
   5 warnings generated.


vim +/init_fuse_bpf +1400 fs/fuse/fuse_i.h

  1385	
  1386	struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
  1387					 unsigned int open_flags, bool isdir,
  1388					 struct file *file);
  1389	void fuse_file_release(struct inode *inode, struct fuse_file *ff,
  1390			       unsigned int open_flags, fl_owner_t id, bool isdir);
  1391	
  1392	/* backing.c */
  1393	#ifdef CONFIG_FUSE_BPF
  1394	struct fuse_ops *find_fuse_ops(const char *key);
  1395	struct fuse_ops *get_fuse_ops(struct fuse_ops *ops);
  1396	void put_fuse_ops(struct fuse_ops *ops);
  1397	int init_fuse_bpf(void);
  1398	void uninit_fuse_bpf(void);
  1399	#else
> 1400	int init_fuse_bpf(void)
  1401	{
  1402		return -EOPNOTSUPP;
  1403	}
> 1404	void uninit_fuse_bpf(void)
  1405	{
  1406	}
> 1407	struct fuse_ops *find_fuse_ops(const char *key)
  1408	{
  1409		return NULL;
  1410	}
> 1411	struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
  1412	{
  1413		return NULL;
  1414	}
> 1415	void put_fuse_ops(struct fuse_ops *ops)
  1416	{
  1417	}
  1418	#endif
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
