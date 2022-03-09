Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F215BD
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 06:38:15 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 27so1152149pgk.10
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 22:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=MmiBDVAJSrHHv3LcXgWshcIszGP5uTeYdY6vxf2gk7I=;
        b=nDkQhDU8Z0HObY/Uj29ENKhM2zXNGfqxdQiLtN3+EHHVwMK1XtIZyXDlaoEVDAUsUL
         5rTzTv9CTTzleQ1+sxiiH9V9kNAA83iN2AkQfniivDge5yjB5X6b/LfQer4NKgu5WN2r
         TQq3/Bk6gKgUfPyMtZ30LykXZfsSvsbyHvziSy7zbQarMFyhGeNJfHkGqSrm6E13pJzf
         HH8ArMf7H/fzTRj/2k0l7sIkZWcyiW0jDRPdyWXicqukaumpugq/KVh8dS0EXz4B66is
         5YQQOiH0s7kM9/lgsRkYP/5czPHEO+cLjB5StXaPAAgMaSOImMUVecNyfV7XpRIJLbme
         Di3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=MmiBDVAJSrHHv3LcXgWshcIszGP5uTeYdY6vxf2gk7I=;
        b=gH/pMHDcrZlvsar1+XBADzlSSZHahEgYae7mkYXJL7wvoQOpJoGrTvR7QNRVkyy7+f
         26gnjfR5JrDOzSA3PNF0/Aj4Klyx090P+dTG4YEsi5tBfGVHCPQPiRFhSvZ8pl0x2ufc
         v7HXEsW2HY0CaChzKERHr4l2m52+Y+h8G8+dV8e1hoOYZgGPDuhcc9aU/pwiOoKL5qOq
         2gfR1an2gY2Mrc6aZGzW1blFkRzUxdlcPGeiQaEYiZH+7BVHLiXulKWihev+im/GJhZ7
         Ae8RQwzGX8IuqTqyWTYTOxFVi7+GR4B64pdntz+cPz9gjakhZCZAx+beevzgQ4bHefF4
         uGNw==
X-Gm-Message-State: AOAM533szKxKeKSNYKrptqKJ3nLNwdlGx1050XCsiMtY+t2xF2n7nSSA
	+6ECjsPg0Gt6AyQmFr9crmI=
X-Google-Smtp-Source: ABdhPJwRtcAVbjsjwMbjVibjEbsPb6yrRJV8ql3AWBjQFqzypdB3WLXg+8Hya0XSx3RhbEHWnwfbOA==
X-Received: by 2002:a05:6a00:1705:b0:4f6:e1e4:447e with SMTP id h5-20020a056a00170500b004f6e1e4447emr19460852pfc.16.1646807894834;
        Tue, 08 Mar 2022 22:38:14 -0800 (PST)
Received: from [192.168.255.10] ([103.7.29.32])
        by smtp.gmail.com with ESMTPSA id h2-20020a056a00218200b004f66d50f054sm1357282pfi.158.2022.03.08.22.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 22:38:14 -0800 (PST)
Message-ID: <c6455ba9-8c34-7f10-ca5a-60f2f01cc9ce@gmail.com>
Date: Wed, 9 Mar 2022 14:38:05 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [kvm:queue 182/203] arch/x86/kernel/kvm.c:769:4: error: use of
 undeclared identifier '__raw_callee_save___kvm_vcpu_is_preempted'
Content-Language: en-US
To: Li RongQing <lirongqing@baidu.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
 Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>,
 Danmei Wei <danmei.wei@intel.com>, Wang GuangJu <wangguangju@baidu.com>,
 kernel test robot <lkp@intel.com>
References: <202203090613.qYNxBFkZ-lkp@intel.com>
From: Like Xu <like.xu.linux@gmail.com>
Organization: Tencent
In-Reply-To: <202203090613.qYNxBFkZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2022 6:18 am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   00a2bd3464280ca1f08e2cbfab22b884ffb731d8
> commit: dc889a8974087aba3eb1cc6db2066fbbdb58922a [182/203] KVM: x86: Support the vCPU preemption check with nopvspin and realtime hint
> config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220309/202203090613.qYNxBFkZ-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0dc66b76fe4c33843755ade391b85ffda0742aeb)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=dc889a8974087aba3eb1cc6db2066fbbdb58922a
>          git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>          git fetch --no-tags kvm queue
>          git checkout dc889a8974087aba3eb1cc6db2066fbbdb58922a
>          # save the config file to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/x86/kernel/kvm.c:769:4: error: use of undeclared identifier '__raw_callee_save___kvm_vcpu_is_preempted'
>                             PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
>                             ^
>     arch/x86/include/asm/paravirt.h:683:35: note: expanded from macro 'PV_CALLEE_SAVE'
>             ((struct paravirt_callee_save) { __raw_callee_save_##func })
>                                              ^
>     <scratch space>:52:1: note: expanded from here
>     __raw_callee_save___kvm_vcpu_is_preempted
>     ^
>     1 error generated.

How about this fix:

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 0d76502cc6f5..d656e4117e01 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -617,6 +617,7 @@ static __always_inline bool pv_vcpu_is_preempted(long cpu)

  void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
  bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
+bool __raw_callee_save___kvm_vcpu_is_preempted(long cpu);

  #endif /* SMP && PARAVIRT_SPINLOCKS */

> 
> 
> vim +/__raw_callee_save___kvm_vcpu_is_preempted +769 arch/x86/kernel/kvm.c
> 
>     754	
>     755	static void __init kvm_guest_init(void)
>     756	{
>     757		int i;
>     758	
>     759		paravirt_ops_setup();
>     760		register_reboot_notifier(&kvm_pv_reboot_nb);
>     761		for (i = 0; i < KVM_TASK_SLEEP_HASHSIZE; i++)
>     762			raw_spin_lock_init(&async_pf_sleepers[i].lock);
>     763	
>     764		if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
>     765			has_steal_clock = 1;
>     766			static_call_update(pv_steal_clock, kvm_steal_clock);
>     767	
>     768			pv_ops.lock.vcpu_is_preempted =
>   > 769				PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
>     770		}
>     771	
>     772		if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
>     773			apic_set_eoi_write(kvm_guest_apic_eoi_write);
>     774	
>     775		if (kvm_para_has_feature(KVM_FEATURE_ASYNC_PF_INT) && kvmapf) {
>     776			static_branch_enable(&kvm_async_pf_enabled);
>     777			alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_kvm_asyncpf_interrupt);
>     778		}
>     779	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
