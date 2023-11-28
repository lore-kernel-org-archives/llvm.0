Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE737D04;
	Tue, 28 Nov 2023 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQfTnoSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701187904; x=1732723904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFXQnQRGVgVhk1VMQgMxWnSVuw5MV/q/ZM1gOgM6uu0=;
  b=jQfTnoSNfcqmbKY/59S0l6T4TooJImUEM9Iv1+8u0s2C6yi3aJ5WZQJ1
   7i71tz/Jx2S+BY0b7DgF8g2lqBb+bHXV0Rd15lr3A69u/Pd2dIr4yf0/p
   SZoNtsvT/B8NwPK+YYUEuU9aEdpd7m1Hse9fiuPfKfxUkPBOEs+q6Nm1C
   Z/5k1gYBFh61ggTDErsrbu9ocGvG1JRRNyRR7EoPdWPyMIl4iIFDvKQXh
   YtF7VINEV+LwqNIsDDI5Uz5QoC0zE4vn24EbaeXFNOvpxS8S5PKIVLrEP
   Qfg4v+oJ8QFDawl0GK5duZhds4SnZuYZITE4/DspACgDzjai9nOT9BRS7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11649464"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="11649464"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="941971347"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="941971347"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2023 08:11:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r80gU-0007ia-0m;
	Tue, 28 Nov 2023 16:11:38 +0000
Date: Wed, 29 Nov 2023 00:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
Message-ID: <202311290054.4swO3tfm-lkp@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-20-c7602158306e@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on sunxi/sunxi/for-next drm/drm-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Add-atomic-helpers/20231128-193409
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-20-c7602158306e%40kernel.org
patch subject: [PATCH v4 20/45] drm/vc4: hdmi: Switch to HDMI connector
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231129/202311290054.4swO3tfm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290054.4swO3tfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290054.4swO3tfm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_hdmi.c:678:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (len > sizeof(buffer))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:729:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:678:2: note: remove the 'if' if its condition is always false
           if (len > sizeof(buffer))
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:672:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +678 drivers/gpu/drm/vc4/vc4_hdmi.c

   654	
   655	static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
   656					    enum hdmi_infoframe_type type,
   657					    const u8 *infoframe, size_t len)
   658	{
   659		struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
   660		struct drm_device *drm = connector->dev;
   661		u32 packet_id = type - 0x80;
   662		const struct vc4_hdmi_register *ram_packet_start =
   663			&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
   664		u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
   665		u32 packet_reg_next = ram_packet_start->offset +
   666			VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
   667		void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
   668							       ram_packet_start->reg);
   669		uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
   670		unsigned long flags;
   671		ssize_t i;
   672		int ret;
   673		int idx;
   674	
   675		if (!drm_dev_enter(drm, &idx))
   676			return 0;
   677	
 > 678		if (len > sizeof(buffer))
   679			goto out;
   680	
   681		memcpy(buffer, infoframe, len);
   682	
   683		WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
   684			    VC4_HDMI_RAM_PACKET_ENABLE),
   685			  "Packet RAM has to be on to store the packet.");
   686	
   687		ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
   688		if (ret) {
   689			DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
   690			goto out;
   691		}
   692	
   693		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
   694	
   695		for (i = 0; i < len; i += 7) {
   696			writel(buffer[i + 0] << 0 |
   697			       buffer[i + 1] << 8 |
   698			       buffer[i + 2] << 16,
   699			       base + packet_reg);
   700			packet_reg += 4;
   701	
   702			writel(buffer[i + 3] << 0 |
   703			       buffer[i + 4] << 8 |
   704			       buffer[i + 5] << 16 |
   705			       buffer[i + 6] << 24,
   706			       base + packet_reg);
   707			packet_reg += 4;
   708		}
   709	
   710		/*
   711		 * clear remainder of packet ram as it's included in the
   712		 * infoframe and triggers a checksum error on hdmi analyser
   713		 */
   714		for (; packet_reg < packet_reg_next; packet_reg += 4)
   715			writel(0, base + packet_reg);
   716	
   717		HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
   718			   HDMI_READ(HDMI_RAM_PACKET_CONFIG) | BIT(packet_id));
   719	
   720		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
   721	
   722		ret = wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
   723				BIT(packet_id)), 100);
   724		if (ret)
   725			DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
   726	
   727	out:
   728		drm_dev_exit(idx);
   729		return ret;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
