Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378B111BF
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688994823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ImDQa0EWypkbyYilMZRBoCfhHc+qyTpXaLpUiDl7QI=;
	b=aRtuFyJt46Tf6z4QtwSX7OrVKeV1EtVCgo9rdyyhW/dn4VxJABzN3xohHpF5ZcXaH3FxIL
	7yaZ8cWbWeTKP94eyztjhavstACw3W9qo+McZvLZNLsrgSs++UhGtDL3I1HPwxkPRNYKrg
	abBGhpKUX9mjH5CoRNEXYM5GjJYtg7M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-fIzac7jKO9u0o52n685lhg-1; Mon, 10 Jul 2023 09:13:42 -0400
X-MC-Unique: fIzac7jKO9u0o52n685lhg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-763a397a3ceso572265985a.1
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 06:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994822; x=1691586822;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ImDQa0EWypkbyYilMZRBoCfhHc+qyTpXaLpUiDl7QI=;
        b=CvrYTxuO/Sa2fyVdmd08vzlOMpejGVwwW4+BFNC4n+k4WPu6zjHG6cU9Irv2qFirLN
         6U0LGzH9i8FJ8ApoMFb3LwA01s/3PbYrF4jlaJrzfB1XXUagmCmFQKxTtnZunHJV36no
         IuNE7PB3uQ0hhsgTdjvBMSzpzz7uyT9GZl9zwEL9xBAMXzYdpnF25aJM6yk1oEKlnFke
         Rt/DQu9Vp7x4sJ3NM2V5dk+4f5xtysAxw4KykSXx/185bUnLWfEuOHPCv1R9vaLHS/1B
         yjAz2YVeuGWJ2Ag36dKv8WQ8JSS+VuYUb9q/1goju0KqlXMAcPzahsbF/QMGP7uspvDP
         lMBA==
X-Gm-Message-State: ABy/qLbvOsrcyc0MbUhhVWm8msUbj6rHLMpDJrmDc8YaOJyhPDu3vRRB
	navy1wSYErShZWVlsDVy7ThQrIBfZuFQ1vqFiVmiTIAHOV7kDj+4D87sQZyP+n5txetJst74X5F
	0rTQgtGDS66rDZA==
X-Received: by 2002:a05:620a:17a9:b0:765:614a:aa0d with SMTP id ay41-20020a05620a17a900b00765614aaa0dmr13761723qkb.56.1688994822135;
        Mon, 10 Jul 2023 06:13:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHZhgqKIZKXgV1RDSk/xsuo9lvs/S+f7G6Iii+FqbXBn5CqQSyBZROmmfgH6B6PkVW/dHZULg==
X-Received: by 2002:a05:620a:17a9:b0:765:614a:aa0d with SMTP id ay41-20020a05620a17a900b00765614aaa0dmr13761705qkb.56.1688994821816;
        Mon, 10 Jul 2023 06:13:41 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a128800b0076639dfca86sm4898224qki.17.2023.07.10.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:13:41 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Subject: Re: [stable:linux-5.15.y 55/9999] arch/x86/kvm/hyperv.c:2185:5:
 error: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall'
In-Reply-To: <202307080326.zDp7E3o0-lkp@intel.com>
References: <202307080326.zDp7E3o0-lkp@intel.com>
Date: Mon, 10 Jul 2023 15:13:38 +0200
Message-ID: <87y1jn52pp.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> Hi Vitaly,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   d54cfc420586425d418a53871290cc4a59d33501
> commit: cb188e07105f2216f5efbefac95df4b6ce266906 [55/9999] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
> config: i386-buildonly-randconfig-r006-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080326.zDp7E3o0-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080326.zDp7E3o0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307080326.zDp7E3o0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> arch/x86/kvm/hyperv.c:2185:5: error: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Werror,-Wframe-larger-than]
>    int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>        ^
>    1 error generated.

(sorry for delayed reply)

This used to be a warning (without CONFIG_KVM_WERROR I guess?) :-) E.g.

https://lore.kernel.org/kvm/87zgg6sza8.fsf@redhat.com/#t

where Nathan explained LLVM's behavior:

https://lore.kernel.org/kvm/Yvp87jlVWg0e376v@dev-arch.thelio-3990X/

This was 'fixed' upstream with

commit 7d5e88d301f84a7b64602dbe3640f288223095ea
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Nov 1 15:53:56 2022 +0100

    KVM: x86: hyper-v: Use preallocated buffer in 'struct kvm_vcpu_hv' instead of on-stack 'sparse_banks'
  
and personally, I'm not against backporting it to 5.15.y but I seriously
doubt it is worth the hassle (i386 KVM + llvm + CONFIG_KVM_WERROR is
likely an impossible combo).

Also, there seems to be another build problem with CONFIG_KVM_WERROR I
met with clan-16 and the same config:

../arch/x86/kvm/x86.c:2315:19: error: unused function 'gtod_is_based_on_tsc' [-Werror,-Wunused-function]
static inline int gtod_is_based_on_tsc(int mode)

TL;DR: Let's ignore this for 5.15, not worth fixing IMO. Cc: kvm@ to
check if anyone thinks differently.

>
>
> vim +/kvm_hv_hypercall +2185 arch/x86/kvm/hyperv.c
>
> 4ad81a91119df7 Vitaly Kuznetsov         2021-05-21  2184  
> e83d58874ba1de Andrey Smetanin          2015-07-03 @2185  int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
> e83d58874ba1de Andrey Smetanin          2015-07-03  2186  {
> 4e62aa96d6e55c Vitaly Kuznetsov         2021-07-30  2187  	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
> bd38b32053eb1c Siddharth Chandrasekaran 2021-05-26  2188  	struct kvm_hv_hcall hc;
> bd38b32053eb1c Siddharth Chandrasekaran 2021-05-26  2189  	u64 ret = HV_STATUS_SUCCESS;
> e83d58874ba1de Andrey Smetanin          2015-07-03  2190  
> e83d58874ba1de Andrey Smetanin          2015-07-03  2191  	/*
> e83d58874ba1de Andrey Smetanin          2015-07-03  2192  	 * hypercall generates UD from non zero cpl and real mode
> e83d58874ba1de Andrey Smetanin          2015-07-03  2193  	 * per HYPER-V spec
> e83d58874ba1de Andrey Smetanin          2015-07-03  2194  	 */
> b3646477d458fb Jason Baron              2021-01-14  2195  	if (static_call(kvm_x86_get_cpl)(vcpu) != 0 || !is_protmode(vcpu)) {
> e83d58874ba1de Andrey Smetanin          2015-07-03  2196  		kvm_queue_exception(vcpu, UD_VECTOR);
> 0d9c055eaaf41b Andrey Smetanin          2016-02-11  2197  		return 1;
> e83d58874ba1de Andrey Smetanin          2015-07-03  2198  	}
> e83d58874ba1de Andrey Smetanin          2015-07-03  2199  
>
> :::::: The code at line 2185 was first introduced by commit
> :::::: e83d58874ba1de74c13d3c6b05f95a023c860d25 kvm/x86: move Hyper-V MSR's/hypercall code into hyperv.c file
>
> :::::: TO: Andrey Smetanin <asmetanin@virtuozzo.com>
> :::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
Vitaly

