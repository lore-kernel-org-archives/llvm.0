Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4B801
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648721163; x=1680257163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvJz3a1518vqn7QRBPgtGZuGTdlKtmBcEY0FBxjEmWg=;
  b=S51nKs9GruM40xCg6QLMenPq9lJphc2Pk6LZGgoNSDV0KtsVAgziNL54
   Q1zxFEnzri+Oya10GHNCAMO/CPhrKGbQBQIsZxC6IqmlUDS+GOXyoKYeP
   oeg+sDAyndXCt9MgXjjJTvOAc+SlX/gb82Pexj9/XDBylxgQUdL/KwYtu
   KkewJBej9qYmgPSbSnvkT8OFUUE2p2OvVEfgl9+/MGKZBttjH8SMpZ46s
   muh+AIY3ciw2AeLuT2sR2kyspKrgJwMgdoxkVRjTLHzv9Rm6CWUSJnq2c
   6pc7z8bVaijiQfLgdjpAHktAs7Ua85cKDkONxTAm/jSQvt+cOJzUmfodR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257364733"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="257364733"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 03:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="503680432"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Mar 2022 03:06:01 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZrgm-00009L-IB;
	Thu, 31 Mar 2022 10:06:00 +0000
Date: Thu, 31 Mar 2022 18:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vishal:cxl-osc 1/3] include/linux/acpi.h:1013:55: warning:
 declaration of 'struct acpi_osc_context' will not be visible outside of this
 function
Message-ID: <202203311839.nb45wpQK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git cxl-osc
head:   1b14cb29c313c4288f576c2480ba62a7721a2e9b
commit: c2618c3e767f53a8a62b82eaa919082378c925e5 [1/3] acpi: add a helper for retrieving _OSC Control DWORDs
config: hexagon-randconfig-r035-20220331 (https://download.01.org/0day-ci/archive/20220331/202203311839.nb45wpQK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 881350a92d821d4f8e4fa648443ed1d17e251188)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git/commit/?id=c2618c3e767f53a8a62b82eaa919082378c925e5
        git remote add vishal https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git
        git fetch --no-tags vishal cxl-osc
        git checkout c2618c3e767f53a8a62b82eaa919082378c925e5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/char/tpm/st33zp24/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/st33zp24/st33zp24.c:21:
   In file included from drivers/char/tpm/st33zp24/../tpm.h:27:
   In file included from include/linux/tpm.h:21:
>> include/linux/acpi.h:1013:55: warning: declaration of 'struct acpi_osc_context' will not be visible outside of this function [-Wvisibility]
   static inline u32 acpi_osc_ctx_get_pci_control(struct acpi_osc_context *context)
                                                         ^
   In file included from drivers/char/tpm/st33zp24/st33zp24.c:21:
   In file included from drivers/char/tpm/st33zp24/../tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   2 warnings generated.
--
   In file included from drivers/char/tpm/st33zp24/i2c.c:8:
   In file included from include/linux/i2c.h:13:
>> include/linux/acpi.h:1013:55: warning: declaration of 'struct acpi_osc_context' will not be visible outside of this function [-Wvisibility]
   static inline u32 acpi_osc_ctx_get_pci_control(struct acpi_osc_context *context)
                                                         ^
   In file included from drivers/char/tpm/st33zp24/i2c.c:17:
   In file included from drivers/char/tpm/st33zp24/../tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   drivers/char/tpm/st33zp24/i2c.c:285:34: warning: unused variable 'of_st33zp24_i2c_match' [-Wunused-const-variable]
   static const struct of_device_id of_st33zp24_i2c_match[] = {
                                    ^
   drivers/char/tpm/st33zp24/i2c.c:291:36: warning: unused variable 'st33zp24_i2c_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id st33zp24_i2c_acpi_match[] = {
                                      ^
   4 warnings generated.


vim +1013 include/linux/acpi.h

  1009	
  1010	static inline void acpi_unregister_wakeup_handler(
  1011		bool (*wakeup)(void *context), void *context) { }
  1012	
> 1013	static inline u32 acpi_osc_ctx_get_pci_control(struct acpi_osc_context *context)
  1014	{
  1015		return 0;
  1016	}
  1017	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
