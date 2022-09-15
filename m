Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8722C2F24
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 08:09:58 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 9so20323982ljr.2
        for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aFwGASWRgsXAK8lC70BFOrXWvfMpVU18irE6y0Vbjm0=;
        b=EaqZPRAqvxtjjSm+WqGQU7jqVOgLOZ6k0oDpgW7OzIw+rFDqUG8MyePQY8klPaAvj6
         bj5Y1L7mi7tovVudJBxS3i6OofgIT4O0oRmE2bJsdg4fdpIEW7UEzh7GDZxcI0QnVyxP
         i3Vt/8q6JcMuC2kzpJoKxT2WcNF7cBFBCt8033pwAaZE+9y3eO2OEuSuP/PnFf1kOjfJ
         BruNDX6MRIPub2TL4+7U/Oemce9B2+GG7YwL+DL5x2S9EoVMRHd+GUhuWKSMqTKOXf/g
         /Kq96flzN5SFfVHCgAZEGWSCDzCSzrYk/rmIBeeR1CZJlnlfzBRM2NUaUWt1+Y7WR2CG
         tkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aFwGASWRgsXAK8lC70BFOrXWvfMpVU18irE6y0Vbjm0=;
        b=4qZjyUHfEQOXTvmpnzM270P5Qomfrs8cU6cKIxmN3gpIMOPNJtp2LsN9iJ/vNPItwl
         2wbZLZzw/UZntZ1rxpsXSaiuV24M/Z5s6WGIZ5v7OeKcs+o8HZvephJ5y+Zc3mKz2fdQ
         npGBNEvmF/XGyyzPXG7J3CPDRgHRJKvUWQ6oi4w3V5dLGhQvDzP8Gi+sxy4NuLaeZDNX
         SO6ks2Yy8xK0hXparKUvShX1dnSpUPw7+o6kdTBOepdwmwd1+WrIQMGOHCS3cOOaJqim
         4sTpI7esvMNdZewy16WqnnwVArZekG2kv3PPdC5WCpClEWTn8sW0ppHfG013+Kz9zogL
         fhyw==
X-Gm-Message-State: ACgBeo09IODR9Ew6DQro5SSisUO+Oj9u+mfdRtSa6WouBbEA3vsB6PNL
	2UkeWiI0EvR0X0MDTh+AO+aEmyZoQAw4MVUv9JSVfg==
X-Google-Smtp-Source: AA6agR7mddkCs1EgVqJOPDXZ2sGd0ezdTapiYlPiA1HWGZvmT8wgdVFgHMLeYx3jCnJM/ZOFK6RQ2fYtWSNCDeg7ehs=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr11764546ljb.257.1663229396349; Thu, 15
 Sep 2022 01:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
 <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com> <YyH/tOqrl8pZmoub@google.com>
In-Reply-To: <YyH/tOqrl8pZmoub@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 15 Sep 2022 09:09:45 +0100
Message-ID: <CAMkAt6p2Y=6sBB1JiZ2FovYXme9QBFWFu+EtnNyuQ3Db3ZhBSg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Sean Christopherson <seanjc@google.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, Marc Orr <marcorr@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 14, 2022 at 5:22 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Sep 14, 2022, Dave Hansen wrote:
> > On 9/14/22 04:13, Peter Gonda wrote:
> > > On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
> > >> Previously, when compiled with clang, native_apic_mem_read gets inlined
> > >> into __xapic_wait_icr_idle and optimized to a testl instruction. When
> > >> run in a VM with SEV-ES enabled, it attempts to emulate this
> > >> instruction, but the emulator does not support it. Instead, use inline
> > >> assembly to force native_apic_mem_read to use the mov instruction which
> > >> is supported by the emulator.
> > > This seems to be an issue with the SEV-ES in guest #VC handler's
> > > "emulator" right?
> >
> > No.
> >
> > It's not just an SEV-ES thing.  It's a problem for TDX and _probably_ a
> > problem for normal virtualization where it's a host-side issue.  Kirill
> > wrote a lot of great background information in here:
> >
> > > https://lore.kernel.org/all/164946765464.4207.3715751176055921036.tip-bot2@tip-bot2/
> >
> > So, the question is not "should we extend the MMIO instruction decoders
> > to handle one more instruction?".  It is "should we extend the MMIO
> > decoders to handle *ALL* memory read instructions?"
> >
> > That's an even more emphatic "NO".
>
> +1, keep the guest-side decoding as simple as possible.
>
> > readl() seems to be the right thing to do.  Also, Dear TDX, SEV and virt
> > folks: please look for more of these.  They're going to bite you sooner
> > or later.  You should have caught this one before now.

Thanks for the context here Dave. Fixing the offending MMIO
instruction here makes sense.
