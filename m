Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E944DB61
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072657; cv=pass; b=Cl1Fp8RCaZAMm9PaghlzvRCh9xf+esRDR3G3juf7gnW37KGFpcDMW24SYquLsPG2UjtJqwxweTSTPTKPcqcz+X3B+qwInRC1EAIjmf0Usff336IrjqZ5N28jEnYlMXSqZ4E7KY6bIAgSj+Gzk3C3DnX4qU8v/liy+d44SNcVxgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072657; c=relaxed/simple;
	bh=oQH4MCqtsx8PuDqkHCstgNaDMaf3tjzD1L/6gzNJxyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnpp2aClM7S90WBGkEDbcBKNFznkEIV0wv4CTl+r5UcwEPuhWUocwPmVpuJi6Hl4lxPyc5M9PPFiWL1Zm8ElNvJRNrEqvTu+CIM7JmBE7WubI4c21MaQUg9w44/S8di1ewfbmBKh9U2YXpVP3kH5YZUxa1v/AVVOAHCaklpRJXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gs91BcUu; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gs91BcUu"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-130b2295ed0so4942091c88.0
        for <llvm@lists.linux.dev>; Wed, 06 May 2026 06:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778072645; cv=none;
        d=google.com; s=arc-20240605;
        b=eRkF7QpXLjF2enxJVworAO2/2Hp9qead9N9iSKKqqL28M0spkFaY3Qhk3J8UUZSNHx
         nbqxPDC8V2TfNm3bOEtXqOKRKehAkZbaloarFeva0thHKtW51/9ndjUW9c81iyYIIA+X
         UKYiBHIg/BmsV51fRPYFQZVdYczotVYU5V5ry3p42UpPAR1Va3LTJFtzZYRnf9LuFNje
         nygRUOPERvEv/3l5dEU6ggDxgEjNcAKEkKaRsvV+QtKsauNp08xk31dfgHM+/BlLoVDn
         lL7PJylHviWzrZYAzLvJC06ryM50kkUmBumkXg8ZYbpC9Kcx/qYYlud4tQXAdbEyBVws
         9i9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        fh=qyzrUe5k0dA+gE6r8gKEHmLiRRihZ/1iKscWP2RCzc4=;
        b=UfK5kga/eqcAT+d69AKO7onMKs7PZyH9yvfoGVNhGLhQnMRA5Rc1Vs2zAPwe8X5lpf
         yTQUPDBzaUFhRFx/ylGkZTsPChF+pw7+M+zOoTgs8zRf3n3yOvewe/aRhlfgg4GkJHQV
         BBSoiYBMQy+6qnNnk2lEPFXdHGouPPpj3jEOj9fJkxkTjT+WOfNiXKF+Ed+zLfRL4iIc
         4WKKrwxFBSdIvUSw+0k5aaluTDL+mK1ouKJkUgXF5m7IVnlc6+ZgMfqwda/iokAqyS/r
         JP5WFJZLaJP4k5MHGqtJPQfymSLlt7SlcgbOctbg75Y7Z5Zy4YKfcRzi94uKgSotiAcN
         VBeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778072645; x=1778677445; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        b=gs91BcUu1JtRvEcnQkTacW++fxVThF96xsiGI0hNxtNOPdFEdXkXxhTYF4kqvMdoAS
         jCBdu+DXFvXITdVGl4i1wK8s6JrtYZCC9JubpkXS5TFEsbZqEni/WviTH37NAOipcPWe
         HJCNhHI6AMliG8qLBp5KmgSlxxL2JawrNn8RDd1UwX09i+mVTbZ2aFdfIUw9d0vffySQ
         29MHdEZ2zgyE4BvUMt7H9+aFPSQIjz98bnUqsHztDn3QzCouSaeQujoKE3KXOkqkwCGJ
         bx6Z/SaYCErlvRGiWjFTyghwUaXbHWk08Hfose6HVkpPFv5p9buDdxQEU1D0puFqiDDv
         ZNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072645; x=1778677445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        b=KnmTA3jFbbSFOxo4bOu65/glwY9ooaMt5PwztKZYYJNOsQATc+51+e2SqBhijCEgJR
         mS1tfLzhln1tSAbEgV35cBBGEjFCzjAi4yrt3lMt/+sO6muUqpexq1NRlTGFPynIKaBR
         Rent4ZRZXw9I8YO8+QFtiIiI9mdIsbBHJSYHy8CENp8l40VglDBxkCEDG0Dd8X9Ohdde
         Go4638PlJP0MBjrEXlthtilqXLhIuTTdLK7V4PbreMYHbVZDuxEbcHztiJ9T+DUP5hwG
         a9od3gbafRPazgAqMObXAEozIIOoLrjrxQhwWHHMOarEkL/34vMlVr1kM4Bq+9CEiOmq
         UnxA==
X-Forwarded-Encrypted: i=1; AFNElJ+jCFkfvxwOlXoNREgiqyOct+yCAWlBMGS7EydSvzid06u2V0GXV/XwajYio8+OFAY72RkQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxM1Yt9YSvf016rVOo2Q49iueR++ASnwKCfK23ALuQbsZ7qTEgQ
	8bBn6lBGBvLT585LYaoCSbw1ljyBiRchQR2xIllRetgTFY+naMWJ8vGGYIcMK+I8g95SvjEAV5K
	g4BphUMj7IbHPCWByKss1fBVvpWmC7gafYjudoOaW
X-Gm-Gg: AeBDievwLpTGWhfVuya54sembeMSAb3k1HS00AcP4oIGAg8DRdAU8rDhXgM7M1+1GrS
	RLFdK8QSzeGUaJH1a+fnjssJ4M/cXGySGa96q9x+nHZbjkCA8wnjRzdMSILTs6+0mOmfGysNHlI
	70BMAcq7iv88od47qENT2LEqMVMbZX1HMfCYT0pAyORE/bAUv4ivrRzmN3NWRj5pYCzfXLLd46u
	S5Z82fgdWwz3Fd3Y3+VheEAdqAaNrxJlfvfTSw20TR2L2XETWQOm9l4mDf4h66UT6yUePSw+DYF
	NhWkW4r1SoTExFh5c0UScFi9DXuQaEtZCrRkuwnHVDf5DaSjGBsraVythx/gGMaQHjESiaw=
X-Received: by 2002:a05:7022:ec0b:b0:12d:f7a6:e641 with SMTP id
 a92af1059eb24-1318e9178d9mr1882135c88.25.1778072643669; Wed, 06 May 2026
 06:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
In-Reply-To: <afkOMIPu1WNFE9MS@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 6 May 2026 15:03:27 +0200
X-Gm-Features: AVHnY4I_sIIXoZtb7Dp2LdZncViXZn8dSOWAzjV1MMogggcywyvPBFhYkIJG5fI
Message-ID: <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 23:23, Marco Elver <elver@google.com> wrote:
>
> On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> > On 4/24/26 15:24, Marco Elver wrote:
> >
> > > @@ -938,7 +968,7 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
> > >   * Try really hard to succeed the allocation but fail
> > >   * eventually.
> > >   */
> > > -static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
> > > +static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > >  {
> > >     if (__builtin_constant_p(size) && size) {
> > >             unsigned int index;
> > > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> > >
> > >             index = kmalloc_index(size);
> > >             return __kmalloc_cache_noprof(
> > > -                           kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > > +                           kmalloc_caches[kmalloc_type(flags, token)][index],
> >
> > While reviewing this, it occured to me we might have been using _RET_IP_
> > here in a suboptimal way ever since this was introduced. Since this is all
> > inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> > the kmalloc() callsite, and not its parent?
> >
> > And after this patch, we get the token passed to _kmalloc_noprof()...
> >
> > >                             flags, size);
> > >     }
> > > -   return __kmalloc_noprof(size, flags);
> > > +   return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> >
> > ... and used also here for the non-constant-size, where previously
> > __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> > own ...
> >
> > >  }
> > > +#define kmalloc_noprof(...)                        _kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> >
> > ... and the token comes from here. With random partitioning that's
> > #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> >
> > so that AFAIK makes the situation worse as now the cases without constant
> > size also start randomizing by the parent callsite and not the kmalloc callsite.
> >
> > But there are many users of __kmalloc_token() and maybe some are corrent in
> > using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> > change things around.
>
> Good catch. I don't think we need multiple variants (otherwise the TYPED
> variant would be broken) - we're moving token generation to the callers
> (not even inlined anymore) with all this macro magic.
>
> I think this is all we need:
>
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  typedef struct { unsigned long v; } kmalloc_token_t;
>  #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
>  extern unsigned long random_kmalloc_seed;
> -#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
>  #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
>  #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
>  #endif
>
> Plus a paragraph in the commit message.  Let me add that.

Bah, this is why it doesn't work:

>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro
'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of
indirect goto statement
     304 |                 state->bos = kcalloc(submit->nr_bos,
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n,
size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)
alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro
'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)
_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |
                       ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from
macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement
expression


Apparently using _THIS_IP_ creates a possible indirect jump target,
but because it's in a statement expression, it's invalid, so the
compiler complains. This is obviously nonsense, because the actual
indirect jump in this gpu driver code would never jump to the
_THIS_IP_ __here label, but that's what it is.

Given this pre-existing issue, we probably need to continue using
_RET_IP_, as before. I tried to fix _THIS_IP_, but it's incredibly
brittle (e.g. __always_inline function returning address of label
doesn't work on Clang, but would on GCC).
