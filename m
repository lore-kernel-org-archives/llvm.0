Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920E3FC2
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 16:22:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id v1so15639334plo.9
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vSqGkij0iJ02LNmcxwO+X24LzA4vRR84QlahoRcoEUk=;
        b=qDwmnr7yOYUEPiNILJjSYsaLa30cmMbxBEJSZzRMbMx5G0/4KajA69yKmAVfQp+Tmx
         VEppdYXx2ij+1vOMreanK3SjSXs6Znqne8dN1Drd7f40qsSpbIoUpSNajl7FgM/vUrx+
         /BMAHez+1J6GkqSA4A+glx2JfnNKOYvdls4OnCW1pBxYID09/vN7MHEasrQ2Q9BBPgf8
         KSW+UC4hFxNSiy3o1hrOMYX6KbaLgtk+k/f5Y3AS4Nw3pCRncSeiBLo9ldFO50squcez
         NYiDT5Ctf3kwOIVngBQKi8sqkXXWgULy6VGmlpHgIDtPQLa1oQCj1wdo/KZYilqpJaV6
         ftoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vSqGkij0iJ02LNmcxwO+X24LzA4vRR84QlahoRcoEUk=;
        b=PGJveFzMaOypYBt0cGBFO4YCLXIQ3qhwh3ZFoJ0gjegfTRECOM3iOnsFxpF0dpvAFM
         DHvJNF4yAJkbIykS3PoeRyIfwLwrlwCXx6iTPqH1SP4T0k4JcrUUz9ilXytDNojqAc1v
         a/bHiw45cilc1sCHCR98eY4KMycUeodwwix22knqI5YqIrGsQCQHJGuJSpWKwxa/XVwd
         wGApH8yM6llBcvzntv84DEkG1CMH3drnGGJzd4SIlphnBnZ/TnPxdvKsGwR/0sV+INJh
         jNOuGlpwPU8VhlEvvIP0+q7YzuV5mbCAxt+f8kAsM9j803k+KSZ9lebNPF9xmnmsgYBm
         yg1w==
X-Gm-Message-State: ACgBeo260nTR6S0i8x2ze9TIOHIpuKYw1J0O7qyXf3pYtT+/5zD5yJA9
	e4+f1AyY72u+F/Jbj8ElhaYKlQ==
X-Google-Smtp-Source: AA6agR6rRu5Esr/QftLs4NgvC2oASCOgWLDyAbveVyj+N+p6xnapdY9Xw5HMK9dDqvSwfRgWL69VgQ==
X-Received: by 2002:a17:902:8486:b0:171:48cd:1356 with SMTP id c6-20020a170902848600b0017148cd1356mr35858433plo.153.1663172536881;
        Wed, 14 Sep 2022 09:22:16 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a318800b002005114fbf5sm5302312pjb.22.2022.09.14.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:22:16 -0700 (PDT)
Date: Wed, 14 Sep 2022 16:22:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Peter Gonda <pgonda@google.com>, Adam Dunlap <acdunlap@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>,
	Marc Orr <marcorr@google.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
Message-ID: <YyH/tOqrl8pZmoub@google.com>
References: <20220812183501.3555820-1-acdunlap@google.com>
 <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
 <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com>

On Wed, Sep 14, 2022, Dave Hansen wrote:
> On 9/14/22 04:13, Peter Gonda wrote:
> > On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
> >> Previously, when compiled with clang, native_apic_mem_read gets inlined
> >> into __xapic_wait_icr_idle and optimized to a testl instruction. When
> >> run in a VM with SEV-ES enabled, it attempts to emulate this
> >> instruction, but the emulator does not support it. Instead, use inline
> >> assembly to force native_apic_mem_read to use the mov instruction which
> >> is supported by the emulator.
> > This seems to be an issue with the SEV-ES in guest #VC handler's
> > "emulator" right?
> 
> No.
> 
> It's not just an SEV-ES thing.  It's a problem for TDX and _probably_ a
> problem for normal virtualization where it's a host-side issue.  Kirill
> wrote a lot of great background information in here:
> 
> > https://lore.kernel.org/all/164946765464.4207.3715751176055921036.tip-bot2@tip-bot2/
> 
> So, the question is not "should we extend the MMIO instruction decoders
> to handle one more instruction?".  It is "should we extend the MMIO
> decoders to handle *ALL* memory read instructions?"
> 
> That's an even more emphatic "NO".

+1, keep the guest-side decoding as simple as possible.

> readl() seems to be the right thing to do.  Also, Dear TDX, SEV and virt
> folks: please look for more of these.  They're going to bite you sooner
> or later.  You should have caught this one before now.
