Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07E13AF2;
	Sat, 20 Dec 2025 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241975; cv=none; b=m0S03Pp41OmPmctVpJy9iKvug1m6fiMGHVZYhSmNyJAgmlH0/aOtVyyAREocwaAfZKMpJMbRnqOYlYkU1lzVrNH5w0hj67Hqrh3OyP+5py3J96IL5PMhqJRJRTfz2EM0fJ7c8iqztqHYujE964FFR9aaaKtJTTITC0so24mJk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241975; c=relaxed/simple;
	bh=xe7YmKM8MqE9DNHQzhQtyLqwjhAOSTJUu/dYGWw0gW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VINIhrQyeagi1vv/aFi+f+k6ZxmEogqyKiQUJIHgDS+gUL2NRJvhkCUNCZVQwtbNzzaFMF+nm3oSPHqjCcUu2snK5+5+EUC0mOKCMcXN8RITRUhROyFd5QKtQSsDz4/Nb1kISTloXUWgVQH5xEB+ag1ukDZw4dMmbsP+6xtLijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeCLi/Cm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeCLi/Cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241974; x=1797777974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xe7YmKM8MqE9DNHQzhQtyLqwjhAOSTJUu/dYGWw0gW4=;
  b=MeCLi/Cm3aMmWmocewTxokLQlReGILNYTSnudzhQ/NA9smdvGRhG+Nfi
   iTrE+9Zb/ERTGqSAA3DHUbgnzYhk+KQ/dkPJrss8V45V3KivTomqvUUWu
   IqS4JXxOIZA6sCKGa3W1HND/t466txC+9i827g3lN94rFY/ujDmAw8vnX
   IF+fLN4GxiHur5UdU9SuWYK0kbkrqvIRHe5igwvGlBsr5w/RG3pkov+Lo
   Y76vuB9WsRTPii+NLF/Cpwmu3ds6eqQwIndTKYRZ7cao2u4HsWhjtLTK3
   4NUc8muLblcsy1p5tK/b40R8rgBvX8rCKM+93RTsxpA5jEz4gQEGBrkXT
   g==;
X-CSE-ConnectionGUID: LO3o6eRdRPuVAlblp9cBkQ==
X-CSE-MsgGUID: OehR0n3sR0OpeJg0/4KlvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294958"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: srlzWLK8TmW6ewwleK4cug==
X-CSE-MsgGUID: JodaJcmNRt2ZuIsH9dKlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986986"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004fp-1KFC;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan =?iso-8859-1?Q?S=F8rensen?= <ssorensen@roku.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable
 system parameters
Message-ID: <202512202237.WBGxzX9D-lkp@intel.com>
References: <20251216092011.111208-4-ssorensen@roku.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216092011.111208-4-ssorensen@roku.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on linus/master v6.19-rc1]
[cannot apply to bluetooth-next/master next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-S-rensen/Bluetooth-hci_conn-use-mod_delayed_work-for-active-mode-timeout/20251216-172823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20251216092011.111208-4-ssorensen%40roku.com
patch subject: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable system parameters
config: powerpc-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202237.WBGxzX9D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202237.WBGxzX9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202237.WBGxzX9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/mgmt_config.c:127:3: warning: implicit conversion from '__le32' (aka 'unsigned int') to '__le16' (aka 'unsigned short') changes value from 536870912 to 0 [-Wconstant-conversion]
     127 |                 TLV_SET_U32(0x0020, idle_timeout),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt_config.c:40:5: note: expanded from macro 'TLV_SET_U32'
      40 |                 { cpu_to_le32(_param_code_), sizeof(__u32) }, \
         |                 ~ ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:34:27: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +127 net/bluetooth/mgmt_config.c

    13	
    14	#define HDEV_PARAM_U32(_param_name_) \
    15		struct {\
    16			struct mgmt_tlv_hdr entry; \
    17			__le32 value; \
    18		} __packed _param_name_
    19	
    20	#define HDEV_PARAM_U16(_param_name_) \
    21		struct {\
    22			struct mgmt_tlv_hdr entry; \
    23			__le16 value; \
    24		} __packed _param_name_
    25	
    26	#define HDEV_PARAM_U8(_param_name_) \
    27		struct {\
    28			struct mgmt_tlv_hdr entry; \
    29			__u8 value; \
    30		} __packed _param_name_
    31	
    32	#define TLV_SET_U16(_param_code_, _param_name_) \
    33		{ \
    34			{ cpu_to_le16(_param_code_), sizeof(__u16) }, \
    35			cpu_to_le16(hdev->_param_name_) \
    36		}
    37	
    38	#define TLV_SET_U32(_param_code_, _param_name_) \
    39		{ \
    40			{ cpu_to_le32(_param_code_), sizeof(__u32) }, \
    41			cpu_to_le32(hdev->_param_name_) \
    42		}
    43	
    44	#define TLV_SET_U8(_param_code_, _param_name_) \
    45		{ \
    46			{ cpu_to_le16(_param_code_), sizeof(__u8) }, \
    47			hdev->_param_name_ \
    48		}
    49	
    50	#define TLV_SET_U16_JIFFIES_TO_MSECS(_param_code_, _param_name_) \
    51		{ \
    52			{ cpu_to_le16(_param_code_), sizeof(__u16) }, \
    53			cpu_to_le16(jiffies_to_msecs(hdev->_param_name_)) \
    54		}
    55	
    56	int read_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
    57				   u16 data_len)
    58	{
    59		int ret;
    60		struct mgmt_rp_read_def_system_config {
    61			/* Please see mgmt-api.txt for documentation of these values */
    62			HDEV_PARAM_U16(def_page_scan_type);
    63			HDEV_PARAM_U16(def_page_scan_int);
    64			HDEV_PARAM_U16(def_page_scan_window);
    65			HDEV_PARAM_U16(def_inq_scan_type);
    66			HDEV_PARAM_U16(def_inq_scan_int);
    67			HDEV_PARAM_U16(def_inq_scan_window);
    68			HDEV_PARAM_U16(def_br_lsto);
    69			HDEV_PARAM_U16(def_page_timeout);
    70			HDEV_PARAM_U16(sniff_min_interval);
    71			HDEV_PARAM_U16(sniff_max_interval);
    72			HDEV_PARAM_U16(le_adv_min_interval);
    73			HDEV_PARAM_U16(le_adv_max_interval);
    74			HDEV_PARAM_U16(def_multi_adv_rotation_duration);
    75			HDEV_PARAM_U16(le_scan_interval);
    76			HDEV_PARAM_U16(le_scan_window);
    77			HDEV_PARAM_U16(le_scan_int_suspend);
    78			HDEV_PARAM_U16(le_scan_window_suspend);
    79			HDEV_PARAM_U16(le_scan_int_discovery);
    80			HDEV_PARAM_U16(le_scan_window_discovery);
    81			HDEV_PARAM_U16(le_scan_int_adv_monitor);
    82			HDEV_PARAM_U16(le_scan_window_adv_monitor);
    83			HDEV_PARAM_U16(le_scan_int_connect);
    84			HDEV_PARAM_U16(le_scan_window_connect);
    85			HDEV_PARAM_U16(le_conn_min_interval);
    86			HDEV_PARAM_U16(le_conn_max_interval);
    87			HDEV_PARAM_U16(le_conn_latency);
    88			HDEV_PARAM_U16(le_supv_timeout);
    89			HDEV_PARAM_U16(def_le_autoconnect_timeout);
    90			HDEV_PARAM_U16(advmon_allowlist_duration);
    91			HDEV_PARAM_U16(advmon_no_filter_duration);
    92			HDEV_PARAM_U8(enable_advmon_interleave_scan);
    93			HDEV_PARAM_U32(idle_timeout);
    94		} __packed rp = {
    95			TLV_SET_U16(0x0000, def_page_scan_type),
    96			TLV_SET_U16(0x0001, def_page_scan_int),
    97			TLV_SET_U16(0x0002, def_page_scan_window),
    98			TLV_SET_U16(0x0003, def_inq_scan_type),
    99			TLV_SET_U16(0x0004, def_inq_scan_int),
   100			TLV_SET_U16(0x0005, def_inq_scan_window),
   101			TLV_SET_U16(0x0006, def_br_lsto),
   102			TLV_SET_U16(0x0007, def_page_timeout),
   103			TLV_SET_U16(0x0008, sniff_min_interval),
   104			TLV_SET_U16(0x0009, sniff_max_interval),
   105			TLV_SET_U16(0x000a, le_adv_min_interval),
   106			TLV_SET_U16(0x000b, le_adv_max_interval),
   107			TLV_SET_U16(0x000c, def_multi_adv_rotation_duration),
   108			TLV_SET_U16(0x000d, le_scan_interval),
   109			TLV_SET_U16(0x000e, le_scan_window),
   110			TLV_SET_U16(0x000f, le_scan_int_suspend),
   111			TLV_SET_U16(0x0010, le_scan_window_suspend),
   112			TLV_SET_U16(0x0011, le_scan_int_discovery),
   113			TLV_SET_U16(0x0012, le_scan_window_discovery),
   114			TLV_SET_U16(0x0013, le_scan_int_adv_monitor),
   115			TLV_SET_U16(0x0014, le_scan_window_adv_monitor),
   116			TLV_SET_U16(0x0015, le_scan_int_connect),
   117			TLV_SET_U16(0x0016, le_scan_window_connect),
   118			TLV_SET_U16(0x0017, le_conn_min_interval),
   119			TLV_SET_U16(0x0018, le_conn_max_interval),
   120			TLV_SET_U16(0x0019, le_conn_latency),
   121			TLV_SET_U16(0x001a, le_supv_timeout),
   122			TLV_SET_U16_JIFFIES_TO_MSECS(0x001b,
   123						     def_le_autoconnect_timeout),
   124			TLV_SET_U16(0x001d, advmon_allowlist_duration),
   125			TLV_SET_U16(0x001e, advmon_no_filter_duration),
   126			TLV_SET_U8(0x001f, enable_advmon_interleave_scan),
 > 127			TLV_SET_U32(0x0020, idle_timeout),
   128		};
   129	
   130		bt_dev_dbg(hdev, "sock %p", sk);
   131	
   132		ret = mgmt_cmd_complete(sk, hdev->id,
   133					MGMT_OP_READ_DEF_SYSTEM_CONFIG,
   134					0, &rp, sizeof(rp));
   135		return ret;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
