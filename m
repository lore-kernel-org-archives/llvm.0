Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439A664D
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657850820; x=1689386820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FkzHnFXcSuBftc+FgccaX+E8y3Wtt6An/M8z6QoZWz8=;
  b=WlL4xQmbtCvSHApCz0JF6g79pIqxJJcpl81Xne1mfEW8Q7NzRAQOKhI5
   LFMvCdzBlnrzyNN6ie96QeQjiPz7Df1ksRDyQaUNgIiAlihulFB3SsArb
   p/cTVcppjNnZI3PYxkNwNrEWQm3BTQkal4MwjP7sjQ+WSroa2ChQ795wb
   eIOzupK7lciBSPdl4AzGHnoynhpILyqY6wWbzJXlhgzhgOkWHDqGMcIjs
   JR295hToruEhtMWOUOrqx5AIKn7TdtpxFw+yqep/OT8+tgGfvP4SulsLQ
   sHzSIQF7UFZV+oFjuAFiVTORbRR2+L2cQyXesN9wSqCM+8R9Yb3ZqPK1M
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="284436758"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="284436758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 19:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="571335650"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2022 19:06:58 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCAjJ-0001S5-Rt;
	Fri, 15 Jul 2022 02:06:57 +0000
Date: Fri, 15 Jul 2022 10:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] cfg80211: Add link_id to various key operations for MLO
Message-ID: <202207150910.JDfPGqGE-lkp@intel.com>
References: <1657518327-17390-1-git-send-email-quic_vjakkam@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657518327-17390-1-git-send-email-quic_vjakkam@quicinc.com>

Hi Veerendranath,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20220714]
[cannot apply to wireless/main staging/staging-testing linus/master v5.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Veerendranath-Jakkam/cfg80211-Add-link_id-to-various-key-operations-for-MLO/20220711-134800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: riscv-randconfig-r006-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150910.JDfPGqGE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bee3397f2bab2485e3986a3d78874c6e44bd52a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Veerendranath-Jakkam/cfg80211-Add-link_id-to-various-key-operations-for-MLO/20220711-134800
        git checkout bee3397f2bab2485e3986a3d78874c6e44bd52a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireless/microchip/wilc1000/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/microchip/wilc1000/cfg80211.c:1702:26: error: incompatible function pointer types initializing 'int (*)(struct wiphy *, struct net_device *, int, u8)' (aka 'int (*)(struct wiphy *, struct net_device *, int, unsigned char)') with an expression of type 'int (struct wiphy *, struct net_device *, u8)' (aka 'int (struct wiphy *, struct net_device *, unsigned char)') [-Werror,-Wincompatible-function-pointer-types]
           .set_default_mgmt_key = set_default_mgmt_key,
                                   ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1702 drivers/net/wireless/microchip/wilc1000/cfg80211.c

70418790437753 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-02-04  1692  
1c40429dfad97d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Bhumika Goyal 2016-09-26  1693  static const struct cfg80211_ops wilc_cfg80211_ops = {
80785a9a82fc6a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1694  	.set_monitor_channel = set_channel,
0e30d06d9bda25 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1695  	.scan = scan,
4ffbcdb6de150c drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1696  	.connect = connect,
b027cde9504e87 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1697  	.disconnect = disconnect,
953d417a0dc704 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1698  	.add_key = add_key,
3044ba7e6f6b89 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1699  	.del_key = del_key,
f4893dfc31f51a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1700  	.get_key = get_key,
0f5b8ca323d56b drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1701  	.set_default_key = set_default_key,
0e703de3ef4169 drivers/net/wireless/microchip/wilc1000/cfg80211.c Ajay Singh    2022-05-24 @1702  	.set_default_mgmt_key = set_default_mgmt_key,
69deb4c2a1ef21 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1703  	.add_virtual_intf = add_virtual_intf,
b4a73355845058 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1704  	.del_virtual_intf = del_virtual_intf,
3615e9a3677831 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1705  	.change_virtual_intf = change_virtual_intf,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Johnny Kim    2015-05-11  1706  
a13168d75b3031 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1707  	.start_ap = start_ap,
2a4c84d7a04e60 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1708  	.change_beacon = change_beacon,
c8cddd7917d8a2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1709  	.stop_ap = stop_ap,
ed26955ca0e81b drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1710  	.add_station = add_station,
a0a8be95cc54b3 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1711  	.del_station = del_station,
14b420849bfe56 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1712  	.change_station = change_station,
f06f562dd14485 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1713  	.get_station = get_station,
bdb6338f6f5bc1 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1714  	.dump_station = dump_station,
a5f7db6aaa20ed drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1715  	.change_bss = change_bss,
a76b63ef570cd7 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1716  	.set_wiphy_params = set_wiphy_params,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Johnny Kim    2015-05-11  1717  
c5b331d4f550fb drivers/net/wireless/microchip/wilc1000/cfg80211.c Ajay Singh    2022-05-24  1718  	.external_auth = external_auth,
4d46657a23cce9 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1719  	.set_pmksa = set_pmksa,
1ff86d9605a2ed drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1720  	.del_pmksa = del_pmksa,
b33c39b1f3fa11 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1721  	.flush_pmksa = flush_pmksa,
6d19d695e091c2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1722  	.remain_on_channel = remain_on_channel,
1dd5440b60ccc8 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1723  	.cancel_remain_on_channel = cancel_remain_on_channel,
4a2f9b38a5eada drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1724  	.mgmt_tx_cancel_wait = mgmt_tx_cancel_wait,
12a26a33fec945 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-14  1725  	.mgmt_tx = mgmt_tx,
d530b9864073a7 drivers/staging/wilc1000/cfg80211.c                Johannes Berg 2020-04-28  1726  	.update_mgmt_frame_registrations = wilc_update_mgmt_frame_registrations,
46530679557262 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-22  1727  	.set_power_mgmt = set_power_mgmt,
a8047e26c799c8 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Chaehyun Lim  2015-09-22  1728  	.set_cqm_rssi_config = set_cqm_rssi_config,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Johnny Kim    2015-05-11  1729  
73584a40d7484f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-01-25  1730  	.suspend = wilc_suspend,
73584a40d7484f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-01-25  1731  	.resume = wilc_resume,
73584a40d7484f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-01-25  1732  	.set_wakeup = wilc_set_wakeup,
70418790437753 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-02-04  1733  	.set_tx_power = set_tx_power,
70418790437753 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-02-04  1734  	.get_tx_power = get_tx_power,
73584a40d7484f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  Glen Lee      2016-01-25  1735  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
