Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE092812;
	Thu, 12 Oct 2023 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dk4Yc1uG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697082000; x=1728618000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8SBRFphgAc7XrE3Rb1ofRf9mr/jw3QSkmnhwpE8Gxc=;
  b=dk4Yc1uGsUwC8kTq1LXDAx9LHwxvp0P6zLhlEp/JpN4UHW+ihPgLNTiR
   Lum5TYzLk9LlOa1MhFrMrBVezdvtK9VSjeCIr8o9bgYye/1hMkXJPwN4o
   GeVkScpyCAzrbno5GxtzwxUPOmTUdNtU9C266XwqxfavQ/DLvgbco97+0
   wwBJ3/px8dYtXckqkkxZ6oppIK1fmCPf7B+3QR9cdQWCkwy0lukUKD/M+
   Nf7lUe2ttzZ+DeeOUGHM8PyRDfXtEnIqM0/vEy1U98cSDn8dT42ng1rhn
   NSWGxoOIGPfImixBuGYsYAREBhUGZ5hKwngMN8gDQ7qgQfuFk7XVT7UTG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387662610"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="387662610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754085414"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="754085414"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Oct 2023 20:39:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqmWl-00036b-1a;
	Thu, 12 Oct 2023 03:38:51 +0000
Date: Thu, 12 Oct 2023 11:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/080-wifi 30/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3965:7: warning:
 variable 'netinfo' is used uninitialized whenever switch case is taken
Message-ID: <202310121102.nSPI9qYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 3952a7bc01860b0efa4efc162197fc0ddafe7187 [30/32] Finish 6G support by supporting new scan structures
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310121102.nSPI9qYu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121102.nSPI9qYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121102.nSPI9qYu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3965:7: warning: variable 'netinfo' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    3965 |         case cpu_to_le32(3):
         |              ^~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3971:9: note: uninitialized use occurs here
    3971 |         return netinfo;
         |                ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3952:39: note: initialize the variable 'netinfo' to silence this warning
    3952 |         struct brcmf_pno_net_info_le *netinfo;
         |                                              ^
         |                                               = NULL
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3984:7: warning: variable 'netinfo' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    3984 |         case cpu_to_le32(1):
         |              ^~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3995:9: note: uninitialized use occurs here
    3995 |         return netinfo;
         |                ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3985:7: warning: variable 'netinfo' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    3985 |         case cpu_to_le32(2):
         |              ^~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3995:9: note: uninitialized use occurs here
    3995 |         return netinfo;
         |                ^~~~~~~
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3981:2: warning: variable 'netinfo' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    3981 |         default:
         |         ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3995:9: note: uninitialized use occurs here
    3995 |         return netinfo;
         |                ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3978:42: note: initialize the variable 'netinfo' to silence this warning
    3978 |         struct brcmf_pno_net_info_v3_le *netinfo;
         |                                                 ^
         |                                                  = NULL
   4 warnings generated.


vim +/netinfo +3965 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  3947	
  3948	static struct brcmf_pno_net_info_le *
  3949	brcmf_get_netinfo_array(struct brcmf_pno_scanresults_le *pfn_v1)
  3950	{
  3951		struct brcmf_pno_scanresults_v2_le *pfn_v2;
  3952		struct brcmf_pno_net_info_le *netinfo;
  3953	
  3954		switch (pfn_v1->version) {
  3955		default:
  3956			WARN_ON(1);
  3957			fallthrough;
  3958		case cpu_to_le32(1):
  3959			netinfo = (struct brcmf_pno_net_info_le *)(pfn_v1 + 1);
  3960			break;
  3961		case cpu_to_le32(2):
  3962			pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
  3963			netinfo = (struct brcmf_pno_net_info_le *)(pfn_v2 + 1);
  3964			break;
> 3965		case cpu_to_le32(3):
  3966			brcmf_err(
  3967				"This should use the brcmf_get_netinfo_v3_array function to retrieve the array\n");
  3968			break;
  3969		}
  3970	
  3971		return netinfo;
  3972	}
  3973	
  3974	static struct brcmf_pno_net_info_v3_le *
  3975	brcmf_get_netinfo_v3_array(struct brcmf_pno_scanresults_le *pfn_v1)
  3976	{
  3977		struct brcmf_pno_scanresults_v2_le *pfn_v2;
  3978		struct brcmf_pno_net_info_v3_le *netinfo;
  3979	
  3980		switch (pfn_v1->version) {
> 3981		default:
  3982			WARN_ON(1);
  3983			fallthrough;
  3984		case cpu_to_le32(1):
  3985		case cpu_to_le32(2):
  3986			brcmf_err(
  3987				"This should use the brcmf_get_netinfo_array function to retrieve the array\n");
  3988			break;
  3989		case cpu_to_le32(3):
  3990			pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
  3991			netinfo = (struct brcmf_pno_net_info_v3_le *)(pfn_v2 + 1);
  3992			break;
  3993		}
  3994	
  3995		return netinfo;
  3996	}
  3997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
