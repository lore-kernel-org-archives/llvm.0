Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF462A
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 01:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651799655; x=1683335655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WFCBimkcBYP+hIPMbP4+JtYDeZqFKssgFgElwgDbHIg=;
  b=BFFua0nc7AEjSKGLYiWfhwl2wSspdiEEGJAc1SlIlWgqiLTFC3C9sdy/
   OrmVcG+uHjAyNbu2tE5ytCVmxLYR3mG4pbbBu8Y4LT8f/eq75cnItPLEe
   vLIgbme/XNkxsiY7LEPgH7cbVzPQpsUnVe5DYqn4L/ZPK/lqpcpqmgDgl
   jhiu1P48saUC5iwC0GgY2uBroQokb+x87THHKF/b6PLtpqdIdUOLKCpO/
   B77L3FFJn62zY2h6omb15CJEx0XXdLQ60L0GmeJjbUtSvlFBH2fNOY1yA
   7gcJ0Q99+3+KrLs6IpID+AN0+SlSQyMMbb4vdJX2+JObrLehF3r+0mRAT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268454939"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="268454939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 18:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="621574292"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 May 2022 18:14:13 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmmXs-000CvV-MQ;
	Fri, 06 May 2022 01:14:12 +0000
Date: Fri, 6 May 2022 09:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/8] Bluetooth: Add BTPROTO_ISO socket type
Message-ID: <202205060800.a0ZUbInN-lkp@intel.com>
References: <20220505230550.3450617-4-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505230550.3450617-4-luiz.dentz@gmail.com>

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master v5.18-rc5 next-20220505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-eir-Add-helpers-for-managing-service-data/20220506-070828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: hexagon-randconfig-r025-20220505 (https://download.01.org/0day-ci/archive/20220506/202205060800.a0ZUbInN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9ab3ba7464f8b680ac64a72e2a75f663c922bcef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-eir-Add-helpers-for-managing-service-data/20220506-070828
        git checkout 9ab3ba7464f8b680ac64a72e2a75f663c922bcef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bluetooth/mgmt.c:4432:6: warning: variable 'changed' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!err)
               ^~~~
   net/bluetooth/mgmt.c:4444:6: note: uninitialized use occurs here
           if (changed)
               ^~~~~~~
   net/bluetooth/mgmt.c:4432:2: note: remove the 'if' if its condition is always true
           if (!err)
           ^~~~~~~~~
   net/bluetooth/mgmt.c:4405:19: note: initialize the variable 'changed' to silence this warning
           bool val, changed;
                            ^
                             = 0
   1 warning generated.
--
>> net/bluetooth/iso.c:777:11: warning: variable 'sent' set but not used [-Wunused-but-set-variable]
           int err, sent = 0;
                    ^
   1 warning generated.


vim +4432 net/bluetooth/mgmt.c

  4398	
  4399	#ifdef CONFIG_BT_LE
  4400	static int set_iso_socket_func(struct sock *sk, struct hci_dev *hdev,
  4401				       struct mgmt_cp_set_exp_feature *cp, u16 data_len)
  4402	{
  4403		struct mgmt_rp_set_exp_feature rp;
  4404	
  4405		bool val, changed;
  4406		int err;
  4407	
  4408		/* Command requires to use the non-controller index */
  4409		if (hdev)
  4410			return mgmt_cmd_status(sk, hdev->id,
  4411					       MGMT_OP_SET_EXP_FEATURE,
  4412					       MGMT_STATUS_INVALID_INDEX);
  4413	
  4414		/* Parameters are limited to a single octet */
  4415		if (data_len != MGMT_SET_EXP_FEATURE_SIZE + 1)
  4416			return mgmt_cmd_status(sk, MGMT_INDEX_NONE,
  4417					       MGMT_OP_SET_EXP_FEATURE,
  4418					       MGMT_STATUS_INVALID_PARAMS);
  4419	
  4420		/* Only boolean on/off is supported */
  4421		if (cp->param[0] != 0x00 && cp->param[0] != 0x01)
  4422			return mgmt_cmd_status(sk, MGMT_INDEX_NONE,
  4423					       MGMT_OP_SET_EXP_FEATURE,
  4424					       MGMT_STATUS_INVALID_PARAMS);
  4425	
  4426		val = cp->param[0] ? true : false;
  4427		if (val)
  4428			err = iso_init();
  4429		else
  4430			err = iso_exit();
  4431	
> 4432		if (!err)
  4433			changed = true;
  4434	
  4435		memcpy(rp.uuid, iso_socket_uuid, 16);
  4436		rp.flags = cpu_to_le32(val ? BIT(0) : 0);
  4437	
  4438		hci_sock_set_flag(sk, HCI_MGMT_EXP_FEATURE_EVENTS);
  4439	
  4440		err = mgmt_cmd_complete(sk, MGMT_INDEX_NONE,
  4441					MGMT_OP_SET_EXP_FEATURE, 0,
  4442					&rp, sizeof(rp));
  4443	
  4444		if (changed)
  4445			exp_feature_changed(hdev, iso_socket_uuid, val, sk);
  4446	
  4447		return err;
  4448	}
  4449	#endif
  4450	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
