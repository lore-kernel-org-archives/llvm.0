Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2216046D57C;
	Wed,  5 Aug 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934622; cv=none; b=DRn9Ptod8NQQOLocSilpohykyh5v0m48bAbgNGsGL8c8oBErtsUFCN/gMgUlCOfuLiCDS068F4kyGZFPLexO1hTHFzgdE4F2HbkiSht5dCoXNv74q8Fp9uTUvDbjODJkzfS7KTGaTTASGAG3wt77FT15mzVVMIFVhFDbiERSZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934622; c=relaxed/simple;
	bh=p0twuRWJ8uycwzsjOOm1b3Zo+AKXNJAF083u54/qqDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHnuW6OBD3s9b1pY3K3K7rxjeIdGidTmqtqwQ14I4AegvBbwUoE5yVVBb1WhEfGkRHLSCwrkyIqgtvT3GeFcXu+1gCaJOo6xEjhlZdwzz3lNEs5pS239JBGxqsB3GvReA8m4eMkXuaTJ2hkgbh00wkpGuXpmA/HHQ7sHGWyGA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Anioibwu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Anioibwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0801F00A3E;
	Wed,  5 Aug 2026 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934620;
	bh=YFATTYMHaqzZjbRgAS5gchqmnq4INnTFQL5meIkL3P0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AnioibwuiNfUKvIMwFOZlUoMKROErwHnkh/ugizWQDyoH61TxV7pFUA9xoaxIgTQH
	 DP4ZeaY7v3qsA8C79AjEaeI+d6zCQ1eBRcQpaq2HP+FRYXzBNLFh06rcLdGrv9JqPL
	 RPtTV3rRFhfUm96jQNCjztZOBfYvRq1OMyeart09EVOAlGMag8FIkfiN4wPld2eIHy
	 lKGK+qYnKNQHu3iq5a3LQkzC4EBFGYt7SOYnzfVfqPoFNCr7gW3R90hEjrqMBF8Ii1
	 mHI0a03Disds30l3BNjsuUtqYbmaAjak2BVCfBt+d6s6xRcEFviUKD36C+0veCn5p6
	 2Yb4NGHxt7qcw==
Message-ID: <d347de18-10ee-41e9-a672-b08f70bc88e4@kernel.org>
Date: Wed, 5 Aug 2026 14:56:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
To: FUJITA Tomonori <tomo@flapping.org>, linkmauve@linkmauve.fr
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
 aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, fujita.tomonori@gmail.com, joelagnelf@nvidia.com,
 gregkh@linuxfoundation.org, prafulrai522@gmail.com, nsc@kernel.org,
 japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net,
 airlied@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, mkchauras@gmail.com
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804.224035.269658578200153488.tomo@flapping.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260804.224035.269658578200153488.tomo@flapping.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/08/2026 à 15:40, FUJITA Tomonori a écrit :
> [Vous ne recevez pas souvent de courriers de tomo@flapping.org. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Tue, 4 Aug 2026 12:11:57 +0200
> Link Mauve <linkmauve@linkmauve.fr> wrote:
> 
>> Hi,
>>
>> On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
>>> On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
>>>> Enable experimental rust support for ppc64le and ppc32be. The patch for
>>>> ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
>>>> merged over it. ppc32 needs some toolchain fixes mentioned in the patch
>>>> `rust: Add PowerPC support` and the discussion for that is done here[1].
>>>>
>>>> This has been tested on
>>>> - powernv9 hardware
>>>> - pseries P11 hardware
>>>> - pseries(9, 10) qemu
>>>> - powernv(9, 10) qemu
>>>> - rustdoc on x86 and powerpc64le
>>>> - rusttest on x86 and powerpc64le
>>>>
>>>> [...]
>>>
>>> Applied to powerpc/next.
>>>
>>> [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2F00cdfd072c709c608606461d7d44d4613119bfa9&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617198585%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=4qQe1qS37TGv6%2Bf9H56kWVqMYSAHsWiDx5oz8WHZ8%2Bg%3D&reserved=0
>>> [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2Fbe809b60cbb61aab96179f44ac3670242ae72996&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617235654%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cw2l64D3ah%2FM3pxFmvMpUnNmcqcSvN3RFoDiYAIR76g%3D&reserved=0
>>> [3/7] powerpc/jump_label: adjust inline asm to be consistent
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2F13244c0a40139fe66c4c5c5655f4d732a6002957&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617259593%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xNvcH9k5RA5ktJupn90VdDuwx4YBvezuDcapqKlYfjs%3D&reserved=0
>>> [4/7] rust/powerpc: Set min rustc version for powerpc
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2Fe299147cdc8e19c6421a6b7863dc82a35b09d967&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617280683%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uNZA7AulROQGv%2B2l4M%2FqC5W4ncWktRoSRRp8eaF%2FcCY%3D&reserved=0
>>> [5/7] rust: Make __udivdi3() and __umoddi3() panic
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2Fc93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617303292%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=znZPWXM7k5FpRlekIyUN1bHzmMyk1YESR56WsiwBuMA%3D&reserved=0
>>> [6/7] rust: Add PowerPC support
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2F73b741adb264967093ef4eb59905618a7e0d0de0&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617326590%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=aFHGhd7RX%2Ft5%2BMjqt6pBmIKPKAKmFEQndKP1F%2F8HSxk%3D&reserved=0
>>> [7/7] powerpc: Enable Rust for ppc64le
>>>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpowerpc%2Fc%2Fbc87cbdb952e9223616b839d64bdb4723aa2ed1d&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C34e4deafcc1d41c1738a08def22e01b0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639214476617346994%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ITEFv9C1CSUVLqJNe5Y8sStUE3KoOVYVzSzbP0qis74%3D&reserved=0
>>>
>>> cheers
>>>
>>
>> I just tested those again in linux-next, with the Wii support series on
>> top, but now the kernel fails to build due to ARCH_WARN_ASM and
>> ARCH_WARN_REACHABLE not being defined on PowerPC:
>> ```
>> error: no rules expected `ARCH_WARN_ASM`
>>     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
>>      |
>>    1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
>>      |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
>>      |
>>     ::: ../rust/kernel/lib.rs:279:1
>>      |
>> 279 | macro_rules! concat_literals {
>>      | ---------------------------- when calling this macro
>>      |
>>      = note: while trying to match sequence start
>>
>> error: no rules expected `ARCH_WARN_REACHABLE`
>>     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
>>      |
>>    1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
>>      |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
>>      |
>>     ::: ../rust/kernel/lib.rs:279:1
>>      |
>> 279 | macro_rules! concat_literals {
>>      | ---------------------------- when calling this macro
>>      |
>>      = note: while trying to match sequence start
>>
>> error: aborting due to 2 previous errors
>> ```
>>
>> This is in addition to the bindings::kvfree_call_rcu() call, but that
>> one is already being handled in a different thread.
> 
> Looks like powerpc needs something like the followings:
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 0db48977c70c..8aba39e0cf26 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -32,34 +32,38 @@
>   #endif /* verbose */
> 
>   #else /* !__ASSEMBLER__ */
> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> -   sizeof(struct bug_entry), respectively */
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#define _EMIT_BUG_ENTRY                                \
> +#define _EMIT_BUG_ENTRY(file, line, flags)     \
>          ".section __bug_table,\"aw\"\n"         \
>          "2:     .4byte 1b - .\n"                \
> -       "       .4byte %0 - .\n"                \
> -       "       .short %1, %2\n"                \
> -       ".org 2b+%3\n"                          \
> -       ".previous\n"
> +       "       .4byte " file " - .\n"          \
> +       "       .short " line ", " flags "\n"
>   #else
> -#define _EMIT_BUG_ENTRY                                \
> +#define _EMIT_BUG_ENTRY(file, line, flags)     \
>          ".section __bug_table,\"aw\"\n"         \
>          "2:     .4byte 1b - .\n"                \
> -       "       .short %2\n"                    \
> -       ".org 2b+%3\n"                          \
> -       ".previous\n"
> +       "       .short " flags "\n"
>   #endif
> 
>   #define BUG_ENTRY(cond_str, insn, flags, ...)          \
>          __asm__ __volatile__(                           \
>                  "1:     " insn "\n"                     \
> -               _EMIT_BUG_ENTRY                         \
> +               _EMIT_BUG_ENTRY("%0", "%1", "%2")       \
> +               ".org 2b+%3\n"                          \
> +               ".previous\n"                           \
>                  : : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),        \
>                    "i" (flags),                          \
>                    "i" (sizeof(struct bug_entry)),       \
>                    ##__VA_ARGS__)
> 
> +#define ARCH_WARN_ASM(file, line, flags, size)         \
> +               "1:     twi 31, 0, 0\n"                 \
> +               _EMIT_BUG_ENTRY(file, line, flags)      \
> +               ".org 2b+" size "\n"                    \
> +               ".previous\n"

Will this build ? Isn't ARCH_WARN_ASM() for use in ASM .S files ? 
_EMIT_BUG_ENTRY is defined in a !__ASSEMBLER__ ifdef.

powerpc already has EMIT_BUG_ENTRY macro for ASM for that. Why do you 
need to modify _EMIT_BUG_ENTRY and BUG_ENTRY() which are for C only (in 
a #ifdef !__ASSEMBLER__) ?

https://elixir.bootlin.com/linux/v7.2-rc5/source/arch/powerpc/include/asm/bug.h#L10

Christophe

