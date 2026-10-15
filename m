Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3F3845C1
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078984; cv=none; b=RVvV5HJ36TTPj6fKjR5iHQHH8xzWwNIk74ysLLATWNM38YUDW1uUlXLcZbYO1/aeSTNlUiQj/FJNioxgn6a/Rk0mckZsbYJeINMhLUkKGI/876nzL3x4oWppvojDQnWOK0tjB5/g65d8gFPD4DvEEEWDhuuSAQ3MUrGSE79l+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078984; c=relaxed/simple;
	bh=1fUOi+Usxn2LQcFzjoDicMxQvfperVSbtfIS6t3a0mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZGB8zCEbPDjD3+456Gb0oM+xbRjAgJ9B7QbqejVm8fOkVrXnNAudPQZdD/nTEPaiMtd/cKbCK1KA4X5lh0rJPCVt67dzJBd8HVPTFI4mF9NeDKqVET6Z5gDZXIR2IhZC7xzKt+5uGyLC15cmmGc98oJswLqKKnHk/xeLUoy3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FERv6evq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FERv6evq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so43164695e9.1
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 08:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792078967; x=1792683767; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EVUVXTF9B/pmjVEVo0zfJaBGiZoNVg7V5lse2RyO7M=;
        b=FERv6evqyTcAqY25zKlwW/E9xIwfOtoWbdEE7pA6kd3Uo9sPTban2p0lTkgfohsWVD
         AT5XKTTK758hKfSDvDo2LDzo4Q/UuJfTZFIY+/azs4GkZRO2IhNaplX+fB/sDxU8zRY5
         Y96MGc5kiFEMLuSnVb35IJnm3nqJ03QHF0/sJljlvUnSw8iqWMcoJceuXdefT9514Jpy
         Y4JCOrz1v89S3ETFB83DYSlkKbSzbo1cpSNxMYRdczNnQlytGGffmd/ja6RNJtgeWzNh
         X6kydXp3jY3A9AftRm/PeEXxqo6Awpol6hh7tZs/KOTqyns+z0JFcjU06cpXVhXsBRvG
         LLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078967; x=1792683767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EVUVXTF9B/pmjVEVo0zfJaBGiZoNVg7V5lse2RyO7M=;
        b=n6EWEE5gqDjABIcw/bKu+5sMcj2eXMIT3VrcV7AEPzeUNf041+PVKwhQYKrNJrGxEd
         oHlVfda5yJkBm4mrTWmXOeZudTZIAP0hgQMe8NfjfXjKnS5HkaI9YS6puHHd512fZW0K
         B20AszgchK2YtqNPNgrT+cxB/NyocnwSabbrlwINqpu9DzjyFnF+1AHqh6kxCk7nxXeL
         YTfs8+yMFkBFhJpWJjgHRf0I0ln/DBpS70NZuJAiY83FErlxIthaU5HKjXFuDyHUYsol
         v5HFN84d1By1OlSkQ0L2bl1MdABBUlRPzcv6ChowogXJJIftw2J27B/k1XZPrrNO59CN
         OlSw==
X-Forwarded-Encrypted: i=1; AKwUvBzSwMCVxmJlZdwR1AxCqnGgMK1M5Va6LU3itNmrQeuqk3FdPNNExPHFwqA7v/qzzcdGJ9kL@lists.linux.dev
X-Gm-Message-State: AFq9FYLM8ca2Fc87PcSZTZoo2AMeC52nCdVhpvjU89M7WZlN0ecvglfS
	4xHedMWbwHcuB99Iat/w9X0qNw0s5aXtNS/HI5kmUrd3wnCIDXP5G55aTD4HzIWaYwU=
X-Gm-Gg: AYBFou3wNEdXmrbqr3VqIBq408YPMGTbxKGUnWKTFhnO1Xv4pTIQ1xpGa85XKUGY2A5
	8ymg12l+Ly60WsXOxJJ1r/7/B5TRalOhBIidTnkkBEo094h+jYymZlwg9i+1uPHZsJdMq7rtibL
	13wZiYN5Ny1YA/+xXt+UBk2TfkbLTVeB9fFs4anscvz5KegrKW7VB5UKtvl6uxJrDnQrYTu4FqY
	TyUjsyaLprd06drUnlBpBQ0hbG+tlXZqfhA6G8gRs5Z6qPx34HujnUvBqzQAU7XcGTfqRoHPQsC
	ZWseDDqIZRP037uZVEYDTTXTtYmzX7p1w6DvFo7DsewLYVty714cvCHhnBkaOBkc60Yxc5HhYTK
	QvzRhwqOXBO8zPoMswa0H2kZxjThQ3V892Z2tKAqqXTpiulmg/pEsJMtVOVEtSIUBKCrIyHFYNK
	tRyTvkrjcirYlYkzlXbs0e6pOZ2zg9636gWYVmt6v7IQ5QWza64cqKesdZ/z5Fo8DnLFDP0ZoBK
	5J+OLJvG2G26pXqtovXHtf2ZOPCglNIJyHGUeXC7nWwyQ==
X-Received: by 2002:a05:600c:8b82:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a18e4b887amr354993855e9.27.1792078967287;
        Thu, 15 Oct 2026 08:42:47 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66c5e6sm52172585e9.2.2026.10.15.08.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:42:46 -0700 (PDT)
Message-ID: <d17b00f9-2a6c-425f-9697-6bc8f31f7a7a@suse.com>
Date: Thu, 15 Oct 2026 17:42:45 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/22] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-13-73128809a4a4@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-build-speedup-v4-13-73128809a4a4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 7:18 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

This looks mostly ok to me. Below are some nits you might want to
consider addressing.

> ---
>  scripts/mod/modpost.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 75374c64b8cc..0fd43c8a89ea 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1155,12 +1155,67 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
>  			 name);
>  }
>  
> +/*
> + * mismatch_cache[section index] ->
> + *   0 - uncached.
> + *  -1 - no mismatch.
> + *  >0 - mismatch index + 1.
> + */
> +static int *mismatch_cache;

It might be cleaner to maintain this cache per elf_info, since it
logically belongs to the processing of an individual ELF file. This
would also be consistent with the existing symsearch cache, which uses
elf::symsearch.

The description could use 'to_secndx' instead of 'section index' to
clarify whether it refers to the source or destination section of
a relocation.

> +
> +static void init_mismatch_cache(unsigned int num_sections)
> +{
> +	mismatch_cache = xcalloc(num_sections, sizeof(*mismatch_cache));
> +}
> +
> +static void reset_mismatch_cache(unsigned int num_sections)
> +{
> +	memset(mismatch_cache, 0, num_sections * sizeof(*mismatch_cache));
> +}
> +
> +static void free_mismatch_cache(void)
> +{
> +	free(mismatch_cache);
> +	mismatch_cache = NULL;
> +}
> +
> +static const struct sectioncheck
> +*cache_mismatch(unsigned int secndx, const struct sectioncheck *mismatch)

Similarly here, s/secndx/to_secndx/.

> +{
> +	if (!mismatch) {
> +		mismatch_cache[secndx] = -1;
> +		return NULL;
> +	}
> +
> +	mismatch_cache[secndx] = (mismatch - sectioncheck) + 1;
> +	return mismatch;
> +}
> +
> +static const struct sectioncheck *get_section_mismatch(const char *fromsec,
> +		const struct elf_info *elf, unsigned int secndx)

s/secndx/to_secndx/, and the fromsec and elf arguments could be swapped
for consistency with the rest of the code.

> +{
> +	int cached;
> +
> +	if (secndx >= elf->num_sections)
> +		return section_mismatch(fromsec, sec_name(elf, secndx));
> +
> +	cached = mismatch_cache[secndx];
> +	if (cached < 0)
> +		return NULL;
> +	if (cached > 0)
> +		return &sectioncheck[cached - 1];
> +
> +	return cache_mismatch(secndx,
> +			      section_mismatch(fromsec, sec_name(elf, secndx)));
> +}
> +
>  static void check_section_mismatch(struct module *mod, struct elf_info *elf,
>  				   Elf_Sym *sym,
>  				   unsigned int fsecndx, const char *fromsec,
>  				   Elf_Addr faddr, Elf_Addr taddr)
>  {
> -	const char *tosec = sec_name(elf, get_secindex(elf, sym));
> +	const unsigned int to_secndx = get_secindex(elf, sym);

The const qualifier can be dropped from the to_secndx definition to
match the usual kernel style.

-- 
Thanks,
Petr
