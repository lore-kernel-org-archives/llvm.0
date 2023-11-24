Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4782E82E;
	Fri, 24 Nov 2023 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMpv1TMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839433; x=1732375433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=taXKTp5bd6Ydbb7kTMIZtkl0LexVLoaDxeOYv0wb1EE=;
  b=LMpv1TMHqJUuGuB9Oo2tegUc/mVSyY6pVCuUtGtFNu6/tCLDY6RMSpIw
   ZqcoX8HuYlDlqLBWi5tyLuxhDxvioYw4wtwTOp43GfFZsqfcJwPbd67lA
   QxeM95ipaan36YnWS0uwP2ckVgCaIdRDXn2OnFE0+C2U0GibGGJz7FfFG
   gaDuVXWNLFPCNW4S9CpgDHj4kHWGgMXSZVRZ0FGwUISOF0BvBLjAP9i3T
   gGVk7bhu3oJQgbjESsRaLn3brHcBh3anhGRY+iUigz2SHWfUX2r0ftW38
   MK16kQlhrpv/LFa/LrDFc47fPcnOFEE5y/eP2lgfSwV7yh2alrpdmGdhk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781767"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456781767"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935598"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014935598"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y21-0002wT-1M;
	Fri, 24 Nov 2023 15:23:49 +0000
Date: Fri, 24 Nov 2023 23:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Donald Robson <donald.robson@imgtec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 10/20] drm/imagination: Add GPU ID parsing and
 firmware loading
Message-ID: <202311241752.3iLyyFcA-lkp@intel.com>
References: <1ff76f7a5b45c742279c78910f8491b8a5e7f6e6.1700668843.git.donald.robson@imgtec.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ff76f7a5b45c742279c78910f8491b8a5e7f6e6.1700668843.git.donald.robson@imgtec.com>

Hi Donald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.7-rc2]
[cannot apply to drm/drm-next drm-tip/drm-tip next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donald-Robson/drm-gpuvm-Helper-to-get-range-of-unmap-from-a-remap-op/20231123-013514
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1ff76f7a5b45c742279c78910f8491b8a5e7f6e6.1700668843.git.donald.robson%40imgtec.com
patch subject: [PATCH v9 10/20] drm/imagination: Add GPU ID parsing and firmware loading
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231124/202311241752.3iLyyFcA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241752.3iLyyFcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_device_info.c:230:47: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                      ^  ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: use '&' for a bitwise operation
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                      ^~
         |                                                      &
   drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: remove constant to silence this warning
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                     ~^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +230 drivers/gpu/drm/imagination/pvr_device_info.c

   204	
   205	/**
   206	 * pvr_device_info_set_features() - Set device features from device information in firmware
   207	 * @pvr_dev: Device pointer.
   208	 * @features: Pointer to features mask in device information.
   209	 * @features_size: Size of features mask, in u64s.
   210	 * @feature_param_size: Size of feature parameters, in u64s.
   211	 *
   212	 * Returns:
   213	 *  * 0 on success, or
   214	 *  * -%EINVAL on malformed stream.
   215	 */
   216	int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features, u32 features_size,
   217					 u32 feature_param_size)
   218	{
   219		const u32 mapping_max = ARRAY_SIZE(features_mapping);
   220		const u32 mapping_max_size = (mapping_max + 63) >> 6;
   221		const u32 nr_bits = min(features_size * 64, mapping_max);
   222		const u64 *feature_params = features + features_size;
   223		u32 param_idx = 0;
   224	
   225		BUILD_BUG_ON(ARRAY_SIZE(features_mapping) != PVR_FW_HAS_FEATURE_MAX);
   226	
   227		/* Verify no unsupported values in the bitmask. */
   228		if (features_size > mapping_max_size) {
   229			drm_warn(from_pvr_device(pvr_dev), "Unsupported features in firmware image");
 > 230		} else if (features_size == mapping_max_size && (mapping_max & 63)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
