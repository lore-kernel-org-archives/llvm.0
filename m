Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1CC7A
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646069837; x=1677605837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dks6yYMwd4lMXpe3SnDkJomov1zowohtskGdY45fvqc=;
  b=kvIH/cvu78pLP3K5d66+VqsXigxePnAZwhNKxccpxTQc4brl6WsuXPsq
   DYlA5lrRDDQ1lKH7R/9YgpZ4ccBlD82XX3cgekbu1V+MJObggdMSPsR9l
   hfN8y6vcEw89wSWDqHhczxs8t+nhhM5VTn6WngS4YhfF34hyGHPAmhYXy
   l+sILXBpG79aqDiyV2uiaTfCBTi1G2ZmPrsp05RHmNJ3z1gK0ItirHE+8
   NZiiJn5v6Zj2jPBnk/xIXaTXD2tYgu2K3jjaIG4luxGVuKh6Vqst/mAhs
   mDYfszb2Y4NrKgKnSwqx+hzlFZxVm4eEwRJ2+6s8jwljOqyU32jxeKuzn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232911999"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="232911999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 09:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="640958037"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2022 09:37:15 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOjxS-0007c5-FJ; Mon, 28 Feb 2022 17:37:14 +0000
Date: Tue, 1 Mar 2022 01:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Slawomir Mrozowicz <slawomirx.mrozowicz@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Slawomir Mrozowicz <slawomirx.mrozowicz@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH net 3/3] ixgbevf: add disable link state
Message-ID: <202203010159.pkLQCurU-lkp@intel.com>
References: <20220228132752.17522-3-slawomirx.mrozowicz@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228132752.17522-3-slawomirx.mrozowicz@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Slawomir,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Slawomir-Mrozowicz/ixgbe-add-the-ability-for-the-PF-to-disable-VF-link-state/20220228-225053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 519ca6fa960587d02904a9f8f79d587ac874fb03
config: x86_64-randconfig-a006-20220228 (https://download.01.org/0day-ci/archive/20220301/202203010159.pkLQCurU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/74e631f4b502bf5cda71dd25f255cd7eca42d280
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Slawomir-Mrozowicz/ixgbe-add-the-ability-for-the-PF-to-disable-VF-link-state/20220228-225053
        git checkout 74e631f4b502bf5cda71dd25f255cd7eca42d280
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/intel/ixgbevf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ixgbevf/vf.c:594:5: warning: no previous prototype for function 'ixgbevf_get_link_state_vf' [-Wmissing-prototypes]
   s32 ixgbevf_get_link_state_vf(struct ixgbe_hw *hw, bool *link_state)
       ^
   drivers/net/ethernet/intel/ixgbevf/vf.c:594:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   s32 ixgbevf_get_link_state_vf(struct ixgbe_hw *hw, bool *link_state)
   ^
   static 
   1 warning generated.


vim +/ixgbevf_get_link_state_vf +594 drivers/net/ethernet/intel/ixgbevf/vf.c

   586	
   587	/**
   588	 * ixgbevf_get_link_state_vf - Get VF link state from PF
   589	 * @hw: pointer to the HW structure
   590	 * @link_state: link state storage
   591	 *
   592	 * Returns state of the operation error or success.
   593	 */
 > 594	s32 ixgbevf_get_link_state_vf(struct ixgbe_hw *hw, bool *link_state)
   595	{
   596		u32 msgbuf[2];
   597		s32 ret_val;
   598		s32 err;
   599	
   600		msgbuf[0] = IXGBE_VF_GET_LINK_STATE;
   601		msgbuf[1] = 0x0;
   602	
   603		err = ixgbevf_write_msg_read_ack(hw, msgbuf, msgbuf, 2);
   604	
   605		if (err || (msgbuf[0] & IXGBE_VT_MSGTYPE_FAILURE)) {
   606			ret_val = IXGBE_ERR_MBX;
   607		} else {
   608			ret_val = 0;
   609			*link_state = msgbuf[1];
   610		}
   611	
   612		return ret_val;
   613	}
   614	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
