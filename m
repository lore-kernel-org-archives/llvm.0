Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9736C
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653285251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkpqFzwzZ6jw/CwHlwN0D0dex/uSfgt4kwv4WFuLSls=;
	b=YyopBodoGOmIsoMU2ydLITlXCetPIqx6AAob8qGWGfvkNuo4EAEkDPkqm+4ZmRaG42LnDt
	urgLc6Cu/+1Yyzdm81P7iBjo/DdGSaO7T44kal8lma5h/QcbhiFVM/tU+GhFt3IX017pZq
	VqlS3O6Y/ICdBufTaMrQiEEXNIpfNCU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-J_y6874sOjuTbP_9OzmsXg-1; Mon, 23 May 2022 01:54:10 -0400
X-MC-Unique: J_y6874sOjuTbP_9OzmsXg-1
Received: by mail-ed1-f70.google.com with SMTP id w14-20020a50fa8e000000b0042ab142d677so9956116edr.11
        for <llvm@lists.linux.dev>; Sun, 22 May 2022 22:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=SyQ0q/1cfv9Dr9N4yrSfFi2vvZn6zBLKl1GWo7CSuOw=;
        b=plkHvf5s/dZswbz+jvB9R24+MwEKxaAWe6XAYMzW2xSX7qiUVptFlJkPy+QHdRuvxL
         ksWiFU2WwD/BPcGI8SvORE2q4uT2Nn01KboFgcvurhxtY73QwjN4Ad59DGbX3tYHBJDr
         BGuwXaE261C0v1k2HI3bhKq3fKubUTGOPfqU0xA6X3W4/+ry6xyGxN+542Ofgarm13p0
         Xw1p8b48U0SHegROz+c5jXVWJHEHv0IxXDuITH/E4w4NwO5RP3/ztjA62N2Fv5dAGZfj
         zcNE/HOEhj8z4lma0d5Cj/ZAFxDLX9GuVRFFwWtbmtRxQgadCYq3mNOcF5mvOPjk5hjZ
         QvmQ==
X-Gm-Message-State: AOAM532MafpC6Zt8zLqp90WYBTukiAcGzQ56aBvfI1588SziCYclH5Vz
	o7YNiJhokYv9pFRmQfSUlbRwoq7G9BdJGLBsFUbSf4FEY7c7Xu259F+eFUkaE2ROl5ka3B9RqPC
	/IL+3h51RDv7qsw==
X-Received: by 2002:a05:6402:34c2:b0:42b:66d3:7b07 with SMTP id w2-20020a05640234c200b0042b66d37b07mr4193963edc.275.1653285248600;
        Sun, 22 May 2022 22:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1DWjG8FpraJzWe8ZWQtBDbo1n8T4WVu+1eU3YiF9hI1NP7Z7jCEltTqr7+vod4nIwDlJdzA==
X-Received: by 2002:a05:6402:34c2:b0:42b:66d3:7b07 with SMTP id w2-20020a05640234c200b0042b66d37b07mr4193941edc.275.1653285248330;
        Sun, 22 May 2022 22:54:08 -0700 (PDT)
Received: from [127.0.0.1] (93-55-6-57.ip261.fastwebnet.it. [93.55.6.57])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906100100b006f506ed0b42sm5650794ejm.48.2022.05.22.22.54.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 May 2022 22:54:07 -0700 (PDT)
Date: Mon, 23 May 2022 07:54:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Yury Norov <yury.norov@gmail.com>
CC: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wanpeng Li <wanpengli@tencent.com>,
 kvm list <kvm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 X86 ML <x86@kernel.org>, lkft-triage@lists.linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5Blinux-next=3Amaster_12308/12886=5D_arch/x86/kvm/hyp?= =?US-ASCII?Q?erv=2Ec=3A1983=3A22=3A_warning=3A_sh?= =?US-ASCII?Q?ift_count_=3E=3D_width_of_type?=
In-Reply-To: <CA+G9fYtaz2MO_-yxwtqQx+Gxm460mr2S++fFCYAqObacEL1X-Q@mail.gmail.com>
References: <202205201624.A4IhDdYX-lkp@intel.com> <Yoe4WQCV9903aQRP@dev-arch.thelio-3990X> <CA+G9fYtaz2MO_-yxwtqQx+Gxm460mr2S++fFCYAqObacEL1X-Q@mail.gmail.com>
Message-ID: <3A8C8235-7FC0-4FDF-921A-E53B57096256@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch is already merged in 5.18.

Paolo


Il 23 maggio 2022 07:49:42 CEST, Naresh Kamboju <naresh.kamboju@linaro.org>=
 ha scritto:
>On Fri, 20 May 2022 at 21:18, Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> Hi Yury,
>>
>> On Fri, May 20, 2022 at 04:24:32PM +0800, kernel test robot wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
>> > head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
>> > commit: 81db71a60292e9a40ae8f6ef137b17f2aaa15a52 [12308/12886] KVM: x8=
6: hyper-v: replace bitmap_weight() with hweight64()
>> > config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/=
20220520/202205201624.A4IhDdYX-lkp@intel.com/config)
>> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e=
00cbbec06c08dc616a0d52a20f678b8fbd4e304)
>> > reproduce (this is a W=3D1 build):
>> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>> >         chmod +x ~/bin/make.cross
>> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git/commit/?id=3D81db71a60292e9a40ae8f6ef137b17f2aaa15a52
>> >         git remote add linux-next https://git.kernel.org/pub/scm/linux=
/kernel/git/next/linux-next.git
>> >         git fetch --no-tags linux-next master
>> >         git checkout 81db71a60292e9a40ae8f6ef137b17f2aaa15a52
>> >         # save the config file
>> >         mkdir build_dir && cp config build_dir/.config
>> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>> >
>> > If you fix the issue, kindly add following tag as appropriate
>> > Reported-by: kernel test robot <lkp@intel.com>
>> >
>> > All warnings (new ones prefixed by >>):
>> >
>> > >> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >=3D width of t=
ype [-Wshift-count-overflow]
>> >                    if (hc->var_cnt !=3D hweight64(valid_bank_mask))
>> >                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> >    include/asm-generic/bitops/const_hweight.h:29:49: note: expanded fr=
om macro 'hweight64'
>> >    #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w=
) : __arch_hweight64(w))
>> >                                                    ^~~~~~~~~~~~~~~~~~~=
~
>> >    include/asm-generic/bitops/const_hweight.h:21:76: note: expanded fr=
om macro '__const_hweight64'
>> >    #define __const_hweight64(w) (__const_hweight32(w) + __const_hweigh=
t32((w) >> 32))
>> >                                                                       =
        ^  ~~
>> >    include/asm-generic/bitops/const_hweight.h:20:49: note: expanded fr=
om macro '__const_hweight32'
>> >    #define __const_hweight32(w) (__const_hweight16(w) + __const_hweigh=
t16((w) >> 16))
>> >                                                    ^
>> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-li=
mit=3D0 to see all)
>> >    include/asm-generic/bitops/const_hweight.h:10:9: note: expanded fro=
m macro '__const_hweight8'
>> >             ((!!((w) & (1ULL << 0))) +     \
>> >                   ^
>> >    include/linux/compiler.h:56:47: note: expanded from macro 'if'
>> >    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__=
) ) )
>> >                                                  ^~~~
>> >    include/linux/compiler.h:58:52: note: expanded from macro '__trace_=
if_var'
>> >    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) :=
 __trace_if_value(cond))
>> >                                                       ^~~~
>
>LKFT build system found these build warnings / errors on Linux next-202205=
20.
>
>> I think this is the proper fix, as valid_bank_mask is only assigned u64
>> values. Could you fold it into that patch to clear this warning up?
>
>The proposed patch below was tested and it fixed the reported problem on 3=
2-bit
>
>> Cheers,
>> Nathan
>>
>> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
>> index b652b856df2b..e2e95a6fccfd 100644
>> --- a/arch/x86/kvm/hyperv.c
>> +++ b/arch/x86/kvm/hyperv.c
>> @@ -1914,7 +1914,7 @@ static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, =
struct kvm_hv_hcall *hc)
>>         struct hv_send_ipi_ex send_ipi_ex;
>>         struct hv_send_ipi send_ipi;
>>         DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
>> -       unsigned long valid_bank_mask;
>> +       u64 valid_bank_mask;
>>         u64 sparse_banks[KVM_HV_MAX_SPARSE_VCPU_SET_BITS];
>>         u32 vector;
>>         bool all_cpus;
>
>Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
>--
>Linaro LKFT
>https://lkft.linaro.org
>

