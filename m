Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001E10F8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 03:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652756996; x=1684292996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZSWVzfk62hRgRSBoatVgskFp9AcVeOHwhKIxAPvNzg=;
  b=EagOkpxtUErQI7QpCvfeDTb0DLE9P3ggdbVuGQA8Vu1ypN5cBm8nSj4B
   StQ3CRA9gG2kg8e+pX1jfN46rQtgqYsfO3LTuiDz5X6PVMUhB8s9lID+G
   d4LAKPETcVCWskfpHoH/6sl3wBDb4xXTjYmrzOk3tZHn3j/nxlMCvEG0h
   lfNuwZA/SeoT0hLThf8SGWnF/howdrs6nYfBuOCPCMxiGeFrWOL6XpujB
   q5PrSZJAmlqFzjqRq/7k2G2M9HUUILACfds6EIiYQDit/PhqTd6zvBlIF
   S2LGIevAzid85b6/JnuENK1trzTRqeSCd7EzsD5vjxk1rxixIN0jAeMYd
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="357447370"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="357447370"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 20:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="626254755"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 May 2022 20:09:54 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqnar-0000YL-Dr;
	Tue, 17 May 2022 03:09:53 +0000
Date: Tue, 17 May 2022 11:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2] Bluetooth: MGMT: Fix uses of bitmap_from_u64
Message-ID: <202205171145.9ekbbpAa-lkp@intel.com>
References: <20220516203539.1708251-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516203539.1708251-1-luiz.dentz@gmail.com>

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20220516]
[cannot apply to bluetooth/master v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Fix-uses-of-bitmap_from_u64/20220517-050324
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: hexagon-randconfig-r041-20220516 (https://download.01.org/0day-ci/archive/20220517/202205171145.9ekbbpAa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/15b968f930769afbaabbfb85c2cefcbc30506a7b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Fix-uses-of-bitmap_from_u64/20220517-050324
        git checkout 15b968f930769afbaabbfb85c2cefcbc30506a7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bluetooth/mgmt.c:7113:7: warning: variable 'params' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (err)
                       ^~~
   net/bluetooth/mgmt.c:7163:9: note: uninitialized use occurs here
                                params ? params->flags : NULL);
                                ^~~~~~
   net/bluetooth/mgmt.c:7113:3: note: remove the 'if' if its condition is always true
                   if (err)
                   ^~~~~~~~
   net/bluetooth/mgmt.c:7082:32: note: initialize the variable 'params' to silence this warning
           struct hci_conn_params *params;
                                         ^
                                          = NULL
   1 warning generated.


vim +7113 net/bluetooth/mgmt.c

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  7076  
2faade53e65f27 Marcel Holtmann        2014-06-29  7077  static int add_device(struct sock *sk, struct hci_dev *hdev,
2faade53e65f27 Marcel Holtmann        2014-06-29  7078  		      void *data, u16 len)
2faade53e65f27 Marcel Holtmann        2014-06-29  7079  {
2faade53e65f27 Marcel Holtmann        2014-06-29  7080  	struct mgmt_cp_add_device *cp = data;
2faade53e65f27 Marcel Holtmann        2014-06-29  7081  	u8 auto_conn, addr_type;
4c54bf2b093bb2 Abhishek Pandit-Subedi 2020-06-17  7082  	struct hci_conn_params *params;
2faade53e65f27 Marcel Holtmann        2014-06-29  7083  	int err;
2faade53e65f27 Marcel Holtmann        2014-06-29  7084  
181d695352305c Marcel Holtmann        2020-05-06  7085  	bt_dev_dbg(hdev, "sock %p", sk);
2faade53e65f27 Marcel Holtmann        2014-06-29  7086  
6659358efe617b Johan Hedberg          2014-07-09  7087  	if (!bdaddr_type_is_valid(cp->addr.type) ||
2faade53e65f27 Marcel Holtmann        2014-06-29  7088  	    !bacmp(&cp->addr.bdaddr, BDADDR_ANY))
2a1afb5ac8d580 Johan Hedberg          2015-03-06  7089  		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
2faade53e65f27 Marcel Holtmann        2014-06-29  7090  					 MGMT_STATUS_INVALID_PARAMS,
2faade53e65f27 Marcel Holtmann        2014-06-29  7091  					 &cp->addr, sizeof(cp->addr));
2faade53e65f27 Marcel Holtmann        2014-06-29  7092  
4b9e7e7516135b Marcel Holtmann        2014-07-23  7093  	if (cp->action != 0x00 && cp->action != 0x01 && cp->action != 0x02)
2a1afb5ac8d580 Johan Hedberg          2015-03-06  7094  		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
2faade53e65f27 Marcel Holtmann        2014-06-29  7095  					 MGMT_STATUS_INVALID_PARAMS,
2faade53e65f27 Marcel Holtmann        2014-06-29  7096  					 &cp->addr, sizeof(cp->addr));
2faade53e65f27 Marcel Holtmann        2014-06-29  7097  
2faade53e65f27 Marcel Holtmann        2014-06-29  7098  	hci_dev_lock(hdev);
2faade53e65f27 Marcel Holtmann        2014-06-29  7099  
6659358efe617b Johan Hedberg          2014-07-09  7100  	if (cp->addr.type == BDADDR_BREDR) {
4b9e7e7516135b Marcel Holtmann        2014-07-23  7101  		/* Only incoming connections action is supported for now */
6659358efe617b Johan Hedberg          2014-07-09  7102  		if (cp->action != 0x01) {
51d7a94d56f842 Johan Hedberg          2015-11-11  7103  			err = mgmt_cmd_complete(sk, hdev->id,
51d7a94d56f842 Johan Hedberg          2015-11-11  7104  						MGMT_OP_ADD_DEVICE,
51d7a94d56f842 Johan Hedberg          2015-11-11  7105  						MGMT_STATUS_INVALID_PARAMS,
51d7a94d56f842 Johan Hedberg          2015-11-11  7106  						&cp->addr, sizeof(cp->addr));
6659358efe617b Johan Hedberg          2014-07-09  7107  			goto unlock;
6659358efe617b Johan Hedberg          2014-07-09  7108  		}
6659358efe617b Johan Hedberg          2014-07-09  7109  
3d4f9c00492b4e Archie Pusaka          2021-06-04  7110  		err = hci_bdaddr_list_add_with_flags(&hdev->accept_list,
8baaa4038edbff Abhishek Pandit-Subedi 2020-06-17  7111  						     &cp->addr.bdaddr,
8baaa4038edbff Abhishek Pandit-Subedi 2020-06-17  7112  						     cp->addr.type, 0);
6659358efe617b Johan Hedberg          2014-07-09 @7113  		if (err)
6659358efe617b Johan Hedberg          2014-07-09  7114  			goto unlock;
a397407f266f8d Johan Hedberg          2014-07-09  7115  
01b1cb87d37fb1 Johan Hedberg          2015-11-16  7116  		hci_req_update_scan(hdev);
a397407f266f8d Johan Hedberg          2014-07-09  7117  
6659358efe617b Johan Hedberg          2014-07-09  7118  		goto added;
6659358efe617b Johan Hedberg          2014-07-09  7119  	}
6659358efe617b Johan Hedberg          2014-07-09  7120  
85813a7ec774b9 Johan Hedberg          2015-10-21  7121  	addr_type = le_addr_type(cp->addr.type);
2faade53e65f27 Marcel Holtmann        2014-06-29  7122  
4b9e7e7516135b Marcel Holtmann        2014-07-23  7123  	if (cp->action == 0x02)
2faade53e65f27 Marcel Holtmann        2014-06-29  7124  		auto_conn = HCI_AUTO_CONN_ALWAYS;
4b9e7e7516135b Marcel Holtmann        2014-07-23  7125  	else if (cp->action == 0x01)
4b9e7e7516135b Marcel Holtmann        2014-07-23  7126  		auto_conn = HCI_AUTO_CONN_DIRECT;
2faade53e65f27 Marcel Holtmann        2014-06-29  7127  	else
a3451d279f839d Johan Hedberg          2014-07-02  7128  		auto_conn = HCI_AUTO_CONN_REPORT;
2faade53e65f27 Marcel Holtmann        2014-06-29  7129  
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7130  	/* Kernel internally uses conn_params with resolvable private
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7131  	 * address, but Add Device allows only identity addresses.
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7132  	 * Make sure it is enforced before calling
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7133  	 * hci_conn_params_lookup.
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7134  	 */
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7135  	if (!hci_is_identity_address(&cp->addr.bdaddr, addr_type)) {
51d7a94d56f842 Johan Hedberg          2015-11-11  7136  		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
51d7a94d56f842 Johan Hedberg          2015-11-11  7137  					MGMT_STATUS_INVALID_PARAMS,
51d7a94d56f842 Johan Hedberg          2015-11-11  7138  					&cp->addr, sizeof(cp->addr));
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7139  		goto unlock;
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7140  	}
9a0a8a8e852dab Jakub Pawlowski        2015-07-20  7141  
bf5b3c8be07905 Marcel Holtmann        2014-06-30  7142  	/* If the connection parameters don't exist for this device,
bf5b3c8be07905 Marcel Holtmann        2014-06-30  7143  	 * they will be created and configured with defaults.
bf5b3c8be07905 Marcel Holtmann        2014-06-30  7144  	 */
51d7a94d56f842 Johan Hedberg          2015-11-11  7145  	if (hci_conn_params_set(hdev, &cp->addr.bdaddr, addr_type,
d06b50ce14119a Marcel Holtmann        2014-07-01  7146  				auto_conn) < 0) {
51d7a94d56f842 Johan Hedberg          2015-11-11  7147  		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
51d7a94d56f842 Johan Hedberg          2015-11-11  7148  					MGMT_STATUS_FAILED, &cp->addr,
51d7a94d56f842 Johan Hedberg          2015-11-11  7149  					sizeof(cp->addr));
2faade53e65f27 Marcel Holtmann        2014-06-29  7150  		goto unlock;
4c54bf2b093bb2 Abhishek Pandit-Subedi 2020-06-17  7151  	} else {
4c54bf2b093bb2 Abhishek Pandit-Subedi 2020-06-17  7152  		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
4c54bf2b093bb2 Abhishek Pandit-Subedi 2020-06-17  7153  						addr_type);
2faade53e65f27 Marcel Holtmann        2014-06-29  7154  	}
2faade53e65f27 Marcel Holtmann        2014-06-29  7155  
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  7156  	err = hci_cmd_sync_queue(hdev, add_device_sync, NULL, NULL);
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  7157  	if (err < 0)
e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  7158  		goto unlock;
51d7a94d56f842 Johan Hedberg          2015-11-11  7159  
6659358efe617b Johan Hedberg          2014-07-09  7160  added:
8afef092a192cb Marcel Holtmann        2014-06-29  7161  	device_added(sk, hdev, &cp->addr.bdaddr, cp->addr.type, cp->action);
4c54bf2b093bb2 Abhishek Pandit-Subedi 2020-06-17  7162  	device_flags_changed(NULL, hdev, &cp->addr.bdaddr, cp->addr.type,
15b968f930769a Luiz Augusto von Dentz 2022-05-16  7163  			     params ? params->flags : NULL);
8afef092a192cb Marcel Holtmann        2014-06-29  7164  
51d7a94d56f842 Johan Hedberg          2015-11-11  7165  	err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
51d7a94d56f842 Johan Hedberg          2015-11-11  7166  				MGMT_STATUS_SUCCESS, &cp->addr,
51d7a94d56f842 Johan Hedberg          2015-11-11  7167  				sizeof(cp->addr));
2faade53e65f27 Marcel Holtmann        2014-06-29  7168  
2faade53e65f27 Marcel Holtmann        2014-06-29  7169  unlock:
2faade53e65f27 Marcel Holtmann        2014-06-29  7170  	hci_dev_unlock(hdev);
2faade53e65f27 Marcel Holtmann        2014-06-29  7171  	return err;
2faade53e65f27 Marcel Holtmann        2014-06-29  7172  }
2faade53e65f27 Marcel Holtmann        2014-06-29  7173  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
