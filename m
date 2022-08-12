Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED69365
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 04:41:06 +0000 (UTC)
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 27C4eOWF628540
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 11 Aug 2022 21:40:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 27C4eOWF628540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022080501; t=1660279227;
	bh=3MaO937nM5p102I50w1EdHgkb+4tICTrGMo6IMrNWYA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ODghmVhRm/82SQORJ3bDP3ohrD+ai5DdyVoGr2mSVIxcfN1fwuvzIFw9IW4zZ2IV9
	 dX+u8LpDZCm3qMf7QFJ5P70OwqjdvJdP5Xn+evIMLoZtG34X/64vBSReFp+5SixBNp
	 4fopC3Gg4mYz+u4myvcZXy23p7S8VVwCjrQF5g3cC+iiM+uYusYqrfutrX4ImO7aRf
	 HBUkrMDthxqxiZDZthEMmKRoROh9HZxm3nYcEYQohkIIXPZ1T3fDCqTFm1of2y06gq
	 qErtrYLzEPPGZyrHfnGFUWqU/eSDo96nczoBPD5dRd82k7SAN4xf7Lxri2rxHAxJdV
	 s7vhZy1d7JZkg==
Date: Thu, 11 Aug 2022 21:40:23 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sean Christopherson <seanjc@google.com>
CC: Adam Dunlap <acdunlap@google.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>,
        Marc Orr <marcorr@google.com>
Subject: Re: [PATCH] x86/asm: Force native_apic_mem_read to use mov
User-Agent: K-9 Mail for Android
In-Reply-To: <YvVgfx+hah/V+r5n@google.com>
References: <20220811180010.3067457-1-acdunlap@google.com> <YvVYDn1JODiu6hKK@google.com> <AB38B5DA-D3AC-4568-A8DD-FC281DDE261A@zytor.com> <YvVgfx+hah/V+r5n@google.com>
Message-ID: <0D6A1E49-F21B-42AA-BBBF-13BFC308BB1E@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 11, 2022 1:03:11 PM PDT, Sean Christopherson <seanjc@google=2Ecom=
> wrote:
>On Thu, Aug 11, 2022, H=2E Peter Anvin wrote:
>> On August 11, 2022 12:27:10 PM PDT, Sean Christopherson <seanjc@google=
=2Ecom> wrote:
>> >On Thu, Aug 11, 2022, Adam Dunlap wrote:
>> >> Previously, when compiled with clang, native_apic_mem_read gets inli=
ned
>> >> into __xapic_wait_icr_idle and optimized to a testl instruction=2E W=
hen
>> >> run in a VM with SEV-ES enabled, it attempts to emulate this
>> >> instruction, but the emulator does not support it=2E Instead, use in=
line
>> >> assembly to force native_apic_mem_read to use the mov instruction wh=
ich
>> >> is supported by the emulator=2E
>> >>=20
>> >> Signed-off-by: Adam Dunlap <acdunlap@google=2Ecom>
>> >> Reviewed-by: Marc Orr <marcorr@google=2Ecom>
>> >> Reviewed-by: Jacob Xu <jacobhxu@google=2Ecom>
>> >> ---
>> >>  arch/x86/include/asm/apic=2Eh | 13 ++++++++++++-
>> >>  1 file changed, 12 insertions(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/arch/x86/include/asm/apic=2Eh b/arch/x86/include/asm/ap=
ic=2Eh
>> >> index 3415321c8240=2E=2E281db79e76a9 100644
>> >> --- a/arch/x86/include/asm/apic=2Eh
>> >> +++ b/arch/x86/include/asm/apic=2Eh
>> >> @@ -109,7 +109,18 @@ static inline void native_apic_mem_write(u32 re=
g, u32 v)
>> >> =20
>> >>  static inline u32 native_apic_mem_read(u32 reg)
>> >>  {
>> >> -	return *((volatile u32 *)(APIC_BASE + reg));
>> >> +	volatile u32 *addr =3D (volatile u32 *)(APIC_BASE + reg);
>> >> +	u32 out;
>> >> +
>> >> +	/*
>> >> +	 * Functionally, what we want to do is simply return *addr=2E Howe=
ver,
>> >> +	 * this accesses an MMIO which may need to be emulated in some cas=
es=2E
>> >> +	 * The emulator doesn't necessarily support all instructions, so w=
e
>> >> +	 * force the read from addr to use a mov instruction=2E
>> >> +	 */
>> >> +	asm_inline("movl %1, %0" : "=3Dr"(out) : "m"(*addr));
>> >> +
>> >> +	return out;
>> >
>> >Can't this just be:
>> >
>> >	return readl((void __iomem *)(APIC_BASE + reg));
>>=20
>> The very point of the patch is to force a specific instruction sequence=
=2E
>
>Yes, and that specific emulator-friendly instruction also has to be force=
d for all
>of the core x86 read/write MMIO helpers=2E  And it's also possible for MM=
IO read/write
>to be enlightened to skip the MOV and go straight to #VMGEXIT, i=2Ee=2E t=
he xAPIC code
>shouldn't assume MOV is the best/only option (ignoring the handling of th=
e P54C
>erratum in the write path)=2E

That's not reasonable=2E=2E=2E but xAPIC is "special" enough=2E
