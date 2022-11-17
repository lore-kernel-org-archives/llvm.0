Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB608F4C
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 21:23:20 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id i131so3430588ybc.9
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 13:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WkqynFnuTl+SBnf8vAzWE9ynW3+h/Y4/Q34MzfRHcPc=;
        b=XcGF4xkzh24/cOTLB7WLZEBztN+OCwfswrdgEOAyH3o3QLjQbxkfEyH9o6xNF9BsRK
         9x4aQ+1HEgJsRN/V4s0WVTj59/sznY5RKQ254hPsFHzZnqkC5uSIuiFpu3XaslREx5xC
         P8NyDAs/d/rBmQrhuwVc/JrZo2D21hAbhmF/6zUxC7MbyPTI1bJzIrQ7D07JFTtiQ4Um
         476qa2MATVla+W4z06fWU6nud4VsmPVx/sQicQ8RqDPMg8hZAWr85jrrY+fZX/GQbNmF
         vmWjmgHtn4296hBgxIusZKveQBin0uDHIIWJezBuCX7EU89J3FrQsbKkEK8metMUqSw6
         9ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkqynFnuTl+SBnf8vAzWE9ynW3+h/Y4/Q34MzfRHcPc=;
        b=3/f6jr5UpD/NPMD5J+7f+7Co0MDjSgO6bXd8fu5vWMQ0HxeH9Lk5GJNFfv5fjsCbdx
         6qBEKUmpTV9Mpk/rlMpBfmtztvZdc1D+nmH8o2mXV+RW3ArFcKlV/4/CcvzOLH4+iyDM
         H7B8RR3hw6T8fzwU/524Ml2wtBhEtpyrtVT7snKIbqFIwuBWrXbFaANtKmbs6m4H4HTo
         +WnOwDo8iLcp720PJjsjWuTvjD+NDujMDAKJfKYWPoPYDSN/CLm/ga0uMmEoBwYW/mUM
         u+mJW1zXOYDu1ekC5GGF6EcmS5jHaT50Wpb8psJ/6AKe7OvyU63+LChtGkW8smtGUSeu
         BD5w==
X-Gm-Message-State: ANoB5plcTsZwN16xtfcA1fXqtuif2qWLQJIJ4+/3UHpzi4fVZNgviQ9V
	ShhF7A2/k8xMvzevzW3K03Yw+Wv3yDasgB9pHE6pzw==
X-Google-Smtp-Source: AA0mqf4JVGtSyb4NJ+SoBWhjXtO1KWOMSMsFG22erYTaz0MdcyM3hNCHGpDDoIAeUO7E0+Rm25aoKwhiNOBTAh8rvEM=
X-Received: by 2002:a25:744f:0:b0:6e6:8d2d:4b42 with SMTP id
 p76-20020a25744f000000b006e68d2d4b42mr3924310ybc.435.1668720198916; Thu, 17
 Nov 2022 13:23:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
 <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com> <YyH/tOqrl8pZmoub@google.com>
 <CAMkAt6p2Y=6sBB1JiZ2FovYXme9QBFWFu+EtnNyuQ3Db3ZhBSg@mail.gmail.com>
 <CAMBK9=YB=8EQymDUda300qPFAL1=7dzC61c0pshrWEC5ibrUfQ@mail.gmail.com>
 <B7175642-351D-44A0-B7AD-E69C6B64FC18@zytor.com> <81950d38-4d5a-6902-bc2e-327d2800eb58@amd.com>
In-Reply-To: <81950d38-4d5a-6902-bc2e-327d2800eb58@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 17 Nov 2022 13:23:08 -0800
Message-ID: <CAA03e5Gb0BDn-e7Th8JPQqrX-EmFW3kGeiKfuFvwEzKe6xRadg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Sean Christopherson <seanjc@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 6:29 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 10/3/22 18:11, H. Peter Anvin wrote:
> > On October 3, 2022 4:01:01 PM PDT, Adam Dunlap <acdunlap@google.com> wrote:
> >> Thanks for all the responses. Is the consensus that we should use the
> >> readl function here or instead use inline assembly directly as in the patch
> >> I originally sent out:
> >>
> >> asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));
> >>
> >> ? The readl function has this exact same code, I'm just not sure
> >> which version fits better stylistically.
> >
> > Is mov with an arbitrary addressing mode still acceptable for whatever is causing this problem?
>
> The acceptable forms of MOV are covered by insn_decode_mmio() in
> arch/x86/lib/insn-eval.c.

Is this blocked on an item? There seems to be consensus that this
patch fixes a bug and is taking the right high-level approach (i.e.,
change the guest code to avoid triggering a sequence that isn't
supported under CVM exception-based emulation). Without something like
this, we weren't able to build the kernel w/ CLANG when it is
configured to run under SEV-ES.

We sent out two versions of the patch. One that does the mov directly
[1] and a second that calls readl [2]. Is one of these two patches
acceptable? Or do we need to follow up on something?

[1] https://lore.kernel.org/lkml/0D6A1E49-F21B-42AA-BBBF-13BFC308BB1E@zytor.com/T/
[2] https://lore.kernel.org/all/20220812183501.3555820-1-acdunlap@google.com/

Thanks,
Marc
