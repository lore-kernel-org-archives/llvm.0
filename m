Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249F6AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 20:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655411177; x=1686947177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCBE9b7OKZue36WoDEtNzIp8Vup2V1mQ1A14xh+mBlQ=;
  b=VtRDC9HyI5Roup85U/aBMz5vx7T5qDICtp42VIeR2Xgc5c+4pQzl9fQZ
   fF55wRFHWZ3+OQGdR7vtglQAilWhwon8Aw16iLFvAoyPo6ZFLXi0G6p7H
   nXRDEOL3R7NzwlG4st25CpY/9g02QDfPTEwWsUCtGV1OQ1Z7/xNaUzdZ1
   1I3/T3gI8PRNyrVw0Mp4RcBygnfJZngSSTcKvwnqbFvvOnfDQ5gmeqLbe
   XZj7A0gu4FAgvrkgowSHuPxqzig6atmtbv5x3uYNPv2CdiKoKQ/0l/xjY
   5Re1dQRf42TwIF03VpLO3o3xC+Jb5hEugyXMqdvcsC58PDUn+3Wp9oaLe
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304792248"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="304792248"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="536584728"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2022 13:26:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1w4D-000OkH-IZ;
	Thu, 16 Jun 2022 20:26:13 +0000
Date: Fri, 17 Jun 2022 04:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>, kexec@lists.infradead.org,
	devicetree@vger.kernel.org, linux-integrity@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, nayna@linux.ibm.com,
	nasastry@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>
Subject: Re: [PATCH v2 3/3] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Message-ID: <202206170406.VbxuBICz-lkp@intel.com>
References: <20220616154130.2052541-4-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616154130.2052541-4-stefanb@linux.ibm.com>

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on linus/master v5.19-rc2 next-20220616]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Berger/tpm-Preserve-TPM-measurement-log-across-kexec/20220616-234240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 0a35780c755ccec097d15c6b4ff8b246a89f1689
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220617/202206170406.VbxuBICz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c28e0f7321d0b7245454e811a3dd0f2134d9dd74
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Berger/tpm-Preserve-TPM-measurement-log-across-kexec/20220616-234240
        git checkout c28e0f7321d0b7245454e811a3dd0f2134d9dd74
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/of/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/of/kexec.c:305: warning: expecting prototype for tpm_free_kexec_buffer(). Prototype was for tpm_of_remove_kexec_buffer() instead


vim +305 drivers/of/kexec.c

   300	
   301	/**
   302	 * tpm_free_kexec_buffer - free memory used by the IMA buffer
   303	 */
   304	static int tpm_of_remove_kexec_buffer(void)
 > 305	{
   306		struct property *prop;
   307	
   308		prop = of_find_property(of_chosen, "linux,tpm-kexec-buffer", NULL);
   309		if (!prop)
   310			return -ENOENT;
   311	
   312		return of_remove_property(of_chosen, prop);
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
