Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA511876
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650538558; x=1682074558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wr+ns2r8MnYhCX6XUEId0C5EgA1GXVs3nv4Jpca9cjo=;
  b=cc71c+QbrRZGUJr2ZwiAwN9fNp4oGdwjm4F2NciMFhLrdjQxxvgmMD/F
   q1Pr1TG5ensMAMfoYgCOoERyFxKPSfXgBJZgzx0E4eoWpjOrwFJuEmVyS
   akJgLnLx5LlIcJunOIKppakl4lisNUQ5LM0xAMRRbnya1rRRPM4ACxSJ4
   F3t+F2sWhzImVR213aJnF3rWJ1yXDKSRna8TtQUwp4mF8F+f8BWthErNs
   zHdys6rhYlg2/4mLxjfMoDDjn1JVjqN5RJnXSlK8CvCvFzVOqyNpBhhHB
   uEjA0iAVauzDXr2i7vYbHC+R+f7lEwR6L6rFvoAH8jIrNa1EhLR1Abnu2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264079632"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="264079632"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 03:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="533060783"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2022 03:55:55 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhUTa-0008FN-Ca;
	Thu, 21 Apr 2022 10:55:54 +0000
Date: Thu, 21 Apr 2022 18:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Romanov <romanton@google.com>, kvm@vger.kernel.org,
	pbonzini@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, seanjc@google.com,
	vkuznets@redhat.com, Anton Romanov <romanton@google.com>
Subject: Re: [PATCH v2] KVM: x86: Use current rather than snapshotted TSC
 frequency if it is constant
Message-ID: <202204211846.Gtei0xp5-lkp@intel.com>
References: <20220421005645.56801-1-romanton@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421005645.56801-1-romanton@google.com>

Hi Anton,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/master]
[also build test WARNING on mst-vhost/linux-next v5.18-rc3 next-20220421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Romanov/KVM-x86-Use-current-rather-than-snapshotted-TSC-frequency-if-it-is-constant/20220421-090221
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220421/202204211846.Gtei0xp5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c60b3070bd6e7e804de118dac10002e4f5f714a6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anton-Romanov/KVM-x86-Use-current-rather-than-snapshotted-TSC-frequency-if-it-is-constant/20220421-090221
        git checkout c60b3070bd6e7e804de118dac10002e4f5f714a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:2936:3: error: expected expression
                   struct timespec64 ts;
                   ^
>> arch/x86/kvm/x86.c:2938:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                   if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
                   ^
   arch/x86/kvm/x86.c:2933:2: note: previous statement is here
           if (ka->use_master_clock &&
           ^
   arch/x86/kvm/x86.c:2938:39: error: use of undeclared identifier 'ts'
                   if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
                                                       ^
   arch/x86/kvm/x86.c:2939:21: error: use of undeclared identifier 'ts'
                           data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
                                            ^
   arch/x86/kvm/x86.c:2939:49: error: use of undeclared identifier 'ts'
                           data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
                                                                        ^
   arch/x86/kvm/x86.c:2952:4: error: expected identifier or '('
           } else {
             ^
   arch/x86/kvm/x86.c:2956:2: error: expected identifier or '('
           put_cpu();
           ^
   include/linux/smp.h:268:20: note: expanded from macro 'put_cpu'
   #define put_cpu()               preempt_enable()
                                   ^
   include/linux/preempt.h:239:26: note: expanded from macro 'preempt_enable'
   #define preempt_enable() \
                            ^
   arch/x86/kvm/x86.c:2956:2: error: expected identifier or '('
   include/linux/smp.h:268:20: note: expanded from macro 'put_cpu'
   #define put_cpu()               preempt_enable()
                                   ^
   include/linux/preempt.h:243:3: note: expanded from macro 'preempt_enable'
   } while (0)
     ^
   arch/x86/kvm/x86.c:2957:1: error: extraneous closing brace ('}')
   }
   ^
   1 warning and 8 errors generated.


vim +/if +2938 arch/x86/kvm/x86.c

c60b3070bd6e7e Anton Romanov 2022-04-21  2922  
869b44211adc87 Paolo Bonzini 2021-09-16  2923  /* Called within read_seqcount_begin/retry for kvm->pvclock_sc.  */
869b44211adc87 Paolo Bonzini 2021-09-16  2924  static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
108b249c453dd7 Paolo Bonzini 2016-09-01  2925  {
108b249c453dd7 Paolo Bonzini 2016-09-01  2926  	struct kvm_arch *ka = &kvm->arch;
8b953440645631 Paolo Bonzini 2016-11-16  2927  	struct pvclock_vcpu_time_info hv_clock;
8b953440645631 Paolo Bonzini 2016-11-16  2928  
e2c2206a18993b Wanpeng Li    2017-05-11  2929  	/* both __this_cpu_read() and rdtsc() should be on the same cpu */
e2c2206a18993b Wanpeng Li    2017-05-11  2930  	get_cpu();
e2c2206a18993b Wanpeng Li    2017-05-11  2931  
869b44211adc87 Paolo Bonzini 2021-09-16  2932  	data->flags = 0;
c60b3070bd6e7e Anton Romanov 2022-04-21  2933  	if (ka->use_master_clock &&
c60b3070bd6e7e Anton Romanov 2022-04-21  2934  		(static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz)))
c68dc1b577eabd Oliver Upton  2021-09-16  2935  #ifdef CONFIG_X86_64
c68dc1b577eabd Oliver Upton  2021-09-16  2936  		struct timespec64 ts;
c68dc1b577eabd Oliver Upton  2021-09-16  2937  
c68dc1b577eabd Oliver Upton  2021-09-16 @2938  		if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
c68dc1b577eabd Oliver Upton  2021-09-16  2939  			data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
c68dc1b577eabd Oliver Upton  2021-09-16  2940  			data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
c68dc1b577eabd Oliver Upton  2021-09-16  2941  		} else
c68dc1b577eabd Oliver Upton  2021-09-16  2942  #endif
c68dc1b577eabd Oliver Upton  2021-09-16  2943  		data->host_tsc = rdtsc();
c68dc1b577eabd Oliver Upton  2021-09-16  2944  
869b44211adc87 Paolo Bonzini 2021-09-16  2945  		data->flags |= KVM_CLOCK_TSC_STABLE;
869b44211adc87 Paolo Bonzini 2021-09-16  2946  		hv_clock.tsc_timestamp = ka->master_cycle_now;
869b44211adc87 Paolo Bonzini 2021-09-16  2947  		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
c60b3070bd6e7e Anton Romanov 2022-04-21  2948  		kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
8b953440645631 Paolo Bonzini 2016-11-16  2949  				   &hv_clock.tsc_shift,
8b953440645631 Paolo Bonzini 2016-11-16  2950  				   &hv_clock.tsc_to_system_mul);
c68dc1b577eabd Oliver Upton  2021-09-16  2951  		data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
55c0cefbdbdaca Oliver Upton  2021-09-16  2952  	} else {
55c0cefbdbdaca Oliver Upton  2021-09-16  2953  		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
55c0cefbdbdaca Oliver Upton  2021-09-16  2954  	}
e2c2206a18993b Wanpeng Li    2017-05-11  2955  
e2c2206a18993b Wanpeng Li    2017-05-11  2956  	put_cpu();
55c0cefbdbdaca Oliver Upton  2021-09-16  2957  }
e2c2206a18993b Wanpeng Li    2017-05-11  2958  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
