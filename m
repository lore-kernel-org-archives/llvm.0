Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE072
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 14:32:31 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id b1so5889980pfm.6
        for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LBHbfGOx6452n/4vMedr7l9TFvpAcwzjwR2fBU0Ds1Q=;
        b=cdO2eWrPzdc1VeMmRqyp9nSih9DttbBHiFxE9UsL79prlg/O0eK8UU2cKjIc2OsHip
         YZJN/WFvqzJgF04ox/wbjlb6+m6JZmGHac8m+SAgyTnfxm/VA+hivYijgQPGp/VE/a0g
         uJAwjHLh4LaG9bWWzQidh6lEiPRKFTXZCyaL4Pw/hU59584hsWrwkHR2WcHdA0ra+IME
         bs+eRN5p95mS4oKDB8QZvGCSrXDKi9eGhwuo1HOFV3tUBD6N17o+SSd1dM7SsZFykq96
         enYw9H2ML0XtSihmA4c6CE7WISfxXCw9vQ+25iEFE9VtIYjqY21SoBm6ryzcKXmx3o3y
         AsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LBHbfGOx6452n/4vMedr7l9TFvpAcwzjwR2fBU0Ds1Q=;
        b=IJJCZbSgaWdaFAAC9zAv9Svf/2b6q2ioWEJx19nVtxBQ4hlM+UO1dl+BB4CBzX4mUG
         PTfM/jj63DcQhe8AoIrDzgS0dynf36JtXgWGzcUfzgbqB6vVVFwSwp29q5mnX26V+oao
         WTriruiSaGLbgiSM9AZKT/cCXLv7Nugj6zYeydCOBXSt87AWzK0/u3p3/r/bk+Ud2yg2
         zLhKDiDJtePNycfj6s1QWygYp1/ACYP/4/GpNVMlrosU0NGt7PU+Y4ecZEuNkJ3hcnww
         iYHLPcbXPsF40a+cLIOhEtDUNH9+7DF3kuMxKs77qVVFi3MBW5WggoZuocBJL6nWixAs
         kDdA==
X-Gm-Message-State: AOAM531+E12cMlTxMExvazk7H6vNTPwvmRAMtdsmNUN8quH92990P203
	e29/XhIe92YPg5IY09sz64u9mQ==
X-Google-Smtp-Source: ABdhPJw2RQRMriorJ/v2MtRZDVgHUpRCix4lst52zmjGO2JYh8dpKLkpYdTzdEVr2FNlBhz7L8Otow==
X-Received: by 2002:a05:6a00:2da:b0:47c:6256:b057 with SMTP id b26-20020a056a0002da00b0047c6256b057mr11201206pft.22.1635517950692;
        Fri, 29 Oct 2021 07:32:30 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id g25sm7037460pfh.216.2021.10.29.07.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 07:32:29 -0700 (PDT)
Date: Fri, 29 Oct 2021 14:32:26 +0000
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ajay Garg <ajaygargnsit@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] KVM: x86: Shove vp_bitmap handling down into
 sparse_set_to_vcpu_mask()
Message-ID: <YXwF+jSnDq9ONTQJ@google.com>
References: <20211028213408.2883933-1-seanjc@google.com>
 <87pmrokn16.fsf@vitty.brq.redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmrokn16.fsf@vitty.brq.redhat.com>

On Fri, Oct 29, 2021, Vitaly Kuznetsov wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >  There's a smoke test for this in selftests, but it's not really all that
> >  interesting.  It took me over an hour and a half just to get a Linux guest
> >  to hit the relevant flows.  Most of that was due to QEMU 5.1 bugs (doesn't
> >  advertise HYPERCALL MSR by default)
> 
> This should be fixed already, right?

Yeah, it's fixed in more recent versions.  That added to the confusion; the local
copy of QEMU source I was reading didn't match the binary I was using.  Doh.

> > diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> > index 4f15c0165c05..80018cfab5c7 100644
> > --- a/arch/x86/kvm/hyperv.c
> > +++ b/arch/x86/kvm/hyperv.c
> > @@ -1710,31 +1710,36 @@ int kvm_hv_get_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata, bool host)
> >  		return kvm_hv_get_msr(vcpu, msr, pdata, host);
> >  }
> >  
> > -static __always_inline unsigned long *sparse_set_to_vcpu_mask(
> > -	struct kvm *kvm, u64 *sparse_banks, u64 valid_bank_mask,
> > -	u64 *vp_bitmap, unsigned long *vcpu_bitmap)
> > +static void sparse_set_to_vcpu_mask(struct kvm *kvm, u64 *sparse_banks,
> > +				    u64 valid_bank_mask, unsigned long *vcpu_mask)
> >  {
> >  	struct kvm_hv *hv = to_kvm_hv(kvm);
> > +	bool has_mismatch = atomic_read(&hv->num_mismatched_vp_indexes);
> > +	u64 vp_bitmap[KVM_HV_MAX_SPARSE_VCPU_SET_BITS];
> >  	struct kvm_vcpu *vcpu;
> >  	int i, bank, sbank = 0;
> > +	u64 *bitmap;
> >  
> > -	memset(vp_bitmap, 0,
> > -	       KVM_HV_MAX_SPARSE_VCPU_SET_BITS * sizeof(*vp_bitmap));
> > +	BUILD_BUG_ON(sizeof(vp_bitmap) >
> > +		     sizeof(*vcpu_mask) * BITS_TO_LONGS(KVM_MAX_VCPUS));
> > +
> > +	/* If vp_index == vcpu_idx for all vCPUs, fill vcpu_mask directly. */
> > +	if (likely(!has_mismatch))
> > +		bitmap = (u64 *)vcpu_mask;
> > +
> > +	memset(bitmap, 0, sizeof(vp_bitmap));
> 
> ... but in the unlikely case has_mismatch == true 'bitmap' is still
> uninitialized here, right? How doesn't it crash?

I'm sure it does crash.  I'll hack the guest to actually test this.  More below.
 
> >  	for_each_set_bit(bank, (unsigned long *)&valid_bank_mask,
> >  			 KVM_HV_MAX_SPARSE_VCPU_SET_BITS)
> > -		vp_bitmap[bank] = sparse_banks[sbank++];
> > +		bitmap[bank] = sparse_banks[sbank++];
> >  
> > -	if (likely(!atomic_read(&hv->num_mismatched_vp_indexes))) {
> > -		/* for all vcpus vp_index == vcpu_idx */
> > -		return (unsigned long *)vp_bitmap;
> > -	}
> > +	if (likely(!has_mismatch))
> > +		return;
> >  
> > -	bitmap_zero(vcpu_bitmap, KVM_MAX_VCPUS);
> > +	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		if (test_bit(kvm_hv_get_vpindex(vcpu), (unsigned long *)vp_bitmap))
> 
> 'vp_bitmap' also doesn't seem to be assigned to anything, I'm really
> confused :-(
>
> Didn't you accidentally mix up 'vp_bitmap' and 'bitmap'?

No, bitmap was supposed to be initialized as:

	if (likely(!has_mismatch))
		bitmap = (u64 *)vcpu_mask;
	else
		bitmap = vp_bitmap;

The idea being that the !mismatch case sets vcpu_mask directly, and the mismatch
case sets vp_bitmap and then uses that to fill vcpu_mask.
