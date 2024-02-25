Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281FF17551;
	Sun, 25 Feb 2024 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708884136; cv=none; b=VG9A5stJSr77oLvlGyodOrRnvd7ZbrXkhm4d1fkZsajoEWDaumz/8a9eBPTFt3v1IGS2uHT5fZcLZ9oMNkNoQXrKmq91q0GvCT+S0tYVon74htVbTZGzTC+wcK6gUnKxr2cpnw4dBnB0lA9DKPQ7cP6nUgzmeY1NazlMIK7qrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708884136; c=relaxed/simple;
	bh=WQ4k+cVAnhT15Z7wFi7deNZ+ISFJHpvAqziU5YWj4Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rxjxRT8V4C1RhMRXLkVgeoHX68fIxYlb21NwYVmyjjuv0Iio9c7rqWewHcK7Uu+iHWtdC0qyBMatEB17jNPSCMnHycvavowsGCayvJUk8C/G5fHgnBzCrlxrHBJXSYHOBct10B48H54ZYqPQdSNwH1zoMKWmxsRtwYZUqgY//nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft9PYwp+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft9PYwp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708884135; x=1740420135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WQ4k+cVAnhT15Z7wFi7deNZ+ISFJHpvAqziU5YWj4Z4=;
  b=Ft9PYwp+o3/Vj7XKe4kN0+R748XD3lhuxsE6No8O8YMoLjcicfom/P0Y
   OLNVziLeT0aWUXHGLTzfUKVVUlEhAOxTM0ZQFFqtqm0IBargqfjgE8btO
   kqxTCDAQHaTTL67ZVvTuNnab5i1+yEeNgFNPAETN+EFPz0zCxR03ZXnbQ
   bPxL2N0QX05FpV/JIhiS4zkVKLHAlgycUZ3GqZhHuHyyukbK6RkO/lbId
   SCqqdp5fo94KTy4aG963t8Cs79SWAqOuPr8FyeCS6ZueM7YNkndqvlTIr
   I2pQ/dLtREm6/Ea+kUmKN4ELOcJgAhcqLZ7wdjTCjdZQ4H5/6mXMxNAGO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20612663"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20612663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 10:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11088206"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2024 10:02:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reIpB-0009iS-0L;
	Sun, 25 Feb 2024 18:02:07 +0000
Date: Mon, 26 Feb 2024 02:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 1/3]
 drivers/gpu/drm/i915/display/intel_dp.c:4233:8: error: call to undeclared
 function 'intel_dp_vsc_sdp_pack'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202402260120.eBo7nTYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   de8de2c8acb931ce6197a04376a7078ccf50e821
commit: 47f419e07111acecab3b529d4ae31a28985f5b61 [1/3] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
config: i386-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240226/202402260120.eBo7nTYE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260120.eBo7nTYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260120.eBo7nTYE-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD de8de2c8acb931ce6197a04376a7078ccf50e821 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:4233:8: error: call to undeclared function 'intel_dp_vsc_sdp_pack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4233 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
         |               ^
   drivers/gpu/drm/i915/display/intel_dp.c:4233:8: note: did you mean 'drm_dp_vsc_sdp_pack'?
   include/drm/display/drm_dp_helper.h:815:9: note: 'drm_dp_vsc_sdp_pack' declared here
     815 | ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
         |         ^
   1 error generated.


vim +/intel_dp_vsc_sdp_pack +4233 drivers/gpu/drm/i915/display/intel_dp.c

03c761b00c87d6 Gwan-gyeong Mun       2020-02-11  4223  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4224  void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4225  			    const struct intel_crtc_state *crtc_state,
9ce5884e513903 José Roberto de Souza 2021-09-22  4226  			    const struct drm_dp_vsc_sdp *vsc)
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4227  {
7801f3b792b0fd Lucas De Marchi       2020-06-30  4228  	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4229  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4230  	struct dp_sdp sdp = {};
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4231  	ssize_t len;
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4232  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14 @4233  	len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4234  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4235  	if (drm_WARN_ON(&dev_priv->drm, len < 0))
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4236  		return;
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4237  
7801f3b792b0fd Lucas De Marchi       2020-06-30  4238  	dig_port->write_infoframe(encoder, crtc_state, DP_SDP_VSC,
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4239  					&sdp, len);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4240  }
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4241  

:::::: The code at line 4233 was first introduced by commit
:::::: cafac5a983619944afa639c53f0d5d885616a3d2 drm/i915/dp: Add compute routine for DP PSR VSC SDP

:::::: TO: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
