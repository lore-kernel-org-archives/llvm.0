Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4986F15AC;
	Fri, 28 Apr 2023 02:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682648896; x=1714184896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nzz3qyDS60sUuUawJehavL6b9ST4rCcODX3QjhWuu14=;
  b=jVM9OlbV/GLFwNgNhznmEbdllaRTdO5q4T7KzbbJLV8HFBDuJSytZW3z
   JI6lrQ9H8ze2bg+/1GJ9OEyUZjHkmot+irylZ6vx+p220t9fxCuAoBk+n
   CYrh1BElhun3CQZabjbCo4F8Omf5PcRegaTQ57r2FTNwWPZCrd7O5GPfX
   Zehjej+TUnqDfztI1ZMugIu9ERK/WNpzzB2Gog6wtXk15CbCc/tl8i0Pe
   jfBBURQe0w2W98V0l7az/EPVOnhVifewqaBxKhfeL/G2WLPlKOQW8Zntj
   oKY02Qaj1Rv2nkZ2OsnRqhomviC43tQFZURyF7HAvMxcvkHy53XjRYHPu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327955064"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="327955064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 19:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697351564"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="697351564"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Apr 2023 19:28:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psDqH-00001W-2a;
	Fri, 28 Apr 2023 02:28:13 +0000
Date: Fri, 28 Apr 2023 10:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v9 4/8] drm/i915/pxp: Add GSC-CS backend to
 send GSC fw messages
Message-ID: <202304281013.7uSrys31-lkp@intel.com>
References: <20230427234843.2886921-5-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427234843.2886921-5-alan.previn.teres.alexis@intel.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b9458e7075652669ec0e04abe039a5ed001701fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230428-075109
base:   b9458e7075652669ec0e04abe039a5ed001701fe
patch link:    https://lore.kernel.org/r/20230427234843.2886921-5-alan.previn.teres.alexis%40intel.com
patch subject: [Intel-gfx] [PATCH v9 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230428/202304281013.7uSrys31-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/142cc2dd29a81581964134582fd02514da0ec6e4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230428-075109
        git checkout 142cc2dd29a81581964134582fd02514da0ec6e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281013.7uSrys31-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:113:17: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                            reply_size, msg_out_size_max);
                                        ^~~~~~~~~~~~~~~~
   include/drm/drm_print.h:466:36: note: expanded from macro 'drm_warn'
           __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
                                      ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:456:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +113 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

    15	
    16	static int
    17	gsccs_send_message(struct intel_pxp *pxp,
    18			   void *msg_in, size_t msg_in_size,
    19			   void *msg_out, size_t msg_out_size_max,
    20			   size_t *msg_out_len,
    21			   u64 *gsc_msg_handle_retry)
    22	{
    23		struct intel_gt *gt = pxp->ctrl_gt;
    24		struct drm_i915_private *i915 = gt->i915;
    25		struct gsccs_session_resources *exec_res =  &pxp->gsccs_res;
    26		struct intel_gsc_mtl_header *header = exec_res->pkt_vaddr;
    27		struct intel_gsc_heci_non_priv_pkt pkt;
    28		size_t max_msg_size;
    29		u32 reply_size;
    30		int ret;
    31	
    32		if (!exec_res->ce)
    33			return -ENODEV;
    34	
    35		max_msg_size = PXP43_MAX_HECI_INOUT_SIZE - sizeof(*header);
    36	
    37		if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
    38			return -ENOSPC;
    39	
    40		if (!exec_res->pkt_vma || !exec_res->bb_vma)
    41			return -ENOENT;
    42	
    43		GEM_BUG_ON(exec_res->pkt_vma->size < (2 * PXP43_MAX_HECI_INOUT_SIZE));
    44	
    45		mutex_lock(&pxp->tee_mutex);
    46	
    47		memset(header, 0, sizeof(*header));
    48		intel_gsc_uc_heci_cmd_emit_mtl_header(header, HECI_MEADDRESS_PXP,
    49						      msg_in_size + sizeof(*header),
    50						      exec_res->host_session_handle);
    51	
    52		/* check if this is a host-session-handle cleanup call (empty packet) */
    53		if (!msg_in && !msg_out)
    54			header->flags |= GSC_INFLAG_MSG_CLEANUP;
    55	
    56		/* copy caller provided gsc message handle if this is polling for a prior msg completion */
    57		header->gsc_message_handle = *gsc_msg_handle_retry;
    58	
    59		/* NOTE: zero size packets are used for session-cleanups */
    60		if (msg_in && msg_in_size)
    61			memcpy(exec_res->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
    62	
    63		pkt.addr_in = i915_vma_offset(exec_res->pkt_vma);
    64		pkt.size_in = header->message_size;
    65		pkt.addr_out = pkt.addr_in + PXP43_MAX_HECI_INOUT_SIZE;
    66		pkt.size_out = msg_out_size_max + sizeof(*header);
    67		pkt.heci_pkt_vma = exec_res->pkt_vma;
    68		pkt.bb_vma = exec_res->bb_vma;
    69	
    70		/*
    71		 * Before submitting, let's clear-out the validity marker on the reply offset.
    72		 * We use offset PXP43_MAX_HECI_INOUT_SIZE for reply location so point header there.
    73		 */
    74		header = exec_res->pkt_vaddr + PXP43_MAX_HECI_INOUT_SIZE;
    75		header->validity_marker = 0;
    76	
    77		ret = intel_gsc_uc_heci_cmd_submit_nonpriv(&gt->uc.gsc,
    78							   exec_res->ce, &pkt, exec_res->bb_vaddr,
    79							   GSC_REPLY_LATENCY_MS);
    80		if (ret) {
    81			drm_err(&i915->drm, "failed to send gsc PXP msg (%d)\n", ret);
    82			goto unlock;
    83		}
    84	
    85		/* Response validity marker, status and busyness */
    86		if (header->validity_marker != GSC_HECI_VALIDITY_MARKER) {
    87			drm_err(&i915->drm, "gsc PXP reply with invalid validity marker\n");
    88			ret = -EINVAL;
    89			goto unlock;
    90		}
    91		if (header->status != 0) {
    92			drm_dbg(&i915->drm, "gsc PXP reply status has error = 0x%08x\n",
    93				header->status);
    94			ret = -EINVAL;
    95			goto unlock;
    96		}
    97		if (header->flags & GSC_OUTFLAG_MSG_PENDING) {
    98			drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
    99			/*
   100			 * When the GSC firmware replies with pending bit, it means that the requested
   101			 * operation has begun but the completion is pending and the caller needs
   102			 * to re-request with the gsc_message_handle that was returned by the firmware.
   103			 * until the pending bit is turned off.
   104			 */
   105			*gsc_msg_handle_retry = header->gsc_message_handle;
   106			ret = -EAGAIN;
   107			goto unlock;
   108		}
   109	
   110		reply_size = header->message_size - sizeof(*header);
   111		if (reply_size > msg_out_size_max) {
   112			drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
 > 113				 reply_size, msg_out_size_max);
   114			reply_size = msg_out_size_max;
   115		}
   116	
   117		if (msg_out)
   118			memcpy(msg_out, exec_res->pkt_vaddr + PXP43_MAX_HECI_INOUT_SIZE + sizeof(*header),
   119			       reply_size);
   120		if (msg_out_len)
   121			*msg_out_len = reply_size;
   122	
   123	unlock:
   124		mutex_unlock(&pxp->tee_mutex);
   125		return ret;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
