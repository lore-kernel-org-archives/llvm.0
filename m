Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B73201
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655485727; x=1687021727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r96wt8WoN/IVK+ZsxfQrb4xoxbtYs4h2oCFcW/FI1yQ=;
  b=XuULs6q+X/JYTZjoIorB8SkrxiChKK9joafDJtPL63NgB8eXDYoX6P61
   P7hHcGQnu0Q6NvzNYfsKoaKu+FWGr+khqbLrT+ROcJpci5UIjMXGBkTnS
   ahUaU3/SADt5Zbzg7AVStHquV7cr1VVy4L5bjGdchRs7YzlOfjoVgiZ2P
   48WGH+J/LDvBP4iJUMd+W0hjmX4cRM7EDDXxieAWRY/naBSqNr7JP7gdK
   TZafkJjB83xRMCaDlgUR338UXh7cjyIqpDjd4cvYAaTR6EwVv+oj+v55e
   BmY1snL3HSU+i8p8yglxvuXEeKC8AdxJubcB5rXKgp0UjdBmGM+KNm6X/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259940986"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259940986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 07:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="536836599"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jun 2022 07:29:44 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Cyl-000PVW-Fn;
	Fri, 17 Jun 2022 14:29:43 +0000
Date: Fri, 17 Jun 2022 22:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 1/2] iosys-map: Add per-word read
Message-ID: <202206172216.2dx0SuDN-lkp@intel.com>
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617085204.1678035-1-lucas.demarchi@intel.com>

Hi Lucas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/iosys-map-Add-per-word-read/20220617-165219
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220617/202206172216.2dx0SuDN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba3376fb07b117d35e6c61c7522340a3a2842ef9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/iosys-map-Add-per-word-read/20220617-165219
        git checkout ba3376fb07b117d35e6c61c7522340a3a2842ef9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1154:14: error: use of undeclared identifier 'vaddr_iomem__'
                   *last_in = record_read(&rec_map, last_switch_in_stamp);
                              ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1155:9: error: use of undeclared identifier 'vaddr_iomem__'
                   *id = record_read(&rec_map, current_context_index);
                         ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1156:12: error: use of undeclared identifier 'vaddr_iomem__'
                   *total = record_read(&rec_map, total_runtime);
                            ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1158:7: error: use of undeclared identifier 'vaddr_iomem__'
                   if (record_read(&rec_map, last_switch_in_stamp) == *last_in &&
                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1159:7: error: use of undeclared identifier 'vaddr_iomem__'
                       record_read(&rec_map, current_context_index) == *id &&
                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1160:7: error: use of undeclared identifier 'vaddr_iomem__'
                       record_read(&rec_map, total_runtime) == *total)
                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
--
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:6: error: use of undeclared identifier 'vaddr_iomem__'
                      ads_blob_read(guc, policies.dpc_promote_time));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:6: error: use of undeclared identifier 'vaddr_iomem__'
                      ads_blob_read(guc, policies.max_num_work_items));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:169:6: error: use of undeclared identifier 'vaddr_iomem__'
                      ads_blob_read(guc, policies.global_flags));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:192:23: error: use of undeclared identifier 'vaddr_iomem__'
           scheduler_policies = ads_blob_read(guc, ads.scheduler_policies);
                                ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:505:8: error: use of undeclared identifier 'vaddr_iomem__'
                   if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
                        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:75:2: note: expanded from macro 'info_map_read'
           iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
                   ^
   include/linux/iosys-map.h:349:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
           ^
   include/linux/iosys-map.h:342:30: note: expanded from macro '__iosys_map_rd_io_u64_case'
           u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
                                       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:584:8: error: use of undeclared identifier 'vaddr_iomem__'
                   if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
                        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:461:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:374:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\


vim +/vaddr_iomem__ +1154 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

77cdd054dd2ced Umesh Nerlige Ramappa 2021-10-26  1132  
4801b99588a2e0 Lucas De Marchi       2022-02-16  1133  #define record_read(map_, field_) \
4801b99588a2e0 Lucas De Marchi       2022-02-16  1134  	iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
4801b99588a2e0 Lucas De Marchi       2022-02-16  1135  
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1136  /*
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1137   * GuC updates shared memory and KMD reads it. Since this is not synchronized,
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1138   * we run into a race where the value read is inconsistent. Sometimes the
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1139   * inconsistency is in reading the upper MSB bytes of the last_in value when
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1140   * this race occurs. 2 types of cases are seen - upper 8 bits are zero and upper
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1141   * 24 bits are zero. Since these are non-zero values, it is non-trivial to
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1142   * determine validity of these values. Instead we read the values multiple times
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1143   * until they are consistent. In test runs, 3 attempts results in consistent
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1144   * values. The upper bound is set to 6 attempts and may need to be tuned as per
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1145   * any new occurences.
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1146   */
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1147  static void __get_engine_usage_record(struct intel_engine_cs *engine,
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1148  				      u32 *last_in, u32 *id, u32 *total)
77cdd054dd2ced Umesh Nerlige Ramappa 2021-10-26  1149  {
4801b99588a2e0 Lucas De Marchi       2022-02-16  1150  	struct iosys_map rec_map = intel_guc_engine_usage_record_map(engine);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1151  	int i = 0;
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1152  
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1153  	do {
4801b99588a2e0 Lucas De Marchi       2022-02-16 @1154  		*last_in = record_read(&rec_map, last_switch_in_stamp);
4801b99588a2e0 Lucas De Marchi       2022-02-16  1155  		*id = record_read(&rec_map, current_context_index);
4801b99588a2e0 Lucas De Marchi       2022-02-16  1156  		*total = record_read(&rec_map, total_runtime);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1157  
4801b99588a2e0 Lucas De Marchi       2022-02-16  1158  		if (record_read(&rec_map, last_switch_in_stamp) == *last_in &&
4801b99588a2e0 Lucas De Marchi       2022-02-16  1159  		    record_read(&rec_map, current_context_index) == *id &&
4801b99588a2e0 Lucas De Marchi       2022-02-16  1160  		    record_read(&rec_map, total_runtime) == *total)
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1161  			break;
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1162  	} while (++i < 6);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1163  }
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1164  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
