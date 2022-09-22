Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E63C26
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663855428; x=1695391428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aiNo3fDk7Qzo4gXy82kK0oPrvMA0769iOvCNTZRXQM4=;
  b=J8asdUDBeNhWbfoqbHP5qJHOBKzasidrDDJSVzIMJfFHkNFvHlVZToHy
   C/lxUjX6xzdrwKC/TECl2xvKgWWoJDFco4ad9Ilcpc/21LPakgGmyFwxH
   grKMwpR7xdleukF7niP9/elA2zCrbupiKMnR4r2kLTYSGBgYllNRBLMBy
   S1KaeW6d9cMJ2iDM57V4jl/9eeI5GvzHmr6PjVU01O4jzHa+JmvsN96rE
   MBMJyiNJ1ct5NzeDDd8Mf2jTIltgzBRRecvl++ZWpne0pH4cm9ZalDLyt
   PPf0XSiivX6mzGtnVzMEIfT2cGrFaAc4uUMCxtdDCw/RlW6jsvLWvKSxM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283356014"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="283356014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762193923"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2022 07:03:26 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obMnV-0004iS-2Q;
	Thu, 22 Sep 2022 14:03:25 +0000
Date: Thu, 22 Sep 2022 22:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: allison.henderson@oracle.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 24/26] xfs: Add parent pointer ioctl
Message-ID: <202209222130.jwQOkbWn-lkp@intel.com>
References: <20220922054458.40826-25-allison.henderson@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922054458.40826-25-allison.henderson@oracle.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on next-20220921]
[cannot apply to linus/master v6.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/allison-henderson-oracle-com/Parent-Pointers/20220922-134750
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
config: s390-randconfig-r044-20220922 (https://download.01.org/0day-ci/archive/20220922/202209222130.jwQOkbWn-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/68cfc39e9d3f8a2a85b516d7c9c8491a2333820f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review allison-henderson-oracle-com/Parent-Pointers/20220922-134750
        git checkout 68cfc39e9d3f8a2a85b516d7c9c8491a2333820f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_parent_utils.c:31:1: warning: no previous prototype for function 'xfs_attr_get_parent_pointer' [-Wmissing-prototypes]
   xfs_attr_get_parent_pointer(
   ^
   fs/xfs/xfs_parent_utils.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
>> fs/xfs/xfs_parent_utils.c:57:6: warning: variable 'lock_mode' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (error)
               ^~~~~
   fs/xfs/xfs_parent_utils.c:121:18: note: uninitialized use occurs here
           xfs_iunlock(ip, lock_mode);
                           ^~~~~~~~~
   fs/xfs/xfs_parent_utils.c:57:2: note: remove the 'if' if its condition is always false
           if (error)
           ^~~~~~~~~~
   fs/xfs/xfs_parent_utils.c:44:26: note: initialize the variable 'lock_mode' to silence this warning
           unsigned int                    lock_mode, flags = XFS_ATTR_PARENT;
                                                    ^
                                                     = 0
   2 warnings generated.


vim +/xfs_attr_get_parent_pointer +31 fs/xfs/xfs_parent_utils.c

    24	
    25	/*
    26	 * Get the parent pointers for a given inode
    27	 *
    28	 * Returns 0 on success and non zero on error
    29	 */
    30	int
  > 31	xfs_attr_get_parent_pointer(
    32		struct xfs_inode		*ip,
    33		struct xfs_pptr_info		*ppi)
    34	{
    35	
    36		struct xfs_attrlist		*alist;
    37		struct xfs_attrlist_ent		*aent;
    38		struct xfs_parent_ptr		*xpp;
    39		struct xfs_parent_name_rec	*xpnr;
    40		char				*namebuf;
    41		unsigned int			namebuf_size;
    42		int				name_len, i, error = 0;
    43		unsigned int			ioc_flags = XFS_IOC_ATTR_PARENT;
    44		unsigned int			lock_mode, flags = XFS_ATTR_PARENT;
    45		struct xfs_attr_list_context	context;
    46	
    47		/* Allocate a buffer to store the attribute names */
    48		namebuf_size = sizeof(struct xfs_attrlist) +
    49			       (ppi->pi_ptrs_size) * sizeof(struct xfs_attrlist_ent);
    50		namebuf = kvzalloc(namebuf_size, GFP_KERNEL);
    51		if (!namebuf)
    52			return -ENOMEM;
    53	
    54		memset(&context, 0, sizeof(struct xfs_attr_list_context));
    55		error = xfs_ioc_attr_list_context_init(ip, namebuf, namebuf_size,
    56				ioc_flags, &context);
  > 57		if (error)
    58			goto out_kfree;
    59	
    60		/* Copy the cursor provided by caller */
    61		memcpy(&context.cursor, &ppi->pi_cursor,
    62			sizeof(struct xfs_attrlist_cursor));
    63		context.attr_filter = XFS_ATTR_PARENT;
    64	
    65		lock_mode = xfs_ilock_attr_map_shared(ip);
    66	
    67		error = xfs_attr_list_ilocked(&context);
    68		if (error)
    69			goto out_kfree;
    70	
    71		alist = (struct xfs_attrlist *)namebuf;
    72		for (i = 0; i < alist->al_count; i++) {
    73			struct xfs_da_args args = {
    74				.geo = ip->i_mount->m_attr_geo,
    75				.whichfork = XFS_ATTR_FORK,
    76				.dp = ip,
    77				.namelen = sizeof(struct xfs_parent_name_rec),
    78				.attr_filter = flags,
    79				.op_flags = XFS_DA_OP_OKNOENT,
    80			};
    81	
    82			xpp = xfs_ppinfo_to_pp(ppi, i);
    83			memset(xpp, 0, sizeof(struct xfs_parent_ptr));
    84			aent = (struct xfs_attrlist_ent *)
    85				&namebuf[alist->al_offset[i]];
    86			xpnr = (struct xfs_parent_name_rec *)(aent->a_name);
    87	
    88			if (aent->a_valuelen > XFS_PPTR_MAXNAMELEN) {
    89				error = -EFSCORRUPTED;
    90				goto out_kfree;
    91			}
    92			name_len = aent->a_valuelen;
    93	
    94			args.name = (char *)xpnr;
    95			args.hashval = xfs_da_hashname(args.name, args.namelen),
    96			args.value = (unsigned char *)(xpp->xpp_name);
    97			args.valuelen = name_len;
    98	
    99			error = xfs_attr_get_ilocked(&args);
   100			error = (error == -EEXIST ? 0 : error);
   101			if (error) {
   102				error = -EFSCORRUPTED;
   103				goto out_kfree;
   104			}
   105	
   106			xfs_init_parent_ptr(xpp, xpnr);
   107			if(!xfs_verify_ino(args.dp->i_mount, xpp->xpp_ino)) {
   108				error = -EFSCORRUPTED;
   109				goto out_kfree;
   110			}
   111		}
   112		ppi->pi_ptrs_used = alist->al_count;
   113		if (!alist->al_more)
   114			ppi->pi_flags |= XFS_PPTR_OFLAG_DONE;
   115	
   116		/* Update the caller with the current cursor position */
   117		memcpy(&ppi->pi_cursor, &context.cursor,
   118			sizeof(struct xfs_attrlist_cursor));
   119	
   120	out_kfree:
   121		xfs_iunlock(ip, lock_mode);
   122		kvfree(namebuf);
   123	
   124		return error;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
