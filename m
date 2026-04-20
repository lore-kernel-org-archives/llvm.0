Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0638AC65
	for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677464; cv=pass; b=VlEPStMLwgrNlUbIFrHIGvtlsELO9Vy5yLzoveUbTxsSV7AAhIYlxSfLhbYPHhftTiCRS4Pj7hwHg3thB5072bxbqduiVGapWfG33FsrU/GfDeos132270VQojRn4tqiN1qcDF79wXZ+wCyaxIJoEyxlhjDgC5kgbrcRV9imHSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677464; c=relaxed/simple;
	bh=AYtIN+DV/14zAGGZ+sPiagOSGUF1db+pHMUYlKur3JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVXELASMfEZxk0RSDIyAF4PjL1JwsNJXrNIlJtCCuq+rIxkwIb9br2ZWPqK+En7p+4UT0G1sT1xYY4YVKC5aFfW+DLD6JR4SjPTPILQ+/uIfQ903VlHwfo4eTVQsYXU8GSYpfiPj5hCo63GcVK9mZ3l3yffF2PD3xMYs2gkC7Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g4Umc/lZ; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g4Umc/lZ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c8f9846c8so602205c88.0
        for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 02:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776677461; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/NXreRwqq6YfI0Q6uOGq7hckC5g//jwsS94AdFj3yrpXdOhVM3G5dsE1pJaIR3NJG
         q1HfCCb3zspcuutbHUPtxMElrZVCqgYAx9CceK3Ybcxw2bvJCpZ+DSun/qpUNZa9g9B6
         DOCXEusSi30gTMe9xGhMXQnUZMBCxf9LCn/AHUTcm7sEFE0Ft/KFA49Q7GH/cMNHKTRu
         mGZ1mcIgEfp866L/bHXMXGES9n5L/2r1f0FRighQ21Wpgif3484HEQNIteAEwBZZirPF
         /bOvWtpuLvbUIU47UKMGZxvf5zlf3+aKaLxiCwSmVCsERbF5aiBpTgTlfTaxtGLdmpw1
         g4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Psv86sYw6WRRa2dc8XVnn4F/sQNlqX7p+36B++yB2PI=;
        fh=s6T1VD+v1xMQmxaa7MlQu2vErJ8euplxz6cjoqmw8ho=;
        b=C9oDo4S1obBXGUwZJuA6autnE5IL8iIsfx5lvs9Y4EzN7xCtZrwekIdd+uuo2zrTZg
         joLIKMBVECPIfV/Y02lXabtjgd1sxHhKWW94uWHfxxYoVX8yJvaTYYw1hIvGwJ4UY6l7
         PP0/OcMyoIimxHHyY17b0AvPhqCvaKI1COL+dgc/t176n9Sx91COxFfCrqRjNNUs8SbE
         qrJVB2V0wonf/VUBqqHRdui5Gfj28TbJy2rSdZQpqLdi7eCVFbW9Ls/kNdkKbUTgqyOq
         L2/QWpW1CwbbWUsDYcGVkVVB0W46nZ6MosT72OiJNmR4REPRwf2vT9/cVnFe1v2HgjDd
         zrEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776677461; x=1777282261; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Psv86sYw6WRRa2dc8XVnn4F/sQNlqX7p+36B++yB2PI=;
        b=g4Umc/lZjjgsN+7IIJ9Whrz/NNsPCrCI2Fnq5WfXHYESkdLdaIooytbGVQvfgKo2R6
         BAFx7gy0K6VtYAmcStPGKYflDjIG9Wl3WeFo/7IgvfIEyYNkfTOY21997QFLkIK4Sfx8
         66gZXkVtyCbOlTawnP4gfKDrSxFQSGd8xeHYfIg/BcfMbZ5hY62fwohnVtMR6P6QU1Kx
         ANwvZqlPZjlmqVmI+LA392XRlK5PpZ+tPoRKfZ/wkZ1BdmGX3wvqTqTyIHBQYi+5n82q
         SQpchEvv4nUaaMUWFIhxlL5KMRLYdgMdeed0Lm86gGtg211we8dskHsZvkd38vgMZGyO
         G9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677461; x=1777282261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Psv86sYw6WRRa2dc8XVnn4F/sQNlqX7p+36B++yB2PI=;
        b=dna8gIzVQkLbG0L6kqWvnmMl6tjCtuxq8LZTm5zLu2acEiYpwMRTYbjvYqHKqFwGOd
         vgNMyLFq/pKtE82dG0M/gJD6nbAe0DMQV712gu2VGXhu7fgt7ltyrbFOWy9C+FDLtZbK
         3mKMcmq9u8lNdDcSjHVmgEIRiGkM3Jr5fvBgwc8lfMxrD1/BzwmuoRTvPVlItl5fTJ7E
         HJlAqCE5wVShpPbqUhTaH5EyedsUpWXvQwSBp1fNBo2hy8fDfeZh8zEjS6r+9q1BiSIC
         O7YU6uWAwcZzdo7Z/Oo92cePFtp91H6eC4/m3NAKXJpjhKM+r8fpSyjg1gnYl3b33Ou+
         b0MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7+GLvC0v7fkaY6KfYCCN0qF0yaaFw9FZPSxNvRonYwqVuUoFdC7l5hYinmAP+b6IEp4EF@lists.linux.dev
X-Gm-Message-State: AOJu0YwFlubtAIiW1RylPc8kBRH318T9zG1/lorddtqxO/NYUEvhe9bg
	3qpZ2LkmUb4iUJYUBRn9uQx+kX8HxBagfeurl4L0fODZKkAHo/ncZuK+KOniy3PJ57KbTHm72V1
	I7HSwk/XLi7cB1t/gQgrOMhhNmrrBQNwgEikzmUcZ
X-Gm-Gg: AeBDieukDQ7ls3/cbneQ3+Hf7OtaMYW1eyx0eKbirJQCti1Prubzx5Is9rscxAcXILd
	K75KL4Jm8iLZZepyLAwonFszkpYn32MnWC35l4CLMUEsHOnzfBz7zWjnsJcoJsQ855a7cWeQLXC
	2SA0rfqVE35AwuNdIL1hkuviWzdCoyCDfN49/0wGjIIRYfmB4HWPaHHXqZJnPw1gnB/UmfmUShf
	EL2piFnhKYpk6XUkAakc2qiajdetSJNTwAoSNJcG0n3+6qp71+UGiMlK4UdJItlCwMNQIp/TIA9
	69sJlGrDedfCb3e5xi4bFfijYmo+RiFnLIts27tD5Jr15rYunPIgYB04j3SThNdFUqp+
X-Received: by 2002:a05:7022:90a:b0:127:33e0:ea40 with SMTP id
 a92af1059eb24-12c73f7fbaamr5617278c88.15.1776677460282; Mon, 20 Apr 2026
 02:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415143735.2974230-1-elver@google.com> <aeXU-wwGSwcx2dvy@hyeyoo>
In-Reply-To: <aeXU-wwGSwcx2dvy@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Mon, 20 Apr 2026 11:30:23 +0200
X-Gm-Features: AQROBzCDqXBXEzcrST_0Skn6GXHUWSKau4IE3IO7VWholE-9v6QWyxVbFP_MsxE
Message-ID: <CANpmjNN0dYD8MB3PpPoxpz4ey2U9xA0w6oVO9hambtRwzSSkiQ@mail.gmail.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>, 
	Danilo Krummrich <dakr@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Apr 2026 at 09:25, Harry Yoo (Oracle) <harry@kernel.org> wrote:
>
> [CC'ing RUST ALLOC folks for rust bindings]
>
> On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
> > Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> > flexible PARTITION_KMALLOC_CACHES, with the former being a partitioning
> > mode of the latter.
> >
> > Introduce a new mode, TYPED_KMALLOC_CACHES, which leverages a feature
> > available in Clang 22 and later, called "allocation tokens" via
> > __builtin_infer_alloc_token [1]. Unlike RANDOM_KMALLOC_CACHES, this mode
> > deterministically assigns a slab cache to an allocation of type T,
> > regardless of allocation site.
> >
> > The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> > the compiler to infer an allocation type from arguments commonly passed
> > to memory-allocating functions and returns a type-derived token ID. The
> > implementation passes kmalloc-args to the builtin: the compiler performs
> > best-effort type inference, and then recognizes common patterns such as
> > `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> > `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> > fallback token (default: 0) is chosen.
> >
> > Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> > expressed, and therefore ensures there's not much drift in which
> > patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> > and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> > compiler recognizes via the cast to TYPE*.
> >
> > Clang's default token ID calculation is described as [1]:
> >
> >    typehashpointersplit: This mode assigns a token ID based on the hash
> >    of the allocated type's name, where the top half ID-space is reserved
> >    for types that contain pointers and the bottom half for types that do
> >    not contain pointers.
> >
> > Separating pointer-containing objects from pointerless objects and data
> > allocations can help mitigate certain classes of memory corruption
> > exploits [2]: attackers who gains a buffer overflow on a primitive
> > buffer cannot use it to directly corrupt pointers or other critical
> > metadata in an object residing in a different, isolated heap region.
> >
> > It is important to note that heap isolation strategies offer a
> > best-effort approach, and do not provide a 100% security guarantee,
> > albeit achievable at relatively low performance cost. Note that this
> > also does not prevent cross-cache attacks: while waiting for future
> > features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> > feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> > init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> > much as possible today.
> >
> > With all that, my kernel (x86 defconfig) shows me a histogram of slab
> > cache object distribution per /proc/slabinfo (after boot):
> >
> >   <slab cache>      <objs> <hist>
> >   kmalloc-part-15    1465  ++++++++++++++
> >   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
> >   kmalloc-part-13    1656  ++++++++++++++++
> >   kmalloc-part-12    1045  ++++++++++
> >   kmalloc-part-11    1697  ++++++++++++++++
> >   kmalloc-part-10    1489  ++++++++++++++
> >   kmalloc-part-09     965  +++++++++
> >   kmalloc-part-08     710  +++++++
> >   kmalloc-part-07     100  +
> >   kmalloc-part-06     217  ++
> >   kmalloc-part-05     105  +
> >   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
> >   kmalloc-part-03     183  +
> >   kmalloc-part-02     283  ++
> >   kmalloc-part-01     316  +++
> >   kmalloc            1422  ++++++++++++++
> >
> > The above /proc/slabinfo snapshot shows me there are 6673 allocated
> > objects (slabs 00 - 07) that the compiler claims contain no pointers or
> > it was unable to infer the type of, and 12015 objects that contain
> > pointers (slabs 08 - 15). On a whole, this looks relatively sane.
> >
> > Additionally, when I compile my kernel with -Rpass=alloc-token, which
> > provides diagnostics where (after dead-code elimination) type inference
> > failed, I see 186 allocation sites where the compiler failed to identify
> > a type (down from 966 when I sent the RFC [4]). Some initial review
> > confirms these are mostly variable sized buffers, but also include
> > structs with trailing flexible length arrays.
> >
> > Link: https://clang.llvm.org/docs/AllocToken.html [1]
> > Link: https://blog.dfsec.com/ios/2025/05/30/blasting-past-ios-18/ [2]
> > Link: https://lwn.net/Articles/944647/ [3]
> > Link: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/ [4]
> > Link: https://discourse.llvm.org/t/rfc-a-framework-for-allocator-partitioning-hints/87434
> > Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>
> > Co-developed-by: Harry Yoo (Oracle) <harry@kernel.org>
> > Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Avoid empty function argument if !PARTITION_KMALLOC_CACHES
> >   (co-developed-by Harry). While Clang does optimize out the empty
> >   struct argument (and generated code is identical to before if
> >   PARTITION_KMALLOC_CACHES is disabled), GCC doesn't do so. So we need
> >   to fully remove the argument if not actually required.
> > * Cover krealloc() which was missed before, resulting in ~100 additional
> >   objects in the pointer-containing caches in above histogram.
> > * Unify kmalloc_token_t definition.
>
> > * Expand Kconfig help text.
>
> Thanks. I find the help text much more useful.
>
> >
> > v1: https://lore.kernel.org/all/20260331111240.153913-1-elver@google.com/
> > * Rebase and switch to builtin name that was released in Clang 22.
> > * Keep RANDOM_KMALLOC_CACHES the default.
> >
> > RFC: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
> > ---
>
> A few comments on V2:
>
> # comment 1
>
> I'm not a big fan of how k[v]realloc_node_align()
> and kmalloc_nolock() define and pass the token parameter.
>
> IMHO it'll be fine to use {DECL,PASS}_KMALLOC_PARAMS() in those
> functions, since SLAB_BUCKETS users already passes NULL bucket
> to most of __kmalloc*() calls anyway.

I'm not sure I agree. 2 reasons:

1. Even though it's "just" k[v]realloc_node_align() and
kmalloc_nolock() - despite their relatively less frequent use - just
put one of them in a hot path and you're sacrificing performance even
further. There are only so many arguments that can be passed in
registers (depending on arch), and may cause more stack spilling.

2. We'd misleadingly declare that these functions do something with
the bucket arg. This is wrong.

Both feels wrong, and would only make this change if you confirm both
are trade-offs that you strongly prefer.

> # comment 2
>
> This breaks Documentation/.
>
> Problems:
>
> - The document generator doesn't handle DECL_KMALLOC_PARAMS() well.
>
> - The signature of the function that users call (krealloc_node_align())
>   and the function that has kerneldoc (krealloc_node_align_noprof())
>   don't match.
>
> - Even worse, moving kerneldoc to the macro doesn't work because
>   it uses variable arguments (...)

Well, some were broken before, now it's just broken more. :-)

We could move the documentation to macros and switch to explicit args
instead of (...).

Otherwise, I don't see any way to fix this. Preferences?

> # comment 3
>
> Looking at how rust generates helper functions,
> in rust/helpers/slab.c:
> | // SPDX-License-Identifier: GPL-2.0
> |
> | #include <linux/slab.h>
> |
> | __rust_helper void *__must_check __realloc_size(2)
> | rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
> |                               gfp_t flags, int node)
> | {
> |       return krealloc_node_align(objp, new_size, align, flags, node);
> | }
> |
> | __rust_helper void *__must_check __realloc_size(2)
> | rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
> |                                gfp_t flags, int node)
> | {
> |       return kvrealloc_node_align(p, size, align, flags, node);
> | }
>
> Rust code probably won't pass any meaningful token?
> (something you may want to address in the future)

Yes, it'll just pass '0' by default. We could force Rust's allocation
to be in the pointer-containing range - if we assume Rust code is less
prone to contain bugs, but the assumption is that such allocations
both originate and are confined to the Rust side. One easy way to do
this is to write:

       return kvrealloc_node_align(p, size + 0 * sizeof(long*), align,
flags, node);

But I'd defer that for now, until we're sure the above assumption
holds (Rust originated + confined).
