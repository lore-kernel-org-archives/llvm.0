Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C580A4C;
	Wed,  1 Mar 2023 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677702640; x=1709238640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLavC08VBuju2ru6GqD+/u+P1rhVoH6prYTe6YHLFCE=;
  b=bH9L1+LzJvGsObbn0Hfta5o4dCZCsOAX7HweNbHKwuzuFOP3GzY746wd
   Bx9uO2M/l9kNwfxoJ0mYzxPhEs3v+TO4IwY/A/Nh71mHJmMKnDi7rnth7
   CionkF13iyQjE95OCzClK1ovFuzGcWClOxqFWk7FjpzROIkHxEbWDxMkn
   51wCPLmAz/PmAlVC+V6nWHnG/0X8ifOqclaZoFvdpP0LOypOPBg3z6scA
   iAByZLMDrpoX6xDuXmW9+oXgETWgJtlPBeIqg5S7mEp3mUu8xHxTx2rZw
   hD4MPv7UO2oOAcYetLrAcHrgvyLwgniH/WFvhf3bf7/WT4jCya1NnG4oE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399300795"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="399300795"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 12:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="624637098"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="624637098"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2023 12:30:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXT5u-0006Ot-0Y;
	Wed, 01 Mar 2023 20:30:34 +0000
Date: Thu, 2 Mar 2023 04:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/aquantia/atlantic/aq_ring.h:67:2: warning:
 field  within 'struct aq_ring_buff_s' is less aligned than 'union
 aq_ring_buff_s::(anonymous at
 drivers/net/ethernet/aquantia/atlantic/aq_ring.h:67:2)' and is usually due
 to 'struct aq_ring_b...
Message-ID: <202303020445.1SDi4WmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0927a7a5391f7d8e593e5e50ead7505a23cadf9
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform support
date:   11 months ago
config: arm-randconfig-r032-20230302 (https://download.01.org/0day-ci/archive/20230302/202303020445.1SDi4WmD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/aquantia/atlantic/ net/l2tp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020445.1SDi4WmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.c:14:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_ptp.h:15:
>> drivers/net/ethernet/aquantia/atlantic/aq_ring.h:67:2: warning: field  within 'struct aq_ring_buff_s' is less aligned than 'union aq_ring_buff_s::(anonymous at drivers/net/ethernet/aquantia/atlantic/aq_ring.h:67:2)' and is usually due to 'struct aq_ring_buff_s' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.
--
   In file included from drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_a0.c:12:
>> drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_ring.h:67:2: warning: field  within 'struct aq_ring_buff_s' is less aligned than 'union aq_ring_buff_s::(anonymous at drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_ring.h:67:2)' and is usually due to 'struct aq_ring_buff_s' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.
--
   In file included from net/l2tp/l2tp_ppp.c:78:
   In file included from include/linux/if_pppox.h:19:
   include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'struct sockaddr_pppox' is less aligned than 'union (unnamed union at include/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           } sa_addr;
             ^
>> include/uapi/linux/if_pppox.h:82:23: warning: field pppol2tp within 'struct sockaddr_pppol2tp' is less aligned than 'struct pppol2tp_addr' and is usually due to 'struct sockaddr_pppol2tp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct pppol2tp_addr pppol2tp;
                                ^
>> include/uapi/linux/if_pppox.h:97:25: warning: field pppol2tp within 'struct sockaddr_pppol2tpv3' is less aligned than 'struct pppol2tpv3_addr' and is usually due to 'struct sockaddr_pppol2tpv3' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct pppol2tpv3_addr pppol2tp;
                                  ^
>> include/uapi/linux/if_pppox.h:88:26: warning: field pppol2tp within 'struct sockaddr_pppol2tpin6' is less aligned than 'struct pppol2tpin6_addr' and is usually due to 'struct sockaddr_pppol2tpin6' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct pppol2tpin6_addr pppol2tp;
                                   ^
>> include/uapi/linux/if_pppox.h:103:28: warning: field pppol2tp within 'struct sockaddr_pppol2tpv3in6' is less aligned than 'struct pppol2tpv3in6_addr' and is usually due to 'struct sockaddr_pppol2tpv3in6' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct pppol2tpv3in6_addr pppol2tp;
                                     ^
   5 warnings generated.


vim +67 drivers/net/ethernet/aquantia/atlantic/aq_ring.h

46f4c29d9de6e4 Igor Russkikh   2019-03-23  24  
018423e90bee89 David VomLehn   2017-01-23  25  /*           TxC       SOP        DX         EOP
018423e90bee89 David VomLehn   2017-01-23  26   *         +----------+----------+----------+-----------
018423e90bee89 David VomLehn   2017-01-23  27   *   8bytes|len l3,l4 | pa       | pa       | pa
018423e90bee89 David VomLehn   2017-01-23  28   *         +----------+----------+----------+-----------
018423e90bee89 David VomLehn   2017-01-23  29   * 4/8bytes|len pkt   |len pkt   |          | skb
018423e90bee89 David VomLehn   2017-01-23  30   *         +----------+----------+----------+-----------
d3ed7c5cf79bb9 Igor Russkikh   2019-06-26  31   * 4/8bytes|is_gso    |len,flags |len       |len,is_eop
018423e90bee89 David VomLehn   2017-01-23  32   *         +----------+----------+----------+-----------
018423e90bee89 David VomLehn   2017-01-23  33   *
018423e90bee89 David VomLehn   2017-01-23  34   *  This aq_ring_buff_s doesn't have endianness dependency.
018423e90bee89 David VomLehn   2017-01-23  35   *  It is __packed for cache line optimizations.
018423e90bee89 David VomLehn   2017-01-23  36   */
018423e90bee89 David VomLehn   2017-01-23  37  struct __packed aq_ring_buff_s {
018423e90bee89 David VomLehn   2017-01-23  38  	union {
46f4c29d9de6e4 Igor Russkikh   2019-03-23  39  		/* RX/TX */
46f4c29d9de6e4 Igor Russkikh   2019-03-23  40  		dma_addr_t pa;
018423e90bee89 David VomLehn   2017-01-23  41  		/* RX */
018423e90bee89 David VomLehn   2017-01-23  42  		struct {
018423e90bee89 David VomLehn   2017-01-23  43  			u32 rss_hash;
018423e90bee89 David VomLehn   2017-01-23  44  			u16 next;
018423e90bee89 David VomLehn   2017-01-23  45  			u8 is_hash_l4;
018423e90bee89 David VomLehn   2017-01-23  46  			u8 rsvd1;
46f4c29d9de6e4 Igor Russkikh   2019-03-23  47  			struct aq_rxpage rxdata;
d3ed7c5cf79bb9 Igor Russkikh   2019-06-26  48  			u16 vlan_rx_tag;
018423e90bee89 David VomLehn   2017-01-23  49  		};
018423e90bee89 David VomLehn   2017-01-23  50  		/* EOP */
018423e90bee89 David VomLehn   2017-01-23  51  		struct {
018423e90bee89 David VomLehn   2017-01-23  52  			dma_addr_t pa_eop;
018423e90bee89 David VomLehn   2017-01-23  53  			struct sk_buff *skb;
018423e90bee89 David VomLehn   2017-01-23  54  		};
018423e90bee89 David VomLehn   2017-01-23  55  		/* TxC */
018423e90bee89 David VomLehn   2017-01-23  56  		struct {
018423e90bee89 David VomLehn   2017-01-23  57  			u32 mss;
018423e90bee89 David VomLehn   2017-01-23  58  			u8 len_l2;
018423e90bee89 David VomLehn   2017-01-23  59  			u8 len_l3;
018423e90bee89 David VomLehn   2017-01-23  60  			u8 len_l4;
386aff88e32ec3 Pavel Belous    2017-03-23  61  			u8 is_ipv6:1;
386aff88e32ec3 Pavel Belous    2017-03-23  62  			u8 rsvd2:7;
018423e90bee89 David VomLehn   2017-01-23  63  			u32 len_pkt;
d3ed7c5cf79bb9 Igor Russkikh   2019-06-26  64  			u16 vlan_tx_tag;
018423e90bee89 David VomLehn   2017-01-23  65  		};
018423e90bee89 David VomLehn   2017-01-23  66  	};
018423e90bee89 David VomLehn   2017-01-23 @67  	union {
018423e90bee89 David VomLehn   2017-01-23  68  		struct {
822cd114cd05a4 Igor Russkikh   2019-11-07  69  			u32 len:16;
018423e90bee89 David VomLehn   2017-01-23  70  			u32 is_ip_cso:1;
018423e90bee89 David VomLehn   2017-01-23  71  			u32 is_udp_cso:1;
018423e90bee89 David VomLehn   2017-01-23  72  			u32 is_tcp_cso:1;
018423e90bee89 David VomLehn   2017-01-23  73  			u32 is_cso_err:1;
018423e90bee89 David VomLehn   2017-01-23  74  			u32 is_sop:1;
018423e90bee89 David VomLehn   2017-01-23  75  			u32 is_eop:1;
822cd114cd05a4 Igor Russkikh   2019-11-07  76  			u32 is_gso_tcp:1;
822cd114cd05a4 Igor Russkikh   2019-11-07  77  			u32 is_gso_udp:1;
018423e90bee89 David VomLehn   2017-01-23  78  			u32 is_mapped:1;
018423e90bee89 David VomLehn   2017-01-23  79  			u32 is_cleaned:1;
018423e90bee89 David VomLehn   2017-01-23  80  			u32 is_error:1;
d3ed7c5cf79bb9 Igor Russkikh   2019-06-26  81  			u32 is_vlan:1;
15beab0a9d797b Dmitry Bezrukov 2020-02-14  82  			u32 is_lro:1;
15beab0a9d797b Dmitry Bezrukov 2020-02-14  83  			u32 rsvd3:3;
c7545689244b50 Pavel Belous    2017-09-25  84  			u16 eop_index;
c7545689244b50 Pavel Belous    2017-09-25  85  			u16 rsvd4;
018423e90bee89 David VomLehn   2017-01-23  86  		};
c7545689244b50 Pavel Belous    2017-09-25  87  		u64 flags;
018423e90bee89 David VomLehn   2017-01-23  88  	};
018423e90bee89 David VomLehn   2017-01-23  89  };
018423e90bee89 David VomLehn   2017-01-23  90  

:::::: The code at line 67 was first introduced by commit
:::::: 018423e90bee8978105eaaa265a26e70637f9f1e net: ethernet: aquantia: Add ring support code

:::::: TO: David VomLehn <vomlehn@texas.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
