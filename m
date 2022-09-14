Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377403D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 12:00:10 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3450990b0aeso176580587b3.12
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QsMCaVH5gf5julRO/w6xJ6Us9sb9A4zSO2PGVhrKaaY=;
        b=ZyREX7134NFnv+/oAG5wLXi2j0idORn9gJdu6JDDCBfneoua05daTo2P3avmR6l7ey
         gbWCq2WJvLmAKls41j2WhXjyjkYOHK4bwlqHzvSfC9rNw3pFSIZQpmkAcihga5bksbZK
         swhZgrGIa49svXTkq2mMiI/b52UPtCi3BWrchSDizUca2HgNJgtFV0tDg29fOTVF1ZWT
         hkAL1UQ16wYPRN5oMiUqQC5MEFI8kObWiWwSPeGQ0TatohpIsjgQcpLLiGyebETjKOzy
         qjibWmn7+mPgJ6HHhN8rQqHoHmgF2A+9sw99NtijP8m4Etk/tS8Lhu7MMzLC6Dzmp8Uu
         k+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QsMCaVH5gf5julRO/w6xJ6Us9sb9A4zSO2PGVhrKaaY=;
        b=bju8S7wf3QC9W97QiD5mbs5LwWcjwZOt3+LckgsV7ZXErglLEHYFF1cLo3p6k9O/3U
         KDt4IjsRtGxs6mMEjHUARDrQRbOJuUj4H4E73oB0MyVrjSNmegSTiBcsm5aBtGwuPlVA
         yOxvvGJb+LQoeSnK7o85+nhlwkDCYdj5lwe1UYZ/2PJ/5+/L8+MEQgSZPHzf2vFwRqmJ
         4KRmlwZcIgp7zlDhf6jN9AimnFpRp4hTqAeje+ja22Ak3wUagvmFtFmqCkxGq6mCj3iD
         +riBfnrSXzps+95Xbu4WT+eTP1NPrJc50fqQL/ZzSZf80JY0vFnzWrkmraMOZ6PZCx2S
         YQqA==
X-Gm-Message-State: ACgBeo1Y/cpGcIPwGa457CAjrWFcJSIHsY9CUdHWTUsTJuiTHeUp5rJf
	onyJthvJmPknF1ep26lgnOt7BRPhvjf1SrFy/jEtrg==
X-Google-Smtp-Source: AA6agR7hrRw99xEORXM7EbpxVm65aZiVieHnXxD+jFhchF2PDeLw4PWBq9V0wVP1vvGrdLGtNeHc16IMsT6Ly6nSZXY=
X-Received: by 2002:a81:7cd7:0:b0:345:221c:5671 with SMTP id
 x206-20020a817cd7000000b00345221c5671mr29558481ywc.297.1663156808987; Wed, 14
 Sep 2022 05:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com> <CAA03e5FLwODdqCpk4BGdxZBrOxQR7rfmrmQg6v5ckzEKuYUx2w@mail.gmail.com>
In-Reply-To: <CAA03e5FLwODdqCpk4BGdxZBrOxQR7rfmrmQg6v5ckzEKuYUx2w@mail.gmail.com>
From: Marc Orr <marcorr@google.com>
Date: Wed, 14 Sep 2022 12:59:58 +0100
Message-ID: <CAA03e5EFk7VjkaT8+xXMaDQcEDTJRzLEuQxxNX=OOyAQG5eCng@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Peter Gonda <pgonda@google.com>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
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

On Wed, Sep 14, 2022 at 12:59 PM Marc Orr <marcorr@google.com> wrote:
>
> On Wed, Sep 14, 2022 at 12:13 PM Peter Gonda <pgonda@google.com> wrote:
> >
> > On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
> > >
> > > Previously, when compiled with clang, native_apic_mem_read gets inlined
> > > into __xapic_wait_icr_idle and optimized to a testl instruction. When
> > > run in a VM with SEV-ES enabled, it attempts to emulate this
> > > instruction, but the emulator does not support it. Instead, use inline
> > > assembly to force native_apic_mem_read to use the mov instruction which
> > > is supported by the emulator.
> >
> > This seems to be an issue with the SEV-ES in guest #VC handler's
> > "emulator" right?
> >
> > If that's the case I think this should be fixed in the #VC handler
> > instead of fixing the code that is failing to be emulated. What if
> > there are other places where a testl is used and our tests have not
> > caught them.
>
> That was my initial reaction too. But we spoke w/ Tom offline (before
> sending this) and my understanding was that we really should be using
> MOV for MMIO. I've cc'd Tom so he can speak to this directly though.

Actually cc'ing Tom :-).
