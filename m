Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03D181;
	Sat, 25 Mar 2023 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679702861; x=1711238861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqjYe5ETR3cpC9yt/U6Ag3nhDT8ZbYROeXbqxVPvoi4=;
  b=glZzhaX2Qx9FMpYzyVL/Q5lmGThflzxeF8T2d0Pc8U7XXEssPyHqXUbz
   iRc4T8d2fZTrBiHDJBVBJHHVfVgtOfgyQy1/17iapZ14SNlry9sxrJTHi
   zfll7ls8xOzqbqPC1IlseCbNB3PAtOVdxtOUA54lUuNoWWLWUa7YX9xx9
   JLVMon3ql6ctey4slNQe4jf6rFLk723Bbnbn77NbCG8Qje5MWpU5CXBN7
   6NBNgXw4kGfyaRbocojhb1nhr8EZ6BAenSLheQh8GmxX7cV9iVF4dH4D8
   4Ak/llyooc/tuefvKdgHuaNea4vhmy3zJ1GSYYKqiO1Qs85tIxl0RcDpD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337418238"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="337418238"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 17:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012463714"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="1012463714"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 17:07:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfrRa-000Fmh-2d;
	Sat, 25 Mar 2023 00:07:38 +0000
Date: Sat, 25 Mar 2023 08:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] Bluetooth: hci_conn: Fix not cleaning up on LE
 Connection failure
Message-ID: <202303250737.5bz7V6oX-lkp@intel.com>
References: <20230324204525.3630188-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324204525.3630188-1-luiz.dentz@gmail.com>

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-Fix-printing-errors-if-LE-Connection-times-out/20230325-044559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230324204525.3630188-1-luiz.dentz%40gmail.com
patch subject: [PATCH 1/2] Bluetooth: hci_conn: Fix not cleaning up on LE Connection failure
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230325/202303250737.5bz7V6oX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e15b8378a4f3221972483cf6bb52f0649341a55e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-Fix-printing-errors-if-LE-Connection-times-out/20230325-044559
        git checkout e15b8378a4f3221972483cf6bb52f0649341a55e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250737.5bz7V6oX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/hci_conn.c:1202:7: warning: variable 'params' is uninitialized when used here [-Wuninitialized]
               (params && params->explicit_connect))
                ^~~~~~
   net/bluetooth/hci_conn.c:1191:32: note: initialize the variable 'params' to silence this warning
           struct hci_conn_params *params;
                                         ^
                                          = NULL
   1 warning generated.


vim +/params +1202 net/bluetooth/hci_conn.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  1186  
9bb3c01fdb2201 Andre Guedes           2014-01-30  1187  /* This function requires the caller holds hdev->lock */
9b3628d79b46f0 Luiz Augusto von Dentz 2022-04-22  1188  static void hci_le_conn_failed(struct hci_conn *conn, u8 status)
9bb3c01fdb2201 Andre Guedes           2014-01-30  1189  {
9bb3c01fdb2201 Andre Guedes           2014-01-30  1190  	struct hci_dev *hdev = conn->hdev;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1191  	struct hci_conn_params *params;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1192  
e15b8378a4f322 Luiz Augusto von Dentz 2023-03-24  1193  	hci_connect_le_scan_cleanup(conn);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1194  
acb9f911ea1f82 Johan Hedberg          2015-12-03  1195  	/* If the status indicates successful cancellation of
91641b79e1e153 Zheng Yongjun          2021-06-02  1196  	 * the attempt (i.e. Unknown Connection Id) there's no point of
acb9f911ea1f82 Johan Hedberg          2015-12-03  1197  	 * notifying failure since we'll go back to keep trying to
acb9f911ea1f82 Johan Hedberg          2015-12-03  1198  	 * connect. The only exception is explicit connect requests
acb9f911ea1f82 Johan Hedberg          2015-12-03  1199  	 * where a timeout + cancel does indicate an actual failure.
acb9f911ea1f82 Johan Hedberg          2015-12-03  1200  	 */
acb9f911ea1f82 Johan Hedberg          2015-12-03  1201  	if (status != HCI_ERROR_UNKNOWN_CONN_ID ||
acb9f911ea1f82 Johan Hedberg          2015-12-03 @1202  	    (params && params->explicit_connect))
acb9f911ea1f82 Johan Hedberg          2015-12-03  1203  		mgmt_connect_failed(hdev, &conn->dst, conn->type,
acb9f911ea1f82 Johan Hedberg          2015-12-03  1204  				    conn->dst_type, status);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1205  
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1206  	/* Enable advertising in case this was a failed connection
3c857757ef6e5a Johan Hedberg          2014-03-25  1207  	 * attempt as a peripheral.
3c857757ef6e5a Johan Hedberg          2014-03-25  1208  	 */
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1209  	hci_enable_advertising(hdev);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1210  }
9bb3c01fdb2201 Andre Guedes           2014-01-30  1211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
