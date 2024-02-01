Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD015AAB5
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706778687; cv=none; b=ofHWZHwl8kutT8Ec55Wf7ruGq4ummmRDMtxpktYPxppZGYHeOQurNjRwawdbOKtOfB4NfjOH3RvrrteQved3gfs1+wFV2GeTtko8Vf/m0cLUlmT+fqruf+bWdUjwXH3jdyxVG2MXOQz5nrY/OcJYa7meiU/uxDarR+kq6akiiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706778687; c=relaxed/simple;
	bh=z5l8pCabst69rv4xapMz3C1Qz+VTsygJd1zMO6dlE20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRgr30jAGMar339Q5+oz1rKtRE132qM2RE33+bOVbI7dzalyanM3M/91Cl/Di+thUujpQOjV70vRp+tYdjcYR0i9XKEqSNlMS8baGAhfqAWZx4WEWFLcLthhwQBJugiuP7cTAJLZu0ad4nzx9+RXU8sWDxUuTPeC4Frt693bISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbDejUcq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbDejUcq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d89f0ab02bso70995ad.1
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 01:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706778685; x=1707383485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpmw7XD3NRYPmylcKUZIs1amCALm5ceYEkOK13mCobY=;
        b=lbDejUcqtmYpCSlYQKX9kxlW63ITYI1sVHJJhXTVCaTbFFewbH0oMa5P0LvemtbbSx
         Cyodd7lM2iWUyq9WfwrnGq+zW0cP/hqAdFsfVFg4UI/9svg1e7ZeM4KnSY1QHl3Um5Jl
         WjqcXwfNhrDuzoSubmPD7bjUJQd7p9kL4KDRSEW33Ky2j20Ieq1RHj18vbg8RQDGcug2
         ZnXpVTUIOD/5fy1VvtCMmL3gQ56ekyaVn52ufWocOlS5xuFiHngWXZY58rILeWYarGAb
         qAJl45BbGFc1XqszHkNW4gkkRDn6o/IWbPSE+Q53BkUN2L/iHQGyp5h4Ps57vR8D41wo
         Rf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778685; x=1707383485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpmw7XD3NRYPmylcKUZIs1amCALm5ceYEkOK13mCobY=;
        b=w7oC/GSvrzFgT6uZIPhSAhtKA8oN/SRTB8iDOKUYZOI+BKmhdxlgO0eNW88PX6rBha
         sChAT5bztypp08byYFnja3ElIdtwrC3o2cdDI/tvjC0B2KnsWjHXv0q8eojgQgQGdMML
         wFU5gqanQ0SZp8SoDhiPab+jneO5HWNW2rQQH7JnungRKbKXVtFfplAstcvIKjd8tger
         wgY0RNv14OezJwAxA5LDkJruMQY+Q8ueP6Md06Yt/OkxD1utoxuoTWg/PhkEfxyayWCg
         LCndA24APsyI7sMYz734CTqgF8N0Br/O/b/4xL9uoxrIOYtTmgGcdJWdhoQJza6neasc
         KwRA==
X-Gm-Message-State: AOJu0YwSdQp37436tRf+u8jekHLWEOJjDMwiD6rgCAPS9FJtDMxBVrgo
	xSAPyh/t6C3G1lauKB0KGIoOTOK5VxLUd//7DzuX6e0o87TtMWfEskSg7Mzetg==
X-Google-Smtp-Source: AGHT+IG06fzWWaeYjUr/vX4M7gLOO+61jy4fE2PhBPJ64FlHm7t/jb+OVF/nW0ijhlWnHwthdyMMFA==
X-Received: by 2002:a17:902:ced1:b0:1d6:fb94:10d5 with SMTP id d17-20020a170902ced100b001d6fb9410d5mr139335plg.27.1706778685070;
        Thu, 01 Feb 2024 01:11:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUrBRGPWguQv+hECDS45pjyaIr8WcoLrgzXUAgcAytmPpZrNB491a1QBS8h6aAZtuUn0nByGer8flJ9jGXMckawcVjlKBMKWkP/CQpCfPU9xE5+qGj1oxLnTwf3K9wBlb5C6+D0K4nlMvIduKOvkPEjfmy/qA0REshrupZR5iibOO+gT0i33Gy/1yGXoCHXhv3UXQFLpzG7gsZP0Y+8ikQ+P/9gGmfcQXi/Xjd7Ui8FQ6YEpJH1sSHbuUj3x1lssAJEKVcRw4pLQS07A0zf805ludaBv+JjRJxZvpY=
Received: from google.com ([2620:15c:2d3:205:ce95:ce9d:3dd2:5053])
        by smtp.gmail.com with ESMTPSA id l20-20020a170902e2d400b001d8d04a4fa8sm7699490plc.300.2024.02.01.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:11:24 -0800 (PST)
Date: Thu, 1 Feb 2024 01:11:20 -0800
From: Fangrui Song <maskray@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Peter Smith <peter.smith@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: jump_label: use constraint "S" instead of "i"
Message-ID: <20240201091120.pbgr7ng6t2c36fut@google.com>
References: <20240131065322.1126831-1-maskray@google.com>
 <CAMj1kXGzADFWa7RmXyjWpCnQ=9hhz6i-XkN4PS1CboZ-kFL8dQ@mail.gmail.com>
 <ZbpEnDK3U/O24ng0@e133380.arm.com>
 <20240201045551.ajg4iqcajyowl2rh@google.com>
 <CAMj1kXEBjumu3VUySg1cQ+SYm4MugJ5f6pd1f7C0XrLyOWAoOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMj1kXEBjumu3VUySg1cQ+SYm4MugJ5f6pd1f7C0XrLyOWAoOw@mail.gmail.com>

On 2024-02-01, Ard Biesheuvel wrote:
>On Thu, 1 Feb 2024 at 05:55, Fangrui Song <maskray@google.com> wrote:
>>
>> On 2024-01-31, Dave Martin wrote:
>> >On Wed, Jan 31, 2024 at 08:16:04AM +0100, Ard Biesheuvel wrote:
>> >> Hello Fangrui,
>> >>
>> >> On Wed, 31 Jan 2024 at 07:53, Fangrui Song <maskray@google.com> wrote:
>> >> >
>> >> > The constraint "i" seems to be copied from x86 (and with a redundant
>> >> > modifier "c"). It works with -fno-PIE but not with -fPIE/-fPIC in GCC's
>> >> > aarch64 port.
>> >
>> >(I'm not sure of the exact history, but the "c" may be inherited from
>> >arm, where an output modifier was needed to suppress the "#" that
>> >prefixes immediates in the traditional asm syntax.  This does not
>> >actually seem to be required for AArch64: rather while a # is allowed
>> >and still considered good style in handwritten asm code, the syntax
>> >doesn't require it, and the compiler doesn't emit it for "i" arguments,
>> >AFAICT.)
>>
>> The aarch64 one could be inherited from
>> arch/arm/include/asm/jump_label.h (2012), which could in turn be
>> inherited from x86 (2010).
>> Both the constraint "i" and the modifier "c" are generic..
>> For -fno-pic this combination can be used for every arch.
>>
>> >> > The constraint "S", which denotes a symbol reference (e.g. function,
>> >> > global variable) or label reference, is more appropriate, and has been
>> >> > available in GCC since 2012 and in Clang since 7.0.
>> >> >
>> >> > Signed-off-by: Fangrui Song <maskray@google.com>
>> >> > Link: https://maskray.me/blog/2024-01-30-raw-symbol-names-in-inline-assembly
>> >> > ---
>> >> >  arch/arm64/include/asm/jump_label.h | 8 ++++----
>> >> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
>> >> > index 48ddc0f45d22..31862b3bb33d 100644
>> >> > --- a/arch/arm64/include/asm/jump_label.h
>> >> > +++ b/arch/arm64/include/asm/jump_label.h
>> >> > @@ -23,9 +23,9 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
>> >> >                  "      .pushsection    __jump_table, \"aw\"    \n\t"
>> >> >                  "      .align          3                       \n\t"
>> >> >                  "      .long           1b - ., %l[l_yes] - .   \n\t"
>> >> > -                "      .quad           %c0 - .                 \n\t"
>> >> > +                "      .quad           %0 - .                  \n\t"
>> >> >                  "      .popsection                             \n\t"
>> >> > -                :  :  "i"(&((char *)key)[branch]) :  : l_yes);
>> >> > +                :  :  "S"(&((char *)key)[branch]) :  : l_yes);
>> >>
>> >> 'key' is not used as a raw symbol name. We should make this
>> >>
>> >> "    .quad   %0 + %1 - ."
>> >>
>> >> and
>> >>
>> >> ::  "S"(key), "i"(branch) :: l_yes);
>> >>
>> >> if we want to really clean this up.
>> >
>> >This hides more logic in the asm so it's arguably more cryptic
>> >(although the code is fairly cryptic to begin with -- I don't really
>> >see why the argument wasn't written as the equivalent
>> >(char *)key + branch...)
>>
>> I agree that using "S" and "i" would introduce complexity.
>> Using just "S" as this patch does should be clear.
>>
>> All of "i" "s" "S" support a symbol or label reference and a constant offset (can be zero),
>> (in object file, a symbol and an addend; in GCC's term, the sum of a SYMBOL_REF and a CONST_INT).
>>
>
>Taken the address of a struct, cast it to char[] and then index it
>using a boolean is rather disgusting, no?

I agree with you.

Hmm. Clang's constraint "S" implementation doesn't support a constant
offset, so
`static_key_false(&nf_hooks_needed[pf][hook])` in include/linux/netfilter.h:nf_hook
would not compile with Clang <= 18.

I have a patch https://github.com/llvm/llvm-project/pull/80255 , but
even if it is accepted and cherry-picked into the 18.x release branch,
if we still support older Clang, we cannot use "S" unconditionally.


So we probably need the following to prepare for -fPIE support in the
future:

diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index 48ddc0f45d22..b8af2f8b0c99 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -15,6 +15,16 @@
  
  #define JUMP_LABEL_NOP_SIZE		AARCH64_INSN_SIZE
  
+/*
+ * Prefer "S" to support PIC. However, use "i" for Clang 18 and earlier as "S"
+ * on a symbol with a constant offset is not supported.
+ */
+#if defined(CONFIG_CC_IS_CLANG) && __clang_major__ <= 18
+#define JUMP_LABEL_STATIC_KEY_CONSTRAINT "i"
+#else
+#define JUMP_LABEL_STATIC_KEY_CONSTRAINT "S"
+#endif
+
  static __always_inline bool arch_static_branch(struct static_key * const key,
  					       const bool branch)
  {
@@ -23,9 +33,9 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
  		 "	.pushsection	__jump_table, \"aw\"	\n\t"
  		 "	.align		3			\n\t"
  		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 + %1 - .		\n\t"
  		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  JUMP_LABEL_STATIC_KEY_CONSTRAINT(key), "i"(branch) :  : l_yes);
  
  	return false;
  l_yes:
@@ -40,9 +50,9 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
  		 "	.pushsection	__jump_table, \"aw\"	\n\t"
  		 "	.align		3			\n\t"
  		 "	.long		1b - ., %l[l_yes] - .	\n\t"
-		 "	.quad		%c0 - .			\n\t"
+		 "	.quad		%0 + %1 - .		\n\t"
  		 "	.popsection				\n\t"
-		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
+		 :  :  JUMP_LABEL_STATIC_KEY_CONSTRAINT(key), "i"(branch) :  : l_yes);
  
  	return false;
  l_yes:


>> >Anyway, I don't think the "i" versys "S" distinction makes any
>> >difference without -fpic or equivalent, so it is not really relevant
>> >for the kernel (except that "S" breaks compatibility with older
>> >compilers...)
>> >
>> >
>> >I think the main advantage of "S" is that it stops you accidentally
>> >emitting undesirable relocations from asm code that is not written for
>> >the -fpic case.
>> >
>> >But just changing "i" to "S" is not sufficient to port asms to -fpic:
>> >the asms still need to be reviewed.
>> >
>> >
>> >So unless the asm has been reviewed for position-independence, it may
>> >anyway be better to stick with "i" so that the compiler actually chokes
>> >if someone tries to build the code with -fpic.
>>
>
>The virtual address of the kernel is randomized by KASLR, which relies
>on PIE linking, and this puts constraints on the permitted types of
>relocations.
>
>IOW, we basically already build the kernel as PIC code, but without
>relying on -fPIC, because that triggers some behaviors that only make
>sense for shared objects in user space.
>
>> >Since we are not trying to run arbitraily many running kernels in a
>> >common address space (and not likely to do that), I'm not sure that we
>> >would ever build the kernel with -fpic except for a few special-case
>> >bits like the EFI stub and vDSO... unless I've missed something?
>> >
>
>Yes, KASLR. The number of kernels is not the point, the point is that
>the virtual load address of the kernel is usually decided at boot, and
>so the code needs to be generated to accommodate that.
>
>> >If there's another reason why "S" is advantageous though, I'm happy to
>> >be corrected.
>>
>> I remember that Ard has an RFC
>> https://lore.kernel.org/linux-arm-kernel/20220427171241.2426592-1-ardb@kernel.org/
>> "[RFC PATCH 0/2] arm64: use PIE code generation for KASLR kernel"
>> and see some recent PIE codegen patches.
>>
>> > Building the KASLR kernel without -fpie but linking it with -pie works
>> > in practice, but it is not something that is explicitly supported by the
>> > toolchains - it happens to work because the default 'small' code model
>> > used by both GCC and Clang relies mostly on ADRP+ADD/LDR to generate
>> > symbol references.
>>
>> I agree that current -fno-PIE with -shared -Bsymbolic linking is a hack
>> that works as a conincidence, not guaranteed by the toolchain.
>> This jump_label improvement (with no object file difference) fixes an
>> obstacle.
>
>If we can get the guaranteed behavior of #pragma GCC visibility
>push(hidden) from a command line option, we should build the core
>kernel with -fpie instead. (Modules are partially linked objects, so
>they can be built non-PIC as before)
>

I believe we don't have such a GCC option, but the effect can be
simulated by -include hidden.h ...
