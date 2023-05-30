Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24817FE6;
	Tue, 30 May 2023 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447116; x=1716983116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9gqQUcAzrA8qNhbodeR78gbdmMGM5+vNUxV7suCQAQ=;
  b=FE5+vs0N6hYklh+MukFPk/UAKpcPYm9KQyZN7Zp71XNfw/tB9Vf3pvrS
   8dqo8zKRnU7Mw9ea3tSe/tzFsmvT5OzHFsXS+HTpCN2ywzvNqmI3KoeTu
   tOVA7PwFYlXosP0WKFQOyoBBo24HTkKvpWXR1Z/yMFop9GqcD9dYXViW6
   zwkqWHKBtpb/SEut55UKla9ntZgLLoA/oJ6roBTMknpCeCoyWfdttedia
   VbAUIA+QhB7dxK6F82EeXp5lxWvQRA7py8xKyiZLWxus6QoEMH/dLJuje
   lIU7ccY+DqcYPNDqm4Iw7iyDHTk1g0X1VdHCtmuqXo/EOP7E8ofCe3ewC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420649847"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="420649847"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="776299109"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="776299109"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 04:44:53 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3xmX-0000AO-0u;
	Tue, 30 May 2023 11:44:53 +0000
Date: Tue, 30 May 2023 19:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel
 memory as user memory
Message-ID: <202305301907.KVm9YudP-lkp@intel.com>
References: <20230530020133.235765-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530020133.235765-1-jarkko@kernel.org>

Hi Jarkko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-tpm_vtpm_proxy-do-not-reference-kernel-memory-as-user-memory/20230530-100537
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230530020133.235765-1-jarkko%40kernel.org
patch subject: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel memory as user memory
config: arm64-randconfig-r034-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301907.KVm9YudP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/919bd177830a9508a5a67fc17014cd10047d8c2f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jarkko-Sakkinen/tpm-tpm_vtpm_proxy-do-not-reference-kernel-memory-as-user-memory/20230530-100537
        git checkout 919bd177830a9508a5a67fc17014cd10047d8c2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301907.KVm9YudP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_vtpm_proxy.c:24:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_vtpm_proxy.c:77:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (buf)
               ^~~
   drivers/char/tpm/tpm_vtpm_proxy.c:83:7: note: uninitialized use occurs here
           if (!rc)
                ^~
   drivers/char/tpm/tpm_vtpm_proxy.c:77:2: note: remove the 'if' if its condition is always true
           if (buf)
           ^~~~~~~~
   drivers/char/tpm/tpm_vtpm_proxy.c:64:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   2 warnings generated.


vim +77 drivers/char/tpm/tpm_vtpm_proxy.c

    55	
    56	/*
    57	 * Functions related to 'server side'
    58	 */
    59	
    60	static ssize_t __vtpm_proxy_read_unlocked(struct proxy_dev *proxy_dev, char __user *buf,
    61						  size_t count)
    62	{
    63		size_t len;
    64		int rc;
    65	
    66		if (!(proxy_dev->state & STATE_OPENED_FLAG))
    67			return -EPIPE;
    68	
    69		len = proxy_dev->req_len;
    70	
    71		if (count < len || len > sizeof(proxy_dev->buffer)) {
    72			pr_debug("Invalid size in recv: count=%zd, req_len=%zd\n",
    73				 count, len);
    74			return -EIO;
    75		}
    76	
  > 77		if (buf)
    78			rc = copy_to_user(buf, proxy_dev->buffer, len);
    79	
    80		memset(proxy_dev->buffer, 0, len);
    81		proxy_dev->req_len = 0;
    82	
    83		if (!rc)
    84			proxy_dev->state |= STATE_WAIT_RESPONSE_FLAG;
    85	
    86		if (rc)
    87			return -EFAULT;
    88	
    89		return len;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
