Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB14A15
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 19:27:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id w14so17735564plp.9
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=xfhnVs3PaC5usAVNEu7i8rCmlaTeNScWKyrA8LXm5/8=;
        b=N4ZESQJUwri03sK+C6U+x9SiZS1kJoOtl9/XTee6ICwy7Xn9wRFIgIYCTy1jyXjHJ/
         gZC4Ht8Yf7BYRCKeWnlk6ufBf9mOJKddAHmFPKL956ZzlCz8OmF6QxQ5WBAEcxlMnmbP
         9mflQUy30A6HiDqOdajiROWD+4mWjbiRScXSeMnYbPQM2FMj8r96iOwwngbKTK87U671
         K1RKrHkAOYk79N/hjR+9d9EynSqbWEUvGngLA1a+quh6hZ+Lqd4pDCjUXPSi3jGZPaK1
         zTwj6ReDZVb+voDAEwuhMcAFvWbOokdC/3EaOr8T43oja3Qp2Kx4weHe812fLCWYq8fJ
         vicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=xfhnVs3PaC5usAVNEu7i8rCmlaTeNScWKyrA8LXm5/8=;
        b=JjEwotZHiywrOcuUS2DAx3qbnRpPNTkRQkQ0AwmzYX0ewdURbqmiKzv8mfBQnELwz5
         Ts/putCUlZ5AUXrY66eSPhEOisKTbRIg65lsuaGEgo8lKYMQql7n+ydV9gRQ1MIa/KPq
         q61p/HrB1WYjk/guRQYolBI4AYsFXocm0rPnlBr756V8q5CTzXsGTepPKVadmSlyq0Ra
         A8SFopQfYlMTQO5iDCOgqLG7T6YZNfgzhFQH7bhhUk6xwSCFm92Fxf7KeFEo8NbTzrO6
         eq2LSyIdAZXU+ZSWFd7ajl8nX5ttJBkzXQmWIjQU4FFbWvEIB7kZ371fsS03STLfos/8
         RBRQ==
X-Gm-Message-State: ACgBeo31oR+GwKdIhRQAASGrUC6Knjw4dnB9+c4aSti7kDn1xqgdsvOg
	6h5PQueyc3YDD3cG5LG0iSq5CA==
X-Google-Smtp-Source: AA6agR5haPNlMfDQXIRE8V6B5qM0hdtv6Mlx+U/U4DRnQ91rBrM+TTT+HKDHGsFItmK4U3GIFSK4PA==
X-Received: by 2002:a17:902:7247:b0:16f:8361:ba26 with SMTP id c7-20020a170902724700b0016f8361ba26mr646092pll.83.1660246034033;
        Thu, 11 Aug 2022 12:27:14 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a199000b001f312e7665asm110165pji.47.2022.08.11.12.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:27:13 -0700 (PDT)
Date: Thu, 11 Aug 2022 19:27:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Adam Dunlap <acdunlap@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>,
	Marc Orr <marcorr@google.com>
Subject: Re: [PATCH] x86/asm: Force native_apic_mem_read to use mov
Message-ID: <YvVYDn1JODiu6hKK@google.com>
References: <20220811180010.3067457-1-acdunlap@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811180010.3067457-1-acdunlap@google.com>

On Thu, Aug 11, 2022, Adam Dunlap wrote:
> Previously, when compiled with clang, native_apic_mem_read gets inlined
> into __xapic_wait_icr_idle and optimized to a testl instruction. When
> run in a VM with SEV-ES enabled, it attempts to emulate this
> instruction, but the emulator does not support it. Instead, use inline
> assembly to force native_apic_mem_read to use the mov instruction which
> is supported by the emulator.
> 
> Signed-off-by: Adam Dunlap <acdunlap@google.com>
> Reviewed-by: Marc Orr <marcorr@google.com>
> Reviewed-by: Jacob Xu <jacobhxu@google.com>
> ---
>  arch/x86/include/asm/apic.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> index 3415321c8240..281db79e76a9 100644
> --- a/arch/x86/include/asm/apic.h
> +++ b/arch/x86/include/asm/apic.h
> @@ -109,7 +109,18 @@ static inline void native_apic_mem_write(u32 reg, u32 v)
>  
>  static inline u32 native_apic_mem_read(u32 reg)
>  {
> -	return *((volatile u32 *)(APIC_BASE + reg));
> +	volatile u32 *addr = (volatile u32 *)(APIC_BASE + reg);
> +	u32 out;
> +
> +	/*
> +	 * Functionally, what we want to do is simply return *addr. However,
> +	 * this accesses an MMIO which may need to be emulated in some cases.
> +	 * The emulator doesn't necessarily support all instructions, so we
> +	 * force the read from addr to use a mov instruction.
> +	 */
> +	asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));
> +
> +	return out;

Can't this just be:

	return readl((void __iomem *)(APIC_BASE + reg));
