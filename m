Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A22ED151
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852478; cv=none; b=tO7IJRX5iPWVjWSE3ysgkzk8gCUV8ohvSRDxeAgkWnImO7UaeP1wIKNiDF4iX1WboB3mHOpYc2BeheeAZSdiiwegc9B0Fnx6UqGVgW6cwvFtYk23UsxLZM9v3UFCd7BsEqyqgAUE+JUG/ixyD/Dnz9AqfpXazlec30fS8wV6lCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852478; c=relaxed/simple;
	bh=+fuZTmVdwbIHymrZKqGvMnKmh2q+5Yh8TQx/OG4Qt8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvLi/3mi8VwOIxnfBf0IkvVg2jwZlFy+qn27Wx8BcAUmLyVSmSzWgMg08cDZMrIq9qOKAbfaGroPC/wiR9TuNOsggArN9m/a7AV7Ww0STKfOJQWHuKzGFnX4WBVrsTqBCBau9Z7V2rrYLSnuI9KePE3HciIPuQN8l9qoyWlK+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qiK2kyoR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qiK2kyoR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4eda6a8cc12so30684301cf.0
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852474; x=1763457274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZTy2q2TNTCA3OHKdlCs5XdCV4IXpZdhN+lpNGYPqtA=;
        b=qiK2kyoRzkjbH2FM67vWaKQDKZXDljYBGxnBj4E9ngn0p9E20n9TwUHEbGQlE9d0TU
         iSIbSg823xborDKwyYxrE+VyOL/l47NsdeBV4kSruWzXqo2YrVgAXiziAPifeYr+BFUb
         NpJOq2UfTufI6d8MOTXQvEHHH1t4arhYw7PPqt7mtNWo5uD0ekr9vaj1xmtR3TDjxq3t
         IWiZLHZK/w748wu99nH4u6igTzgiwIj1GAYbSSfSMTNw5nNdtAK3L4T5B0XEDn6KScz9
         Q2W+4e7AMmo8Tf3zzG/dfWwGKsYC/KU8ZUV2jKkTzgTZIxmwNcN7R9ogvcEJ1JABDNr9
         VhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852474; x=1763457274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZTy2q2TNTCA3OHKdlCs5XdCV4IXpZdhN+lpNGYPqtA=;
        b=tkb2MVqjyy6aLiYF5npdhi/B4aYPI+PNr6hopIdrV/99NLhpZGCB+1/5AbZ2vAvWhp
         Vl5CZXkRGthxFz+XRpSB7SL+Fx7FE/eaQDDwF5oAQm1OAODPoz7No8Oj1ShJD663V2xL
         aQLxOBB7aO/d2xX/TyEMi76HbeWKOcyR2k9SBmAzmGlOdr/3zycXpFQeSaJusLArhKy5
         TrBhO6BIlWIaBc0IcFWGuWHeJo7+jd3bN2072PMzWlCkDMFgF8gtoazLQ0FunjSl6CWT
         vTDo0kslHqBHFAuTMKQvkln5RcsWnziavMgpW5OihbQDzCS4Ne6qRGJ2VEYbpDqq7P08
         l+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwuFJMCVdpc920q3bM5MCKktmggzjcPshKkE/b06msILAR0qX3hMfOs42btSBN+5b6j8XE@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb3h/V/yGy+PQqK6JNPPmgqmF0BjCWcK763Qq9l2VJjOJHvNlG
	Lpqxkcegxall6LvxLOOiTVIOpY589VxaRUwtCZOnoxRL8Zh/n+pwZyZ3V3NdZI7vsqYndoxYnab
	yNePW1d982VtXHAQRzHT7KsfpKp2/ggSUcHHsfcIp
X-Gm-Gg: ASbGncv9EUBUguUZAGM65rmtJ6TTs/J0J1Os/oh/pcSQILOUsj/vGfqH9/7JrYx9n6s
	LplCbSCBG0FlGuR9Ip2z239T7DX4JoWbQFTb9+AVJ0LLZRl7WUQUuaZ90UbSrj0QAdzRRcAgJQp
	xyqrtjzadPUbksJQa412pHId7kndoFlkZNnb14jSg1h89pr0+5msfCivjIXw/MeePgS4uq7ORW5
	eJnRUjyjFd/QdfRZAdV8TuWrJ7/Rsux4YLAhoy8RZIlNW0d6h7alcRhvW4vDs6fXhxdS/QDbtFm
	aA96G9dILY2c5EORGldYNvd5miTBjrkUaMsg
X-Google-Smtp-Source: AGHT+IFHyI5tV3uPkHfzZQDwtLCu1xXfZdNpjQHEIN8gqbseljKndHdCHWJHLu5LbqQguzv8YlVvlOC2YwOH7fkw7n0=
X-Received: by 2002:a05:622a:205:b0:4ec:f151:6559 with SMTP id
 d75a77b69052e-4eda4ec1851mr145606591cf.27.1762852474078; Tue, 11 Nov 2025
 01:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:13:57 +0100
X-Gm-Features: AWmQ_bknFBa8gAhB6UE8n7ZlyUgSKcguUN9eypJruwNRSxK5vCFPizbRNuQ2qaE
Message-ID: <CAG_fn=V4jVyS41MDxJeN-A2zk6WhTnxp7m3FRWmkXMpy5f+haA@mail.gmail.com>
Subject: Re: [PATCH v6 09/18] mm/execmem: Untag addresses in EXECMEM_ROX
 related pointer arithmetic
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
> vm_reset_perms() calculates range's start and end addresses using min()
> and max() functions. To do that it compares pointers but, with KASAN
> software tags mode enabled, some are tagged - addr variable is, while
> start and end variables aren't. This can cause the wrong address to be
> chosen and result in various errors in different places.
>
> Reset tags in the address used as function argument in min(), max().
>
> execmem_cache_add() adds tagged pointers to a maple tree structure,
> which then are incorrectly compared when walking the tree. That results
> in different pointers being returned later and page permission violation
> errors panicking the kernel.
>
> Reset tag of the address range inserted into the maple tree inside
> execmem_vmalloc() which then gets propagated to execmem_cache_add().
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

> diff --git a/mm/execmem.c b/mm/execmem.c
> index 810a4ba9c924..fd11409a6217 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -59,7 +59,7 @@ static void *execmem_vmalloc(struct execmem_range *rang=
e, size_t size,
>                 return NULL;
>         }
>
> -       return p;
> +       return kasan_reset_tag(p);

I think a comment would be nice here.


> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3328,7 +3328,7 @@ static void vm_reset_perms(struct vm_struct *area)
>          * the vm_unmap_aliases() flush includes the direct map.
>          */
>         for (i =3D 0; i < area->nr_pages; i +=3D 1U << page_order) {
> -               unsigned long addr =3D (unsigned long)page_address(area->=
pages[i]);
> +               unsigned long addr =3D (unsigned long)kasan_reset_tag(pag=
e_address(area->pages[i]));

Ditto
