Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD517EA;
	Sun, 24 Apr 2022 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650811305; x=1682347305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3qakcHWEZbb/tE6ZLoH7UT+OIS/LUOLJ19s9X3V6mpY=;
  b=chyphFfvpz3jGI5k+b4nN+ERECMEWjWpWeK54j5+hW0ioAe65C/gL8Hv
   THuqWiPJaOl0gBV4WSzpECc5M5Ur6KAvJMlhgwCN96540K7VGwWKYeNcu
   YYg0dkLF+XahRiyulOKunIrKJdA59PvbIS+n40RhgcHWwzgPC82ylbpEC
   eOo24nDLafKLKWg140LtiMd4P+zkuEhqfMAsr8iqHSmz8zK0ergiOeYcY
   dfw6PJ3PJEr5DCnq9guH8ktMzukSvPsEaA2jz81m0gosiuRlxuNmj0suW
   UTwLrLIj+byyF3ZEZQbSWKRvnnC65LiIk4VMewG5I1ktecFaIuG8r3TH6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="263899695"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="263899695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 07:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="704223679"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2022 07:41:42 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nidQk-0001Wr-6u;
	Sun, 24 Apr 2022 14:41:42 +0000
Date: Sun, 24 Apr 2022 22:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/5] staging: vt6655: Replace two VNSvInPortD with
 ioread64_lo_hi
Message-ID: <202204242226.Y6Amb3he-lkp@intel.com>
References: <db5ba681cea27de815b172f8b93a8fd1efa30e99.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db5ba681cea27de815b172f8b93a8fd1efa30e99.1650784817.git.philipp.g.hortmann@gmail.com>

Hi Philipp,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Hortmann/staging-vt6655-Replace-macro-VNSvInPortW-D-with-ioread16-32/20220424-154730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 1efba7ef1d7da5944493728c5375fef5b2130de4
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220424/202204242226.Y6Amb3he-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6e7e66f536e6d9d9eef8e7786de652b2702e1ee8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Philipp-Hortmann/staging-vt6655-Replace-macro-VNSvInPortW-D-with-ioread16-32/20220424-154730
        git checkout 6e7e66f536e6d9d9eef8e7786de652b2702e1ee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/vt6655/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/vt6655/card.c:757:16: error: call to undeclared function 'ioread64_lo_hi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           *pqwCurrTSF = ioread64_lo_hi(iobase + MAC_REG_TSFCNTR);
                         ^
   1 error generated.


vim +/ioread64_lo_hi +757 drivers/staging/vt6655/card.c

   730	
   731	/*
   732	 * Description: Read NIC TSF counter
   733	 *              Get local TSF counter
   734	 *
   735	 * Parameters:
   736	 *  In:
   737	 *      priv         - The adapter to be read
   738	 *  Out:
   739	 *      qwCurrTSF       - Current TSF counter
   740	 *
   741	 * Return Value: true if success; otherwise false
   742	 */
   743	bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
   744	{
   745		void __iomem *iobase = priv->port_offset;
   746		unsigned short ww;
   747		unsigned char data;
   748	
   749		MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
   750		for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
   751			data = ioread8(iobase + MAC_REG_TFTCTL);
   752			if (!(data & TFTCTL_TSFCNTRRD))
   753				break;
   754		}
   755		if (ww == W_MAX_TIMEOUT)
   756			return false;
 > 757		*pqwCurrTSF = ioread64_lo_hi(iobase + MAC_REG_TSFCNTR);
   758	
   759		return true;
   760	}
   761	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
