Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F176E38F8
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 16:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647449736; x=1678985736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAXPQMH0OY5gQFxdbuFzRP3CS/7T1P1R/kYOcxXDcJg=;
  b=AUzjbvsjS3uPv+GobSnfZ8wrK/BzXhDfC8DagQv08z4exhCXU2tWQJ+U
   MSJa6WXxgMZMd50VFCU6HmOF34c3dLu8lv/wp3gnqWjv7JrBB9utCdrfl
   VgKC7Llxc1Pm7hiW830fO4Qydy32Q7nvSCKc82LnNt7RyouXZXveZ3eX0
   kKlzlUPsGciKFWfrnrAEDhnw2453haTgnVqMiY8XoC2WwSNiKINujIuS/
   zuGsnalqi5yNy2xtcoS0SfITXy/6Y7VQnZOguwlKlpGUFw4zvJKwugULV
   Uk5jKoDpxmBOAeGnUWRe6m9nFWJQmTj9uYYVfNoiEbMdu4+4p+HHfr7YS
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256851124"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="256851124"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 09:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="516421840"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2022 09:55:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUWve-000CeL-FF; Wed, 16 Mar 2022 16:55:18 +0000
Date: Thu, 17 Mar 2022 00:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>
Subject: [kvm:queue 211/233] arch/x86/kvm/cpuid.c:739:2: error: unannotated
 fall-through between switch labels
Message-ID: <202203170046.ZHNPrXH7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   2ca1ba339ed8e476b007b6ebf130125e4bbea01a
commit: 413f986a59872bd62f9e60017f5638dbee0df3e1 [211/233] KVM: x86: synthesize CPUID leaf 0x80000021h if useful
config: i386-randconfig-r012-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170046.ZHNPrXH7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=413f986a59872bd62f9e60017f5638dbee0df3e1
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout 413f986a59872bd62f9e60017f5638dbee0df3e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/cpuid.c:739:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
           default:
           ^
   arch/x86/kvm/cpuid.c:739:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 error generated.


vim +739 arch/x86/kvm/cpuid.c

e53c95e8d41ef99 Sean Christopherson 2020-03-02  707  
e53c95e8d41ef99 Sean Christopherson 2020-03-02  708  static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
aa10a7dc8858f6c Sean Christopherson 2020-03-02  709  					      u32 function, u32 index)
00b27a3efb11606 Avi Kivity          2011-11-23  710  {
e53c95e8d41ef99 Sean Christopherson 2020-03-02  711  	struct kvm_cpuid_entry2 *entry;
e53c95e8d41ef99 Sean Christopherson 2020-03-02  712  
e53c95e8d41ef99 Sean Christopherson 2020-03-02  713  	if (array->nent >= array->maxnent)
aa10a7dc8858f6c Sean Christopherson 2020-03-02  714  		return NULL;
e53c95e8d41ef99 Sean Christopherson 2020-03-02  715  
e53c95e8d41ef99 Sean Christopherson 2020-03-02  716  	entry = &array->entries[array->nent++];
aa10a7dc8858f6c Sean Christopherson 2020-03-02  717  
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  718  	memset(entry, 0, sizeof(*entry));
00b27a3efb11606 Avi Kivity          2011-11-23  719  	entry->function = function;
00b27a3efb11606 Avi Kivity          2011-11-23  720  	entry->index = index;
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  721  	switch (function & 0xC0000000) {
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  722  	case 0x40000000:
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  723  		/* Hypervisor leaves are always synthesized by __do_cpuid_func.  */
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  724  		return entry;
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  725  
413f986a59872bd Paolo Bonzini       2021-10-21  726  	case 0x80000000:
413f986a59872bd Paolo Bonzini       2021-10-21  727  		/*
413f986a59872bd Paolo Bonzini       2021-10-21  728  		 * 0x80000021 is sometimes synthesized by __do_cpuid_func, which
413f986a59872bd Paolo Bonzini       2021-10-21  729  		 * would result in out-of-bounds calls to do_host_cpuid.
413f986a59872bd Paolo Bonzini       2021-10-21  730  		 */
413f986a59872bd Paolo Bonzini       2021-10-21  731  		{
413f986a59872bd Paolo Bonzini       2021-10-21  732  			static int max_cpuid_80000000;
413f986a59872bd Paolo Bonzini       2021-10-21  733  			if (!READ_ONCE(max_cpuid_80000000))
413f986a59872bd Paolo Bonzini       2021-10-21  734  				WRITE_ONCE(max_cpuid_80000000, cpuid_eax(0x80000000));
413f986a59872bd Paolo Bonzini       2021-10-21  735  			if (function > READ_ONCE(max_cpuid_80000000))
413f986a59872bd Paolo Bonzini       2021-10-21  736  				return entry;
413f986a59872bd Paolo Bonzini       2021-10-21  737  		}
413f986a59872bd Paolo Bonzini       2021-10-21  738  
2746a6b72ab9a92 Paolo Bonzini       2021-10-28 @739  	default:
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  740  		break;
2746a6b72ab9a92 Paolo Bonzini       2021-10-28  741  	}
ab8bcf64971180e Paolo Bonzini       2019-06-24  742  
00b27a3efb11606 Avi Kivity          2011-11-23  743  	cpuid_count(entry->function, entry->index,
00b27a3efb11606 Avi Kivity          2011-11-23  744  		    &entry->eax, &entry->ebx, &entry->ecx, &entry->edx);
d9aadaf689928ba Paolo Bonzini       2019-07-04  745  
d9aadaf689928ba Paolo Bonzini       2019-07-04  746  	switch (function) {
d9aadaf689928ba Paolo Bonzini       2019-07-04  747  	case 4:
d9aadaf689928ba Paolo Bonzini       2019-07-04  748  	case 7:
d9aadaf689928ba Paolo Bonzini       2019-07-04  749  	case 0xb:
d9aadaf689928ba Paolo Bonzini       2019-07-04  750  	case 0xd:
a06dcd625d61817 Jim Mattson         2019-09-12  751  	case 0xf:
a06dcd625d61817 Jim Mattson         2019-09-12  752  	case 0x10:
a06dcd625d61817 Jim Mattson         2019-09-12  753  	case 0x12:
d9aadaf689928ba Paolo Bonzini       2019-07-04  754  	case 0x14:
a06dcd625d61817 Jim Mattson         2019-09-12  755  	case 0x17:
a06dcd625d61817 Jim Mattson         2019-09-12  756  	case 0x18:
690a757d610e50c Jing Liu            2022-01-05  757  	case 0x1d:
690a757d610e50c Jing Liu            2022-01-05  758  	case 0x1e:
a06dcd625d61817 Jim Mattson         2019-09-12  759  	case 0x1f:
d9aadaf689928ba Paolo Bonzini       2019-07-04  760  	case 0x8000001d:
d9aadaf689928ba Paolo Bonzini       2019-07-04  761  		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
d9aadaf689928ba Paolo Bonzini       2019-07-04  762  		break;
d9aadaf689928ba Paolo Bonzini       2019-07-04  763  	}
aa10a7dc8858f6c Sean Christopherson 2020-03-02  764  
aa10a7dc8858f6c Sean Christopherson 2020-03-02  765  	return entry;
00b27a3efb11606 Avi Kivity          2011-11-23  766  }
00b27a3efb11606 Avi Kivity          2011-11-23  767  

:::::: The code at line 739 was first introduced by commit
:::::: 2746a6b72ab9a92bd188c4ac3e4122ee1c18f754 KVM: x86: skip host CPUID call for hypervisor leaves

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
