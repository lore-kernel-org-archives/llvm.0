Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECADA48;
	Mon, 14 Oct 2024 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900182; cv=none; b=Ms92ti4jjjHttL6fRsfVXbapLQCqzxxyRQsYklw6b+crw4lMOzgdaepPPH8r432kvuBXkGxhgyMAQF2zi4vgfKX0KpkZ/1sV6jFWrhKbe3LCmfR5/PjiB1IAXb+rmAoTnfFoUJ1nHfhVbAGHYb6rQXA/ADLjGbJi7TJGnmjft2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900182; c=relaxed/simple;
	bh=vpIsovd2+HCEgZRWlUIeN5kkyiJSGb4U/zxknEPljbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNgOoXqPBICfzVL/zEZq1gGqpavj5x4s/AEIJGb9/XHh8B0PicBsWkrLGO7jfzFfPA2SQfDS3hoEVvXcGT9gYhS1acRJG0yqBeCvv+Ruqw2gTXropwechDtgrDAr6M6iq/s/UuVP2NrOyf+3muAmnHTBjrl9d6kR3xrQc12/Usg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1nqNM37; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1nqNM37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728900180; x=1760436180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vpIsovd2+HCEgZRWlUIeN5kkyiJSGb4U/zxknEPljbY=;
  b=f1nqNM37weCzMEJ3dOwBtXPeggmP9K6uarCOMjJWCoW5mdzEfnGut7gt
   YVKkPdv0SLNGgbOJXG/3wroIHfvM3Jv/Bt+ryVmhqDICSwm9AmYs3vU6H
   2xAhNQqUnAh9zcJI/q3DIjZ1DG3JQL0uc8tzdIjn0TIctWLgN4zioI4yr
   hSp7Yve76obhBimSjp2urRYaCrvwZMMzRm5oaoAArOkXIpAy7E78hLigs
   2qZ0jYKR+dCZpT1kViqHa7vJuATUCetjYmJn6JWLQ0dlim7g86Z4z2Aiz
   9QWHj39moekWdBDzHOkmyZp5ubipu9sVtUd+rumRXDrrXZmdIqTuXY3OY
   A==;
X-CSE-ConnectionGUID: etyWkBcOQgq2TR6fnlyCJA==
X-CSE-MsgGUID: zJqIkgaWSDymVhTrCeJ0Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28425301"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="28425301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:03:00 -0700
X-CSE-ConnectionGUID: 6oYZvrxxRGuvY+FwoslWOA==
X-CSE-MsgGUID: Gd0QffBDRxqJv0Y2BYDdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77397122"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2024 03:02:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Hui-000FAe-00;
	Mon, 14 Oct 2024 10:02:56 +0000
Date: Mon, 14 Oct 2024 18:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/7] fs: Add inode_get_ino() and implement
 get_ino() for NFS
Message-ID: <202410141711.AKChu4Zr-lkp@intel.com>
References: <20241010152649.849254-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010152649.849254-1-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on trondmy-nfs/linux-next pcmoore-selinux/next linus/master v6.12-rc3 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/audit-Fix-inode-numbers/20241010-232916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241010152649.849254-1-mic%40digikod.net
patch subject: [RFC PATCH v1 1/7] fs: Add inode_get_ino() and implement get_ino() for NFS
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241014/202410141711.AKChu4Zr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141711.AKChu4Zr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141711.AKChu4Zr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/nfs/client.c:47:
>> fs/nfs/internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   3 errors generated.
--
   In file included from fs/nfs/inode.c:49:
>> fs/nfs/internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
>> fs/nfs/inode.c:91:33: error: declaration of anonymous struct must be a definition
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |                                 ^
>> fs/nfs/inode.c:91:46: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |                           ~~~~~              ^
         |                           int
>> fs/nfs/inode.c:91:5: error: conflicting types for 'nfs_compat_user_ino64'
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |     ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
>> fs/nfs/inode.c:91:46: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |                                              ^
>> fs/nfs/inode.c:98:26: error: use of undeclared identifier 'inode'
      98 |         u64 fileid = NFS_FILEID(inode);
         |                                 ^
   1 warning and 7 errors generated.
--
   In file included from fs/nfs/namespace.c:21:
>> fs/nfs/internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
>> fs/nfs/namespace.c:235:13: error: incompatible function pointer types initializing 'u64 (*)(const struct inode *)' (aka 'unsigned long long (*)(const struct inode *)') with an expression of type 'u64 (u64)' (aka 'unsigned long long (unsigned long long)') [-Wincompatible-function-pointer-types]
     235 |         .get_ino        = nfs_compat_user_ino64,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/namespace.c:241:13: error: incompatible function pointer types initializing 'u64 (*)(const struct inode *)' (aka 'unsigned long long (*)(const struct inode *)') with an expression of type 'u64 (u64)' (aka 'unsigned long long (unsigned long long)') [-Wincompatible-function-pointer-types]
     241 |         .get_ino        = nfs_compat_user_ino64,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
   In file included from fs/nfs/nfs4proc.c:61:
>> fs/nfs/internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   fs/nfs/nfs4proc.c:9462:12: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9462 |         unsigned *ptr;
         |                   ^
   1 warning and 3 errors generated.
--
   In file included from fs/nfs/filelayout/filelayout.c:40:
>> fs/nfs/filelayout/../internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/filelayout/../internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/filelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   3 errors generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:22:
>> fs/nfs/flexfilelayout/../internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/flexfilelayout/../internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/flexfilelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   fs/nfs/flexfilelayout/flexfilelayout.c:1238:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1238 |         int err;
         |             ^
   1 warning and 3 errors generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:15:
>> fs/nfs/flexfilelayout/../internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/flexfilelayout/../internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/flexfilelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^
   1 warning and 3 errors generated.
--
   In file included from fs/nfs/blocklayout/blocklayout.c:43:
>> fs/nfs/blocklayout/../internal.h:454:40: error: declaration of anonymous struct must be a definition
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                        ^
>> fs/nfs/blocklayout/../internal.h:454:53: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~              ^
         |                                  int
>> fs/nfs/blocklayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^
   include/linux/nfs_fs.h:448:12: note: previous declaration is here
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^
   fs/nfs/blocklayout/blocklayout.c:384:9: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     384 |         size_t count = header->args.count;
         |                ^
   1 warning and 3 errors generated.


vim +454 fs/nfs/internal.h

   440	
   441	/* inode.c */
   442	extern struct workqueue_struct *nfsiod_workqueue;
   443	extern struct workqueue_struct *nfslocaliod_workqueue;
   444	extern struct inode *nfs_alloc_inode(struct super_block *sb);
   445	extern void nfs_free_inode(struct inode *);
   446	extern int nfs_write_inode(struct inode *, struct writeback_control *);
   447	extern int nfs_drop_inode(struct inode *);
   448	extern void nfs_clear_inode(struct inode *);
   449	extern void nfs_evict_inode(struct inode *);
   450	extern void nfs_zap_acl_cache(struct inode *inode);
   451	extern void nfs_set_cache_invalid(struct inode *inode, unsigned long flags);
   452	extern bool nfs_check_cache_invalid(struct inode *, unsigned long);
   453	extern int nfs_wait_bit_killable(struct wait_bit_key *key, int mode);
 > 454	extern u64 nfs_compat_user_ino64(const struct *inode);
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
