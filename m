Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E9190694;
	Wed,  3 Jul 2024 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720041986; cv=none; b=NtEE15Kxk+psaqKtjHQgKyw6RB295uG25yc1H9ZYFWpXGBDZLrz0ZYPhU+DLCGq6nX7ZBzrL+jjNvhOhfnJcyKIO3v4ROHnulFwYL8w39cITU38Cx1exkd45ys31lV5bgqgcjMyiIxXPBr0ruZiEqha9FkB8yylYFvYfyl+4CzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720041986; c=relaxed/simple;
	bh=N4vDhkwtkH6NXF985wmCUNbN+JIz4qMWpF58qBSQ/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJPbuJlK2WI8uOm/EIGFRifNwKfLq4Tu92I1KvxmUamqT07rKJ6+jNw1vGrDIQ51zSuAIH6PNNMR86ArW37b1mMgFw3YqXqYkJ+mMQOBdF5GZUJFJOZemQfare6+uoaidqu/zr7C54zPV0Vho3vPyOcbOE6lpjNvXzB5t8pW1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivZpLah2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivZpLah2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720041984; x=1751577984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4vDhkwtkH6NXF985wmCUNbN+JIz4qMWpF58qBSQ/UU=;
  b=ivZpLah2kSuI+HUP40DJP3lmwShQcArSdWnVH/Bj8YIsgbm0DPLInkD4
   mUfOIH0SQr2zmC0q/saq+tf/6HzGyiMp4ZfWdhmTwBC/pHXaW8mg3n9hH
   08SSDAEOi/PgQ7CQidDNXCGutRhHyY2iN3H64A2WmF/vayaEAHXxAbj31
   VfmabEo/h86RH3Kws60ibEPsEmZNeYB3ASHEtELnQ3dwkK9grXdmTFM2S
   kACncqUj9wDifr/nbOTUJchn6ocE38v23gdL/LWYkowXQOGGBNV8U7uVh
   cFS+5LltFhCYcFsDcyRpAf5mvGiE9P9NxN6QH/pJKMk+IFosc5w9clVVZ
   Q==;
X-CSE-ConnectionGUID: xcaKOe8ST9exWCnqDlm7Ig==
X-CSE-MsgGUID: SRwyiXRyQ1uvoCopCTxMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20201511"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="20201511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 14:26:24 -0700
X-CSE-ConnectionGUID: hO4vBnlwRdOBnWd46L+xgw==
X-CSE-MsgGUID: q6o03YIPR+e2Ds0uBKt95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51330694"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2024 14:26:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP7Ua-000QFM-1P;
	Wed, 03 Jul 2024 21:26:20 +0000
Date: Thu, 4 Jul 2024 05:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] fuse: Convert to new uid/gid option parsing helpers
Message-ID: <202407040514.52Z73Et4-lkp@intel.com>
References: <4e1a4efa-4ca5-4358-acee-40efd07c3c44@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1a4efa-4ca5-4358-acee-40efd07c3c44@redhat.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on mszeredi-fuse/for-next]
[also build test ERROR on linus/master vfs-idmapping/for-next v6.10-rc6 next-20240703]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Sandeen/fuse-verify-g-u-id-mount-options-correctly/20240703-162239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/4e1a4efa-4ca5-4358-acee-40efd07c3c44%40redhat.com
patch subject: [PATCH 2/2] fuse: Convert to new uid/gid option parsing helpers
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20240704/202407040514.52Z73Et4-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040514.52Z73Et4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040514.52Z73Et4-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/inode.c:743:2: error: call to undeclared function 'fsparam_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fsparam_uid     ("user_id",             OPT_USER_ID),
           ^
   fs/fuse/inode.c:744:2: error: call to undeclared function 'fsparam_gid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fsparam_gid     ("group_id",            OPT_GROUP_ID),
           ^
   fs/fuse/inode.c:743:2: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
           fsparam_uid     ("user_id",             OPT_USER_ID),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/inode.c:744:2: error: incompatible integer to pointer conversion initializing 'fs_param_type *' (aka 'int (*)(struct p_log *, const struct fs_parameter_spec *, struct fs_parameter *, struct fs_parse_result *)') with an expression of type 'int' [-Wint-conversion]
           fsparam_gid     ("group_id",            OPT_GROUP_ID),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fuse/inode.c:745:2: error: designator in initializer for scalar type 'u8' (aka 'unsigned char')
           fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:116:33: note: expanded from macro 'fsparam_flag'
   #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:3: note: expanded from macro '__fsparam'
                   .name = NAME, \
                   ^~~~~~~~~~~~
>> fs/fuse/inode.c:746:2: error: designator in initializer for scalar type 'unsigned short'
           fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:116:33: note: expanded from macro 'fsparam_flag'
   #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:3: note: expanded from macro '__fsparam'
                   .name = NAME, \
                   ^~~~~~~~~~~~
>> fs/fuse/inode.c:747:2: error: designator in initializer for scalar type 'const void *'
           fsparam_u32     ("max_read",            OPT_MAX_READ),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:120:32: note: expanded from macro 'fsparam_u32'
   #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:3: note: expanded from macro '__fsparam'
                   .name = NAME, \
                   ^~~~~~~~~~~~
   fs/fuse/inode.c:743:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           fsparam_uid     ("user_id",             OPT_USER_ID),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           {
   fs/fuse/inode.c:804:17: error: no member named 'uid' in 'struct fs_parse_result'
                   kuid = result.uid;
                          ~~~~~~ ^
   fs/fuse/inode.c:816:17: error: no member named 'gid' in 'struct fs_parse_result'
                   kgid = result.gid;
                          ~~~~~~ ^
   1 warning and 9 errors generated.


vim +745 fs/fuse/inode.c

d8a5ba45457e4a Miklos Szeredi 2005-09-09  738  
d7167b149943e3 Al Viro        2019-09-07  739  static const struct fs_parameter_spec fuse_fs_parameters[] = {
c30da2e981a703 David Howells  2019-03-25  740  	fsparam_string	("source",		OPT_SOURCE),
c30da2e981a703 David Howells  2019-03-25  741  	fsparam_u32	("fd",			OPT_FD),
c30da2e981a703 David Howells  2019-03-25  742  	fsparam_u32oct	("rootmode",		OPT_ROOTMODE),
b382c6a31542e9 Eric Sandeen   2024-07-02  743  	fsparam_uid	("user_id",		OPT_USER_ID),
b382c6a31542e9 Eric Sandeen   2024-07-02  744  	fsparam_gid	("group_id",		OPT_GROUP_ID),
c30da2e981a703 David Howells  2019-03-25 @745  	fsparam_flag	("default_permissions",	OPT_DEFAULT_PERMISSIONS),
c30da2e981a703 David Howells  2019-03-25 @746  	fsparam_flag	("allow_other",		OPT_ALLOW_OTHER),
c30da2e981a703 David Howells  2019-03-25 @747  	fsparam_u32	("max_read",		OPT_MAX_READ),
c30da2e981a703 David Howells  2019-03-25  748  	fsparam_u32	("blksize",		OPT_BLKSIZE),
c7eb6869632a5d David Howells  2019-03-25  749  	fsparam_string	("subtype",		OPT_SUBTYPE),
c30da2e981a703 David Howells  2019-03-25  750  	{}
d8a5ba45457e4a Miklos Szeredi 2005-09-09  751  };
d8a5ba45457e4a Miklos Szeredi 2005-09-09  752  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
