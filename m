Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117F2C87
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 19:42:23 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t7so10800858pgl.9
        for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lK1voEAYQM1Zw18e5E1VVoH3wBqqtv/okEv7iiFVh70=;
        b=GaF7547hqixI5UkbbfFOY7HdihpFrDQNoseyonrv1aBGlub3UrkKpkyROHB0fjjFtC
         AqTJtRcepoRxh+duQknvJiM9otwlZMA9YfoBJQsevcn/JtCoxAnLN0MK/Vi/G5KvFVMP
         SgR2fpvRw1qKNLxOlSKohK6UplG5zpgvpjzf03wlnHhQflZqSkMjhSkHJ8AMR0gGYpKN
         153DTVeJcvnRAfBYA7J9okg/fe8v/rVHsVjFCrkq9bHM0f4aBngNs4f2DfbpMAxQs2W8
         Z+L0tVi2/aIRG1g7/LBwUccgWnSEoWknlQOOGEYUP/yNo6M/es9LZsqO86AT4q05X0TF
         1RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lK1voEAYQM1Zw18e5E1VVoH3wBqqtv/okEv7iiFVh70=;
        b=p00GZBA7vAP9XeFgiybwN0BnjRYSpkIY89/lvA8Scgvqvb8yKw2xrKBoc6L8WtHvem
         xmmktBfn3G/sSPUe+BRM9jNK3pBRRizJcYXy1CZEux31Ldvk9Gq77g2tDdBmodyyiNtQ
         m8ZauRa+nyIjoHYN0Z5dbS6toNRE+UGbM4NWjSAFy6PDgtlZNFk4nXPy851nwBFWCWx+
         7XeUAIYMUHuBdHotQ0jVyWnXxtrgCpPnHgKrGQCV1jImpYu/iU0dWK1jttYs/a2/UeVY
         q7tbZ6K3tSgX/uOc//jG5PDBBp9V9YDFKOLRz8+jilJOdOg/bbMYxGoSVHaTFrLN6/e6
         4zEw==
X-Gm-Message-State: AOAM531TUxqqDXpzKXfM0JkyVEp7aXEByR80TMW/BQ7ngDRZN8JNu370
	ivX0tZ0UrRHClDs1ByzYvWr/ew==
X-Google-Smtp-Source: ABdhPJwK4k7Rz5/QJaWcnrGW0kx9mF1xEg5+NlPhkY5Mk4ZNEzcn/PNdEHi442Efhty6I/tib/scAg==
X-Received: by 2002:a05:6a00:998:b0:47b:e61e:c0f4 with SMTP id u24-20020a056a00099800b0047be61ec0f4mr12967519pfg.31.1635536543015;
        Fri, 29 Oct 2021 12:42:23 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id ne7sm2324275pjb.36.2021.10.29.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 12:42:22 -0700 (PDT)
Date: Fri, 29 Oct 2021 19:42:18 +0000
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
Message-ID: <YXxOmoAPDtwblW51@google.com>
References: <20211028213408.2883933-1-seanjc@google.com>
 <87pmrokn16.fsf@vitty.brq.redhat.com>
 <YXwF+jSnDq9ONTQJ@google.com>
 <YXxGO5/xO8KWfnKj@google.com>
 <YXxK8CcIk2MiVw2p@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXxK8CcIk2MiVw2p@google.com>

On Fri, Oct 29, 2021, Sean Christopherson wrote:
> On Fri, Oct 29, 2021, Sean Christopherson wrote:
> > On Fri, Oct 29, 2021, Sean Christopherson wrote:
> > > On Fri, Oct 29, 2021, Vitaly Kuznetsov wrote:
> > > > > +	/* If vp_index == vcpu_idx for all vCPUs, fill vcpu_mask directly. */
> > > > > +	if (likely(!has_mismatch))
> > > > > +		bitmap = (u64 *)vcpu_mask;
> > > > > +
> > > > > +	memset(bitmap, 0, sizeof(vp_bitmap));
> > > > 
> > > > ... but in the unlikely case has_mismatch == true 'bitmap' is still
> > > > uninitialized here, right? How doesn't it crash?
> > > 
> > > I'm sure it does crash.  I'll hack the guest to actually test this.
> > 
> > Crash confirmed.  But I don't feel too bad about my one-line goof because the
> > existing code botches sparse VP_SET, i.e. _EX flows.  The spec requires the guest
> > to explicit specify the number of QWORDS in the variable header[*], e.g. VP_SET
> > in this case, but KVM ignores that and does a harebrained calculation to "count"
> > the number of sparse banks.  It does this by counting the number of bits set in
> > valid_bank_mask, which is comically broken because (a) the whole "sparse" thing
> > should be a clue that they banks are not packed together, (b) the spec clearly
> > states that "bank = VPindex / 64", (c) the sparse_bank madness makes this waaaay
> > more complicated than it needs to be, and (d) the massive sparse_bank allocation
> > on the stack is completely unnecessary because KVM simply ignores everything that
> > wouldn't fit in vp_bitmap.
> > 
> > To reproduce, stuff vp_index in descending order starting from KVM_MAX_VCPUS - 1.
> > 
> > 	hv_vcpu->vp_index = KVM_MAX_VCPUS - vcpu->vcpu_idx - 1;
> > 
> > E.g. with an 8 vCPU guest, KVM will calculate sparse_banks_len=1, read zeros, and
> > do nothing, hanging the guest because it never sends IPIs.
>  
> Ugh, I can't read.  The example[*] clarifies that the "sparse" VP_SET packs things
> into BankContents.  I don't think I imagined my guest hanging though, so something
> is awry.  Back to debugging...

Found the culprit.  When __send_ipi_mask_ex() (in the guest) sees that the target
set is all present CPUs, it skips setting the sparse VP_SET and goes straight to
HV_GENERIC_SET_ALL, but still issues the _EX versions.  KVM mishandles that case
by skipping the IPIs altogether when there's no sparse banks.  The spec says that
it's legal for there to be no sparse banks if the data is not needed, which is
the case here since the format is not sparse.
