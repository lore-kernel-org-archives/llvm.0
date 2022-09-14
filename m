Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A476C3D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 11:59:31 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3378303138bso176890737b3.9
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Af0ZsDPyJgdTr/TUks7HMX0MOkiwdsdfC6dDsp+AdmY=;
        b=caMfRnhMjAAcuWfqKzIREz06Y0ofv0vsUz0iAAkXwc/p27apoikQfCiZ//EqFBLCyX
         6/LjkFijqkgoWK0xoBNs2ebOVJztDz+TGO8xbTtwJSWPdAhYNh8IhhcQOEyJlIoGv6bv
         gb+uelQjQxKhROytfgCELdZFNmdk0RrV8Z13ONPYwLUuss1DpC7h21uqinTMHDRYnpIN
         0m6Zix9kEZ8EttadiD/vvQj5iN4rzEAvZZuSNgK13bGVSk/BL/jH6CRn0Oii86AF1i8R
         4d1bnqe3a9aD2QvDPPAgXSY/7QU5qG9mDzDjs6FLncaCfebKU0FIgGbC8C5Uw4uaOSVI
         Zt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Af0ZsDPyJgdTr/TUks7HMX0MOkiwdsdfC6dDsp+AdmY=;
        b=rvUFb3fDbuEw3OFwtl11IrFy86Bl3EJcXT/4Q56FvZm7wunIPWzAm/Lpdq9iKthh27
         sKUMFE6DeUll+imTM7ZkTJkmYwXEWHHPFnQS2aga+vaPwcfKLcOWRK3ZTFL5IX/o5E5o
         B2eH7AoxCSsjSVGWooTA1yA7gpo8E3Uukl9MMuhJkLmjQvh111w4qKYn6NUUrgDmNgSc
         af/rVDJiBeQweipPrldiyxG0nMnP6uUkDxMEGqQYtkGaB2k14H9/SO5uCD4QnY2ftONf
         /vhNIYOQGq9HjRQeWIZWmng8/fxL2vGOmLInTyIcNG+OTpm1Z42xu/WdVb9Dlix2+G3y
         4FQg==
X-Gm-Message-State: ACgBeo1QFqcW2iEFBVLL/mN8iXAxdSOeC9urMaNSrlmtNH4qYiMn9hfg
	dtDDEpmdnMUneUvjiXUzoWRAEYg37NCNe9m13IuBOA==
X-Google-Smtp-Source: AA6agR7589auuQ/9iWjrUoQfLowfBPv7DFT0AZ2qXsKOLI1SemwwlWcZle4JKS6G0QRfZWzT/gD5XHG1TvCh4hzVF2s=
X-Received: by 2002:a0d:de05:0:b0:345:4827:5029 with SMTP id
 h5-20020a0dde05000000b0034548275029mr29700203ywe.385.1663156770383; Wed, 14
 Sep 2022 04:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
In-Reply-To: <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
From: Marc Orr <marcorr@google.com>
Date: Wed, 14 Sep 2022 12:59:19 +0100
Message-ID: <CAA03e5FLwODdqCpk4BGdxZBrOxQR7rfmrmQg6v5ckzEKuYUx2w@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Peter Gonda <pgonda@google.com>
Cc: Adam Dunlap <acdunlap@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 14, 2022 at 12:13 PM Peter Gonda <pgonda@google.com> wrote:
>
> On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
> >
> > Previously, when compiled with clang, native_apic_mem_read gets inlined
> > into __xapic_wait_icr_idle and optimized to a testl instruction. When
> > run in a VM with SEV-ES enabled, it attempts to emulate this
> > instruction, but the emulator does not support it. Instead, use inline
> > assembly to force native_apic_mem_read to use the mov instruction which
> > is supported by the emulator.
>
> This seems to be an issue with the SEV-ES in guest #VC handler's
> "emulator" right?
>
> If that's the case I think this should be fixed in the #VC handler
> instead of fixing the code that is failing to be emulated. What if
> there are other places where a testl is used and our tests have not
> caught them.

That was my initial reaction too. But we spoke w/ Tom offline (before
sending this) and my understanding was that we really should be using
MOV for MMIO. I've cc'd Tom so he can speak to this directly though.
