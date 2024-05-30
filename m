Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431C1BF3A;
	Thu, 30 May 2024 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033783; cv=none; b=Iw5gecRuvD6mMvlmBBd4dbo/a6BkVjG+hDSsUdA83gohdfmTRX7vRaixp6iqpDW9Kb5pjhHq5haXFJDQn7FUfL1HVcbbOtKHxP5tYJzF4Sax6qS45E9Hb3FjjZ8s0Em+z0KgQwiE0vG4cdBObv5A85lNo2zbeDbn08kvadrMUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033783; c=relaxed/simple;
	bh=Yg7ADNLFhA8x8n2kljlsNCO28sL98OmzmdIzh3y/eLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6fGsHD9MsSUqWMFyU4PJDEoLK3WBMNb2NmlhqWZR480Yd4D6cVUh2SGm6Pr4coz0RsJKaT0JUIeveLSE6Au18CsH++6VxBoXpFcUyyiDJhPGfeuGMhV832nExpJzru9VTMUMGMccF6qX/+IObPciV1J1SM6jIXi6TRL+i7w94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j46uIzr6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j46uIzr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717033780; x=1748569780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yg7ADNLFhA8x8n2kljlsNCO28sL98OmzmdIzh3y/eLw=;
  b=j46uIzr6XNi4K1xsJpiHugfesybV8Mj8OQfrpqdxUbFLHz6u2f2RR2cM
   6t+DayTcMt0udGycfLgAyv74pCSTWTQh9tBH3H7D3UJfmlD3J8DCwkvLA
   KuicR+pydv0V4zwmclSYPxBs0sRs4MA0tNUieuFwfG8hg7j4l2P69Ni9B
   Q817cCIiWfAifYQWd/HcyRBSHWsba+iUWsYFVH98RTlKs61yXdXI20ewm
   vthzHoV1PGM/8f+vrB6hxJhwIR398AiFf9mhFKaV8vepNoJnNdznzDeQf
   M0qS6XarCN4nixLQ9FzVb+O1v9bskVosxQ0PDOqfUWmUoMJlZjiz57NwM
   w==;
X-CSE-ConnectionGUID: 14JpBYvSQMq3Skl9hBzqLA==
X-CSE-MsgGUID: N1h8v6pvSUymGRGjzYnarQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38871272"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="38871272"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 18:49:39 -0700
X-CSE-ConnectionGUID: 9VN7nmezSeecFN5lDFf2ug==
X-CSE-MsgGUID: sxn7NAeARr20p2UmRvIQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40546398"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 18:49:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCUvA-000EQA-0L;
	Thu, 30 May 2024 01:49:36 +0000
Date: Thu, 30 May 2024 09:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 2/3] net: txgbe: support Flow Director perfect
 filters
Message-ID: <202405300942.GkTBvnAh-lkp@intel.com>
References: <20240529093821.27108-3-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529093821.27108-3-jiawenwu@trustnetic.com>

Hi Jiawen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiawen-Wu/net-txgbe-add-FDIR-ATR-support/20240529-174347
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240529093821.27108-3-jiawenwu%40trustnetic.com
patch subject: [RFC net-next 2/3] net: txgbe: support Flow Director perfect filters
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240530/202405300942.GkTBvnAh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300942.GkTBvnAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300942.GkTBvnAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:325:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     325 |         case 0x7F:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:325:2: note: insert 'break;' to avoid fall-through
     325 |         case 0x7F:
         |         ^
         |         break; 
   drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:340:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     340 |         case TXGBE_ATR_L4TYPE_MASK:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:340:2: note: insert 'break;' to avoid fall-through
     340 |         case TXGBE_ATR_L4TYPE_MASK:
         |         ^
         |         break; 
   drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:359:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     359 |         case 0xFFFF:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c:359:2: note: insert 'break;' to avoid fall-through
     359 |         case 0xFFFF:
         |         ^
         |         break; 
   3 warnings generated.


vim +325 drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c

   303	
   304	int txgbe_fdir_set_input_mask(struct wx *wx, union txgbe_atr_input *input_mask)
   305	{
   306		u32 fdirm = 0, fdirtcpm = 0, flex = 0;
   307	
   308		/* Program the relevant mask registers.  If src/dst_port or src/dst_addr
   309		 * are zero, then assume a full mask for that field.  Also assume that
   310		 * a VLAN of 0 is unspecified, so mask that out as well.  L4type
   311		 * cannot be masked out in this implementation.
   312		 *
   313		 * This also assumes IPv4 only.  IPv6 masking isn't supported at this
   314		 * point in time.
   315		 */
   316	
   317		/* verify bucket hash is cleared on hash generation */
   318		if (input_mask->formatted.bkt_hash)
   319			wx_dbg(wx, "bucket hash should always be 0 in mask\n");
   320	
   321		/* Program FDIRM and verify partial masks */
   322		switch (input_mask->formatted.vm_pool & 0x7F) {
   323		case 0x0:
   324			fdirm |= TXGBE_RDB_FDIR_OTHER_MSK_POOL;
 > 325		case 0x7F:
   326			break;
   327		default:
   328			wx_err(wx, "Error on vm pool mask\n");
   329			return -EINVAL;
   330		}
   331	
   332		switch (input_mask->formatted.flow_type & TXGBE_ATR_L4TYPE_MASK) {
   333		case 0x0:
   334			fdirm |= TXGBE_RDB_FDIR_OTHER_MSK_L4P;
   335			if (input_mask->formatted.dst_port ||
   336			    input_mask->formatted.src_port) {
   337				wx_err(wx, "Error on src/dst port mask\n");
   338				return -EINVAL;
   339			}
   340		case TXGBE_ATR_L4TYPE_MASK:
   341			break;
   342		default:
   343			wx_err(wx, "Error on flow type mask\n");
   344			return -EINVAL;
   345		}
   346	
   347		/* Now mask VM pool and destination IPv6 - bits 5 and 2 */
   348		wr32(wx, TXGBE_RDB_FDIR_OTHER_MSK, fdirm);
   349	
   350		flex = rd32(wx, TXGBE_RDB_FDIR_FLEX_CFG(0));
   351		flex &= ~TXGBE_RDB_FDIR_FLEX_CFG_FIELD0;
   352		flex |= (TXGBE_RDB_FDIR_FLEX_CFG_BASE_MAC |
   353			 TXGBE_RDB_FDIR_FLEX_CFG_OFST(0x6));
   354	
   355		switch ((__force u16)input_mask->formatted.flex_bytes & 0xFFFF) {
   356		case 0x0000:
   357			/* Mask Flex Bytes */
   358			flex |= TXGBE_RDB_FDIR_FLEX_CFG_MSK;
   359		case 0xFFFF:
   360			break;
   361		default:
   362			wx_err(wx, "Error on flexible byte mask\n");
   363			return -EINVAL;
   364		}
   365		wr32(wx, TXGBE_RDB_FDIR_FLEX_CFG(0), flex);
   366	
   367		/* store the TCP/UDP port masks, bit reversed from port layout */
   368		fdirtcpm = ntohs(input_mask->formatted.dst_port);
   369		fdirtcpm <<= TXGBE_RDB_FDIR_PORT_DESTINATION_SHIFT;
   370		fdirtcpm |= ntohs(input_mask->formatted.src_port);
   371	
   372		/* write both the same so that UDP and TCP use the same mask */
   373		wr32(wx, TXGBE_RDB_FDIR_TCP_MSK, ~fdirtcpm);
   374		wr32(wx, TXGBE_RDB_FDIR_UDP_MSK, ~fdirtcpm);
   375		wr32(wx, TXGBE_RDB_FDIR_SCTP_MSK, ~fdirtcpm);
   376	
   377		/* store source and destination IP masks (little-enian) */
   378		wr32(wx, TXGBE_RDB_FDIR_SA4_MSK, ntohl(~input_mask->formatted.src_ip[0]));
   379		wr32(wx, TXGBE_RDB_FDIR_DA4_MSK, ntohl(~input_mask->formatted.dst_ip[0]));
   380	
   381		return 0;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
