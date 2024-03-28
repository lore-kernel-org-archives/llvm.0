Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DF7E583;
	Thu, 28 Mar 2024 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640058; cv=none; b=m3/Ep1tIv9G892c6WgpdA/zWtZv/cKhTJGEOFJVdusLR3ZprPHTpoW/BdHELAJ6HoSglqL1dfPLfLt2pRbRepFmDmCu4QlnMtKZZT9ViS8enTR9udrSa0i52q6oZRWuk8obc+tr7mCnZpeTdtuHpdgwawyELaCT+l0RzWhoS8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640058; c=relaxed/simple;
	bh=nkU3bCTh86GEcjg5ESJxchooM6+nADk21kFFRRWMVfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcpR/gocIw3l2CXBlCioxJtTifuvGtJ6fcjNiFEFry8l31cA+X/qQKgs+wihCqfdGGIJ0wi5joFaaXNaA8p+AzFTT3PdeR7r3OxmhAP8fwLD32CY9jgD15cwzwc/mJYJj0T4ipgw2AHiNux5cqyB4aMT5AoKsOFxdflVPBzFNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBP9AyhH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBP9AyhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711640056; x=1743176056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkU3bCTh86GEcjg5ESJxchooM6+nADk21kFFRRWMVfA=;
  b=ZBP9AyhHV6g3S2MX3mNfRNFv3IieyxZo+V8dU006KpXdr5TXyhsO6ndu
   vJihVLEHrtcmCaGTJiGt4WXRHvWfttSkOIk/B/xb5LoKc1Z3arYXjDvel
   VSpZ8L80+KZG/4nsMg4PhHr8V0nsSZKVJDfSlV6eYmLjabpbAKEYw8GQg
   JCj07ZVRCgbrx0e8Ic2FquI7nEpKwbRc35mxQj9RYJ/ciQZ6nUMEtUH3W
   E93AZPIiIjANCSQazI3MVLxMoIO5Dn81JSoEU60F+O3msmanFIWhXx3Lq
   9fJdUC7CehJmP2kqcUVWwHg7jr8TI9Z0UCQWBBmgY5U7GROCBEKyYvhd6
   g==;
X-CSE-ConnectionGUID: ilmbcPwYStiYG88TReRcLw==
X-CSE-MsgGUID: dMtH+A/nRAuh4yYwahECyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6912013"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6912013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16519452"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 08:34:12 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rprlZ-0002Gq-2P;
	Thu, 28 Mar 2024 15:34:09 +0000
Date: Thu, 28 Mar 2024 23:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] cxl/core: Add region info to cxl_general_media and
 cxl_dram events
Message-ID: <202403282310.8boff281-lkp@intel.com>
References: <061d1eac5d4e270337911199f0b0633c0ff230b4.1711598777.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <061d1eac5d4e270337911199f0b0633c0ff230b4.1711598777.git.alison.schofield@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-region-Move-cxl_dpa_to_region-work-to-the-region-driver/20240328-123905
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/061d1eac5d4e270337911199f0b0633c0ff230b4.1711598777.git.alison.schofield%40intel.com
patch subject: [PATCH 3/4] cxl/core: Add region info to cxl_general_media and cxl_dram events
config: powerpc-randconfig-001-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282310.8boff281-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282310.8boff281-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282310.8boff281-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/trace.c:5:
   drivers/cxl/core/core.h:49:9: error: returning 'void *' from a function with incompatible result type 'struct cxl_region'
           return NULL;
                  ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   In file included from drivers/cxl/core/trace.c:8:
   In file included from drivers/cxl/core/./trace.h:748:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/cxl/core/./trace.h:380:3: error: assigning to 'struct cxl_region *' from incompatible type 'struct cxl_region'
                   store_region_info(cxlmd, to_gm_dpa(record),
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/./trace.h:24:8: note: expanded from macro 'store_region_info'
                   cxlr = cxl_dpa_to_region(cxlmd, dpa);                   \
                        ^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   In file included from drivers/cxl/core/trace.c:8:
   In file included from drivers/cxl/core/./trace.h:748:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   drivers/cxl/core/./trace.h:480:3: error: assigning to 'struct cxl_region *' from incompatible type 'struct cxl_region'
                   store_region_info(cxlmd, __entry->dpa, __entry->region_uuid,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/./trace.h:24:8: note: expanded from macro 'store_region_info'
                   cxlr = cxl_dpa_to_region(cxlmd, dpa);                   \
                        ^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   3 errors generated.


vim +380 drivers/cxl/core/./trace.h

   336	
   337		TP_PROTO(const struct cxl_memdev *cxlmd, enum cxl_event_log_type log,
   338			 struct cxl_event_gen_media *rec),
   339	
   340		TP_ARGS(cxlmd, log, rec),
   341	
   342		TP_STRUCT__entry(
   343			CXL_EVT_TP_entry
   344			/* General Media */
   345			__field(u64, dpa)
   346			__field(u8, descriptor)
   347			__field(u8, type)
   348			__field(u8, transaction_type)
   349			__field(u8, channel)
   350			__field(u32, device)
   351			__array(u8, comp_id, CXL_EVENT_GEN_MED_COMP_ID_SIZE)
   352			/* Following are out of order to pack trace record */
   353			__field(u64, hpa)
   354			__field_struct(uuid_t, region_uuid)
   355			__field(u16, validity_flags)
   356			__field(u8, rank)
   357			__field(u8, dpa_flags)
   358			__string(region_name, to_region_name(cxlmd, to_gm_dpa(record)))
   359		),
   360	
   361		TP_fast_assign(
   362			CXL_EVT_TP_fast_assign(cxlmd, log, rec->hdr);
   363			__entry->hdr_uuid = CXL_EVENT_GEN_MEDIA_UUID;
   364	
   365			/* General Media */
   366			__entry->dpa = le64_to_cpu(rec->phys_addr);
   367			__entry->dpa_flags = __entry->dpa & CXL_DPA_FLAGS_MASK;
   368			/* Mask after flags have been parsed */
   369			__entry->dpa &= CXL_DPA_MASK;
   370			__entry->descriptor = rec->descriptor;
   371			__entry->type = rec->type;
   372			__entry->transaction_type = rec->transaction_type;
   373			__entry->channel = rec->channel;
   374			__entry->rank = rec->rank;
   375			__entry->device = get_unaligned_le24(rec->device);
   376			memcpy(__entry->comp_id, &rec->component_id,
   377				CXL_EVENT_GEN_MED_COMP_ID_SIZE);
   378			__entry->validity_flags = get_unaligned_le16(&rec->validity_flags);
   379			__assign_str(region_name, to_region_name(cxlmd, to_gm_dpa(record)));
 > 380			store_region_info(cxlmd, to_gm_dpa(record),
   381					  __entry->region_uuid, __entry->hpa);
   382		),
   383	
   384		CXL_EVT_TP_printk("dpa=%llx dpa_flags='%s' " \
   385			"descriptor='%s' type='%s' transaction_type='%s' channel=%u rank=%u " \
   386			"device=%x comp_id=%s validity_flags='%s' " \
   387			"hpa=%llx region=%s region_uuid=%pUb",
   388			__entry->dpa, show_dpa_flags(__entry->dpa_flags),
   389			show_event_desc_flags(__entry->descriptor),
   390			show_mem_event_type(__entry->type),
   391			show_trans_type(__entry->transaction_type),
   392			__entry->channel, __entry->rank, __entry->device,
   393			__print_hex(__entry->comp_id, CXL_EVENT_GEN_MED_COMP_ID_SIZE),
   394			show_valid_flags(__entry->validity_flags),
   395			__entry->hpa, __get_str(region_name), &__entry->region_uuid
   396		)
   397	);
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
