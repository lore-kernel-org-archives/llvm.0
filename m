Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C5AFED;
	Tue, 18 Apr 2023 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681845189; x=1713381189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hi5rDPKAiKO3dkrZvNzmcu1W3or/62oMJmUKhJ71JxI=;
  b=dySk9KABxqIujHmrff8iOawN7JZIdSX2UAOSERMJ/necIF1Vn+7FhQNd
   mRyrFHbIzm5VARqJbbM+gb6Exk16mYbxL6gw6bc2BuV6rfWjRjXfVQM7n
   ZbVX21epG3a37mI2vth1C4ePN+k1h7fzPZdXFqvtDwMY0Wtf7ber4Bw+t
   4MM16Mv3kn2P1J76b4WqVzEG8neXhZLzPgJbVb4JMkNSWVwFDC+u9di9f
   XtQ/oLagri1WvkonTamA4SLbFCgIjS0wakF+M9+FOY6e5go1EhSrUMjPg
   NdF2v8112qMmUWpBVuwfnn2otWCWOETipoZfPmXNXhVbUnFsl8bGY/c3L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325599454"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325599454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 12:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641481107"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="641481107"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 12:13:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poqlD-000dwL-1q;
	Tue, 18 Apr 2023 19:13:03 +0000
Date: Wed, 19 Apr 2023 03:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>, kexec@lists.infradead.org,
	devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	nayna@linux.ibm.com, nasastry@in.ibm.com, mpe@ellerman.id.au,
	Stefan Berger <stefanb@linux.ibm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Nageswara R Sastry <rnsastry@linux.ibm.com>,
	Coiby Xu <coxu@redhat.com>
Subject: Re: [PATCH v9 4/4] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Message-ID: <202304190215.d0zwo1ni-lkp@intel.com>
References: <20230418134409.177485-5-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418134409.177485-5-stefanb@linux.ibm.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8f57ae2eb07ab39a6f0ccad60c760743051026]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Berger/drivers-of-kexec-ima-Support-32-bit-platforms/20230418-214600
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230418134409.177485-5-stefanb%40linux.ibm.com
patch subject: [PATCH v9 4/4] tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
config: x86_64-randconfig-a013-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190215.d0zwo1ni-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/16a833d47b9aca53a1b099dea4066b76b7f14ee1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Berger/drivers-of-kexec-ima-Support-32-bit-platforms/20230418-214600
        git checkout 16a833d47b9aca53a1b099dea4066b76b7f14ee1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190215.d0zwo1ni-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/mailbox.c:18:
   In file included from include/linux/mailbox_client.h:10:
>> include/linux/of.h:1664:48: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
   static inline void tpm_add_kexec_buffer(struct kimage *image) { }
                                                  ^
   1 warning generated.


vim +1664 include/linux/of.h

  1660	
  1661	#if defined(CONFIG_KEXEC_FILE) && defined(CONFIG_OF_FLATTREE)
  1662	void tpm_add_kexec_buffer(struct kimage *image);
  1663	#else
> 1664	static inline void tpm_add_kexec_buffer(struct kimage *image) { }
  1665	#endif
  1666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
