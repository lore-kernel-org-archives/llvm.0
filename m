Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B81922D4;
	Thu, 30 Jan 2025 05:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216307; cv=none; b=Muqr9jfSZLkAYTVln0DNVRu2Kn+nvs4KGn9v5NOT8JMIMRMJSpoR8UOJGTg6a1JPf7R+jpECAr/MgXqpkJo+cK6XGrxqUvxoovdjLSJPhHVFEJjkmT+mcM8ZFEBAkoj0l1CqgxhnAvvVmMUrBAJgKHjI8hsbWlKS+/qvAimbAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216307; c=relaxed/simple;
	bh=2oUZWhFRgfr9pvRVDiHPhUHnAAS7F/GEitJvK46KaIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owoBFJwde4nO9wFiVLqVbrKhZr1EKnWFoVyK4wdnJrCRkR2i4vGdwT8LPcdeI5+jFSM4LsciAs46VY3ihUnKvgWGvz+0TFSu1DWU9fAH0UAA9cKVWko7R1KhFov1tOWYuGT7/76Y8jedZl1MO9asR58ldmiRewUfYHNGep9oD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuh4+E9a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuh4+E9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216306; x=1769752306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2oUZWhFRgfr9pvRVDiHPhUHnAAS7F/GEitJvK46KaIA=;
  b=iuh4+E9abDThEqz+bWJNM8XYgzkSsWNDI23KLbjfJYr+71pbN7rKuTVQ
   hGTQYdjicqRpjIWPyT+pCkchOKonq6zgI30H+cRKXZ651PcEztdUJ0lpz
   g9OwCNcBSrZxIp8BbBXbFkkdfhspnqh1Jvnoer7Ocu3M9x+WLws0Bnwyf
   b9GkSGhe/KuT0akZY8g4M6TNlDW6SwRev2STIBZQcJmsCi1oFrmk+c8rC
   K9ZGZMx1uawF1TdbmHj0kJx3ypaCSlaZwEc//Uscdv0ttBP/C0emPaL8n
   SzpEXlMXx5zubQZWPLHQBHdNR/nzI67Focv8/p/y8y3B+z+juoSZGMqKM
   Q==;
X-CSE-ConnectionGUID: kvdba7rnTuenzIDVnyz3mA==
X-CSE-MsgGUID: sRsusSw/RRCS83sTalnIXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50169677"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50169677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 21:51:40 -0800
X-CSE-ConnectionGUID: UU8eQFvlQyuWW4KYN2gmSw==
X-CSE-MsgGUID: bwuHiGaxTBedhuinQI40rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132502975"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 21:51:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNSi-000jip-1T;
	Thu, 30 Jan 2025 05:51:36 +0000
Date: Thu, 30 Jan 2025 13:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 8/20] drivers/iommu/iommu-pages.h:30:47:
 error: incomplete definition of type 'struct iommu_pages_list'
Message-ID: <202501301330.2iIypjer-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   b21a333dd68ad1bca44a6a4ff61c91a9d43fba3a
commit: 68f020177fc5b024a95372c15ec6f8f6f192e410 [8/20] iommu/pages: Formalize the freelist API
config: um-defconfig (https://download.01.org/0day-ci/archive/20250130/202501301330.2iIypjer-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301330.2iIypjer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301330.2iIypjer-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-pages.c:6:
>> drivers/iommu/iommu-pages.h:14:38: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      14 | void iommu_put_pages_list_new(struct iommu_pages_list *list);
         |                                      ^
   drivers/iommu/iommu-pages.h:27:48: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      27 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^
>> drivers/iommu/iommu-pages.h:30:47: error: incomplete definition of type 'struct iommu_pages_list'
      30 |         list_add_tail(&virt_to_page(virt)->lru, &list->pages);
         |                                                  ~~~~^
   drivers/iommu/iommu-pages.h:27:48: note: forward declaration of 'struct iommu_pages_list'
      27 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^
   drivers/iommu/iommu-pages.h:41:51: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      41 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:44:19: error: incomplete definition of type 'struct iommu_pages_list'
      44 |         list_splice(&from->pages, &to->pages);
         |                      ~~~~^
   drivers/iommu/iommu-pages.h:41:51: note: forward declaration of 'struct iommu_pages_list'
      41 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:44:31: error: incomplete definition of type 'struct iommu_pages_list'
      44 |         list_splice(&from->pages, &to->pages);
         |                                    ~~^
   drivers/iommu/iommu-pages.h:41:51: note: forward declaration of 'struct iommu_pages_list'
      41 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^
   drivers/iommu/iommu-pages.h:51:50: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      51 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^
   drivers/iommu/iommu-pages.h:53:25: error: incomplete definition of type 'struct iommu_pages_list'
      53 |         return list_empty(&list->pages);
         |                            ~~~~^
   drivers/iommu/iommu-pages.h:51:50: note: forward declaration of 'struct iommu_pages_list'
      51 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^
>> drivers/iommu/iommu-pages.c:75:38: warning: declaration of 'struct iommu_pages_list' will not be visible outside of this function [-Wvisibility]
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^
   drivers/iommu/iommu-pages.c:75:6: error: conflicting types for 'iommu_put_pages_list_new'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |      ^
   drivers/iommu/iommu-pages.h:14:6: note: previous declaration is here
      14 | void iommu_put_pages_list_new(struct iommu_pages_list *list);
         |      ^
>> drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/iommu/iommu-pages.c:75:38: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^
>> drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:483:63: note: expanded from macro '__same_type'
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/iommu/iommu-pages.c:75:38: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^
>> drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:857:30: note: expanded from macro 'list_for_each_entry_safe'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:483:63: note: expanded from macro '__same_type'
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/iommu/iommu-pages.c:75:38: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^
>> drivers/iommu/iommu-pages.c:79:40: error: incomplete definition of type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                           ~~~~^
   include/linux/list.h:859:32: note: expanded from macro 'list_for_each_entry_safe'
     859 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:761:30: note: expanded from macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-pages.c:75:38: note: forward declaration of 'struct iommu_pages_list'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^
   5 warnings and 9 errors generated.


vim +30 drivers/iommu/iommu-pages.h

    11	
    12	void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
    13	void iommu_free_page(void *virt);
  > 14	void iommu_put_pages_list_new(struct iommu_pages_list *list);
    15	void iommu_put_pages_list_old(struct list_head *head);
    16	
    17	#define iommu_put_pages_list(head)                                   \
    18		_Generic(head,                                               \
    19			struct iommu_pages_list *: iommu_put_pages_list_new, \
    20			struct list_head *: iommu_put_pages_list_old)(head)
    21	
    22	/**
    23	 * iommu_pages_list_add - add the page to a iommu_pages_list
    24	 * @list: List to add the page to
    25	 * @virt: Address returned from iommu_alloc_pages_node()
    26	 */
    27	static inline void iommu_pages_list_add(struct iommu_pages_list *list,
    28						void *virt)
    29	{
  > 30		list_add_tail(&virt_to_page(virt)->lru, &list->pages);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
