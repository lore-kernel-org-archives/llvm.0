Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229D1A3150;
	Thu, 31 Jul 2025 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753963127; cv=none; b=mpeRS/PZYZLD8ZiKjCb8d+Mxx6bEHhc4wsBi9LipSoD/Kuj7CXj+MVIVP8mtYyaDcVp3ru6mrab0PObe2GiAQyeDra/pf6K103kCXFdfDylCe+xZOxXMCKcybr8JohMOZictXuR/jNclTs3lKIhgpozOw1uP/oQSySmtQWaEJTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753963127; c=relaxed/simple;
	bh=tNoXWwvWQbqlFtYXzrT1UZX3GrjrrW8QenY36N0vl90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIhCO+uTXYmARDgr/CFxZSRbwOOqPiXxH1PLQksZGJUl5QxpxAPOy1l/ImhcMoaZ3nTUpR4Ip9ZpAeorPJcXEib+CSGe0cdsC5BPBb+0fO9rn31z8yCQIK1xsO97zqwROw+JgxOxVNdmz++0nRJ4yXmm67xfH7Znw6+Ljw/Uyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLh+VkKC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLh+VkKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753963126; x=1785499126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNoXWwvWQbqlFtYXzrT1UZX3GrjrrW8QenY36N0vl90=;
  b=lLh+VkKCXAAId5YUJBGk1BOpFobdLmr/hweT83IhrsRijNWjjTtWBJBh
   ysXpi0M+Qoy6QZLPyvuuD+eLsVAAd/1Srl9Eqq7GbA89JLtCL1NjM7X+5
   5ZyM47dZTNpC4IqIbHFZarIzh7A9Ips+fZ556U7cdb4DDrd7rg5Xg+85o
   XUm5g6RJ+pZ4ohj6KX6DxOfLkeRhGB5XuZMTnRoh8UvWmozj+Kud7pIfq
   TtfSfPO0MTu+3xUOtaAkZAga7TmzNe+AfhMcefbp/wwweJ1rWkIA8vwXV
   B1i5eb5JHvQ6X7HLfq4OctQ41RepMTG7WDel6o7MKgDOOePgbTgJVCQvW
   w==;
X-CSE-ConnectionGUID: e6J6DSFCSICnLcDQEkTA6g==
X-CSE-MsgGUID: cf+iuyUhTKGIfdYt9HQcRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56149538"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="56149538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 04:58:45 -0700
X-CSE-ConnectionGUID: h8B0eOTjSPiYILRaospTeQ==
X-CSE-MsgGUID: u1o93U89S3mUPnFxhiwPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="167492742"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2025 04:58:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhRvk-0003k4-12;
	Thu, 31 Jul 2025 11:58:40 +0000
Date: Thu, 31 Jul 2025 19:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Li Jun <lijun01@kylinos.cn>, gregkh@linuxfoundation.org,
	mingo@kernel.org, tglx@linutronix.de, nathan@kernel.org,
	n.zhandarovich@fintech.ru, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: atm: Fix kernel coding style
Message-ID: <202507311928.0ny4leMQ-lkp@intel.com>
References: <20250731014134.535119-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731014134.535119-1-lijun01@kylinos.cn>

Hi Li,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.16 next-20250731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Jun/usb-atm-Fix-kernel-coding-style/20250731-094241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250731014134.535119-1-lijun01%40kylinos.cn
patch subject: [PATCH] usb: atm: Fix kernel coding style
config: i386-buildonly-randconfig-003-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311928.0ny4leMQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311928.0ny4leMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311928.0ny4leMQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:511:35: note: expanded from macro 'CXACRU_ALL_FILES'
     511 | #define CXACRU_ALL_FILES(_action) \
         |                                   ^
   <scratch space>:27:1: note: expanded from here
      27 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:511:35: note: expanded from macro 'CXACRU_ALL_FILES'
     511 | #define CXACRU_ALL_FILES(_action) \
         |                                   ^
   <scratch space>:27:1: note: expanded from here
      27 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:511:35: note: expanded from macro 'CXACRU_ALL_FILES'
     511 | #define CXACRU_ALL_FILES(_action) \
         |                                   ^
   <scratch space>:27:1: note: expanded from here
      27 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:512:80: note: expanded from macro 'CXACRU_ALL_FILES'
     512 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_RATE,           u32,  downstream_rate); \
         |                                                                                ^
   <scratch space>:37:1: note: expanded from here
      37 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:512:80: note: expanded from macro 'CXACRU_ALL_FILES'
     512 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_RATE,           u32,  downstream_rate); \
         |                                                                                ^
   <scratch space>:37:1: note: expanded from here
      37 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:512:80: note: expanded from macro 'CXACRU_ALL_FILES'
     512 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_RATE,           u32,  downstream_rate); \
         |                                                                                ^
   <scratch space>:37:1: note: expanded from here
      37 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:513:78: note: expanded from macro 'CXACRU_ALL_FILES'
     513 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_RATE,             u32,  upstream_rate); \
         |                                                                              ^
   <scratch space>:47:1: note: expanded from here
      47 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:513:78: note: expanded from macro 'CXACRU_ALL_FILES'
     513 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_RATE,             u32,  upstream_rate); \
         |                                                                              ^
   <scratch space>:47:1: note: expanded from here
      47 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:513:78: note: expanded from macro 'CXACRU_ALL_FILES'
     513 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_RATE,             u32,  upstream_rate); \
         |                                                                              ^
   <scratch space>:47:1: note: expanded from here
      47 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:514:76: note: expanded from macro 'CXACRU_ALL_FILES'
     514 | CXACRU_ATTR_##_action(CXINF_LINK_STATUS,               LINK, link_status); \
         |                                                                            ^
   <scratch space>:57:1: note: expanded from here
      57 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:514:76: note: expanded from macro 'CXACRU_ALL_FILES'
     514 | CXACRU_ATTR_##_action(CXINF_LINK_STATUS,               LINK, link_status); \
         |                                                                            ^
   <scratch space>:57:1: note: expanded from here
      57 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:514:76: note: expanded from macro 'CXACRU_ALL_FILES'
     514 | CXACRU_ATTR_##_action(CXINF_LINK_STATUS,               LINK, link_status); \
         |                                                                            ^
   <scratch space>:57:1: note: expanded from here
      57 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:515:76: note: expanded from macro 'CXACRU_ALL_FILES'
     515 | CXACRU_ATTR_##_action(CXINF_LINE_STATUS,               LINE, line_status); \
         |                                                                            ^
   <scratch space>:67:1: note: expanded from here
      67 | CXACRU__ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro 'CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:515:76: note: expanded from macro 'CXACRU_ALL_FILES'
     515 | CXACRU_ATTR_##_action(CXINF_LINE_STATUS,               LINE, line_status); \
         |                                                                            ^
   <scratch space>:67:1: note: expanded from here
      67 | CXACRU__ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro 'CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:515:76: note: expanded from macro 'CXACRU_ALL_FILES'
     515 | CXACRU_ATTR_##_action(CXINF_LINE_STATUS,               LINE, line_status); \
         |                                                                            ^
   <scratch space>:67:1: note: expanded from here
      67 | CXACRU__ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro 'CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:516:38: note: expanded from macro 'CXACRU_ALL_FILES'
     516 | CXACRU__ATTR_##_action(mac_address); \
         |                                      ^
   <scratch space>:71:1: note: expanded from here
      71 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:516:38: note: expanded from macro 'CXACRU_ALL_FILES'
     516 | CXACRU__ATTR_##_action(mac_address); \
         |                                      ^
   <scratch space>:71:1: note: expanded from here
      71 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:516:38: note: expanded from macro 'CXACRU_ALL_FILES'
     516 | CXACRU__ATTR_##_action(mac_address); \
         |                                      ^
   <scratch space>:71:1: note: expanded from here
      71 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:517:84: note: expanded from macro 'CXACRU_ALL_FILES'
     517 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_SNR_MARGIN,       dB,   upstream_snr_margin); \
         |                                                                                    ^
   <scratch space>:81:1: note: expanded from here
      81 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:517:84: note: expanded from macro 'CXACRU_ALL_FILES'
     517 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_SNR_MARGIN,       dB,   upstream_snr_margin); \
         |                                                                                    ^
   <scratch space>:81:1: note: expanded from here
      81 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:517:84: note: expanded from macro 'CXACRU_ALL_FILES'
     517 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_SNR_MARGIN,       dB,   upstream_snr_margin); \
         |                                                                                    ^
   <scratch space>:81:1: note: expanded from here
      81 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:518:86: note: expanded from macro 'CXACRU_ALL_FILES'
     518 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_SNR_MARGIN,     dB,   downstream_snr_margin); \
         |                                                                                      ^
   <scratch space>:91:1: note: expanded from here
      91 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:518:86: note: expanded from macro 'CXACRU_ALL_FILES'
     518 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_SNR_MARGIN,     dB,   downstream_snr_margin); \
         |                                                                                      ^
   <scratch space>:91:1: note: expanded from here
      91 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:518:86: note: expanded from macro 'CXACRU_ALL_FILES'
     518 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_SNR_MARGIN,     dB,   downstream_snr_margin); \
         |                                                                                      ^
   <scratch space>:91:1: note: expanded from here
      91 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:519:85: note: expanded from macro 'CXACRU_ALL_FILES'
     519 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_ATTENUATION,      dB,   upstream_attenuation); \
         |                                                                                     ^
   <scratch space>:101:1: note: expanded from here
     101 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected ')'
   drivers/usb/atm/cxacru.c:519:85: note: expanded from macro 'CXACRU_ALL_FILES'
     519 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_ATTENUATION,      dB,   upstream_attenuation); \
         |                                                                                     ^
   <scratch space>:101:1: note: expanded from here
     101 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   drivers/usb/atm/cxacru.c:539:1: note: to match this '('
   drivers/usb/atm/cxacru.c:519:85: note: expanded from macro 'CXACRU_ALL_FILES'
     519 | CXACRU_ATTR_##_action(CXINF_UPSTREAM_ATTENUATION,      dB,   upstream_attenuation); \
         |                                                                                     ^
   <scratch space>:101:1: note: expanded from here
     101 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:198:34: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     198 | #define CXACRU__ATTR_INIT(_name) \
         |                                  ^
>> drivers/usb/atm/cxacru.c:539:1: error: expected identifier or '('
     539 | CXACRU_ALL_FILES(INIT);
         | ^
   drivers/usb/atm/cxacru.c:520:87: note: expanded from macro 'CXACRU_ALL_FILES'
     520 | CXACRU_ATTR_##_action(CXINF_DOWNSTREAM_ATTENUATION,    dB,   downstream_attenuation); \
         |                                                                                       ^
   <scratch space>:111:1: note: expanded from here
     111 | CXACRU_ATTR_INIT
         | ^
   drivers/usb/atm/cxacru.c:218:3: note: expanded from macro 'CXACRU_ATTR_INIT'
     218 | } \
         |   ^
   drivers/usb/atm/cxacru.c:199:2: note: expanded from macro '\
   CXACRU__ATTR_INIT'
     199 | (static DEVICE_ATTR_RO(_name))
         |  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +539 drivers/usb/atm/cxacru.c

fa70fe44aba95c Simon Arlott 2007-03-06  538  
fa70fe44aba95c Simon Arlott 2007-03-06 @539  CXACRU_ALL_FILES(INIT);
fa70fe44aba95c Simon Arlott 2007-03-06  540  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
