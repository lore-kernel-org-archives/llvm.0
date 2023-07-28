Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FACF14A98;
	Fri, 28 Jul 2023 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690560859; x=1722096859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/sHPSp5CO9qpoH0krtxZGrMN/jzGqbgU2TjOO0q1a4o=;
  b=C218Zp5PRvyJtwbf6BsIGmxZcrWbATd7Uun/USqUsHxcios9OHILWYtw
   OClkhZI+6dZZOfYUvdqv7iemOwHeph2q8CX05KGgG+GmTR7W2mHiEPsQp
   BdZi38vKOwloELKLLdlDWUtVcVrcVA+k8RnKGtjtjheORbjwhmiRVnoYZ
   DmE37f9SY8KtJuzkw2v+FqxWnWks+nKXUHFTkKEqdZop7oFcTLrS4Pebu
   LlqVsqKFHrxcRk3SOX4fy/kdzdLOQ9P6oHOz6POTLEyfRP5xiJKAwUhxN
   upZ30Ux4xkRuZcNfFOABnBRdtcEQo5kSYzsFYp2jIpNWt1uYbuZnk+Bpj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367508447"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="367508447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 09:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="851264272"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="851264272"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 09:08:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPQ0t-0003Ly-0h;
	Fri, 28 Jul 2023 16:08:23 +0000
Date: Sat, 29 Jul 2023 00:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [hverkuil-media-tree:hdmi-dbg 25/34]
 drivers/gpu/drm/vc4/vc4_hdmi.c:573:37: error: passing 'const struct
 drm_connector_state *' to parameter of type 'struct drm_connector_state *'
 discards qualifiers
Message-ID: <202307282352.BKzOHh7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   7cbf796fd240aa51fe399866ae7c223133457a0e
commit: 3b0ea91f7f9721432d165bb0ad18c28eb776be25 [25/34] drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB range
config: riscv-randconfig-r013-20230728 (https://download.01.org/0day-ci/archive/20230728/202307282352.BKzOHh7k-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307282352.BKzOHh7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307282352.BKzOHh7k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_hdmi.c:573:37: error: passing 'const struct drm_connector_state *' to parameter of type 'struct drm_connector_state *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     573 |                 conn_state_to_vc4_hdmi_conn_state(state);
         |                                                   ^~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.h:255:63: note: passing argument to parameter 'conn_state' here
     255 | conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
         |                                                               ^
   1 error generated.


vim +573 drivers/gpu/drm/vc4/vc4_hdmi.c

   563	
   564	static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
   565						   const struct drm_connector_state *state,
   566						   struct drm_property *property,
   567						   uint64_t *val)
   568	{
   569		struct drm_device *drm = connector->dev;
   570		struct vc4_hdmi *vc4_hdmi =
   571			connector_to_vc4_hdmi(connector);
   572		const struct vc4_hdmi_connector_state *vc4_conn_state =
 > 573			conn_state_to_vc4_hdmi_conn_state(state);
   574	
   575		if (property == vc4_hdmi->broadcast_rgb_property) {
   576			*val = vc4_conn_state->broadcast_rgb;
   577		} else {
   578			drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
   579				property->base.id, property->name);
   580			return -EINVAL;
   581		}
   582	
   583		return 0;
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
