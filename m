Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2618A6BA
	for <llvm@lists.linux.dev>; Wed,  5 Feb 2025 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799164; cv=none; b=O99vnz3fSvB+Vfw9ZpKwsWuAgzK3xJQHUHbzszq70e741JyXgk2sJB4jTm2kZb56K/BOwHVW0rQDqBC3wrUMFlVe9i57tN5ZMjAwlnIuRm4mmpF2qorJ34crHcHZY2FkmexeZb2l7y6kdOBy3VoV4I73F7w0evWLsJgrGNv936s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799164; c=relaxed/simple;
	bh=MrDuwIcA4TUWgBdw7ZNSSQ8hvV3j4q9ZV/wFeQ7mJKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8nezY21DbJDxAUA9msP68caRfAiyRUdO0WOW7YX58J+Utk9Egw+aEYjo7fj2UaqBMm2B7KTZt8Hp4RmJssp9IkXrGH2AhD2V9JFxkfghG1yXs4gg8CpTmwHZUAlBzlbQFKO7GTU2BrKx2Z0lXKV3lg5TB3wiTbXYTm48rzqSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWM+NJCB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWM+NJCB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38db909acc9so220019f8f.0
        for <llvm@lists.linux.dev>; Wed, 05 Feb 2025 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799160; x=1739403960; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=DWM+NJCB0rP+cXkVcyyDwQEupuqHOFjQRQDty+f8l2vvn1gnBaBi4ZZm4IeaVAboXp
         eqO3mTCBWSCfwk8xpxwS/Yc0/wBo6NAVE50t3pLyoKmQN1Jvo3afjyYRyWof7VDllKUA
         7NFACzqB02tjO2EC75IRm1FggejsV50AFcvYKTlUrQUg/h26br85ffqPxEh4iDNgcmUl
         KQLcI1SABW3cnt2B0Yo/R//DO4OOAySxhiVXUwJwc+YrmXOn8bOwp/xK7KHlSn/lEdX+
         dkkRcHkSNY2+7fLTD3oftisN0qNouuPb3QZqO+MmMJu4uFi7GGXgWG7aakymk3pHBwSl
         Pb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799160; x=1739403960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=sVFt6DC6FpsGaqZoa/YurNWdKKioNx/Z1SlXyWgRAiC93dUDunjt/LrKQ3NvIxcC5b
         yXvs9MyhHgwNUXRSVb6fvJAr4ONVGS+cBYTukDwZ0J7CpaBmkNHfX9+PfV6WKd9Jh/ql
         KOw4AZQ6iG4MLoHKF3HRxiNI3J4Zmb7zx2mJ5K52eGrRYbVrKfJ4BWmkiQDA/owensxX
         SWSCcA9lUO75jJR3JK4RKubb50JlshktRE5swtcoj3fiZ7vuot6GXmxO9vVs6OvfB0m0
         EU2tM2wrVnATp0iKX9ZSVxAMV63wbaUAR7J4tNjWBi5P8o4kg+gx27440DLxkIbCEnNT
         f+NA==
X-Forwarded-Encrypted: i=1; AJvYcCUeiiiyW8VUi84fEgHHEHOyngtxUEUmeNRVcZsEzi4I6vVMx0SWWjLEBFLBq+wBgNcJaic5@lists.linux.dev
X-Gm-Message-State: AOJu0YyTYFE8sh+ESfwEgXpGB/Y+rAO1a3SQ6DYSbRjDAMmQVgnFX+WL
	gfuJDppuHcwMZ+Pva1cVRqt951nQGKNJ2aWs2UdROc84d7HJ9BO3illbzBtSNXLy4FQ0I4Vebht
	bewekI1EoaSeWt9KzW2M6g/mt95A=
X-Gm-Gg: ASbGncveQkZJuOvksWNf+P/oKiAn4z9Ipek1ujT+GMA5RtLO24zd7i6fyA7y5JOfyI8
	FJHu5eq4qNyE53PcR+CJgtRywr6YyA66NkvPG/ovRFMYXZo6E7Vx/cvXDKmM/WWEf3Pa2UkKeRA
	==
X-Google-Smtp-Source: AGHT+IGbg8frwCmtZh2Cq1mQ+7gcdTinnbG3Ybu+Qvbg9VC2A4roSQzA7Y8T7x0Do1hYoZdYgXjogJqzzmDtvH5wZas=
X-Received: by 2002:a05:6000:1786:b0:385:f0dc:c9f4 with SMTP id
 ffacd0b85a97d-38db48bdaecmr3897521f8f.20.1738799160206; Wed, 05 Feb 2025
 15:46:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:45:49 +0100
X-Gm-Features: AWEUYZm-2kNDPAYBLLDAqKKnZZXufvhPekieyoATWEHpiTcF4DB1S0LSkY8umDA
Message-ID: <CA+fCnZfKQwNWbYEhk70ykT1+cnibCBnvZJrhAMvu_b0Y8xZTSg@mail.gmail.com>
Subject: Re: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:36=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> In KASAN's generic mode the default value in shadow memory is zero.
> During initialization of shadow memory pages they are allocated and
> zeroed.
>
> In KASAN's tag-based mode the default tag for the arm64 architecture is
> 0xFE which corresponds to any memory that should not be accessed. On x86
> (where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
> during the initializations all the bytes in shadow memory pages should
> be filled with 0xE or 0xEE if two tags should be packed in one shadow
> byte.
>
> Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
> avoid zeroing out the memory so it can be set with the KASAN invalid
> tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  arch/x86/mm/kasan_init_64.c | 19 ++++++++++++++++---
>  include/linux/kasan.h       | 25 +++++++++++++++++++++++++
>  mm/kasan/kasan.h            | 19 -------------------
>  3 files changed, 41 insertions(+), 22 deletions(-)
>
> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 9dddf19a5571..55d468d83682 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -35,6 +35,18 @@ static __init void *early_alloc(size_t size, int nid, =
bool should_panic)
>         return ptr;
>  }
>
> +static __init void *early_raw_alloc(size_t size, int nid, bool should_pa=
nic)
> +{
> +       void *ptr =3D memblock_alloc_try_nid_raw(size, size,
> +                       __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE,=
 nid);
> +
> +       if (!ptr && should_panic)
> +               panic("%pS: Failed to allocate page, nid=3D%d from=3D%lx\=
n",
> +                     (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
> +
> +       return ptr;
> +}
> +
>  static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
>                                       unsigned long end, int nid)
>  {
> @@ -64,8 +76,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsig=
ned long addr,
>                 if (!pte_none(*pte))
>                         continue;
>
> -               p =3D early_alloc(PAGE_SIZE, nid, true);
> -               entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
> +               p =3D early_raw_alloc(PAGE_SIZE, nid, true);
> +               memset(p, PAGE_SIZE, kasan_dense_tag(KASAN_SHADOW_INIT));
> +               entry =3D pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL)=
;
>                 set_pte_at(&init_mm, addr, pte, entry);
>         } while (pte++, addr +=3D PAGE_SIZE, addr !=3D end);
>  }
> @@ -437,7 +450,7 @@ void __init kasan_init(void)
>          * it may contain some garbage. Now we can clear and write protec=
t it,
>          * since after the TLB flush no one should write to it.
>          */
> -       memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> +       kasan_poison(kasan_early_shadow_page, PAGE_SIZE, KASAN_SHADOW_INI=
T, false);
>         for (i =3D 0; i < PTRS_PER_PTE; i++) {
>                 pte_t pte;
>                 pgprot_t prot;
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 83146367170a..af8272c74409 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -151,6 +151,31 @@ static __always_inline void kasan_unpoison_range(con=
st void *addr, size_t size)
>                 __kasan_unpoison_range(addr, size);
>  }
>
> +#ifdef CONFIG_KASAN_HW_TAGS
> +
> +static inline void kasan_poison(const void *addr, size_t size, u8 value,=
 bool init)
> +{
> +       if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> +               return;
> +       if (WARN_ON(size & KASAN_GRANULE_MASK))
> +               return;
> +
> +       hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
> +}
> +
> +#else /* CONFIG_KASAN_HW_TAGS */
> +
> +/**
> + * kasan_poison - mark the memory range as inaccessible
> + * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> + * @size - range size, must be aligned to KASAN_GRANULE_SIZE
> + * @value - value that's written to metadata for the range
> + * @init - whether to initialize the memory range (only for hardware tag=
-based)
> + */
> +void kasan_poison(const void *addr, size_t size, u8 value, bool init);
> +
> +#endif /* CONFIG_KASAN_HW_TAGS */

Please keep kasan_poison() and kasan_unpoison() in mm/kasan/kasan.h:
these are intended as internal-only functions (perhaps, we should add
this into the comment). Instead, add a purpose-specific wrapper
similar to the ones in include/linux/kasan.h.


> +
>  void __kasan_poison_pages(struct page *page, unsigned int order, bool in=
it);
>  static __always_inline void kasan_poison_pages(struct page *page,
>                                                 unsigned int order, bool =
init)
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index a56aadd51485..2405477c5899 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -466,16 +466,6 @@ static inline u8 kasan_random_tag(void) { return 0; =
}
>
>  #ifdef CONFIG_KASAN_HW_TAGS
>
> -static inline void kasan_poison(const void *addr, size_t size, u8 value,=
 bool init)
> -{
> -       if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> -               return;
> -       if (WARN_ON(size & KASAN_GRANULE_MASK))
> -               return;
> -
> -       hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
> -}
> -
>  static inline void kasan_unpoison(const void *addr, size_t size, bool in=
it)
>  {
>         u8 tag =3D get_tag(addr);
> @@ -497,15 +487,6 @@ static inline bool kasan_byte_accessible(const void =
*addr)
>
>  #else /* CONFIG_KASAN_HW_TAGS */
>
> -/**
> - * kasan_poison - mark the memory range as inaccessible
> - * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> - * @size - range size, must be aligned to KASAN_GRANULE_SIZE
> - * @value - value that's written to metadata for the range
> - * @init - whether to initialize the memory range (only for hardware tag=
-based)
> - */
> -void kasan_poison(const void *addr, size_t size, u8 value, bool init);
> -
>  /**
>   * kasan_unpoison - mark the memory range as accessible
>   * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> --
> 2.47.1
>
