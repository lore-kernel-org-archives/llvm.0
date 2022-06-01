Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D563A
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654115520; x=1685651520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i2CoMCKZWusaz7aKZyipOQ3qwKdv2ES5FNwWBC7IkNY=;
  b=B2U/drpBweZt+BJ1rMrt8lQCDe435AvaynszJm1yUkTIyU+xsTefjjlj
   D0QSKDcs3na011lI/n1bVoM0JEqvlKpsXAuXu19zFhPZZ3JlVACoDByh8
   01vzEy3IfWSDA90BjAwTnm5wRU7Q/zZnIJy2cRQ+lWWhSpl8ln7sAuV8F
   6A0UaOmDBAOvXqCx6S213pT8jqlobnCeLNBNiamXVG6/hktvEIzTF99ek
   ADlEF5nnePFiv7+DZKArIOuk9C+c8bCnsZneDBrajosy5S9CN8WKeAWbZ
   YJXcllXO8fDBg6BK5oCQEMwn/0SqdxE19tM0IJUL8i970yhpsRt7bnc02
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275444496"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="275444496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 13:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="756618553"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2022 13:28:17 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwUwy-0004NQ-OG;
	Wed, 01 Jun 2022 20:28:16 +0000
Date: Thu, 2 Jun 2022 04:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3] ceph: prevent a client from exceeding the MDS
 maximum xattr size
Message-ID: <202206020411.AHeREyCE-lkp@intel.com>
References: <20220601162939.12278-1-lhenriques@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601162939.12278-1-lhenriques@suse.de>

Hi "Luís,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on v5.18 next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/ceph-prevent-a-client-from-exceeding-the-MDS-maximum-xattr-size/20220602-002950
base:   https://github.com/ceph/ceph-client.git for-linus
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220602/202206020411.AHeREyCE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/052d43ff323eb7d212ed64d7cd3e2af4589f4596
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lu-s-Henriques/ceph-prevent-a-client-from-exceeding-the-MDS-maximum-xattr-size/20220602-002950
        git checkout 052d43ff323eb7d212ed64d7cd3e2af4589f4596
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ceph/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ceph/xattr.c:1081:37: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           dout("setxattr value size: %ld\n", size);
                                      ~~~     ^~~~
                                      %zu
   include/linux/ceph/ceph_debug.h:35:45: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:576:38: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
                                       ~~~     ^~~~~~~~~~~
   include/linux/printk.h:132:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1081 fs/ceph/xattr.c

  1052	
  1053	static int ceph_sync_setxattr(struct inode *inode, const char *name,
  1054				      const char *value, size_t size, int flags)
  1055	{
  1056		struct ceph_fs_client *fsc = ceph_sb_to_client(inode->i_sb);
  1057		struct ceph_inode_info *ci = ceph_inode(inode);
  1058		struct ceph_mds_request *req;
  1059		struct ceph_mds_client *mdsc = fsc->mdsc;
  1060		struct ceph_osd_client *osdc = &fsc->client->osdc;
  1061		struct ceph_pagelist *pagelist = NULL;
  1062		int op = CEPH_MDS_OP_SETXATTR;
  1063		int err;
  1064	
  1065		if (size > 0) {
  1066			/* copy value into pagelist */
  1067			pagelist = ceph_pagelist_alloc(GFP_NOFS);
  1068			if (!pagelist)
  1069				return -ENOMEM;
  1070	
  1071			err = ceph_pagelist_append(pagelist, value, size);
  1072			if (err)
  1073				goto out;
  1074		} else if (!value) {
  1075			if (flags & CEPH_XATTR_REPLACE)
  1076				op = CEPH_MDS_OP_RMXATTR;
  1077			else
  1078				flags |= CEPH_XATTR_REMOVE;
  1079		}
  1080	
> 1081		dout("setxattr value size: %ld\n", size);
  1082	
  1083		/* do request */
  1084		req = ceph_mdsc_create_request(mdsc, op, USE_AUTH_MDS);
  1085		if (IS_ERR(req)) {
  1086			err = PTR_ERR(req);
  1087			goto out;
  1088		}
  1089	
  1090		req->r_path2 = kstrdup(name, GFP_NOFS);
  1091		if (!req->r_path2) {
  1092			ceph_mdsc_put_request(req);
  1093			err = -ENOMEM;
  1094			goto out;
  1095		}
  1096	
  1097		if (op == CEPH_MDS_OP_SETXATTR) {
  1098			req->r_args.setxattr.flags = cpu_to_le32(flags);
  1099			req->r_args.setxattr.osdmap_epoch =
  1100				cpu_to_le32(osdc->osdmap->epoch);
  1101			req->r_pagelist = pagelist;
  1102			pagelist = NULL;
  1103		}
  1104	
  1105		req->r_inode = inode;
  1106		ihold(inode);
  1107		req->r_num_caps = 1;
  1108		req->r_inode_drop = CEPH_CAP_XATTR_SHARED;
  1109	
  1110		dout("xattr.ver (before): %lld\n", ci->i_xattrs.version);
  1111		err = ceph_mdsc_do_request(mdsc, NULL, req);
  1112		ceph_mdsc_put_request(req);
  1113		dout("xattr.ver (after): %lld\n", ci->i_xattrs.version);
  1114	
  1115	out:
  1116		if (pagelist)
  1117			ceph_pagelist_release(pagelist);
  1118		return err;
  1119	}
  1120	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
