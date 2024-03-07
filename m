Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995045C82;
	Thu,  7 Mar 2024 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709780265; cv=none; b=FyJgUPAdOGnzOTgmCFBaeotTIkUx3hH+t5ZpKrVHYhDtRanUeCY80spzovD5T3+KaSSZqS7woRR4dS8i9l1COUaBKRKk74jEQ4LPJClj/LwQKJcn2bMM4LedxDa1AOQmiEdGv0vzLhjTf/vNTM/+8I4wC1NY98POn08y5RgVJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709780265; c=relaxed/simple;
	bh=bW/njpQ/dAm1KbGtGFt5W1YOmJ5ZtXXTiG/Q/DJKpHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzszEWjPU7svWJLMrL6807ZRflbevK/m1Ft4VRbRC4bGhVQ2WzO3j8TlwnQlXs7s4SiGPq+moPgx60X1RUFe1Tp8TSmtK4fXButgSwXq2rDuMLDoEHKRA8VlOb3Bk20VNMA8Ha3W/4AvFI6psEhOiE9AYb2I0TqYykxdPPqqiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE4rs0Lc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE4rs0Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709780264; x=1741316264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bW/njpQ/dAm1KbGtGFt5W1YOmJ5ZtXXTiG/Q/DJKpHQ=;
  b=CE4rs0LcgLQI3XukDi962+IZ1ScbiKWaddCRbe75eJh7vzR/4ch3j7k8
   q88BoXHUDn72K+hxJWZ/KGuuyLjjNUcPBbW34O0uxJr41FtCWh2QocLyQ
   D2czVWHZ4IijRyoLSkuco0CKcx8x0En/b9O8Hl7RjSzFmBJ0snKTqQYOZ
   86yYIiV8cRPirCuLIF1VarGNp7mFVe+qwVAjXmDcU63uwzGPpQ8A5wcX9
   35rcZm6eEH4RUBd+PVhQBx25T+tj+7BnxvpAW6JBSDn3Ziqr6t3UDA6nn
   epm333qDE1EoD800l9DfLqzOWbfGV1+Uw9i6ovQPP9Tg2xlXJlW2PLaD0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15006709"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="15006709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 18:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="14620867"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2024 18:57:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri3wx-0004jh-04;
	Thu, 07 Mar 2024 02:57:39 +0000
Date: Thu, 7 Mar 2024 10:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:evm-fscaps-v2 29/29] security/security.c:2375:8:
 error: call to undeclared function 'ima_inode_set_fscaps'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202403071011.ToNWLeka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux evm-fscaps-v2
head:   49621962de7e9bad18b99e21dcb8b32f5af7b61e
commit: 49621962de7e9bad18b99e21dcb8b32f5af7b61e [29/29] fixes
config: hexagon-randconfig-002-20240307 (https://download.01.org/0day-ci/archive/20240307/202403071011.ToNWLeka-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071011.ToNWLeka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071011.ToNWLeka-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/security.c:14:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from security/security.c:14:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from security/security.c:14:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> security/security.c:2375:8: error: call to undeclared function 'ima_inode_set_fscaps'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = ima_inode_set_fscaps(idmap, dentry, caps, flags);
                 ^
   security/security.c:2375:8: note: did you mean 'evm_inode_set_fscaps'?
   include/linux/evm.h:181:19: note: 'evm_inode_set_fscaps' declared here
   static inline int evm_inode_set_fscaps(struct mnt_idmap *idmap,
                     ^
>> security/security.c:2434:8: error: call to undeclared function 'ima_inode_remove_fscaps'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = ima_inode_remove_fscaps(dentry);
                 ^
   security/security.c:2434:8: note: did you mean 'evm_inode_remove_fscaps'?
   include/linux/evm.h:188:19: note: 'evm_inode_remove_fscaps' declared here
   static inline int evm_inode_remove_fscaps(struct dentry *dentry)
                     ^
   6 warnings and 2 errors generated.


vim +/ima_inode_set_fscaps +2375 security/security.c

  2353	
  2354	/**
  2355	 * security_inode_set_fscaps() - Check if setting fscaps is allowed
  2356	 * @idmap: idmap of the mount
  2357	 * @dentry: file
  2358	 * @caps: fscaps to be written
  2359	 * @flags: flags for setxattr
  2360	 *
  2361	 * Check permission before setting the file capabilities given in @vfs_caps.
  2362	 *
  2363	 * Return: Returns 0 if permission is granted.
  2364	 */
  2365	int security_inode_set_fscaps(struct mnt_idmap *idmap, struct dentry *dentry,
  2366				      const struct vfs_caps *caps, int flags)
  2367	{
  2368		int ret;
  2369	
  2370		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2371			return 0;
  2372		ret = call_int_hook(inode_set_fscaps, 0, idmap, dentry, caps, flags);
  2373		if (ret)
  2374			return ret;
> 2375		ret = ima_inode_set_fscaps(idmap, dentry, caps, flags);
  2376		if (ret)
  2377			return ret;
  2378		return evm_inode_set_fscaps(idmap, dentry, caps, flags);
  2379	}
  2380	
  2381	/**
  2382	 * security_inode_post_set_fscaps() - Update the inode after setting fscaps
  2383	 * @idmap: idmap of the mount
  2384	 * @dentry: file
  2385	 * @caps: fscaps to be written
  2386	 * @flags: flags for setxattr
  2387	 *
  2388	 * Update inode security field after successfully setting fscaps.
  2389	 *
  2390	 */
  2391	void security_inode_post_set_fscaps(struct mnt_idmap *idmap,
  2392					    struct dentry *dentry,
  2393					    const struct vfs_caps *caps, int flags)
  2394	{
  2395		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2396			return;
  2397		call_void_hook(inode_post_set_fscaps, idmap, dentry, caps, flags);
  2398		evm_inode_post_set_fscaps(idmap, dentry, caps, flags);
  2399	}
  2400	
  2401	/**
  2402	 * security_inode_get_fscaps() - Check if reading fscaps is allowed
  2403	 * @dentry: file
  2404	 *
  2405	 * Check permission before getting fscaps.
  2406	 *
  2407	 * Return: Returns 0 if permission is granted.
  2408	 */
  2409	int security_inode_get_fscaps(struct mnt_idmap *idmap, struct dentry *dentry)
  2410	{
  2411		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2412			return 0;
  2413		return call_int_hook(inode_get_fscaps, 0, idmap, dentry);
  2414	}
  2415	
  2416	/**
  2417	 * security_inode_remove_fscaps() - Check if removing fscaps is allowed
  2418	 * @idmap: idmap of the mount
  2419	 * @dentry: file
  2420	 *
  2421	 * Check permission before removing fscaps.
  2422	 *
  2423	 * Return: Returns 0 if permission is granted.
  2424	 */
  2425	int security_inode_remove_fscaps(struct mnt_idmap *idmap, struct dentry *dentry)
  2426	{
  2427		int ret;
  2428	
  2429		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2430			return 0;
  2431		ret = call_int_hook(inode_remove_fscaps, 0, idmap, dentry);
  2432		if (ret)
  2433			return ret;
> 2434		ret = ima_inode_remove_fscaps(dentry);
  2435		if (ret)
  2436			return ret;
  2437		return evm_inode_remove_fscaps(dentry);
  2438	}
  2439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
