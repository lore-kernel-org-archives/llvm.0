Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C15801;
	Mon,  5 Feb 2024 01:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707095641; cv=none; b=W/dL0bQoZmgXmrO03VBA5EqgoAr09/u3xDIJi7QMJEudq5Y3ONgfXTYwSTAirdcmKbTr0pklSPhJjuCLt5TEddO0Hbe38G18j7rLnzH3nN3DFbmksOARcstiS3aB+wxCkGLl58LsSX5ElDRVj/xlAiCmnC0tgX6EIiqLi1jw2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707095641; c=relaxed/simple;
	bh=OOpVaxhdhp3ytdFkmIgfH9VMUT6wH0tkIfNv4NPMOxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ID3FV3kIqmGB9vM/RtsRXG9TpAvwh0jHgmD7t7MOi9lMEXEdUW28qS3EmceEaakvu2Lvdq3SyCdGY4Zh2UNnGiEdLla/SBC7zB7ZTBR2/zJqtVi1HWC7BWz0ild+BSzcpcq9VszymCZOF4xHlrFjLS7F7orz7C1IW3BcsIb/K5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0WS58DT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0WS58DT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707095639; x=1738631639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OOpVaxhdhp3ytdFkmIgfH9VMUT6wH0tkIfNv4NPMOxc=;
  b=R0WS58DT7fO3f7CPZQo/6L4hf706R1v3Rij29slsjNGbFzPo/+G994b9
   85nnaBj39Huj2qfYw2FgZ7mEqgIYrKGI0GenZYqahUnMJWHsGdHzYj+Mj
   qPsRXLleVJTSR0d6/IhoxPhlhR5nOwe4duwdLOJ+WCMOqgaw/3xfF/UiO
   U9qD7hz1xNV838EM3GtE59WqOT8GCAk2au2kI47UmXJoYyC7ZDt9kIIYi
   bb282lX330ErK3Vlhl/uYr4ICCeYczyL8rx2dt8XGn76Wnwt6PKqdi2Bl
   QIyzPieOOhqAtLG4VbRp9WQjaX84I42Rs/U4lonKj5psbI3EFAFHR4Bt0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="320551"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="320551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 17:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="823723267"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823723267"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2024 17:13:56 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnYX-00004C-0e;
	Mon, 05 Feb 2024 01:13:53 +0000
Date: Mon, 5 Feb 2024 09:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] drm/i915: Use vblank worker to unpin old legacy
 cursor fb safely
Message-ID: <202402050950.XAjoCakq-lkp@intel.com>
References: <20240204195207.3616932-2-chaitanya.kumar.borah@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204195207.3616932-2-chaitanya.kumar.borah@intel.com>

Hi Chaitanya,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240202]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.8-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Kumar-Borah/drm-i915-Use-vblank-worker-to-unpin-old-legacy-cursor-fb-safely/20240205-035939
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240204195207.3616932-2-chaitanya.kumar.borah%40intel.com
patch subject: [PATCH 1/5] drm/i915: Use vblank worker to unpin old legacy cursor fb safely
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240205/202402050950.XAjoCakq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050950.XAjoCakq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050950.XAjoCakq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.c:6785:3: error: call to undeclared function 'drm_vblank_work_flush_all'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6785 |                 drm_vblank_work_flush_all(&crtc->base);
         |                 ^
   drivers/gpu/drm/i915/display/intel_display.c:6785:3: note: did you mean 'drm_vblank_work_flush'?
   include/drm/drm_vblank_work.h:69:6: note: 'drm_vblank_work_flush' declared here
      69 | void drm_vblank_work_flush(struct drm_vblank_work *work);
         |      ^
   1 error generated.


vim +/drm_vblank_work_flush_all +6785 drivers/gpu/drm/i915/display/intel_display.c

  6765	
  6766	static void intel_commit_modeset_disables(struct intel_atomic_state *state)
  6767	{
  6768		struct intel_crtc_state *new_crtc_state, *old_crtc_state;
  6769		struct intel_crtc *crtc;
  6770		u32 handled = 0;
  6771		int i;
  6772	
  6773		for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
  6774						    new_crtc_state, i) {
  6775			if (!intel_crtc_needs_modeset(new_crtc_state))
  6776				continue;
  6777	
  6778			intel_pre_plane_update(state, crtc);
  6779	
  6780			if (!old_crtc_state->hw.active)
  6781				continue;
  6782	
  6783			intel_crtc_disable_planes(state, crtc);
  6784	
> 6785			drm_vblank_work_flush_all(&crtc->base);
  6786		}
  6787	
  6788		/* Only disable port sync and MST slaves */
  6789		for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
  6790						    new_crtc_state, i) {
  6791			if (!intel_crtc_needs_modeset(new_crtc_state))
  6792				continue;
  6793	
  6794			if (!old_crtc_state->hw.active)
  6795				continue;
  6796	
  6797			/* In case of Transcoder port Sync master slave CRTCs can be
  6798			 * assigned in any order and we need to make sure that
  6799			 * slave CRTCs are disabled first and then master CRTC since
  6800			 * Slave vblanks are masked till Master Vblanks.
  6801			 */
  6802			if (!is_trans_port_sync_slave(old_crtc_state) &&
  6803			    !intel_dp_mst_is_slave_trans(old_crtc_state) &&
  6804			    !intel_crtc_is_bigjoiner_slave(old_crtc_state))
  6805				continue;
  6806	
  6807			intel_old_crtc_state_disables(state, old_crtc_state,
  6808						      new_crtc_state, crtc);
  6809			handled |= BIT(crtc->pipe);
  6810		}
  6811	
  6812		/* Disable everything else left on */
  6813		for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
  6814						    new_crtc_state, i) {
  6815			if (!intel_crtc_needs_modeset(new_crtc_state) ||
  6816			    (handled & BIT(crtc->pipe)))
  6817				continue;
  6818	
  6819			if (!old_crtc_state->hw.active)
  6820				continue;
  6821	
  6822			intel_old_crtc_state_disables(state, old_crtc_state,
  6823						      new_crtc_state, crtc);
  6824		}
  6825	}
  6826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
