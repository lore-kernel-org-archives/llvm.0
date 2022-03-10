Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6418D
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 17:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A046C340E8;
	Thu, 10 Mar 2022 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646934408;
	bh=LxrudhChGHrWoF38IaSbjEege9yFf0TdQNlrpDPlnzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZU1GyeQmIgwUqzKzHhAwr1T6sq0dJwnbY19s6LOErPieKaKNFF11L0iHWK8+PkdYU
	 fMXVuhEXvBn3zXgiB36LwKWPKkq4c2zku6AjryeV7MTnKOLydfIelEOvuiQUftc/g6
	 qvzQtl22mf1EzX+X9lympGIAkx5AxzH75Hq8XNpMghfOF83NbQlOXDI3gV+ahpDtZv
	 lkGdlbo4fWs80sG1XUh5V1ksI8h6m39xciPf43IfXf3Dm1sfFtxMkusJS04T+dAr0a
	 x0xQ7rBIpSr9SfWEnrFIv+aGKu4V5jraBZCAyaPgLKArmeO3u224oyLLNXws45v30m
	 rwBMqnL/eMDFg==
Date: Thu, 10 Mar 2022 10:46:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [kvm:queue 210/210] arch/x86/kvm/cpuid.c:739:2: warning:
 unannotated fall-through between switch labels
Message-ID: <Yio5gfTHY5qvcEyU@dev-arch.thelio-3990X>
References: <202203101604.2rV6WBqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203101604.2rV6WBqW-lkp@intel.com>

Hi Paolo,

On Thu, Mar 10, 2022 at 05:05:41PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   ce41d078aaa9cf15cbbb4a42878cc6160d76525e
> commit: ce41d078aaa9cf15cbbb4a42878cc6160d76525e [210/210] KVM: x86: synthesize CPUID leaf 0x80000021h if useful
> config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220310/202203101604.2rV6WBqW-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=ce41d078aaa9cf15cbbb4a42878cc6160d76525e
>         git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>         git fetch --no-tags kvm queue
>         git checkout ce41d078aaa9cf15cbbb4a42878cc6160d76525e
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/kvm/cpuid.c:739:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>            default:
>            ^
>    arch/x86/kvm/cpuid.c:739:2: note: insert 'break;' to avoid fall-through
>            default:
>            ^
>            break; 
>    1 warning generated.
> 
> 
> vim +739 arch/x86/kvm/cpuid.c
> 
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  707  
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  708  static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
> aa10a7dc8858f6 Sean Christopherson 2020-03-02  709  					      u32 function, u32 index)
> 00b27a3efb1160 Avi Kivity          2011-11-23  710  {
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  711  	struct kvm_cpuid_entry2 *entry;
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  712  
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  713  	if (array->nent >= array->maxnent)
> aa10a7dc8858f6 Sean Christopherson 2020-03-02  714  		return NULL;
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  715  
> e53c95e8d41ef9 Sean Christopherson 2020-03-02  716  	entry = &array->entries[array->nent++];
> aa10a7dc8858f6 Sean Christopherson 2020-03-02  717  
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  718  	memset(entry, 0, sizeof(*entry));
> 00b27a3efb1160 Avi Kivity          2011-11-23  719  	entry->function = function;
> 00b27a3efb1160 Avi Kivity          2011-11-23  720  	entry->index = index;
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  721  	switch (function & 0xC0000000) {
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  722  	case 0x40000000:
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  723  		/* Hypervisor leaves are always synthesized by __do_cpuid_func.  */
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  724  		return entry;
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  725  
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  726  	case 0x80000000:
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  727  		/*
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  728  		 * 0x80000021 is sometimes synthesized by __do_cpuid_func, which
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  729  		 * would result in out-of-bounds calls to do_host_cpuid.
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  730  		 */
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  731  		{
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  732  			static int max_cpuid_80000000;
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  733  			if (!READ_ONCE(max_cpuid_80000000))
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  734  				WRITE_ONCE(max_cpuid_80000000, cpuid_eax(0x80000000));
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  735  			if (function > READ_ONCE(max_cpuid_80000000))
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  736  				return entry;
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  737  		}
> ce41d078aaa9cf Paolo Bonzini       2021-10-21  738  

Please add a "break;" here to fix this clang warning. GCC does not warn
when falling through to a case statement that just contains "break" or
"return" but clang's verion of the warning does, which matches the
kernel's guidance in Documentation/process/deprecated.rst for having all
case statements end in either "break", "continue", "fallthrough",
"goto", or "return".

> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28 @739  	default:
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  740  		break;
> 2746a6b72ab9a9 Paolo Bonzini       2021-10-28  741  	}
> ab8bcf64971180 Paolo Bonzini       2019-06-24  742  
> 00b27a3efb1160 Avi Kivity          2011-11-23  743  	cpuid_count(entry->function, entry->index,
> 00b27a3efb1160 Avi Kivity          2011-11-23  744  		    &entry->eax, &entry->ebx, &entry->ecx, &entry->edx);
> d9aadaf689928b Paolo Bonzini       2019-07-04  745  
> d9aadaf689928b Paolo Bonzini       2019-07-04  746  	switch (function) {
> d9aadaf689928b Paolo Bonzini       2019-07-04  747  	case 4:
> d9aadaf689928b Paolo Bonzini       2019-07-04  748  	case 7:
> d9aadaf689928b Paolo Bonzini       2019-07-04  749  	case 0xb:
> d9aadaf689928b Paolo Bonzini       2019-07-04  750  	case 0xd:
> a06dcd625d6181 Jim Mattson         2019-09-12  751  	case 0xf:
> a06dcd625d6181 Jim Mattson         2019-09-12  752  	case 0x10:
> a06dcd625d6181 Jim Mattson         2019-09-12  753  	case 0x12:
> d9aadaf689928b Paolo Bonzini       2019-07-04  754  	case 0x14:
> a06dcd625d6181 Jim Mattson         2019-09-12  755  	case 0x17:
> a06dcd625d6181 Jim Mattson         2019-09-12  756  	case 0x18:
> 690a757d610e50 Jing Liu            2022-01-05  757  	case 0x1d:
> 690a757d610e50 Jing Liu            2022-01-05  758  	case 0x1e:
> a06dcd625d6181 Jim Mattson         2019-09-12  759  	case 0x1f:
> d9aadaf689928b Paolo Bonzini       2019-07-04  760  	case 0x8000001d:
> d9aadaf689928b Paolo Bonzini       2019-07-04  761  		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> d9aadaf689928b Paolo Bonzini       2019-07-04  762  		break;
> d9aadaf689928b Paolo Bonzini       2019-07-04  763  	}
> aa10a7dc8858f6 Sean Christopherson 2020-03-02  764  
> aa10a7dc8858f6 Sean Christopherson 2020-03-02  765  	return entry;
> 00b27a3efb1160 Avi Kivity          2011-11-23  766  }
> 00b27a3efb1160 Avi Kivity          2011-11-23  767  
> 
> :::::: The code at line 739 was first introduced by commit
> :::::: 2746a6b72ab9a92bd188c4ac3e4122ee1c18f754 KVM: x86: skip host CPUID call for hypervisor leaves
> 
> :::::: TO: Paolo Bonzini <pbonzini@redhat.com>
> :::::: CC: Paolo Bonzini <pbonzini@redhat.com>
> 

Cheers,
Nathan
