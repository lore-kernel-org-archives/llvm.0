Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BE20E703
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540196; cv=none; b=haYTV3NMXNYZnCcb7dqlHZv/7AlATMC/9DwxcDR2r9LcuK3FACxwlM2rdRLeKoxmG/BPfPOpQgfW3inKlU1tON2d1G6CGRJHy3blvD00JYIj9CtHTgPR5F1oH9OcV/tcTJBibl2BwBMAduMLMmmetJTbMn20qfCQHSG2G0HeqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540196; c=relaxed/simple;
	bh=dnaPgtw+uOGzBc9Q8I5K46IpAnL+zbk7+D3CpS8e/LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsQhlhmcAnLc5Ea0oVHJQkG39yo1coOcmZDIruwbycVhHaC3eog9LaONpGm1htiEfTs12rVA4mPHJ+tKwVvDyjRLNfdYwK2/sNkblxMwtWzDtf5HN5dcvx7wNwqFeZazMqtHngr5cRIHZCsaZCwy1c2asIaqntCzSJ/1/YaSXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZWjW52NC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZWjW52NC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227d6b530d8so110273195ad.3
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743540193; x=1744144993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4N9bSikoL2WjOyo56gwXGKLK2uNMMUkoiqCVV5Eb9wg=;
        b=ZWjW52NCaC1jKttUU0GnoaK4WxPtSUs7wIQS/4on09h5fKARhMAtRpWMQczF8ZVF6u
         0pFTt3kvXpvIUsddkVQSzPjHxttu6IV2ikSOSm+HVtYUHOYgI/OE+3nl9AxkpNTZbx0n
         VJZfCYg3oMHHCFv2hvCWlpvY6/p0MEOj3d7hF6huERAXY/TVQVspYSQjwrCux9H3Olzj
         uXlvNI9xACUbEhWRwhfeAsfnoBzJMy3AFm2X5Wr/888aMboCJjMeL+Q67Nwp+kdkrtT/
         TiKywC6fBxd3TSoOFzt/oH8tDbZHfheftHedi6cbSTmJlrKxLstc5hzWLryDXxl+HnNA
         9/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540193; x=1744144993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N9bSikoL2WjOyo56gwXGKLK2uNMMUkoiqCVV5Eb9wg=;
        b=HiQ/UXgkOjDcl2KKs2PDYOR2DlCJnoGIdEPnVlqtiGxnW1BXxrlOimh0aHG/FSOPdG
         WxE+2IU/DucpRmT1a4EkwQifcxAUzoSAMF6X+0gT86ILsic34wrZH4GcTMRv6kxmoLaw
         a2geFq06x/oF5Q+XnV9bloanv+Pl9zIR+bFC5Bo99dOZBiIALbZVVPr2CFz+thAomhdP
         O3oiAl/DcQy4AFgsdzpYFELUcJ2hv5Y9s2ToNtHlITEmYfO8eB7Y2nS9XhSRGVk25lPQ
         qXWATER11NNrjmL9kB6YqodtbS3y8nMsxopE0EZD7kKAOfrJH6P2Dk504+2h3ZVrn/RY
         Gg7w==
X-Forwarded-Encrypted: i=1; AJvYcCUA4u89etjttZDjjsk/aahmRRi/vtlJPY74n6RqtcwJOHHCSFCA2vEROFS5MxMkooaxe3LA@lists.linux.dev
X-Gm-Message-State: AOJu0YwNdvIELu1T9Ges7RbS1VUHdBgxc+WB0cgQx75g4Yb19ZdumQA0
	BtlGdO3tvx6o1TkGFlcfqAJKgD1KiZkOJZWnQsGDMOrfEwwrllRJTalTGV60HPg=
X-Gm-Gg: ASbGncvaJwslk8QNkCFezyTM4cl9N432p64xdnCm0XQ2hCLnYACpIgjsNdB+Rrln6Uz
	sdfv5mcikae32mfA9o6Tc4Z7DDbT+Yipdco22G+atZhYQJoRRKUFTmX0VpkhCleXDGgsv/c0a7j
	o9JlkMUu1YeH3xmJlX2HJ1ON9+vpTZ1x/b9xP/2UTel1fsaqeOurubyDw/aYmSuhsgxlfZi46YJ
	SAbZBy4qZivTdRTVuf0scQrdLAx9F7olhyxmqxnWvAkXM0LAwJKO1VzwYzf8wueFtu0y1t9qdA+
	bkVUKoWbkPLMfHpOuSjrjaVEGBmHkjINs8Q=
X-Google-Smtp-Source: AGHT+IEK/OL+9Kd9LZbi6kJp9eomm5A9lXwmWj+SEPjmTfabDnSjH/xtw6UkP02pfgtMx4rN8zRqyg==
X-Received: by 2002:a17:902:c411:b0:220:f7bb:842 with SMTP id d9443c01a7336-2295c0ed243mr67067595ad.42.1743540193373;
        Tue, 01 Apr 2025 13:43:13 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cde55sm93609305ad.132.2025.04.01.13.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:43:12 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:43:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
Message-ID: <Z-xP3M7-GSUCHQkb@ghost>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
 <20250401192833.GA3645424@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401192833.GA3645424@ax162>

On Tue, Apr 01, 2025 at 12:28:33PM -0700, Nathan Chancellor wrote:
> Hi Charlie,
> 
> On Wed, Mar 19, 2025 at 11:35:20AM -0700, Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> > 
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ...
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> ...
> > +#define RISCV_RUNTIME_CONST_64_ZBA				\
> > +	".option push\n\t"					\
> > +	".option arch,+zba\n\t"					\
> > +	"slli	%[__tmp],%[__tmp],32\n\t"			\
> > +	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
> > +	"nop\n\t"						\
> > +	"nop\n\t"						\
> > +	".option pop\n\t"					\
> ...
> > +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
> ...
> > +#elif defined(CONFIG_RISCV_ISA_ZBA)
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		ALTERNATIVE(						\
> > +			RISCV_RUNTIME_CONST_64_BASE,			\
> > +			RISCV_RUNTIME_CONST_64_ZBA,			\
> > +			0, RISCV_ISA_EXT_ZBA, 1				\
> > +		)							\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> 
> This breaks the build for clang versions 16 and earlier because they do
> not support '.option arch' and it is used in CONFIG_RISCV_ISA_ZBA, which
> has no dependencies and it is default on.
> 
>   $ make -skj"$(nproc)" ARCH=riscv LLVM=1 mrproper defconfig fs/dcache.o
>   fs/dcache.c:117:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
>           return runtime_const_ptr(dentry_hashtable) +
>                  ^
>   arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
>                           RISCV_RUNTIME_CONST_64_ZBA,                     \
>                           ^
>   arch/riscv/include/asm/runtime-const.h:57:17: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
>           ".option push\n\t"                                      \
>                          ^
>   <inline asm>:32:10: note: instantiated into assembly here
>           .option arch,+zba
>                   ^
>   fs/dcache.c:117:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
>           return runtime_const_ptr(dentry_hashtable) +
>                  ^
>   arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
>                           RISCV_RUNTIME_CONST_64_ZBA,                     \
>                           ^
>   arch/riscv/include/asm/runtime-const.h:59:30: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
>           "slli   %[__tmp],%[__tmp],32\n\t"                       \
>                                         ^
>   <inline asm>:34:2: note: instantiated into assembly here
>           add.uw a2,a2,a3
>           ^
>   ...
> 
>   $ rg 'OPTION_ARCH|ZBA' .config
>   364:CONFIG_RISCV_ISA_ZBA=y
> 
> Should it grow a dependency on AS_HAS_OPTION_ARCH or should there be a
> different fix?

This should have been fixed by Alex's patch [1]. Zba is in an awkward
state because BPF generates Zba code without the need for toolchain
support.

[1] https://lore.kernel.org/all/20250328115422.253670-1-alexghiti@rivosinc.com/

> 
> Cheers,
> Nathan
