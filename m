Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24881FA4;
	Sun,  3 Mar 2024 00:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709425149; cv=none; b=F5Zlt5QDafiV9XDPR0HHCPNIg6tppi9XcDlN3FViZWMaTOWsMTkeFXpMO3yZrsjTUWqWmB666uUICTJpqp9yAYWgNcXhNhK1ZmA8VX/6EdWEGuTqqqICWESbWUyJ1OtNoqIsYSZRTBiAAPNLTZ8kBWxfnACKK4SDi95qya0KEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709425149; c=relaxed/simple;
	bh=xOaJmeh2KVXZIGe8CpnqAGhw60A7Miufvj5MQ3AHIkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwxaMzDR7vFFBAO2Gu2YMTwc5TMxMixETgTF5lLUEaAf9AHJAX5mifoFu1daOhhcdkG+j4nuALzaXbWKsnRQGDHgar770+PmuZSi3ekljM/7sVJbtEWORQ/eQVJhDHtv7tNkcAByupWWuCZwFr+mGMP92qJMxfcAFQG2MuU5eVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itswd0Sx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itswd0Sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709425148; x=1740961148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOaJmeh2KVXZIGe8CpnqAGhw60A7Miufvj5MQ3AHIkQ=;
  b=itswd0SxUcCAB/pt8npdO64O3bIEVCqxWtU9Gc5j6yJj9paJM9UutROS
   7JC23gKZkN+Xipawx3jffwl/N6kDDlUTjQ3jy4im0tG1rKt48nwhESQl+
   pHz8lvgBfkfI/+bAsEkS2zqeB/L+aEw5rjYYttt6kxo6EiTi5gwPWePFv
   000+KnJqx4zPmLeD66XrLfbA0tgkkxXh4n9nQdUi4I00FM8nJfnj84cks
   ZmssrPTiYfNL8oB/nuiOBJC0dOe7b6kwaQ2JmE5/jZZSTCSm1Cv3jqO7W
   GPXrpCkHNtRisiOlre+l2NLZ7Ek//68fDVzYKRVR3kzbfoelt0UaS+UKy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3797582"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3797582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 16:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="31748230"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2024 16:19:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgZZF-0000OI-22;
	Sun, 03 Mar 2024 00:19:01 +0000
Date: Sun, 3 Mar 2024 08:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/isp/v2 1/22]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202403030813.vObQHqlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.8/isp/v2
head:   429a9c05cc5a81e4f62c163c2e8bbdc600cf6b91
commit: 364969482811f5f21a5c14a8213c5297b027da5e [1/22] staging: vc04_services: Add new vc-sm-cma driver
config: arm64-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240303/202403030813.vObQHqlO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030813.vObQHqlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030813.vObQHqlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     283 |         default:
         |         ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: note: insert 'break;' to avoid fall-through
     283 |         default:
         |         ^
         |         break; 
   1 warning generated.
--
   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:523:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     523 |         buffer->in_use = 1;
         |                        ^ ~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:419:1: warning: no previous prototype for function 'vc_sm_cma_import_dmabuf_internal' [-Wmissing-prototypes]
     419 | vc_sm_cma_import_dmabuf_internal(struct sm_state_t *state,
         | ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:418:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     418 | int
         | ^
         | static 
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:701:51: error: too few arguments to function call, expected 2, have 1
     701 |         vchiq_add_connected_callback(vc_sm_connected_init);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                     ^
   drivers/staging/vc04_services/vc-sm-cma/../interface/vchiq_arm/vchiq_connected.h:9:6: note: 'vchiq_add_connected_callback' declared here
       9 | void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
         |      ^                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +283 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c

   267	
   268	static int vc_sm_cma_vchi_callback(struct vchiq_instance *vchiq_instance,
   269					   enum vchiq_reason reason,
   270					   struct vchiq_header *header,
   271					   unsigned int handle, void *userdata)
   272	{
   273		struct sm_instance *instance = vchiq_get_service_userdata(vchiq_instance, handle);
   274	
   275		switch (reason) {
   276		case VCHIQ_MESSAGE_AVAILABLE:
   277			vchiq_msg_queue_push(vchiq_instance, handle, header);
   278			complete(&instance->io_cmplt);
   279			break;
   280	
   281		case VCHIQ_SERVICE_CLOSED:
   282			pr_info("%s: service CLOSED!!", __func__);
 > 283		default:
   284			break;
   285		}
   286	
   287		return 0;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
