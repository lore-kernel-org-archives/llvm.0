Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DAE7F;
	Sat, 22 Apr 2023 02:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682129133; x=1713665133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndnU5Cjlacr6Stj13rK04KuImod5f7Jx51QOgya2Os0=;
  b=D1STkC7ECUIYnNYuc9tzM3+sdyvd31oIv3He9kgM4mGVFVgMd1G3Pdg0
   DRYPY+WbJPAE65j4azHP3JJg94sJSxeIZpMr0xOACx8t+Au+/UKY0Uysi
   qixTcsEJ1ZoAFTux6yIWi8DQPlV6wkdw6ID9DWYoLJFTCnsC6O0xqra8N
   3x8xzwWmYB0TnaoC45GkfUddcmllYtiffUl6TKTtMiiKiBGpDMQoW0CVp
   7tTfPAElfMLljIKp1WsRlVUrRJ6Ph5Oto8weLAXBLyHxUmLLbC7UVIRkB
   Wzb87kOk9aMycwXfnu0cdNvk7x5blbcNcWZEw6hnFgB79MjbmCZ27sdeo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409059343"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409059343"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 19:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1022088382"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="1022088382"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 19:05:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq2d0-000h0K-37;
	Sat, 22 Apr 2023 02:05:30 +0000
Date: Sat, 22 Apr 2023 10:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 2/5] fs/overlayfs/util.c:1119:6: error: call to
 undeclared function 'is_multigrain_ctime'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202304220930.6WSX7mOI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   54dd444fe05963240ab071845d5de2b1da6d7688
commit: f24a43a08ee5e1ae888e58bad45356f8c7985de4 [2/5] overlayfs: flag the ctime as QUERIED on multigrain timestamp when copying up
config: mips-randconfig-r006-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220930.6WSX7mOI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=f24a43a08ee5e1ae888e58bad45356f8c7985de4
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout f24a43a08ee5e1ae888e58bad45356f8c7985de4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/overlayfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220930.6WSX7mOI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/util.c:1119:6: error: call to undeclared function 'is_multigrain_ctime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (is_multigrain_ctime(realinode)) {
               ^
   fs/overlayfs/util.c:1119:6: note: did you mean 'is_multigrain_ts'?
   include/linux/fs.h:2187:20: note: 'is_multigrain_ts' declared here
   static inline bool is_multigrain_ts(struct inode *inode)
                      ^
   1 error generated.


vim +/is_multigrain_ctime +1119 fs/overlayfs/util.c

  1088	
  1089	/*
  1090	 * ovl_copyattr() - copy inode attributes from layer to ovl inode
  1091	 *
  1092	 * When overlay copies inode information from an upper or lower layer to the
  1093	 * relevant overlay inode it will apply the idmapping of the upper or lower
  1094	 * layer when doing so ensuring that the ovl inode ownership will correctly
  1095	 * reflect the ownership of the idmapped upper or lower layer. For example, an
  1096	 * idmapped upper or lower layer mapping id 1001 to id 1000 will take care to
  1097	 * map any lower or upper inode owned by id 1001 to id 1000. These mapping
  1098	 * helpers are nops when the relevant layer isn't idmapped.
  1099	 */
  1100	void ovl_copyattr(struct inode *inode)
  1101	{
  1102		struct path realpath;
  1103		struct inode *realinode;
  1104		struct mnt_idmap *real_idmap;
  1105		vfsuid_t vfsuid;
  1106		vfsgid_t vfsgid;
  1107	
  1108		ovl_i_path_real(inode, &realpath);
  1109		realinode = d_inode(realpath.dentry);
  1110		real_idmap = mnt_idmap(realpath.mnt);
  1111	
  1112		vfsuid = i_uid_into_vfsuid(real_idmap, realinode);
  1113		vfsgid = i_gid_into_vfsgid(real_idmap, realinode);
  1114	
  1115		inode->i_uid = vfsuid_into_kuid(vfsuid);
  1116		inode->i_gid = vfsgid_into_kgid(vfsgid);
  1117		inode->i_mode = realinode->i_mode;
  1118		inode->i_atime = realinode->i_atime;
> 1119		if (is_multigrain_ctime(realinode)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
