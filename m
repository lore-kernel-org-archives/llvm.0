Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545323;
	b=m/s0gFNd1F9F1P9OgOY05/c6PrUUPGzWPWnebkLru+LJwvr6uxm09KmIkOAGxsJpe1ZM
	 n8EBCQI6OefJRsZCSe0Ac+SS+4auefJetYl7HvSs617VUibktig+QLm5FuXGwOPSe4J/q
	 fj4Z10iN264sMRPUVK+ZerJjWg5bmL1yqjdhlpIxUpGnfbL0OqEO80M8P735D26pJe/zl
	 Gnc42TdaH5l5oy1hUd4voOFxJlGC4a9U+xYdWczS5tu1SVj/kd3vtOh3I4q0uEdBKFHOB
	 7mEgZxtGBE6dG23xIZuYruh/wTk6wtLmTH8QU1UtPt27RHdUdIpECxW5owH4y/07oGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545323;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZD9tL3vMl3UtRiIJdtxpjqUODfVXA7ba8Z8pqs7VXsE=;
	b=3OmFfJedxEE3MC8qQrzf94vFk2sMLcOC5hC7Q3eAwp8DaChWYy6R385qqgGHgWIyM3LM
	 RZjim/l43nxep0vKCmHiT8kVU9Y5WEEflsmq/SlH8LkkAyoz9C1Gec5UDueYEf4UVyGn2
	 z6peAdkVVBtvEVyQ6c82zy5D8Dw2fwvFSbPNgh3KfNYRR5Z7VCHusaUAa71PpSY5vf5/K
	 vLGeMSqPiNCVXymVBsC34MEVxD40Adat5kY/AGx44qicwKelLmXWNnTVZAUIN1/fZyhje
	 rj0GT5cl5ChU0eBIME0it+SKnSSvJE41HGYUqblFnWFUfQPhoe0SBPeEzH3e4acfyFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRZrSkvk;
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6583606A335
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 18:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6583606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRZrSkvk
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=GRQQ4ERdsiUnnr2qKIeSLtPr4xietU4WPx/E9/lU1Gg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795545320; v=1; x=1796150120;
 b=ZRZrSkvkvM15n3n9+2hAH3EykW0el0ReQMlCL9td8F7nqqmuZWg6w5sA5Neny4EU5g3sLMkk
 Kv6v6yvptu7mpuG1pCUWXjsputFT13apaq78gl2nfP56itxPmxncalT3HgyHtkwv3PVhlbowqzl
 MOtIWs7AFEZlDg9zueH7a28E=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 695234c76aa59047;
	Tue, 24 Nov 2026 18:35:18 +0000
X-Mizu-Trace-ID: 695234c76aa59047
X-Migadu-Flow: FLOW_OUT
Message-ID: <59a0bc6a-61d2-462c-92c5-445d29298d85@linux.dev>
Date: Tue, 24 Nov 2026 10:35:08 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] percpu: do not put btf_type_tag on per-cpu variable
 declarations
To: dennis@kernel.org, tj@kernel.org, cl@gentwo.org
Cc: chris@chrisdown.name, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev,
 eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 llvm@lists.linux.dev
References: <20261117220824.609017-1-vineet.gupta@linux.dev>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261117220824.609017-1-vineet.gupta@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 2:08 PM, Vineet Gupta wrote:
> __percpu carries BTF_TYPE_TAG(percpu), which records that a pointer
> points to per-cpu memory. __PCPU_ATTRS() applies __percpu to the per-cpu
> variable itself, so DECLARE_PER_CPU() and DEFINE_PER_CPU() put the tag in
> declaration specifier position on the variable's own type.
>
> arch/x86/include/asm/processor.h has
>
> 	DECLARE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
>
> which an x86 defconfig preprocesses to
>
> 	extern __seg_gs __attribute__((btf_type_tag("percpu")))
> 	__attribute__((section(".data..percpu" "..read_mostly")))
> 	__typeof__(struct cpuinfo_x86) cpu_info;
>
> and GCC warns:
>
> 	processor.h:232:36: warning: ignoring attributes applied to
> 	'struct cpuinfo_x86' after definition [-Wattributes]
>
> which -Werror turns into a build failure.
>
> The compiler is right to object to a type tag on the aggregate, and the
> issue is fundamental: every variant of an aggregate shares one DIE, so
> there is nowhere to put it. clang drops it silently and GCC warns.
>
> The tag is meant to record that a pointer points to per-cpu memory, and
> cpu_info is not a pointer.
>
> And this gets worse: for a pointer-typed per-cpu variable GCC attaches
> the tag to the pointee, so
>
> 	static DEFINE_PER_CPU(struct bpf_hrtimer *, hrtimer_running);
>
> comes out as PTR -> TYPE_TAG 'percpu' -> struct bpf_hrtimer. The truth
> is the other way round: hrtimer_running lives in per-cpu memory and
> points at ordinary memory, while that record says it is an ordinary
> pointer to per-cpu memory. clang emits no tag there at all.
>
> Add __percpu_var, which skips the btf tag (__percpu under sparse) and
> use it in __PCPU_ATTRS(). The cpu_info declaration above becomes
>
> 	extern __seg_gs
> 	__attribute__((section(".data..percpu" "..read_mostly")))
> 	__typeof__(struct cpuinfo_x86) cpu_info;
>
> The pointer spelling, T __percpu *p, is unchanged and keeps its tag.
>
> Before this patch the tag also qualified the variable's type, so &var
> had type "T __percpu *", and a pointer does have a DIE of its own:
> pahole emitted PTR -> TYPE_TAG 'percpu' -> T for each one.
> this_cpu_ptr(&var) is that shape, and that is where the records came
> from.
>
> Those are the records an x86 defconfig built with clang loses: 280 BTF
> types, 140 TYPE_TAG and the 140 pointers carrying them, with .BTF
> shrinking by 3360 bytes. They are the derived pointers -- clang never
> recorded the declarations themselves. None of them were reachable: a
> record points at a type only if something is declared with it, and
> nothing is declared with these. The 803 places that do declare a
> "T __percpu *" keep theirs -- the 110 tagged pointers that something
> references are the same before and after. .text is byte-identical.
>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

If this patch is OK can someone pick this up please. I'm not sure what 
subsys?

Thx,
-Vineet


> ---
> Changes in v2:
>   - Dropped the "message is confusing" sentence: GCC's "after definition"
>     refers to the definition of struct cpuinfo_x86, not to the declaration
>     of cpu_info, so the message is accurate (Chris Down).
>   - Dropped 2/2, "local_lock: do not put btf_type_tag on the lock guard
>     type". Only the tag on the typedef generates a warning, and that
>     needs a GCC fix [1] anyway. The pointer usage "T __percpu *" is fine
>     (Chris Down).
>   - Rebased onto v7.4-rc2.
>
> RFC: https://lore.kernel.org/r/20261110012235.1024461-1-vineet.gupta@linux.dev/
>
> [1] https://inbox.sourceware.org/gcc-patches/20261112191815.884167-1-vineet.gupta@linux.dev/
>
>   include/linux/compiler_types.h | 8 ++++++++
>   include/linux/percpu-defs.h    | 2 +-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index c5921f139007..b250d6870324 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -50,6 +50,7 @@
>   # define __user		__attribute__((noderef, address_space(__user)))
>   # define __iomem	__attribute__((noderef, address_space(__iomem)))
>   # define __percpu	__attribute__((noderef, address_space(__percpu)))
> +# define __percpu_var	__percpu
>   # define __rcu		__attribute__((noderef, address_space(__rcu)))
>   static inline void __chk_user_ptr(const volatile void __user *ptr) { }
>   static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
> @@ -68,7 +69,14 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
>   #  define __user	BTF_TYPE_TAG(user)
>   # endif
>   # define __iomem
> +/*
> + * btf_type_tag records "points to per-cpu memory", so it belongs on the
> + * pointer spelling only. Declaring the per-cpu variable itself puts the tag
> + * in declaration specifier position, where clang drops it and GCC attaches it
> + * to the wrong type, so __percpu_var leaves it out.
> + */
>   # define __percpu	__percpu_qual BTF_TYPE_TAG(percpu)
> +# define __percpu_var	__percpu_qual
>   # define __rcu		BTF_TYPE_TAG(rcu)
>   
>   # define __chk_user_ptr(x)	(void)0
> diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
> index dbe3267a0a13..f53fc430aaad 100644
> --- a/include/linux/percpu-defs.h
> +++ b/include/linux/percpu-defs.h
> @@ -45,7 +45,7 @@
>    * that section.
>    */
>   #define __PCPU_ATTRS(sec)						\
> -	__percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
> +	__percpu_var __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
>   	PER_CPU_ATTRIBUTES
>   
>   #define __PCPU_DUMMY_ATTRS						\

