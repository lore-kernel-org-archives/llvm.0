Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783F7B;
	Sun,  5 Feb 2023 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675607664; x=1707143664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53TN9BnoCBRU9bwx1idlDuaHpEjaKt8yj/T3Vfqy5xs=;
  b=SlwS8sjZOs4JfJnDN/E7ztdLHATSQgcztPpGvIBjzkpKVLL4QV72Q03F
   cPDH3yFWiXWLSG/4+LyY75WYx6wantie+9Wy6fUfokvAr0fKdc9QxFInw
   CN9jzHQDH6UsWmv8aB6+jx1oQ2KmwozpbOEh6VEUnKgUV6s6gol9oOuG0
   LDoIPBZWzWPjyn0vmrq+BLmLk2hV0h2bmJ3K84IXgjR8n0nTLInqAVFKq
   gzDB9ZKL40EHaCBZUvfn9LAKWVW8kNPaIypOg0gKXY8Y/mTmq7f9nYGUN
   RpW4vpejNO7FsFI4VVEu9/btg6OHE4eDrVJRd9nqfkMCsGPd6idw9ICUk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308691875"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="308691875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 06:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698607811"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698607811"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 06:34:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOg61-00023Y-14;
	Sun, 05 Feb 2023 14:34:21 +0000
Date: Sun, 5 Feb 2023 22:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-for-next 21/24] error[E0425]: cannot find
 function `drm_gem_object_get` in crate `bindings`
Message-ID: <202302052253.n0pJjBrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-for-next
head:   66a57fa1328927e067e02fa8a64782c4ee5aac1d
commit: a09519a8f540416972af3a8dbb185744434aa08b [21/24] rust: kernel: drm: gem: Add GEM object abstraction
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230205/202302052253.n0pJjBrj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a09519a8f540416972af3a8dbb185744434aa08b
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-for-next
        git checkout a09519a8f540416972af3a8dbb185744434aa08b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `drm_gem_object_get` in crate `bindings`
   --> rust/kernel/drm/gem/mod.rs:132:23
   |
   132   |             bindings::drm_gem_object_get(self.gem_obj() as *const _ as *mut _);
   |                       ^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gem_object_free`
   |
   ::: rust/bindings/bindings_generated.rs:48044:5
   |
   48044 |     pub fn drm_gem_object_free(kref: *mut kref);
   |     -------------------------------------------- similarly named function `drm_gem_object_free` defined here
--
>> error[E0425]: cannot find function `drm_vma_node_offset_addr` in crate `bindings`
   --> rust/kernel/drm/gem/mod.rs:182:23
   |
   182   |               bindings::drm_vma_node_offset_addr(&self.gem_obj().vma_node as *const _ as *mut _)
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_vma_offset_add`
   |
   ::: rust/bindings/bindings_generated.rs:47942:5
   |
   47942 | /     pub fn drm_vma_offset_add(
   47943 | |         mgr: *mut drm_vma_offset_manager,
   47944 | |         node: *mut drm_vma_offset_node,
   47945 | |         pages: core::ffi::c_ulong,
   47946 | |     ) -> core::ffi::c_int;
   | |__________________________- similarly named function `drm_vma_offset_add` defined here
--
>> error[E0425]: cannot find function `drm_gem_object_put` in crate `bindings`
   --> rust/kernel/drm/gem/mod.rs:298:23
   |
   298   |               bindings::drm_gem_object_put((*self.ptr).gem_obj() as *const _ as *mut _);
   |                         ^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gem_object_init`
   |
   ::: rust/bindings/bindings_generated.rs:48047:5
   |
   48047 | /     pub fn drm_gem_object_init(
   48048 | |         dev: *mut drm_device,
   48049 | |         obj: *mut drm_gem_object,
   48050 | |         size: usize,
   48051 | |     ) -> core::ffi::c_int;
   | |__________________________- similarly named function `drm_gem_object_init` defined here
--
>> error[E0425]: cannot find function `drm_gem_object_put` in crate `bindings`
   --> rust/kernel/drm/gem/mod.rs:334:23
   |
   334   |               bindings::drm_gem_object_put((*self.ptr).gem_obj() as *const _ as *mut _);
   |                         ^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gem_object_init`
   |
   ::: rust/bindings/bindings_generated.rs:48047:5
   |
   48047 | /     pub fn drm_gem_object_init(
   48048 | |         dev: *mut drm_device,
   48049 | |         obj: *mut drm_gem_object,
   48050 | |         size: usize,
   48051 | |     ) -> core::ffi::c_int;
   | |__________________________- similarly named function `drm_gem_object_init` defined here
--
>> error: aborting due to 4 previous errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
