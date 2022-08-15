Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B12D1102
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660551012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=27lKoSaVUdINu4HuH13l5vYL4jblUD5XULMIR7fcHFc=;
	b=EwOrUAnwpqbcJq3OEHm4gle65hUcdJQyfcPOi2ucTHCOjjiU0Yesqm9ASRnlyw/XX8gqNK
	IBZHW6t9l3lRkvbrvHSAB9fNnu00pbdELcdPP9ka4Nw/Rp1CRRprTDdTEE98d7Cug/XG3A
	YKrVd+R4R76+C0Uz+XGzIUGG7+jzBRI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-dFcrD8T7Mtex1bjLvxsr_A-1; Mon, 15 Aug 2022 04:10:10 -0400
X-MC-Unique: dFcrD8T7Mtex1bjLvxsr_A-1
Received: by mail-ej1-f69.google.com with SMTP id sc31-20020a1709078a1f00b0073096c2b4e1so954628ejc.22
        for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 01:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc;
        bh=27lKoSaVUdINu4HuH13l5vYL4jblUD5XULMIR7fcHFc=;
        b=ax4Iaf7TtnCeVpyW7iDxJsjHa4t8odAXuSDD2sUFgehZAmLoc3SWzvlSyejWipai98
         KPGL0CSvI1lTcI01x3/jDQDuUowY4YU48Bt/msTdAzDCSGvyM7iivM4eZt1OkkkYsYAO
         tafuEi59XUrVGLhefY9pPu0uzVL56F/ZIeA2K5+3zKSEV9twZ8XYZ1mPXIN1mqLa1pw0
         w86dquN2sLXybJzAWVcT7Q80HA4dl55ebWIV9q73LR5RvoU80z6abRURbqVJo+J5slN9
         s1IFqSvLOOmUDH1Ua3G0xBKxOYpHzhBt7xjMkf2kGld/efjV/1UmLTHBdpGPs0IF651e
         dL7w==
X-Gm-Message-State: ACgBeo1k2vsYi3ow2kpcONPt128Kb1LYg8BoCRQXvn1clONIZMixNkUP
	qj6TyCduHrTQ+bXLiMAl3nbl/9aOW4SQ1xT0yyLjJ3YJ6Ejkq2HrptZdzOkSV9JoRQMWprLjRff
	fgXAXqJYEsgWO6A==
X-Received: by 2002:a05:6402:b88:b0:442:5d35:2133 with SMTP id cf8-20020a0564020b8800b004425d352133mr13569772edb.53.1660551009660;
        Mon, 15 Aug 2022 01:10:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hclU/vcxB2BCRDttM2wYHPyAa40y3hKKPm2d8l2u3HXLlrSsnS9PHPPW6R6uAupXIcyydIw==
X-Received: by 2002:a05:6402:b88:b0:442:5d35:2133 with SMTP id cf8-20020a0564020b8800b004425d352133mr13569752edb.53.1660551009372;
        Mon, 15 Aug 2022 01:10:09 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id r21-20020aa7cb95000000b0043cfc872e7dsm6164849edt.10.2022.08.15.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 01:10:08 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [stable:linux-5.15.y 5373/9027] arch/x86/kvm/hyperv.c:2185:5:
 warning: stack frame size (1036) exceeds limit (1024) in
 'kvm_hv_hypercall'
In-Reply-To: <202208142025.NHKErAjq-lkp@intel.com>
References: <202208142025.NHKErAjq-lkp@intel.com>
Date: Mon, 15 Aug 2022 10:10:07 +0200
Message-ID: <87zgg6sza8.fsf@redhat.com>
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
> FYI, the error/warning still remains.
>

Yes, this is expected as the patch which is supposed to 'fix' this is
still pendind. The latest version is here:

https://lore.kernel.org/kvm/20220803134540.399220-1-vkuznets@redhat.com/

...

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   7217df81279835a7aee62a07aabb7b8fb8c766f2
> commit: cb188e07105f2216f5efbefac95df4b6ce266906 [5373/9027] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220814/202208142025.NHKErAjq-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=cb188e07105f2216f5efbefac95df4b6ce266906
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.15.y
>         git checkout cb188e07105f2216f5efbefac95df4b6ce266906
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Wframe-larger-than]
>    int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>        ^
>    1 warning generated.
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

... but let me repeat myself: (see my previous reply here:
https://lore.kernel.org/kvm/874jyw2v5n.fsf@redhat.com/)
The source of the problem seems to be that Clang probably inlines
kvm_hv_send_ipi() as on-stack variables in kvm_hv_hypercall() can not
exceed 1024 bytes limit (struct kvm_hv_hcall is 144 bytes, the rest is
negligible). The patch I mention above will likely fix the issue as it
significantly reduces on-stack allocations in kvm_hv_send_ipi() but in
this situation it shouldn't be inlined in the first place.

(I still hope that I'm wrong finger pointing at the compiler here and
someone smart will come to correct me :-)

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

