Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238724C669;
	Wed, 11 Jun 2025 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681646; cv=none; b=FflgAyHs5bfh1blJJ3KEalWw2SWP4vboUX3TDFogg8I+fphl6tJx6dLxvIfH0u16dUcoO84OyTHO+XLYfyAWCQY0ikjwe3z9nN0SPmxO740IVxSxc4TwA6KD5a3V9a0eVGDjJAdVnmYX/e0cglK51GiALqBADTjToN31ptYYj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681646; c=relaxed/simple;
	bh=clL+hHukW8hOdwCbYC9qmyTSO39mKRqxJ0JAVmgRT4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssgrr7zEiMIXoO7hLSRog6gvx8wO+KhV/OAdpewnqhiPErj3kWomJu+l+g9uhspD+1Hv3wcx/GA1TdM08QaV8X8aSMVh27s2Ayhf42LFjLaH+84gUdH6VS/ofPShZSofVKVCAiJ+TFwkgfNoYt6k0ySAlBf6aJfOGZ4WsBYmlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuN+tLEH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuN+tLEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749681644; x=1781217644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clL+hHukW8hOdwCbYC9qmyTSO39mKRqxJ0JAVmgRT4M=;
  b=kuN+tLEH+yYGkk7gu4m7vpJZ5PXrYdOyN/1x7VbwglEnPDi+vkwhBqy3
   kzr/mRRtgTToWgTogxVUmJN8VehMo7ingmPWkrQZ8EUrGDwv7pugZB8NA
   sFdirB9ygvzNL5/4XWIaOmv/F8J1JQZFNvMkxTchKHxdpAw3DvC4d8ztl
   jrJwTTGCSH8Kehl7i6aU6t4XsQE+Xof9V6g4ZCtXRC5uhtiOSSziq7z2z
   ZarcetMzsXTrCUwLcZ8W0dYVJrijpe7rUMHVtMo+ChmWyVVb1SMFNO7fA
   cKzFycs6eYWH0kWr/GxqdAZFggIfPQD14PQb0AU2xokKCApjoA++FijOK
   A==;
X-CSE-ConnectionGUID: aAMUXzxaQMi+9U4SLWDfKQ==
X-CSE-MsgGUID: 2eF77Lj5Shqiq3ABVeZVzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69405164"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="69405164"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 15:40:44 -0700
X-CSE-ConnectionGUID: 5TGcI8TISU2TWTN2UvZkQw==
X-CSE-MsgGUID: Q8IkK4TCQJOPK1eDbmrX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="151130052"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2025 15:40:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPU7a-000AuI-10;
	Wed, 11 Jun 2025 22:40:38 +0000
Date: Thu, 12 Jun 2025 06:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
	duanqiangwen@net-swift.com, linglingzhang@trustnetic.com,
	jiawenwu@net-swift.com, Mengyuan Lou <mengyuanlou@net-swift.com>
Subject: Re: [PATCH net-next 06/12] net: txgbevf: init interrupts and request
 irqs
Message-ID: <202506120658.JRvrXNTk-lkp@intel.com>
References: <20250611083559.14175-7-mengyuanlou@net-swift.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611083559.14175-7-mengyuanlou@net-swift.com>

Hi Mengyuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mengyuan-Lou/net-libwx-add-mailbox-api-for-wangxun-vf-drivers/20250611-165134
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250611083559.14175-7-mengyuanlou%40net-swift.com
patch subject: [PATCH net-next 06/12] net: txgbevf: init interrupts and request irqs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250612/202506120658.JRvrXNTk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120658.JRvrXNTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120658.JRvrXNTk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c:77:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
      77 |                 default:
         |                 ^
   drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c:77:3: note: insert 'break;' to avoid fall-through
      77 |                 default:
         |                 ^
         |                 break; 
   1 warning generated.


vim +77 drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c

    46	
    47	static void txgbevf_set_num_queues(struct wx *wx)
    48	{
    49		u32 def_q = 0, num_tcs = 0;
    50		u16 rss, queue;
    51		int ret = 0;
    52	
    53		/* Start with base case */
    54		wx->num_rx_queues = 1;
    55		wx->num_tx_queues = 1;
    56	
    57		spin_lock_bh(&wx->mbx.mbx_lock);
    58		/* fetch queue configuration from the PF */
    59		ret = wx_get_queues_vf(wx, &num_tcs, &def_q);
    60		spin_unlock_bh(&wx->mbx.mbx_lock);
    61	
    62		if (ret)
    63			return;
    64	
    65		/* we need as many queues as traffic classes */
    66		if (num_tcs > 1) {
    67			wx->num_rx_queues = num_tcs;
    68		} else {
    69			rss = min_t(u16, num_online_cpus(), TXGBEVF_MAX_RSS_NUM);
    70			queue = min_t(u16, wx->mac.max_rx_queues, wx->mac.max_tx_queues);
    71			rss = min_t(u16, queue, rss);
    72	
    73			switch (wx->vfinfo->vf_api) {
    74			case wx_mbox_api_13:
    75				wx->num_rx_queues = rss;
    76				wx->num_tx_queues = rss;
  > 77			default:
    78				break;
    79			}
    80		}
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
