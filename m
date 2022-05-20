Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4C15D1
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653064207; x=1684600207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CZYswHE5SGhufd15z7J+HW4Ly0idiv0tqBde/Y19+sA=;
  b=HdHVIZ/tO/bUNtVw4wxVkYr5ReeK61bfMJqVs3KkWVPvIBZSgMFPnCuX
   chwZEeBwPQ1G6mnIwKQCfVaKYT4kn3VdGJhN3r2xnzZuBmJdhoCl2n1nj
   eQs8aEotes25O1e3+XujrRati+j1UURrKOe2uqUoMAiJyDcLR03wclhMz
   Wu7kMPzrmnLPW3rpLyRZHekIPJU/rXUTFrcxm3Cm/aMDpBN9sL1BIz9Dd
   GOkQnr2VXx8Q9kMSl6YWJF/kf/Y74WzpfnuWq/B916khZD3YknAZgRlyi
   keZ0zbSN/rcJmEJqze6tZHOTET/XorXoH2bFNL7z3wfRv2Uybz/zXGyUp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="271474354"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="271474354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 09:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="628243549"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 May 2022 09:29:52 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ns5Vg-0004vM-5a;
	Fri, 20 May 2022 16:29:52 +0000
Date: Sat, 21 May 2022 00:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] ceph: try to prevent exceeding the MDS maximum xattr
 size
Message-ID: <202205210021.IgsLVawx-lkp@intel.com>
References: <20220520115426.438-1-lhenriques@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520115426.438-1-lhenriques@suse.de>

Hi "Luís,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/ceph-try-to-prevent-exceeding-the-MDS-maximum-xattr-size/20220520-195559
base:   https://github.com/ceph/ceph-client.git for-linus
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220521/202205210021.IgsLVawx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3c9e88c091f0e9b17856d7de9b8c705e827ee716
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lu-s-Henriques/ceph-try-to-prevent-exceeding-the-MDS-maximum-xattr-size/20220520-195559
        git checkout 3c9e88c091f0e9b17856d7de9b8c705e827ee716
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ceph/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ceph/xattr.c:1087:36: warning: data argument not used by format string [-Wformat-extra-args]
           dout("setxattr value size: ld\n", size);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/ceph/ceph_debug.h:35:45: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:576:38: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:132:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^
   1 warning generated.


vim +1087 fs/ceph/xattr.c

  1058	
  1059	static int ceph_sync_setxattr(struct inode *inode, const char *name,
  1060				      const char *value, size_t size, int flags)
  1061	{
  1062		struct ceph_fs_client *fsc = ceph_sb_to_client(inode->i_sb);
  1063		struct ceph_inode_info *ci = ceph_inode(inode);
  1064		struct ceph_mds_request *req;
  1065		struct ceph_mds_client *mdsc = fsc->mdsc;
  1066		struct ceph_osd_client *osdc = &fsc->client->osdc;
  1067		struct ceph_pagelist *pagelist = NULL;
  1068		int op = CEPH_MDS_OP_SETXATTR;
  1069		int err;
  1070	
  1071		if (size > 0) {
  1072			/* copy value into pagelist */
  1073			pagelist = ceph_pagelist_alloc(GFP_NOFS);
  1074			if (!pagelist)
  1075				return -ENOMEM;
  1076	
  1077			err = ceph_pagelist_append(pagelist, value, size);
  1078			if (err)
  1079				goto out;
  1080		} else if (!value) {
  1081			if (flags & CEPH_XATTR_REPLACE)
  1082				op = CEPH_MDS_OP_RMXATTR;
  1083			else
  1084				flags |= CEPH_XATTR_REMOVE;
  1085		}
  1086	
> 1087		dout("setxattr value size: ld\n", size);
  1088	
  1089		/* do request */
  1090		req = ceph_mdsc_create_request(mdsc, op, USE_AUTH_MDS);
  1091		if (IS_ERR(req)) {
  1092			err = PTR_ERR(req);
  1093			goto out;
  1094		}
  1095	
  1096		req->r_path2 = kstrdup(name, GFP_NOFS);
  1097		if (!req->r_path2) {
  1098			ceph_mdsc_put_request(req);
  1099			err = -ENOMEM;
  1100			goto out;
  1101		}
  1102	
  1103		if (op == CEPH_MDS_OP_SETXATTR) {
  1104			req->r_args.setxattr.flags = cpu_to_le32(flags);
  1105			req->r_args.setxattr.osdmap_epoch =
  1106				cpu_to_le32(osdc->osdmap->epoch);
  1107			req->r_pagelist = pagelist;
  1108			pagelist = NULL;
  1109		}
  1110	
  1111		req->r_inode = inode;
  1112		ihold(inode);
  1113		req->r_num_caps = 1;
  1114		req->r_inode_drop = CEPH_CAP_XATTR_SHARED;
  1115	
  1116		dout("xattr.ver (before): %lld\n", ci->i_xattrs.version);
  1117		err = ceph_mdsc_do_request(mdsc, NULL, req);
  1118		ceph_mdsc_put_request(req);
  1119		dout("xattr.ver (after): %lld\n", ci->i_xattrs.version);
  1120	
  1121	out:
  1122		if (pagelist)
  1123			ceph_pagelist_release(pagelist);
  1124		return err;
  1125	}
  1126	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
