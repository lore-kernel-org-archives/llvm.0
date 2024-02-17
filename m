Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DD1C15;
	Sat, 17 Feb 2024 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708147635; cv=none; b=CheWOPTjaY94lyHLRwTYBn+UIvccRF8RJMu4miK/qr/SMFmbwX3aMV2sp9bxQrqBVEy8cSWGitd64G7HVgjdv0p0OUyyYrEw8NIGFbKyhV7TgqbrSd79u/cdyV3gI1lef9QQZhvqM78EW8mdHXhU1qfVVtewpSkQz6pQlxZaR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708147635; c=relaxed/simple;
	bh=gnVMXMKLG+nbWBjfyaxTDhBV36sWaw3mAMIkwnqewf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWDwRALaY1YPspvjmm29SZoQJUw/Lm0P4s7Wc/OcaE3RkTQAKNDUQboiE0b6JeYcMc4o/z4flFDZVuLWGqbeQNgaM7jxJt83vPJFwjgXCaBoJ23zyEEo44Qx62Y0lgj3lU5GVqgkiiLTNhsPeTrqI3N0v783LsdAuoEJSvCaAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjWmqd+8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjWmqd+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708147633; x=1739683633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gnVMXMKLG+nbWBjfyaxTDhBV36sWaw3mAMIkwnqewf4=;
  b=CjWmqd+8Hyv/wfAYCGeMAUWzFDTCSD3DcPZ1hYsIYRwV4Eg4wq3t7kgI
   aWLIxMfAxHRww9BZ3hAEGJDteA25yP3ScvEY/D7vaipu8uZwb+ULcxx4D
   4BPCVNZ4SHfoKjqtARIdOkI3zjNOXQLVVQn5iEc5Iwq9kazKn6/J/n/rR
   noMw/zxjC05YFAMB3x4v+bd3uMKxgBXj0dXlDBMIzepizsPu/4sDTCZHS
   AOwdPN1tK5E9gb4cpFKOQgOvWYUmHB6GRb9z8RciSZz5/SI3hRWbkqVGK
   wAjNHPnKVrcMShnKIJHi91BmcDAoEKesjWTEQ6MyzS8hS+HnOgRJ6nptW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19710043"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="19710043"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 21:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4184009"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2024 21:27:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbDED-0001s4-0q;
	Sat, 17 Feb 2024 05:27:09 +0000
Date: Sat, 17 Feb 2024 13:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.pidfd 18/20] fs/dcache.c:2691:7: error:
 incompatible pointer types passing 'struct dentry *' to parameter of type
 'struct inode *'
Message-ID: <202402171322.SGWds8uL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.pidfd
head:   ffebc37672ec6446071a9244a17a080efb95924e
commit: ffd9f05253ab2839436ffe549eadb3e26328f1c7 [18/20] dcache: add d_instantiate_unique_anon()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240217/202402171322.SGWds8uL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171322.SGWds8uL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171322.SGWds8uL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/dcache.c:2691:7: error: incompatible pointer types passing 'struct dentry *' to parameter of type 'struct inode *' [-Werror,-Wincompatible-pointer-types]
    2691 |         iput(entry);
         |              ^~~~~
   include/linux/fs.h:2538:32: note: passing argument to parameter here
    2538 | extern void iput(struct inode *);
         |                                ^
   1 error generated.


vim +2691 fs/dcache.c

  2644	
  2645	/**
  2646	 * d_instantiate_unique_anon - reuse existing, unhashed dentry or add new one
  2647	 * @entry: dentry to add
  2648	 * @inode: The inode to attach this dentry
  2649	 *
  2650	 * Helper for special filesystems that want to recycle the exact same dentry
  2651	 * over and over. Dentries must be unhashed, IS_ROOT() dentries gotten via
  2652	 * d_alloc_anon(). Anything else is a bug. Caller must provide valid inode.
  2653	 */
  2654	struct dentry *d_instantiate_unique_anon(struct dentry *entry, struct inode *inode)
  2655	{
  2656		struct dentry *alias;
  2657		unsigned int hash = entry->d_name.hash;
  2658	
  2659		if (!inode)
  2660			return NULL;
  2661	
  2662		if (!IS_ROOT(entry))
  2663			return NULL;
  2664	
  2665		if (WARN_ON_ONCE(!d_unhashed(entry)))
  2666			return NULL;
  2667	
  2668		if (WARN_ON_ONCE(!hlist_unhashed(&entry->d_u.d_alias)))
  2669			return NULL;
  2670	
  2671		spin_lock(&inode->i_lock);
  2672		hlist_for_each_entry(alias, &inode->i_dentry, d_u.d_alias) {
  2673			if (alias->d_name.hash != hash)
  2674				continue;
  2675			if (!d_same_name(alias, entry->d_parent, &entry->d_name))
  2676				continue;
  2677			if (WARN_ON_ONCE(!IS_ROOT(alias)))
  2678				continue;
  2679			if (WARN_ON_ONCE(!d_unhashed(alias)))
  2680				continue;
  2681			spin_lock(&alias->d_lock);
  2682			dget_dlock(alias);
  2683			spin_unlock(&alias->d_lock);
  2684			spin_unlock(&inode->i_lock);
  2685			return alias;
  2686		}
  2687	
  2688		__d_instantiate(entry, inode);
  2689		spin_unlock(&inode->i_lock);
  2690		security_d_instantiate(entry, inode);
> 2691		iput(entry);
  2692		return NULL;
  2693	}
  2694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
