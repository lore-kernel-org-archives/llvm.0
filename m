Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7972636;
	Sat, 24 May 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081806; cv=none; b=QG6gcH+TKt/LfC5WFcemPXdA2+6xUdAvuRnqiCq3Ar9oRvvbYSJXNTvkoPSEaLS3et02ikno7hdn51iccd32kmvFqlnUf1hGBQDF0fWnh+6m2o0OGPImh8uSGKnHEcmGsjm2NbsI1GforECB6Mrj1ZZmWwHnVMz13PXPgVfNZ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081806; c=relaxed/simple;
	bh=tkgsikOFEBAvQEbcmRSmb8lXKUmtZtHNpC4Z2oD5TB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tuDGr9dPZ+o0xcQ5SOnFZQ1HwncIfCaCl7RtCwtRuPkp3LrzRhL76PDhs6gAfm0vnIxkMywDA+J/QQwh1WDwqLQjgVul3k5gZxRCrXQcE5Cu3A0wFWAjzY1DaPeePs75vS/Ul/hEwG7PUgh1EERG/8CP2UJVgN1Iw9L5Kw4BJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crac2sEl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crac2sEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748081805; x=1779617805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkgsikOFEBAvQEbcmRSmb8lXKUmtZtHNpC4Z2oD5TB8=;
  b=crac2sElUDXoEQerxK020OIN7bhrYpVidZRWeP9PftFbLkmvjDxc7gPe
   zHTPUodfUHi6EPoJtreqVlGtUa+1MMT6SICDExLpE4fO89zKehGoSWGIE
   jesX1Q/9iXCHSKXBHq8tu6MOxrw3+cutVIR3szEnoUqrh2fK3x2DXBTcb
   G8rUdTB06FCJBVaqrRi8R9XSgqYVqJWm00A4T3oWslozn1OpAByj0DqUO
   J1Q47Ed2ODrVJdMGToMY5pcs7Z/CSufhy3/n6+j6OoO0AN+GTv9L/eNGu
   LjR4lTX1OiNQhhkJwLnEV9pQ4sChSUhs+pz1azx37SXiAogzs9xMMB3yQ
   A==;
X-CSE-ConnectionGUID: 7+Yu/Mz1SvqCZF6E2njiUw==
X-CSE-MsgGUID: 7oQ9ZuXBSu6wftryy5sE8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61478091"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61478091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:16:44 -0700
X-CSE-ConnectionGUID: pgbIEnXgSy29jOaEakjaoQ==
X-CSE-MsgGUID: UScw3lF5QJibLUHEzTVxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="164742513"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 May 2025 03:16:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIlvk-000R6q-2D;
	Sat, 24 May 2025 10:16:40 +0000
Date: Sat, 24 May 2025 18:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sharath Srinivasan <sharath.srinivasan@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Gerd Rausch <gerd.rausch@oracle.com>
Subject: [jlayton:uek-localio 1954/2262] net/rds/rds.h:1279:41: warning:
 result of comparison of constant 9223372036854775807 with expression of type
 'unsigned long' is always true
Message-ID: <202505241812.Se3iJnIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 73a9aa78a055a18eac4ee5e4b143b40a4e5e5fcc [1954/2262] net/rds: mod reconnect delay on sendmsg()
config: arm-randconfig-003-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241812.Se3iJnIA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241812.Se3iJnIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241812.Se3iJnIA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rds/tcp_stats.c:37:
   net/rds/rds.h:1034:22: error: no member named 'net' in 'possible_net_t'
    1034 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rds.h:1279:41: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1279 |                    (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from net/rds/tcp.c:40:
   net/rds/rds.h:1034:22: error: no member named 'net' in 'possible_net_t'
    1034 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rds.h:1279:41: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1279 |                    (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   In file included from net/rds/tcp.c:40:
   In file included from net/rds/rds.h:12:
   include/uapi/linux/rds.h:280:18: warning: field peer_addr within 'struct rds6_info_tcp_socket' is less aligned than 'struct in6_addr' and is usually due to 'struct rds6_info_tcp_socket' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     280 |         struct in6_addr peer_addr;
         |                         ^
   2 warnings and 1 error generated.
--
   In file included from net/rds/cong.c:38:
   net/rds/rds.h:1034:22: error: no member named 'net' in 'possible_net_t'
    1034 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rds.h:1279:41: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1279 |                    (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   net/rds/cong.c:264:21: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
     264 |                             virt_to_page(page_addrs[i]),
         |                                          ^~~~~~~~~~~~~
   arch/arm/include/asm/memory.h:384:53: note: expanded from macro 'virt_to_page'
     384 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:52:27: note: expanded from macro '__pfn_to_page'
      52 | ({      unsigned long __pfn = (pfn);                    \
         |                                ^~~
   arch/arm/include/asm/memory.h:290:53: note: passing argument to parameter 'p' here
     290 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   1 warning and 2 errors generated.
--
   In file included from net/rds/rdma.c:38:
   In file included from net/rds/trace.h:19:
   net/rds/rds.h:1034:22: error: no member named 'net' in 'possible_net_t'
    1034 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rds.h:1279:41: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1279 |                    (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   net/rds/rdma.c:603:27: warning: variable 'local_vec' set but not used [-Wunused-but-set-variable]
     603 |         struct rds_iovec __user *local_vec;
         |                                  ^
   2 warnings and 1 error generated.
--
   In file included from net/rds/send.c:38:
   net/rds/rds.h:1034:22: error: no member named 'net' in 'possible_net_t'
    1034 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rds.h:1279:41: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1279 |                    (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   net/rds/send.c:1380:18: warning: variable 'rns' set but not used [-Wunused-but-set-variable]
    1380 |         struct rds_net *rns;
         |                         ^
   2 warnings and 1 error generated.


vim +1279 net/rds/rds.h

  1267	
  1268	static inline bool rds_cond_queue_reconnect_work(struct rds_conn_path *cp, unsigned long delay)
  1269	{
  1270		unsigned long mod_delay = max(delay,
  1271					      msecs_to_jiffies(rds_sysctl_reconnect_max_jiffies));
  1272	
  1273		if (!test_and_set_bit(RDS_RECONNECT_PENDING, &cp->cp_flags)) {
  1274			rds_queue_delayed_work(cp, cp->cp_wq, &cp->cp_up_or_down_w,
  1275					       delay, "reconnect work");
  1276			return true;
  1277		} else if (!test_bit(RDS_SHUTDOWN_WORK_QUEUED, &cp->cp_flags) &&
  1278			   (cp->cp_up_or_down_w.timer.expires > 0) &&
> 1279			   (cp->cp_up_or_down_w.timer.expires < KTIME_MAX) &&
  1280			   time_after(cp->cp_up_or_down_w.timer.expires,
  1281				      jiffies + mod_delay)) {
  1282			/* mod_delayed_work due to an immediate sendmsg()
  1283			 * by always allowing shortening the delay,
  1284			 * if the existing reconnect timer expires later
  1285			 * than reconnect_max_delay_ms (1s).
  1286			 */
  1287			rds_mod_delayed_work(cp, cp->cp_wq, &cp->cp_up_or_down_w,
  1288					     mod_delay, "reconnect work");
  1289			return true;
  1290		} else {
  1291			return false;
  1292		}
  1293	}
  1294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
