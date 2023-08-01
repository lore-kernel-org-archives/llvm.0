Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193E26AB1;
	Tue,  1 Aug 2023 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690874865; x=1722410865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lpPJ90+riuw2ummWKQe5ELJBHXw8RuUjjS4B9wtPCaA=;
  b=llzd6lr0mW1mR2hxrAKgorCGCD3acgbOpvxovDim4T5mkow+FNN6EPYx
   cZgPEtzU3VYietDJyhhi/AHfxQKIWdvBqXDf0AhQo9rodVs+ce8MgQDOT
   5DcARkc4ARQ668qI3jZfcpjuHyCvklAn1ctifT0V4I7TyhSGEqMFSkJLr
   YM/fI/ayXnnbWccXK3ddwuF3wiZ/5sJ4jwZ7Cnk6HVqAFTtcjBJpikOva
   j7tYXaLTTph2NKNNtN0/NGAyb1h8MaFszrN96VyXjpTYRNQQwE0G4bGER
   eea68z5DRxomA7k9px4Q3cwfZWey3lGCs3Eo1pxUKxbD9htM0yLGRsrAJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348817524"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="348817524"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="794052071"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="794052071"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2023 00:27:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQjn9-00004N-34;
	Tue, 01 Aug 2023 07:27:39 +0000
Date: Tue, 1 Aug 2023 15:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nikunj Kela <quic_nkela@quicinc.com>, sudeep.holla@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cristian.marussi@arm.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 3/3] firmware: arm_scmi: Add qcom hvc/shmem transport
Message-ID: <202308011516.voJRAbHr-lkp@intel.com>
References: <20230724164419.16092-4-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724164419.16092-4-quic_nkela@quicinc.com>

Hi Nikunj,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikunj-Kela/dt-bindings-arm-convert-nested-if-else-construct-to-allOf/20230725-004613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724164419.16092-4-quic_nkela%40quicinc.com
patch subject: [PATCH v2 3/3] firmware: arm_scmi: Add qcom hvc/shmem transport
config: arm-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230801/202308011516.voJRAbHr-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011516.voJRAbHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011516.voJRAbHr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/qcom_hvc.c:182:2: error: write to reserved register 'R7'
           arm_smccc_1_1_hvc(scmi_info->func_id, (unsigned long)scmi_info->cap_id,
           ^
   include/linux/arm-smccc.h:536:48: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                                   ^
   include/linux/arm-smccc.h:398:24: note: expanded from macro 'SMCCC_HVC_INST'
   #define SMCCC_HVC_INST  __HVC(0)
                           ^
   arch/arm/include/asm/opcodes-virt.h:11:22: note: expanded from macro '__HVC'
   #define __HVC(imm16) __inst_arm_thumb32(                                \
                        ^
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
           __inst_thumb32(thumb_opcode)
           ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
   #define __inst_thumb32(x) ___inst_thumb32(                              \
                             ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
           ".short " __stringify(first) ", " __stringify(second) "\n\t"
           ^
   1 error generated.


vim +/R7 +182 drivers/firmware/arm_scmi/qcom_hvc.c

   167	
   168	static int qcom_hvc_send_message(struct scmi_chan_info *cinfo,
   169					 struct scmi_xfer *xfer)
   170	{
   171		struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
   172		struct arm_smccc_res res;
   173	
   174		/*
   175		 * Channel will be released only once response has been
   176		 * surely fully retrieved, so after .mark_txdone()
   177		 */
   178		mutex_lock(&scmi_info->shmem_lock);
   179	
   180		shmem_tx_prepare(scmi_info->shmem, xfer, cinfo);
   181	
 > 182		arm_smccc_1_1_hvc(scmi_info->func_id, (unsigned long)scmi_info->cap_id,
   183				  0, 0, 0, 0, 0, 0, &res);
   184	
   185		if (res.a0) {
   186			mutex_unlock(&scmi_info->shmem_lock);
   187			return -EOPNOTSUPP;
   188		}
   189	
   190		return 0;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
