Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD201B7E5;
	Sat, 17 Feb 2024 02:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708136247; cv=none; b=SVA1k2CZ/UcSnOruWV7z40LRFY006Re+Tw0BzNYyFoBAO9TDQW/a80KFCm960n6uDBkEem6C8cTSs+CqVYsoruvK3wMnGukZ2UKLgpDDvdvDJltZRGeTJ6j4Yh8AYqlslzUApq65/d7gLGRMZEZq+DpcM0g3lrYGOzPWqigRfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708136247; c=relaxed/simple;
	bh=YE/PvgNqkcihxiMRO2BPM1Ruk9GX/CIFkqUWtcWCyyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlpfGvOTx2OuuDNmdBbIFHehtrwggk7q3P6/nUNa8SoagWQ2V8BjYfOlhYwKJqNqyWzy9iKS3bvgsOM5OgYLN7AGMEadH+65M2LExhYv7AKTS0x0hCUPbfaSahZZ9L05FrEojSi2WF8cqjWZSPud7WTKPg/eMSYwmE1fWwUQxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiUAZnPW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiUAZnPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708136244; x=1739672244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YE/PvgNqkcihxiMRO2BPM1Ruk9GX/CIFkqUWtcWCyyI=;
  b=eiUAZnPWuuRkSiODA0G/FrV+8+0rGTtEpeIXmb8yVZ+6e2vD3lFSiVHs
   JK9g9aF5VVTE+fNlOZdCv8gZ2qW03uJPsIaS8Z+yknMuNitpodd4Zf9FG
   u3sxruKdXu5FDlcZQlCcnMyNJSadOwzkhgJ6W7Htb4qCiEYHByz1M+frI
   W9joCpygMk9OOg8XAmnv+GvLAhePe24cjzvUp3Uz+BGsfthjmMYjSi5hh
   uxt30tus6gnQWxpoMtN40iNAwjTy1wBrwMN3iTFG/Mu0El6aJnMqb0cZp
   fJ8bKNN4fEegJ0K6xHNv3b+DNK3tLouuXXK7VnK6voJCItL9L/bdB2elv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="12907738"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="12907738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 18:17:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="3973389"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2024 18:17:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbAGV-0001l6-1D;
	Sat, 17 Feb 2024 02:17:19 +0000
Date: Sat, 17 Feb 2024 10:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 5/5] overlayfs: Optimize credentials usage
Message-ID: <202402171018.wLqzCOn5-lkp@intel.com>
References: <20240216051640.197378-6-vinicius.gomes@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216051640.197378-6-vinicius.gomes@intel.com>

Hi Vinicius,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.8-rc4 next-20240216]
[cannot apply to mszeredi-vfs/overlayfs-next mszeredi-vfs/next vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinicius-Costa-Gomes/cleanup-Fix-discarded-const-warning-when-defining-lock-guard/20240216-132100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240216051640.197378-6-vinicius.gomes%40intel.com
patch subject: [RFC v3 5/5] overlayfs: Optimize credentials usage
config: i386-buildonly-randconfig-003-20240216 (https://download.01.org/0day-ci/archive/20240217/202402171018.wLqzCOn5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171018.wLqzCOn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171018.wLqzCOn5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/file.c:435:3: error: cannot jump from this goto statement to its label
     435 |                 goto out_unlock;
         |                 ^
   fs/overlayfs/file.c:437:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     437 |         guard(cred)(ovl_creds(file_inode(file)->i_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:210:1: note: expanded from here
     210 | __UNIQUE_ID_guard291
         | ^
   fs/overlayfs/file.c:431:3: error: cannot jump from this goto statement to its label
     431 |                 goto out_unlock;
         |                 ^
   fs/overlayfs/file.c:437:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     437 |         guard(cred)(ovl_creds(file_inode(file)->i_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:210:1: note: expanded from here
     210 | __UNIQUE_ID_guard291
         | ^
   fs/overlayfs/file.c:498:3: error: cannot jump from this goto statement to its label
     498 |                 goto out_unlock;
         |                 ^
   fs/overlayfs/file.c:501:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     501 |         guard(cred)(ovl_creds(file_inode(file_out)->i_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:228:1: note: expanded from here
     228 | __UNIQUE_ID_guard293
         | ^
   fs/overlayfs/file.c:493:3: error: cannot jump from this goto statement to its label
     493 |                 goto out_unlock;
         |                 ^
   fs/overlayfs/file.c:501:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     501 |         guard(cred)(ovl_creds(file_inode(file_out)->i_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:228:1: note: expanded from here
     228 | __UNIQUE_ID_guard293
         | ^
   fs/overlayfs/file.c:488:4: error: cannot jump from this goto statement to its label
     488 |                         goto out_unlock;
         |                         ^
   fs/overlayfs/file.c:501:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     501 |         guard(cred)(ovl_creds(file_inode(file_out)->i_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
--
>> fs/overlayfs/inode.c:78:4: error: cannot jump from this goto statement to its label
      78 |                         goto out_put_write;
         |                         ^
   fs/overlayfs/inode.c:81:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
      81 |                 guard(cred)(ovl_creds(dentry->d_sb));
         |                 ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:244:1: note: expanded from here
     244 | __UNIQUE_ID_guard286
         | ^
   1 error generated.
--
>> fs/overlayfs/namei.c:989:3: error: cannot jump from this goto statement to its label
     989 |                 goto out;
         |                 ^
   fs/overlayfs/namei.c:991:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     991 |         guard(cred)(ovl_creds(dentry->d_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:237:1: note: expanded from here
     237 | __UNIQUE_ID_guard287
         | ^
   1 error generated.
--
>> fs/overlayfs/dir.c:892:3: error: cannot jump from this goto statement to its label
     892 |                 goto out;
         |                 ^
   fs/overlayfs/dir.c:894:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     894 |         guard(cred)(ovl_creds(dentry->d_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:25:1: note: expanded from here
      25 | __UNIQUE_ID_guard299
         | ^
   fs/overlayfs/dir.c:888:3: error: cannot jump from this goto statement to its label
     888 |                 goto out;
         |                 ^
   fs/overlayfs/dir.c:894:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     894 |         guard(cred)(ovl_creds(dentry->d_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:25:1: note: expanded from here
      25 | __UNIQUE_ID_guard299
         | ^
   fs/overlayfs/dir.c:883:4: error: cannot jump from this goto statement to its label
     883 |                         goto out;
         |                         ^
   fs/overlayfs/dir.c:894:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     894 |         guard(cred)(ovl_creds(dentry->d_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:25:1: note: expanded from here
      25 | __UNIQUE_ID_guard299
         | ^
   3 errors generated.
--
>> fs/overlayfs/util.c:1167:3: error: cannot jump from this goto statement to its label
    1167 |                 goto out_unlock;
         |                 ^
   fs/overlayfs/util.c:1172:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1172 |         guard(cred)(ovl_creds(dentry->d_sb));
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:19:1: note: expanded from here
      19 | __UNIQUE_ID_guard284
         | ^
   1 error generated.


vim +435 fs/overlayfs/file.c

2f502839e85ab2 Miklos Szeredi       2018-07-18  419  
aab8848cee5eca Miklos Szeredi       2018-07-18  420  static long ovl_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
aab8848cee5eca Miklos Szeredi       2018-07-18  421  {
aab8848cee5eca Miklos Szeredi       2018-07-18  422  	struct inode *inode = file_inode(file);
aab8848cee5eca Miklos Szeredi       2018-07-18  423  	struct fd real;
aab8848cee5eca Miklos Szeredi       2018-07-18  424  	int ret;
aab8848cee5eca Miklos Szeredi       2018-07-18  425  
23a8ce16419a30 Amir Goldstein       2022-10-17  426  	inode_lock(inode);
23a8ce16419a30 Amir Goldstein       2022-10-17  427  	/* Update mode */
23a8ce16419a30 Amir Goldstein       2022-10-17  428  	ovl_copyattr(inode);
23a8ce16419a30 Amir Goldstein       2022-10-17  429  	ret = file_remove_privs(file);
23a8ce16419a30 Amir Goldstein       2022-10-17  430  	if (ret)
23a8ce16419a30 Amir Goldstein       2022-10-17  431  		goto out_unlock;
23a8ce16419a30 Amir Goldstein       2022-10-17  432  
aab8848cee5eca Miklos Szeredi       2018-07-18  433  	ret = ovl_real_fdget(file, &real);
aab8848cee5eca Miklos Szeredi       2018-07-18  434  	if (ret)
23a8ce16419a30 Amir Goldstein       2022-10-17 @435  		goto out_unlock;
aab8848cee5eca Miklos Szeredi       2018-07-18  436  
d98e0bce422c37 Vinicius Costa Gomes 2024-02-15  437  	guard(cred)(ovl_creds(file_inode(file)->i_sb));
aab8848cee5eca Miklos Szeredi       2018-07-18  438  	ret = vfs_fallocate(real.file, mode, offset, len);
aab8848cee5eca Miklos Szeredi       2018-07-18  439  
aab8848cee5eca Miklos Szeredi       2018-07-18  440  	/* Update size */
c002728f608183 Amir Goldstein       2023-09-27  441  	ovl_file_modified(file);
aab8848cee5eca Miklos Szeredi       2018-07-18  442  
aab8848cee5eca Miklos Szeredi       2018-07-18  443  	fdput(real);
aab8848cee5eca Miklos Szeredi       2018-07-18  444  
23a8ce16419a30 Amir Goldstein       2022-10-17  445  out_unlock:
23a8ce16419a30 Amir Goldstein       2022-10-17  446  	inode_unlock(inode);
23a8ce16419a30 Amir Goldstein       2022-10-17  447  
aab8848cee5eca Miklos Szeredi       2018-07-18  448  	return ret;
aab8848cee5eca Miklos Szeredi       2018-07-18  449  }
aab8848cee5eca Miklos Szeredi       2018-07-18  450  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
