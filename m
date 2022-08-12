Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1E398
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 18:32:15 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-32a17d3bba2so17911157b3.9
        for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ORIsyUO0VTM3cCQDkfzGyTL3t6ofQrr59k7+5WV0MlE=;
        b=dDQp7SowWnPSZmEJqrKIQ8A8DafQRisivyCnbZVo+Khl8dnmtZ6RmT7/EPNVRtMzYF
         14lWJtjBcn27dUdBwWBcZf40LxdPAcmIiuPtiSECXNIvOyLmJskv2FWInjOG36WU0uM8
         qNtNaBi+wdmBVZprLL5/UMEpgOADm9c+lvi3fnLsPDESzTgOEg5Z9JpyybDzdlwCwcyC
         It26RVZ5vmJdLU4Lu6UbYVB7xn22S/z59UAiDnHRcPJvfNAYDAPu7diKQzhi/yBdd5w7
         Ms9EmgfQ1A9odRFx1S8lKo9+GiI6Zx52y3GDaSpgbMXcvnCahcsnYRZjKQ+slS0AT1Bx
         AinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ORIsyUO0VTM3cCQDkfzGyTL3t6ofQrr59k7+5WV0MlE=;
        b=UNh7b+9Ba/JncY7pB+07XjEGMUSOldumlKFRYtWY5tajyf203/F3fwumAZRBv78wEh
         xtAtGleSjHQ9ds9h2WwdVmBEPmo/eGSEHFL9eQTajUrjKHxCcMbCzxQWnfyfwADiXxw1
         gZPNCqiZAML9KGheCFFl/5HDp8fGRQr63zhdGJZoHcaoo5uE3GyvFIM9SkzKoFruQ108
         pACSIIuHEn+ffTfMNQe0AFyD/AkpkYy/45iAtSFKYjmg3GKztfFJICHsqSVpSEqUmkjJ
         n9EkpEGrkSEOxgNZu2Bka2K+Ftzlc4Ijal7Jnvtl3vhDRTNpEzgZnz7hoMHxQLxTGg7L
         6nWQ==
X-Gm-Message-State: ACgBeo2oy9RYamBagCUykboiqz9WWmkTcB88AIiLH7tgvQgph/tlz56x
	2PSF/NRa16sbYQDwGN+66FjbmtOBBn1P5umeoHgTuQ==
X-Google-Smtp-Source: AA6agR45OaG4gWA/xB45D5aiX3ywvG7HtNsAOaJpftApMuVTBgr68MEeev9YiXIbdMgKc0XP7nUNzSmo7Aurk/rnNCM=
X-Received: by 2002:a0d:cb50:0:b0:32e:4e5c:a51e with SMTP id
 n77-20020a0dcb50000000b0032e4e5ca51emr5185007ywd.188.1660329134698; Fri, 12
 Aug 2022 11:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220811180010.3067457-1-acdunlap@google.com> <YvVYDn1JODiu6hKK@google.com>
 <AB38B5DA-D3AC-4568-A8DD-FC281DDE261A@zytor.com> <YvVgfx+hah/V+r5n@google.com>
 <0D6A1E49-F21B-42AA-BBBF-13BFC308BB1E@zytor.com>
In-Reply-To: <0D6A1E49-F21B-42AA-BBBF-13BFC308BB1E@zytor.com>
From: Adam Dunlap <acdunlap@google.com>
Date: Fri, 12 Aug 2022 11:32:02 -0700
Message-ID: <CAMBK9=b1ALFYOB1iTUW7BHgq=sg=x9t8sTnC5YgQ5bePF+UvNg@mail.gmail.com>
Subject: Re: [PATCH] x86/asm: Force native_apic_mem_read to use mov
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, 
	Marc Orr <marcorr@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 9:40 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> On August 11, 2022 1:03:11 PM PDT, Sean Christopherson <seanjc@google.com> wrote:
> >On Thu, Aug 11, 2022, H. Peter Anvin wrote:
> >> On August 11, 2022 12:27:10 PM PDT, Sean Christopherson <seanjc@google.com> wrote:
> >> >On Thu, Aug 11, 2022, Adam Dunlap wrote:
> >> >> Previously, when compiled with clang, native_apic_mem_read gets inlined
> >> >> into __xapic_wait_icr_idle and optimized to a testl instruction. When
> >> >> run in a VM with SEV-ES enabled, it attempts to emulate this
> >> >> instruction, but the emulator does not support it. Instead, use inline
> >> >> assembly to force native_apic_mem_read to use the mov instruction which
> >> >> is supported by the emulator.
> >> >>
> >> >> Signed-off-by: Adam Dunlap <acdunlap@google.com>
> >> >> Reviewed-by: Marc Orr <marcorr@google.com>
> >> >> Reviewed-by: Jacob Xu <jacobhxu@google.com>
> >> >> ---
> >> >>  arch/x86/include/asm/apic.h | 13 ++++++++++++-
> >> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> >> >> index 3415321c8240..281db79e76a9 100644
> >> >> --- a/arch/x86/include/asm/apic.h
> >> >> +++ b/arch/x86/include/asm/apic.h
> >> >> @@ -109,7 +109,18 @@ static inline void native_apic_mem_write(u32 reg, u32 v)
> >> >>
> >> >>  static inline u32 native_apic_mem_read(u32 reg)
> >> >>  {
> >> >> - return *((volatile u32 *)(APIC_BASE + reg));
> >> >> + volatile u32 *addr = (volatile u32 *)(APIC_BASE + reg);
> >> >> + u32 out;
> >> >> +
> >> >> + /*
> >> >> +  * Functionally, what we want to do is simply return *addr. However,
> >> >> +  * this accesses an MMIO which may need to be emulated in some cases.
> >> >> +  * The emulator doesn't necessarily support all instructions, so we
> >> >> +  * force the read from addr to use a mov instruction.
> >> >> +  */
> >> >> + asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));
> >> >> +
> >> >> + return out;
> >> >
> >> >Can't this just be:
> >> >
> >> >    return readl((void __iomem *)(APIC_BASE + reg));
> >>
> >> The very point of the patch is to force a specific instruction sequence.
> >
> >Yes, and that specific emulator-friendly instruction also has to be forced for all
> >of the core x86 read/write MMIO helpers.  And it's also possible for MMIO read/write
> >to be enlightened to skip the MOV and go straight to #VMGEXIT, i.e. the xAPIC code
> >shouldn't assume MOV is the best/only option (ignoring the handling of the P54C
> >erratum in the write path).
>
> That's not reasonable... but xAPIC is "special" enough.

Thanks for your responses. I think for now it makes sense to use the
readl function because
I haven't seen it require the ax register so can't verify the result.
I will send out a modified
patch using readl shortly.
