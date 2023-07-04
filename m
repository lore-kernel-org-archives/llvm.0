Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297E1368;
	Tue,  4 Jul 2023 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688454830; x=1719990830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siXw7Hgvg0qvEBA2mPmaJ8uv1VSpnqahj1u53oKb7/s=;
  b=k6Y684/efrK40AH7l+oe5Sn4R/P43IWWgwmAZyMW9tX31HgKcfRw0kzI
   s21y8UR02aHVA8jgUyI4K0orE+P6ThYdu+U1SZ6Y/iNoZ8ku+A4nAQ3kU
   80uj+TGwBbI7dEarW4DiaVMZ7U/+f//ny6035sP1uCyzgODHFQDxtUsAT
   78SRmlSeo//SwyO5e2Z4ErDkA7SRQhZz5j4CkR5M/1FRrQbU2IXL5sckd
   lSbsUiFkWePyVIEuWFDBaX5A1jaUJhMMyoD3vxqcQAtSsbZdNHikuqFnG
   W14pyhniP8z2J/lCPkMvsuMirKUeaT+LRL1S4t6rb5neeSUAzACjZfgsY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343390782"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="343390782"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 00:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788772161"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="788772161"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 00:13:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGaEG-000I45-2L;
	Tue, 04 Jul 2023 07:13:40 +0000
Date: Tue, 4 Jul 2023 15:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>
Subject: drivers/hid/hid-nvidia-shield.c:59:2: warning: field  within 'struct
 thunderstrike_hostcmd_resp_report' is less aligned than 'union
 thunderstrike_hostcmd_resp_report::(anonymous at
 drivers/hid/hid-nvidia-shield.c:59:2)' and is usually due to 'struct
 thund...
Message-ID: <202307041500.6bKn7nCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24be4d0b46bb0c3c1dc7bacd30957d6144a70dfc
commit: 09308562d4afb1abc66366608fa1cb9de783272f HID: nvidia-shield: Initial driver implementation with Thunderstrike support
date:   4 weeks ago
config: arm-randconfig-r014-20230704 (https://download.01.org/0day-ci/archive/20230704/202307041500.6bKn7nCl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041500.6bKn7nCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041500.6bKn7nCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-nvidia-shield.c:59:2: warning: field  within 'struct thunderstrike_hostcmd_resp_report' is less aligned than 'union thunderstrike_hostcmd_resp_report::(anonymous at drivers/hid/hid-nvidia-shield.c:59:2)' and is usually due to 'struct thunderstrike_hostcmd_resp_report' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.


vim +59 drivers/hid/hid-nvidia-shield.c

    53	
    54	struct thunderstrike_hostcmd_resp_report {
    55		u8 report_id; /* THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID */
    56		u8 cmd_id;
    57		u8 reserved_at_10;
    58	
  > 59		union {
    60			struct thunderstrike_hostcmd_board_info board_info;
    61			struct thunderstrike_hostcmd_haptics motors;
    62			__le16 fw_version;
    63			u8 payload[30];
    64		};
    65	} __packed;
    66	static_assert(sizeof(struct thunderstrike_hostcmd_resp_report) ==
    67		      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
