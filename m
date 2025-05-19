Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23420F08E;
	Mon, 19 May 2025 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682524; cv=none; b=Qeev2R5owZpt8gxD/3kqY3p9UAgqDz0+iepzHP6mVhJIgcLO61S+PY7AoBAFVBXNFtxQ28MRrlajwkFoJIk0oicduktmsiVghOpjE1LrwATSHvHp6zDYqQWEUVuLRTF2kcsbhrh9pBudolZX44HS38bKGHEKdjj1xz88G1EIWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682524; c=relaxed/simple;
	bh=0SL3ej0FQcdPxVAGnPKIMa3enhbho3e+2nvkuCl9iqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDg6sTLLhmRlEKmEuyUZ11Y+2su0JGSbUJgC2XgoubjdrivQOenCu/5Jz74rHLMmOQgSN/czI1iCLK1895qx9+bWF59V685fj0FaU5Whx7m1Z9IEGxOYyCYJwUie/lPj3Yq8u5hJgS3zJFcdbFiCSwZZyOhoY2gwrL5FOa1sf24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyogKODr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyogKODr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747682523; x=1779218523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SL3ej0FQcdPxVAGnPKIMa3enhbho3e+2nvkuCl9iqA=;
  b=IyogKODr032WqOkaZIpX2Bmlg7Bbeefcmbzm0lKNqXoabmWKmRFMD/mT
   15aiLWq0FGxZfEV8igEFqkERggg2P9VchREya8sg6+unjuCh3LEF4b1HZ
   ncvKt7cI0v6zRUsSIxuSYFC5ABOH2MdPxO1CS2vEaPGyW6bp6JGDS3zWs
   dHOkaWJ/Cs8aXFX1DmxGh0sWj32OivvzczxT6rY1aYFRZnuwopw5k1tmI
   +iUtMwM22tYKd5J7A231Iov8gkFllRAE7N7jpbTXDp7vkMVPWhqzgXA3l
   vXr6qu0h7x9RNS6dxEG4hjsw8Px5PSl/qm3o8bEvrn6Dc70jcuPNPzvlL
   g==;
X-CSE-ConnectionGUID: 7qCi4DjQQseDkMQ98+T4NA==
X-CSE-MsgGUID: XeAgAy9cRX+n6JNM+24h8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49471139"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49471139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:22:01 -0700
X-CSE-ConnectionGUID: m5HY1MJORDeQAW1cyNCNpw==
X-CSE-MsgGUID: sCXD3PGlS0m5qAkbxz9FrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140358982"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 12:22:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH63g-000LmG-22;
	Mon, 19 May 2025 19:21:56 +0000
Date: Tue, 20 May 2025 03:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 2/2] fs/inode.c:2591:40: error: passing
 'const struct inode *' to parameter of type 'struct inode *' discards
 qualifiers
Message-ID: <202505200336.LdTIrBPj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   3d7c34e70ff9f9f109feb055469b6a056e07b88b
commit: 3d7c34e70ff9f9f109feb055469b6a056e07b88b [2/2] vfs: Fix inode ownership checks with regard to foreign ownership
config: s390-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200336.LdTIrBPj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200336.LdTIrBPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200336.LdTIrBPj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/inode.c:2591:40: error: passing 'const struct inode *' to parameter of type 'struct inode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2591 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   fs/internal.h:55:69: note: passing argument to parameter 'inode' here
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                                     ^
   1 error generated.
--
>> fs/attr.c:101:40: error: passing 'const struct inode *' to parameter of type 'struct inode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     101 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   fs/internal.h:55:69: note: passing argument to parameter 'inode' here
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                                     ^
   fs/attr.c:130:40: error: passing 'const struct inode *' to parameter of type 'struct inode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     130 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   fs/internal.h:55:69: note: passing argument to parameter 'inode' here
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                                     ^
   2 errors generated.


vim +2591 fs/inode.c

  2569	
  2570	/**
  2571	 * inode_owner_or_capable - check current task permissions to inode
  2572	 * @idmap: idmap of the mount the inode was found from
  2573	 * @inode: inode being checked
  2574	 *
  2575	 * Return true if current either has CAP_FOWNER in a namespace with the
  2576	 * inode owner uid mapped, or owns the file.
  2577	 *
  2578	 * If the inode has been found through an idmapped mount the idmap of
  2579	 * the vfsmount must be passed through @idmap. This function will then take
  2580	 * care to map the inode according to @idmap before checking permissions.
  2581	 * On non-idmapped mounts or if permission checking is to be performed on the
  2582	 * raw inode simply pass @nop_mnt_idmap.
  2583	 */
  2584	bool inode_owner_or_capable(struct mnt_idmap *idmap,
  2585				    const struct inode *inode)
  2586	{
  2587		vfsuid_t vfsuid;
  2588		struct user_namespace *ns;
  2589		int ret;
  2590	
> 2591		ret = vfs_inode_is_owned_by_me(idmap, inode);
  2592		if (ret == 0)
  2593			return true;
  2594		if (ret < 0)
  2595			return false;
  2596	
  2597		vfsuid = i_uid_into_vfsuid(idmap, inode);
  2598		ns = current_user_ns();
  2599		if (vfsuid_has_mapping(ns, vfsuid) && ns_capable(ns, CAP_FOWNER))
  2600			return true;
  2601		return false;
  2602	}
  2603	EXPORT_SYMBOL(inode_owner_or_capable);
  2604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
