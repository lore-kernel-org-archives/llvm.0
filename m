Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28210799;
	Sat, 20 Apr 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713598130; cv=none; b=NwnJ4ykJbBa6SfJuaYr2JyPXq+x6GJ/nvcGNCwhgUC6b2Ib0bIdqiaDg7hReSje/WdSAhRMQUhuDsHdXCGwm48829wiYnozUG9RYn7z07c65Fcr2WYM9v1WYGmlMXErh+mHHsTx8KKbU/k/1EvE1Japgk41Cwwk+vRG/7O2oL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713598130; c=relaxed/simple;
	bh=sAivAzT0oVwaD9n5WBgB4BnplJuETqJ5cyvWAY3Tfpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpAzkiH2jQB2UFZk9UuvbUg1X86QRUZWsPOy0SkLpbDGjFTDOxXqFpS3Q3vR0lxkuTsbvLtGArrH3+sU4z6fRJCFNHeJzfFl6koECAPWTpBdq+KRvVeiEl5m9WIyho+DmLaN6vVHFWHv+YHpCB7HN47trYWQM1qrJQbf0qfd8H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY1BRNQR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY1BRNQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713598128; x=1745134128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAivAzT0oVwaD9n5WBgB4BnplJuETqJ5cyvWAY3Tfpg=;
  b=aY1BRNQR77PtaY7xKVJnBycqMywnlZeSDRxAeNCojPEpa4MAwLdzilgE
   010KHBnwPlOTRBcFk/T7UpxTiIM8aqZ8prHJBFsBe2mj/reLL+GU3fstR
   CJjicTrI8TfxA3PEa1fc6zpOgonA8NJZiSDgALeRzE5+XCMjLx2OjlqYn
   JcAdiYlHxQSEWxYp5sZM0uVuVZgNpFGU2uz2/USkf+JkRRQ5dBlNADbls
   mv0fK/lY/nVPipGkzjtLT4J3gRn90V3Q+wjUy3Du06fnkFS3YPc3dYiAA
   Xg+Wwx0cVue5gRiPnXiZrvsz1NaMj0FdBEim95C5Me3huhtgIL2gOsVCf
   A==;
X-CSE-ConnectionGUID: Gy69XioxR+a4kPYQvlfoYQ==
X-CSE-MsgGUID: Xo6SZ2cpTNiOekEI65I0MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34603241"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="34603241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 00:28:48 -0700
X-CSE-ConnectionGUID: sf4796HUS/Sv4+tWzL1/ig==
X-CSE-MsgGUID: 9jWw6ZpkSTi3kFz5eAg6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23412050"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Apr 2024 00:28:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry59P-000Apu-1Q;
	Sat, 20 Apr 2024 07:28:43 +0000
Date: Sat, 20 Apr 2024 15:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 3/3] fs/nfsd/nfsctl.c:1690:6: warning: variable
 'nthreads' is used uninitialized whenever 'if' condition is true
Message-ID: <202404201540.SB2DhrAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c8be1a810c477b09b0d1bb6640f28868d6a5c16f
commit: c8be1a810c477b09b0d1bb6640f28868d6a5c16f [3/3] nfsd: revise the threads set/get format
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240420/202404201540.SB2DhrAG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201540.SB2DhrAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201540.SB2DhrAG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/nfsctl.c:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfsd/nfsctl.c:13:
   In file included from include/linux/sunrpc/svcsock.h:13:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/nfsd/nfsctl.c:1690:6: warning: variable 'nthreads' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1690 |         if (count > 1)
         |             ^~~~~~~~~
   fs/nfsd/nfsctl.c:1732:16: note: uninitialized use occurs here
    1732 |         return ret == nthreads ? 0 : ret;
         |                       ^~~~~~~~
   fs/nfsd/nfsctl.c:1690:2: note: remove the 'if' if its condition is always false
    1690 |         if (count > 1)
         |         ^~~~~~~~~~~~~~
    1691 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:1672:14: note: initialize the variable 'nthreads' to silence this warning
    1672 |         u32 nthreads;
         |                     ^
         |                      = 0
   18 warnings generated.


vim +1690 fs/nfsd/nfsctl.c

  1656	
  1657	/**
  1658	 * nfsd_nl_threads_set_doit - set the number of running threads
  1659	 * @skb: reply buffer
  1660	 * @info: netlink metadata and command arguments
  1661	 *
  1662	 * Return 0 on success or a negative errno.
  1663	 */
  1664	int nfsd_nl_threads_set_doit(struct sk_buff *skb, struct genl_info *info)
  1665	{
  1666		struct net *net = genl_info_net(info);
  1667		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  1668		const struct nlattr *attr;
  1669		const char *scope = NULL;
  1670		int ret, rem;
  1671		int count = 0, nrpools;
  1672		u32 nthreads;
  1673	
  1674		if (GENL_REQ_ATTR_CHECK(info, NFSD_A_SERVER_THREADS))
  1675			return -EINVAL;
  1676	
  1677		/* count number of SERVER_THREADS values */
  1678		nlmsg_for_each_attr(attr, info->nlhdr, GENL_HDRLEN, rem) {
  1679			if (nla_type(attr) == NFSD_A_SERVER_THREADS)
  1680				++count;
  1681		}
  1682	
  1683		mutex_lock(&nfsd_mutex);
  1684		nrpools = nfsd_nrpools(net);
  1685		if (nrpools && (count > nrpools))
  1686			count = nrpools;
  1687	
  1688		/* FIXME: make this handle non-global pool-modes */
  1689		ret = -EOPNOTSUPP;
> 1690		if (count > 1)
  1691			goto out_unlock;
  1692	
  1693		nthreads = nla_get_u32(info->attrs[NFSD_A_SERVER_THREADS]);
  1694		if (info->attrs[NFSD_A_SERVER_GRACETIME] ||
  1695		    info->attrs[NFSD_A_SERVER_LEASETIME] ||
  1696		    info->attrs[NFSD_A_SERVER_SCOPE]) {
  1697	
  1698			ret = -EBUSY;
  1699			if (nn->nfsd_serv && nn->nfsd_serv->sv_nrthreads)
  1700				goto out_unlock;
  1701	
  1702			ret = -EINVAL;
  1703			attr = info->attrs[NFSD_A_SERVER_GRACETIME];
  1704			if (attr) {
  1705				u32 gracetime = nla_get_u32(attr);
  1706	
  1707				if (gracetime < 10 || gracetime > 3600)
  1708					goto out_unlock;
  1709	
  1710				nn->nfsd4_grace = gracetime;
  1711			}
  1712	
  1713			attr = info->attrs[NFSD_A_SERVER_LEASETIME];
  1714			if (attr) {
  1715				u32 leasetime = nla_get_u32(attr);
  1716	
  1717				if (leasetime < 10 || leasetime > 3600)
  1718					goto out_unlock;
  1719	
  1720				nn->nfsd4_lease = leasetime;
  1721			}
  1722	
  1723			attr = info->attrs[NFSD_A_SERVER_SCOPE];
  1724			if (attr)
  1725				scope = nla_data(attr);
  1726		}
  1727	
  1728		ret = nfsd_svc(nthreads, net, get_current_cred(), scope);
  1729	out_unlock:
  1730		mutex_unlock(&nfsd_mutex);
  1731	
  1732		return ret == nthreads ? 0 : ret;
  1733	}
  1734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
