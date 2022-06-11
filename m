Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D8A21
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654960280; x=1686496280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sr6Hyoey14RLH11sYQd0LbbLyKPYmB2YzzdDzUDVWi8=;
  b=Hej+8yCjDqBIhZMlOzimLxdvyEFXMH/e12uvEarNYltZuvs/7JO+t1Hp
   25QhfyT2AXhJ+mFum6r4WxTjOGL/meP7G6KqE4UtPvgs17PCQJw8cZPn5
   JN+cX9o90Pp+7FNjPf7fwS/Gt5zcPp6SDGoYtTSQQAo5ohR0JDyB+IiIy
   EM6Vx/oDwa19AVhUXfhux5ohoEk3j82ARFaRwy/owZIvaTiSq6G+6/Col
   VVeZUVX1UE771PAHwp1qxiq6ezlDUAAVkPHf7E66vyAuwASpV4d6iXrzk
   qiDPoSaTTfxOBKdl3DL1jx/dWXXswlKj2x2cr0zIX+HbJqT2+3rwLcYvB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="364226230"
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="364226230"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 08:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="586798958"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2022 08:11:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o02lh-000J0D-Vj;
	Sat, 11 Jun 2022 15:11:17 +0000
Date: Sat, 11 Jun 2022 23:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Allison Henderson <allison.henderson@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 10/17] xfs: parent pointer attribute creation
Message-ID: <202206112311.zPVsFae7-lkp@intel.com>
References: <20220611094200.129502-11-allison.henderson@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220611094200.129502-11-allison.henderson@oracle.com>

Hi Allison,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.19-rc1 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Allison-Henderson/Return-of-the-Parent-Pointers/20220611-174444
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220611/202206112311.zPVsFae7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f78cf1e945fc44e0022add251db2819f37b8d2ff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Allison-Henderson/Return-of-the-Parent-Pointers/20220611-174444
        git checkout f78cf1e945fc44e0022add251db2819f37b8d2ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_parent.c:55:1: warning: no previous prototype for function 'xfs_init_parent_name_rec' [-Wmissing-prototypes]
   xfs_init_parent_name_rec(
   ^
   fs/xfs/libxfs/xfs_parent.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
>> fs/xfs/libxfs/xfs_parent.c:70:1: warning: no previous prototype for function 'xfs_init_parent_name_irec' [-Wmissing-prototypes]
   xfs_init_parent_name_irec(
   ^
   fs/xfs/libxfs/xfs_parent.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   2 warnings generated.


vim +/xfs_init_parent_name_rec +55 fs/xfs/libxfs/xfs_parent.c

    35	
    36	/*
    37	 * Parent pointer attribute handling.
    38	 *
    39	 * Because the attribute value is a filename component, it will never be longer
    40	 * than 255 bytes. This means the attribute will always be a local format
    41	 * attribute as it is xfs_attr_leaf_entsize_local_max() for v5 filesystems will
    42	 * always be larger than this (max is 75% of block size).
    43	 *
    44	 * Creating a new parent attribute will always create a new attribute - there
    45	 * should never, ever be an existing attribute in the tree for a new inode.
    46	 * ENOSPC behavior is problematic - creating the inode without the parent
    47	 * pointer is effectively a corruption, so we allow parent attribute creation
    48	 * to dip into the reserve block pool to avoid unexpected ENOSPC errors from
    49	 * occurring.
    50	 */
    51	
    52	
    53	/* Initializes a xfs_parent_name_rec to be stored as an attribute name */
    54	void
  > 55	xfs_init_parent_name_rec(
    56		struct xfs_parent_name_rec	*rec,
    57		struct xfs_inode		*ip,
    58		uint32_t			p_diroffset)
    59	{
    60		xfs_ino_t			p_ino = ip->i_ino;
    61		uint32_t			p_gen = VFS_I(ip)->i_generation;
    62	
    63		rec->p_ino = cpu_to_be64(p_ino);
    64		rec->p_gen = cpu_to_be32(p_gen);
    65		rec->p_diroffset = cpu_to_be32(p_diroffset);
    66	}
    67	
    68	/* Initializes a xfs_parent_name_irec from an xfs_parent_name_rec */
    69	void
  > 70	xfs_init_parent_name_irec(

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
