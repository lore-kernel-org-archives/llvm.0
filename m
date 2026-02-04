Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1E27464F;
	Wed,  4 Feb 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770225568; cv=none; b=CCAggONdHudAabKlR5i65BB+xfPdSAQGn/D7zRmp8CPG7k6lyFHgpoSvQUDpVcl8ttTI9QDeT1PKLF2ia77i0ct/3tpjy20zzkalkFaqjv5alrni/HGBoESYImhpYDfsjBLJ5A5eqyRoGbLEmaw9OG48GSa10UbdP7eJVihOHQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770225568; c=relaxed/simple;
	bh=DtHe0dwbusnQaV94dHwbXq/wTSKOEey/tmCSKDwj+wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nalRY7nQJ09BUJOSLDkNC5tvudlGCrJB5pORrfHYpunMHW/1ia0zh8r3tLKof1QejUnuNeM+ux67QxgYZCdIlOqZM/XHmunGUOdFklPM7Z4fbmE5mR7IvjmaIWhKMQIT5d7PYvAD0olIUX92pAXda7NoObo2kw//sCchqmQL3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr0Pw4cU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mr0Pw4cU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7599C4CEF7;
	Wed,  4 Feb 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770225568;
	bh=DtHe0dwbusnQaV94dHwbXq/wTSKOEey/tmCSKDwj+wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mr0Pw4cU9VKIf49Cx5IUekaRAaaJWcVfy4cr6IfmgolfGJgwarXwi7+W2mtY0mUFz
	 T8SUfyk5vmnZi4h84W19N6J6mA0lHMAsnaT54R3ayxcS3w4OMilo/hjFL7mRLQNc4u
	 o/8kHtDxD1wuOvAtf1OQbEoSi4aPLhL25djAeuIXxw7OzbBT9hTh2jiGXBqlaWaEns
	 RL9npkDq+LWQ582cE7X6G+kjwXQ5BDI8U7swO4T9ZbNhNo5PD5CNI7MZ4rFjVB8nZD
	 0Ql3r/znHtrsNeVVmcvfvWw/ZXmJkryBPyN+Mseo8R4zN2I0wiY9lZvVWYnaD7XbgE
	 l4uDcnF4SFtWw==
Message-ID: <6a4799d9-48fe-410e-acad-fe687edebc7e@kernel.org>
Date: Wed, 4 Feb 2026 18:19:19 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add PowerPC support
To: Alice Ryhl <aliceryhl@google.com>, Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>,
 Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYMiXcy33YEVkgYM@google.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aYMiXcy33YEVkgYM@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/02/2026 à 11:41, Alice Ryhl a écrit :
> On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
>> For now only Big Endian 32-bit PowerPC is supported, as that is the only
>> hardware I have.  This has been tested on the Nintendo Wii so far, but I
>> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> Super cool!
> 
>> These changes aren’t the only ones required to get the kernel to compile
>> and link on PowerPC, libcore will also have to be changed to not use
>> integer division to format u64, u128 and core::time::Duration, otherwise
>> __udivdi3() and __umoddi3() will have to be added.  I have tested this
>> change by replacing the three implementations with unimplemented!() and
>> it linked just fine.
> 
> Uh oh this seems tricky. How is this not a problem on arm32 too?
> 
> Perhaps we should just be providing __udivdi3() and __umoddi3() in
> general?

We don't want those functions in the kernel as they are sub-optimal and 
unnecessary. Usually the kernel needs can be covered with do_div() or 
other functions in include/asm-generic/div64.h. If we add those 
functions people will start doing divides blindly in the kernel 
forgetting the huge cost a 64 bits divide has on a 32 bits processor.

> 
>> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
>> index d4eaba459a0e..238f0f625a36 100644
>> --- a/arch/powerpc/include/asm/jump_label.h
>> +++ b/arch/powerpc/include/asm/jump_label.h
>> @@ -15,14 +15,18 @@
>>   #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>>   #define JUMP_LABEL_NOP_SIZE	4
>>   
>> +/* This macro is also expanded on the Rust side. */
>> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
>> +	"1:\n\t"					\
>> +	"nop # arch_static_branch\n\t"			\
>> +	".pushsection __jump_table,  \"aw\"\n\t"	\
>> +	".long 1b - ., " label " - .\n\t"		\
>> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
>> +	 ".popsection \n\t"
>> +

Would be better split in two with a JUMP_TABLE_ENTRY() macro as other 
architectures and as done by Mukesh in its patch, see 
https://lore.kernel.org/r/20260204042417.83903-1-mkchauras@gmail.com

>>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>>   {
>> -	asm goto("1:\n\t"
>> -		 "nop # arch_static_branch\n\t"
>> -		 ".pushsection __jump_table,  \"aw\"\n\t"
>> -		 ".long 1b - ., %l[l_yes] - .\n\t"
>> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
>> -		 ".popsection \n\t"
>> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>>   		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
> In case this patch takes a long time to land, it may make sense to split
> this part out in a separate patch that can land now.
> 
> Also, consider pre-emptively updating arch_static_branch_jump too. We
> probably need it at some point in the future.
> 
>> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
>> index 38b3416bb979..0054880ba0ea 100644
>> --- a/scripts/generate_rust_target.rs
>> +++ b/scripts/generate_rust_target.rs
>> @@ -188,6 +188,16 @@ fn main() {
>>           panic!("arm uses the builtin rustc target");
>>       } else if cfg.has("ARM64") {
>>           panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
>> +    } else if cfg.has("PPC32") {
>> +        ts.push("arch", "powerpc");
>> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
>> +        ts.push("features", "+soft-float");
>> +        ts.push("llvm-target", "powerpc-unknown-eabi");
>> +        if cfg.rustc_version_atleast(1, 91, 0) {
>> +            ts.push("target-pointer-width", 32);
>> +        } else {
>> +            ts.push("target-pointer-width", "32");
>> +        }
> 
> Is there no built-in target we can use? I think we want to avoid adding
> new targets if at all possible.
> 
> Alice

