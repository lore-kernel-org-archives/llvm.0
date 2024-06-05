Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85D621;
	Wed,  5 Jun 2024 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717546172; cv=none; b=nMa/azN0EuLkUOAiax1MIGB1BhkJxzxZ7UlZ/CPVfYnT+fssgwKgn1Wkzc5K23f1SicK4vvfArlimEiQIylqSlrs8a+U8/+7Q9R4KZn9Sq+XMEaXaGAur/wsVjma9kQ4sHhA2Rj2DwGg+gRPjRlY2j0579tSJDA08kMFZiVperc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717546172; c=relaxed/simple;
	bh=HDeBiNyM0UH6gVh1dsToODVSST3YTpQgfByyudlMXZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qijHCF4V1ykeiDStgBpIkSg2KbB0vhtQ17LzjuWfjfCcCata6rGE855rWWnI1woergd5zLUVgM3Guluu9d7MXwqvHIJQY4U82KhVkyoI2hk6NkHmrFiErjEBnVkRnHnhnGkog5UY3VN0gbnT+ahoqM14CM2t9KbJgs0u3PK8XkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrUDqs1f; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrUDqs1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717546169; x=1749082169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HDeBiNyM0UH6gVh1dsToODVSST3YTpQgfByyudlMXZ4=;
  b=nrUDqs1fN4P/yaiBBWAPjh1xpRmCLrK04op9f6sH7dzChPtvwyi7/j/5
   Ui/hEnk4ZouHJDqio+9u+x8nT7LW6TvEJDZZs38qdhqJN4oNrpNJ9PWhH
   TMX9OlVZ3gBogTZ5dEq/M3StJ4bLI3EfG6GRss03ctK6/v0z+q8La+KXv
   ZNPVP6UdcHRb4RwHdwHhGhAA53PIuOijhgyCM45W+WWNpRMAuLQyotIVD
   s9Ck5Wmflbw8qvxQDpiRtudn8gihOCBI2Al88twCAV5BO11zcdNFQNBm8
   OqvpKKaPNl2nQWt7ZlI5v31FOTlqDwZE7q0U5UY/8P4moTKfz3U9KLDP5
   A==;
X-CSE-ConnectionGUID: x/TaBlgtTTGbjuURLkUx+w==
X-CSE-MsgGUID: DF17OjGvQhKDhtGAD/oHwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11908302"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="11908302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 17:09:29 -0700
X-CSE-ConnectionGUID: TC8joihgR6itdnLzjdzL9g==
X-CSE-MsgGUID: NoVc9QKyTXmUUKKj9Sqnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37464965"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2024 17:09:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEeDV-0000hg-1F;
	Wed, 05 Jun 2024 00:09:25 +0000
Date: Wed, 5 Jun 2024 08:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 3/3] fs/nfsd/nfsctl.c:1677:14: warning: variable
 'total' set but not used
Message-ID: <202406050841.axBDBTDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   ff49ed9ff4b74def8eed480ffb8029c51c87545e
commit: ff49ed9ff4b74def8eed480ffb8029c51c87545e [3/3] nfsd: allow passing in array of thread counts via netlink
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240605/202406050841.axBDBTDh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050841.axBDBTDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050841.axBDBTDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/nfsctl.c:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfsd/nfsctl.c:13:
   In file included from include/linux/sunrpc/svcsock.h:13:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/nfsd/nfsctl.c:13:
   In file included from include/linux/sunrpc/svcsock.h:13:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/nfsd/nfsctl.c:13:
   In file included from include/linux/sunrpc/svcsock.h:13:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/nfsd/nfsctl.c:1677:14: warning: variable 'total' set but not used [-Wunused-but-set-variable]
    1677 |         int rem, i, total = 0;
         |                     ^
   18 warnings generated.


vim +/total +1677 fs/nfsd/nfsctl.c

  1666	
  1667	/**
  1668	 * nfsd_nl_threads_set_doit - set the number of running threads
  1669	 * @skb: reply buffer
  1670	 * @info: netlink metadata and command arguments
  1671	 *
  1672	 * Return 0 on success or a negative errno.
  1673	 */
  1674	int nfsd_nl_threads_set_doit(struct sk_buff *skb, struct genl_info *info)
  1675	{
  1676		int *nthreads, count = 0, nrpools, ret = -EOPNOTSUPP;
> 1677		int rem, i, total = 0;
  1678		struct net *net = genl_info_net(info);
  1679		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  1680		const struct nlattr *attr;
  1681		const char *scope = NULL;
  1682	
  1683		if (GENL_REQ_ATTR_CHECK(info, NFSD_A_SERVER_THREADS))
  1684			return -EINVAL;
  1685	
  1686		/* count number of SERVER_THREADS values */
  1687		nlmsg_for_each_attr(attr, info->nlhdr, GENL_HDRLEN, rem) {
  1688			if (nla_type(attr) == NFSD_A_SERVER_THREADS)
  1689				count++;
  1690		}
  1691	
  1692		mutex_lock(&nfsd_mutex);
  1693	
  1694		nrpools = max(count, nfsd_nrpools(net));
  1695		nthreads = kcalloc(nrpools, sizeof(int), GFP_KERNEL);
  1696		if (!nthreads) {
  1697			ret = -ENOMEM;
  1698			goto out_unlock;
  1699		}
  1700	
  1701		i = 0;
  1702		nlmsg_for_each_attr(attr, info->nlhdr, GENL_HDRLEN, rem) {
  1703			if (nla_type(attr) == NFSD_A_SERVER_THREADS) {
  1704				total += nthreads[i++] = nla_get_u32(attr);
  1705				if (i >= count)
  1706					break;
  1707			}
  1708		}
  1709	
  1710		if (info->attrs[NFSD_A_SERVER_GRACETIME] ||
  1711		    info->attrs[NFSD_A_SERVER_LEASETIME] ||
  1712		    info->attrs[NFSD_A_SERVER_SCOPE]) {
  1713			ret = -EBUSY;
  1714			if (nn->nfsd_serv && nn->nfsd_serv->sv_nrthreads)
  1715				goto out_unlock;
  1716	
  1717			ret = -EINVAL;
  1718			attr = info->attrs[NFSD_A_SERVER_GRACETIME];
  1719			if (attr) {
  1720				u32 gracetime = nla_get_u32(attr);
  1721	
  1722				if (gracetime < 10 || gracetime > 3600)
  1723					goto out_unlock;
  1724	
  1725				nn->nfsd4_grace = gracetime;
  1726			}
  1727	
  1728			attr = info->attrs[NFSD_A_SERVER_LEASETIME];
  1729			if (attr) {
  1730				u32 leasetime = nla_get_u32(attr);
  1731	
  1732				if (leasetime < 10 || leasetime > 3600)
  1733					goto out_unlock;
  1734	
  1735				nn->nfsd4_lease = leasetime;
  1736			}
  1737	
  1738			attr = info->attrs[NFSD_A_SERVER_SCOPE];
  1739			if (attr)
  1740				scope = nla_data(attr);
  1741		}
  1742	
  1743		ret = nfsd_svc(nrpools, nthreads, net, get_current_cred(), scope);
  1744		if (ret > 0)
  1745			ret = 0;
  1746	out_unlock:
  1747		mutex_unlock(&nfsd_mutex);
  1748		kfree(nthreads);
  1749		return ret;
  1750	}
  1751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
