Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE38226541
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742492403; cv=none; b=JohYuZ6GbJsTU1n0Cfxa6CH70E9AxXFd+tPpnLL1nNWOFxnDBlo8XTXIvIOY7RmzGIXdYuc89LSMKlgks9+Y2Nb/gKimHvRR1mf9oLyts0nGGnIZWQlkXP9JvN6V9tqIQKPEwNv6a8Ti8Z/1qXMnq0zc0jl+OwUpdbgW6kIZPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742492403; c=relaxed/simple;
	bh=gpGLVKoREoUi12NpjXgAakIGPXWe4J/DtcP8JYm5+4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7xLzG73hX2IczqBCRN6/QYzBLMmnzI6/CocKie9XeMf2xg0Va6Zkk4NMQEURgVpexKRz23F2qpKRUA28Pk03sAwG7oA1BkPrI4rXkp5xdj4SS5bMlqmMnT/B1DKWSjm+7cqeqC7N/8ZV95DSsWBlz0q+53won+OdNBXNqh7jCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzivtCWq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzivtCWq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1271465e9.0
        for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742492400; x=1743097200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICJPfH1Men5qwSYszeUMQ6QRHz5SpwAhZQR7oJ7/pJ8=;
        b=JzivtCWqwVmxlYaZtgEHrn1zRodegs9S/VuNgHooBaq7c/t/uHwnUXeTRGOqZVtSaa
         vdGtUceQzjkORSg/KDawWToxOeWFyJswHuuZJ/Vd+vTFCnkuLeqS+5HFD+WYpJ1TI5DZ
         r4ygntPRCuNEW8okWB/XzEYL4u40PpTTD2Wff66okS0MRAxG3ibOuUeverJafd/1ev/y
         GyKEZA6VwfQwPpoAS5cVQnI24XJYZhaop9BKK11/ccpu5dUazn+n1pzD99WXGzfZzR9k
         oXRZb//B21wPj0UgLHHjKUfVoQAdhCr6OKE8XRfIwh8/WH7j5QYDG10AWpIjsyaG/5zS
         ww9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492400; x=1743097200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICJPfH1Men5qwSYszeUMQ6QRHz5SpwAhZQR7oJ7/pJ8=;
        b=fz35KC4clnVhVy316TK34v83i07W617RF5zFLW2/6L2i+rWCE7siQjR1XsL03emwxT
         1G7Mk2i/sHDh9SrPW3g1nP8nV6qhsMiSiuZTjbyaUtCpv98H/ZINMT6ZyZ3SzSaraKNI
         Xr7JTAEE8BFSok7bBVwRC9xT2ijer5uhCLnmrJBzUSFYl/wC3IrpZTmGi5BXuwU1LZ1B
         FWGXNFqiL3fFbWIZuu3HDMVE31HeAuQs00+ROkI0NsJS6hY++FFL7jTPLCXzqGL6PRdj
         aqiH1FpGHH6VvM/ACI3D3GBHhJr/vdJAIt/S53Ii3pdzhg3MV/UujnrXEyGwy/No6kcz
         fH/A==
X-Forwarded-Encrypted: i=1; AJvYcCXrJKZw1bd104t0BLAbecJ3npE9wu9fFqsFM++6u87YWA9jEGtZVtsk7nKvexlVhSflyp8D@lists.linux.dev
X-Gm-Message-State: AOJu0YwAkfen5WvnG7EMWVpTKWk2Ki+4SDafape7ySuCcgw+DK8MYdiH
	wyRI4FxNOcv00YCbBgu7X4Iya6WWsAZRgBr3WNlMR+cBoqfGS/PAeOhEHiDu+Z269TSLlJhJ+aW
	KFJ3ZFGs+yZzJvMWxFYcXy/sUkAU=
X-Gm-Gg: ASbGncs07LsFhYTHdqCPOfcbQNX3GFHyRnhLY4YPEz4VwdGln2HGqtLt7Mk9XNGa11u
	xOeAvyF369LrmsJwT643X3zrA/F6L7rygQhSjc4BQ8cBvx666yzpNGzmF/ozpnNCZghpHpJ78Qk
	UWWrsXLlud/0sq3k8/7QxsKVKwUXG5p0MOEeqqUf2uXM/v22bMb1ftZwQ4
X-Google-Smtp-Source: AGHT+IEX+FZMqw/uKIyLvjuLIVQFBZHkjVI/CUtdYx+oxdxQMzv1hpI+TEDGWokkbPtcXqceiLtWpgt7xJ7OwvQ//Fc=
X-Received: by 2002:a05:600c:46c3:b0:43b:bbb9:e25f with SMTP id
 5b1f17b1804b1-43d44d75804mr24674625e9.6.1742492399899; Thu, 20 Mar 2025
 10:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <383482f87ad4f68690021e0cc75df8143b6babe2.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <383482f87ad4f68690021e0cc75df8143b6babe2.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Date: Thu, 20 Mar 2025 18:39:35 +0100
X-Gm-Features: AQ5f1JqCTLk6bw5pMZNlmkGp7az-6cdHmNjgmKBcGwH1kgc8PZz3csgjGnMk__8
Message-ID: <CAPAsAGxDRv_uFeMYu9TwhBVWHCCtkSxoWY4xmFB_vowMbi8raw@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] mm: Pcpu chunk address tag reset
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, kirill.shutemov@linux.intel.com, will@kernel.org, 
	ardb@kernel.org, jason.andryuk@amd.com, dave.hansen@linux.intel.com, 
	pasha.tatashin@soleen.com, ndesaulniers@google.com, 
	guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, mark.rutland@arm.com, 
	broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, rppt@kernel.org, 
	kaleshsingh@google.com, richard.weiyang@gmail.com, luto@kernel.org, 
	glider@google.com, pankaj.gupta@amd.com, andreyknvl@gmail.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:19=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The problem presented here is related to NUMA systems and tag-based
> KASAN mode. Getting to it can be explained in the following points:
>
>         1. A new chunk is created with pcpu_create_chunk() and
>            vm_structs are allocated. On systems with one NUMA node only
>            one is allocated, but with more NUMA nodes at least a second
>            one will be allocated too.
>
>         2. chunk->base_addr is assigned the modified value of
>            vms[0]->addr and thus inherits the tag of this allocated
>            structure.
>
>         3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
>            executed which calculates per cpu pointers that correspond to
>            the vms structure addresses. The calculations are based on
>            adding an offset from a table to chunk->base_addr.
>
> Here the problem presents itself since for addresses based on vms[1] and
> up, the tag will be different than the ones based on vms[0] (base_addr).
> The tag mismatch happens and an error is reported.
>
> Reset the base_addr tag, since it will disable tag checks for pointers
> derived arithmetically from base_addr that would inherit its tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  mm/percpu-vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
> index cd69caf6aa8d..e13750d804f7 100644
> --- a/mm/percpu-vm.c
> +++ b/mm/percpu-vm.c
> @@ -347,7 +347,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp=
)
>         }
>
>         chunk->data =3D vms;
> -       chunk->base_addr =3D vms[0]->addr - pcpu_group_offsets[0];
> +       chunk->base_addr =3D kasan_reset_tag(vms[0]->addr) - pcpu_group_o=
ffsets[0];

This looks like a generic tags mode bug. I mean that arm64 is also
affected by this.
I assume it just wasn't noticed before because arm64 with multiple
NUMAs are much less common.

With this change tag-mode KASAN won't be able to catch bugus accesses
to pcpu areas.
I'm thinking it would be better to fix this on the pcpu_get_vm_areas()
area side by replacing
this
    for (area =3D 0; area < nr_vms; area++)
        vms[area]->addr =3D kasan_unpoison_vmalloc(vms[area]->addr,
                                             vms[area]->size,
KASAN_VMALLOC_PROT_NORMAL);

with something like
    kasan_unpoison_vmap_areas(vms, nr_vms);
which will unpoison all areas using the same tag.

Thoughts?
