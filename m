Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503B83A19
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706914271; cv=none; b=jlbP9roD5WPsVZjI9LlBMLRXlYLKQoBxgR+NofueMVA4mUUeLQzZn+GeKOlnfKlgKw+YzfMgd+nAZxjGJogAnHGSf+YW0ILI0G5buJ4LD46gAS2eoFFeaRVG+E+fvP8yHgt4oArIJqeSf7/KraB/D7ZTRlgvhe5i2R661EYPGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706914271; c=relaxed/simple;
	bh=q5AtBea6xhHLz465Ofgp0wGnE1Yg8+UADk4YyBy5GHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDConwOCVh5yoAykyIrlWahoyemYJndZFLgnMeJNbBqRfxzFxVAU7LnXEEFP3AKqtcmw5peF4Hlp24sIdpa9L56qmoGQ/Yf2kPRzuGiqgFf75ELnyphZqX+EUb3pSK4LajfiCplLTr3rITEoNMMYjomZ0qFTAO0mO7OwcSZYN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hM5FWRV2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hM5FWRV2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d94691de1eso16245ad.1
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 14:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706914269; x=1707519069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YqcJnfRzgDSbBBe/WvP/tbuGz6ND0myieOWZsXq2pmo=;
        b=hM5FWRV2AJNwQ513y27JDo6LustAwHIffvlERQ/F4DB9P5DVgtkpYk8iE+F/lA7FZx
         ViW8Zio1NAljStbtlfoFnuqeJPwDCeuh1oK/2rbzRx7E6dhYM1B6nM/8LsWXvozps/Ae
         a9x7LooZaM6mQa16E8bEKxu47Ba/CJy3uxkCCQPDvL+fxC0CQE4dBWINVdoQKe4NNrx2
         1USUbJqvgd13qUo16+Oud8lIKxGvb0Tv1vyOAfc5QXK/W+FQKAIDObuGTMpq+gI/TUPk
         k3/6wyt7UwQpwW85AGXEZeDUtSE0W8eapsSGNnyGFY7npN6GBL4128aKwZejGJBH4IHw
         8m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706914269; x=1707519069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqcJnfRzgDSbBBe/WvP/tbuGz6ND0myieOWZsXq2pmo=;
        b=dhzzY+3d8x3yqs+0QGPxOWorfIAIDmQTnBjOrx8F3m2tqtP6gKn2l+GzEOt8mHRo42
         HUaJaR9/CMt5RX/RkkdIR1H8zfL3EVln1qMiMX4iZgQP+h5rutSTFHyHQD9EouY3kQnM
         xBGAg9eXOhU4Ps5amC/D/N5IHmiR50dSv2JuBL0Utb0yiz5+cG9kX2ubfpz2Ea+A3dpV
         e8JvPiBm/u4aQZFb1iTDIBtvmhj4WmWejYOyDFGtCk4zNwI8m9c0ebJr4xaCv6Qz1kzH
         wHYfeKsIHfxTdO/SZIER5j/p3b/U6MTyofptHnwR0ZdlbhCbMmfOxC+1r3n9tmwU4jzB
         g2Xw==
X-Gm-Message-State: AOJu0Yxjr5Zk59rmOPSemccXj8Yu9IFAcS/OhsFzAcf2IqBCelHzrUSi
	w+2aifl9nTuE5rowGjP9ShZmrOcV2E2fEDzyIhiWp8fogwn2GA6pYkAcKiAVABWhg7cVguVsIL+
	WeA==
X-Google-Smtp-Source: AGHT+IGVWMBG/8R/mcT1xzeSAovhC1BYWddmMDiTFgZ2PCdc0N+nk0ZwPvdIjerAJYq/NQ6a+ztOYA==
X-Received: by 2002:a17:903:41c6:b0:1d8:d225:699d with SMTP id u6-20020a17090341c600b001d8d225699dmr43383ple.16.1706914268482;
        Fri, 02 Feb 2024 14:51:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWROBV9WCdSrFk2QIYXgRwLyzJC9hOOU0tOnfJzgdb6oYdieh5AE8I54bOvoR6Psby88v+3G0Fvby4ld5P/GTm4lOsdSi/K0hExIWkIsWmV08mYdKBMtpN9B4psTsqwiuYXSEp7vQTQcptJV2wh/VdTJabUmz+SvdeE5kd9UTZaPXVxJuD6JVKQwlmAMBg1L5LiG9o/pgaL8WY3qp4fs2jR35w7K2XOuXnht4tTe48B+N5CGAH0nnNTGNVkGXFQ2owjy+LuRBs9uU7IZcjj53+BBDFfShaAbcfGq5k=
Received: from google.com ([2620:15c:2d3:205:f745:d0b:94d5:8e9a])
        by smtp.gmail.com with ESMTPSA id jx2-20020a170903138200b001d95ec93929sm2097279plb.290.2024.02.02.14.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 14:51:07 -0800 (PST)
Date: Fri, 2 Feb 2024 14:51:04 -0800
From: Fangrui Song <maskray@google.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Peter Smith <peter.smith@arm.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: jump_label: use constraints "Si" instead of "i"
Message-ID: <20240202225104.f4dsagfwf6gcnddy@google.com>
References: <20240201223545.728028-1-maskray@google.com>
 <Zb0Qu5lR0iZUqImb@e133380.arm.com>
 <CAMj1kXGSQ4Xq68Cmq6BH37FPJ+R+N5cOfrdC+aVML4sGaNDopg@mail.gmail.com>
 <Zb0eRogn3rjkeDAs@e133380.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zb0eRogn3rjkeDAs@e133380.arm.com>

On 2024-02-02, Dave Martin wrote:
>On Fri, Feb 02, 2024 at 05:32:33PM +0100, Ard Biesheuvel wrote:
>> On Fri, 2 Feb 2024 at 16:56, Dave Martin <Dave.Martin@arm.com> wrote:
>> >
>> > On Thu, Feb 01, 2024 at 02:35:45PM -0800, Fangrui Song wrote:
>> > > The generic constraint "i" seems to be copied from x86 or arm (and with
>> > > a redundant generic operand modifier "c"). It works with -fno-PIE but
>> > > not with -fPIE/-fPIC in GCC's aarch64 port.
>> > >
>> > > The machine constraint "S", which denotes a symbol or label reference
>> > > with a constant offset, supports PIC and has been available in GCC since
>> > > 2012 and in Clang since 7.0. However, Clang before 19 does not support
>> > > "S" on a symbol with a constant offset [1] (e.g.
>> > > `static_key_false(&nf_hooks_needed[pf][hook])` in
>> > > include/linux/netfilter.h), so we use "i" as a fallback.
>> > >
>> > > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
>> > > Signed-off-by: Fangrui Song <maskray@google.com>
>> > > Link: https://github.com/llvm/llvm-project/pull/80255 [1]
>> > >
>> > > ---
>> > > Changes from
>> > > arm64: jump_label: use constraint "S" instead of "i" (https://lore.kernel.org/all/20240131065322.1126831-1-maskray@google.com/)
>> > >
>> > > * Use "Si" as Ard suggested to support Clang<19
>> > > * Make branch a separate operand
>> > > ---
>> > >  arch/arm64/include/asm/jump_label.h | 12 ++++++++----
>> > >  1 file changed, 8 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
>> > > index 48ddc0f45d22..1f7d529be608 100644
>> > > --- a/arch/arm64/include/asm/jump_label.h
>> > > +++ b/arch/arm64/include/asm/jump_label.h
>> > > @@ -15,6 +15,10 @@
>> > >
>> > >  #define JUMP_LABEL_NOP_SIZE          AARCH64_INSN_SIZE
>> > >
>> > > +/*
>> > > + * Prefer the constraint "S" to support PIC with GCC. Clang before 19 does not
>> > > + * support "S" on a symbol with a constant offset, so we use "i" as a fallback.
>> > > + */
>> > >  static __always_inline bool arch_static_branch(struct static_key * const key,
>> > >                                              const bool branch)
>> > >  {
>> > > @@ -23,9 +27,9 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
>> > >                "      .pushsection    __jump_table, \"aw\"    \n\t"
>> > >                "      .align          3                       \n\t"
>> > >                "      .long           1b - ., %l[l_yes] - .   \n\t"
>> > > -              "      .quad           %c0 - .                 \n\t"
>> > > +              "      .quad           %0 + %1 - .             \n\t"
>> > >                "      .popsection                             \n\t"
>> > > -              :  :  "i"(&((char *)key)[branch]) :  : l_yes);
>> > > +              :  :  "Si"(key), "i"(branch) :  : l_yes);
>> >
>> > Is the meaning of multi-alternatives well defined if different arguments
>> > specify different numbers of alternatives?  The GCC documentation says:
>> >
>> > https://gcc.gnu.org/onlinedocs/gcc/Multi-Alternative.html:
>> >
>> > -8<-
>> >
>> > [...] All operands for a single instruction must have the same number of
>> > alternatives.
>> >
>> > ->8-
>> >
>>
>> AIUI that does not apply here. That reasons about multiple arguments
>> having more than one constraint, where not all combinations of those
>> constraints are supported by the instruction.
>
>Ah, scratch that: I'm confusing multi-alternatives with simple
>constraints: all arguments must have the same number of comma-separated
>lists of constraint letters, but each list can contain as many or as few
>letters as are needed to match the operand.
>
>So "Si"(), "i"() is fine.

"Si" is fine for GCC and Clang.
"i" is fine for Clang but not for GCC PIC.

     https://maskray.me/blog/2024-01-30-raw-symbol-names-in-inline-assembly#aarch64

     In gcc/config/aarch64, LEGITIMATE_PIC_OPERAND_P(X) disallows any symbol
     reference, which means that "i" and "s" cannot be used for PIC. Instead,
     the constraint "S" has been supported since the initial port (2012) to
     reference a symbol or label.

I am also not familiar with
https://gcc.gnu.org/onlinedocs/gcc/Multi-Alternative.html (comma in a
constraint string). Thankfully we don't need this powerful construct:)

>> > Also, I still think it may be redundant to move the addition inside the
>> > asm, so long as Clang is happy with the symbol having an offset.
>> >
>>
>> Older Clang is not happy with the symbol having an offset.
>>
>> And given that the key pointer and the 'branch' boolean are two
>> distinct inputs to this function, I struggle to understand why you
>> feel it is better to combine them in the argument. 'branch' is used to
>> decide whether or not to set bit 0, independently of the value of key.
>> Using array indexing to combine those values together to avoid an
>> addition in the asm obfuscates the code.
>
>This was more about not making changes that don't need to be made,
>unless it clearly makes the code better.
>
>But if some verions of Clang accept "S" but choke if there's an offset,
>then moving the addition into the asm seems the way to go.
>
>(I may have misread the commit message on this point.)
>
>[...]
>
>Cheers
>---Dave

I am convinced by Ard' argument that two inputs (key, branch) deserve
two operands.
The existing "i"(&((char *)key)[branch]) is kinda ugly and also longer:)
