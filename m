Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EAA35FF5B;
	Mon, 13 Jul 2026 05:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919908; cv=none; b=YieXOpXWnSlV3jU+rF4rJFxh3xko3pRrSR6m0LCk35TIIp+1p5ykiW9B+qvFKHUlbyMM4m4JXi8NJ9awTJCTKltpDJEXv+KFhRUwFbYcmPl2p45myWgkh2IejZi7obDimoXN766CY/x9RfLYcZGJkBwYEH45BdcwUarq06EdkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919908; c=relaxed/simple;
	bh=PxEUB6SvrLUOPAnnZvvq7B+rz6N65UrO69YXSqppklk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MILraftDezcKVdhUKQwNLn9SYYPCstOGAZClHFo9xNQBBIxTjvQIbyAnBE4KePlI9MxgeDmMxZFo6Lk3IFuTQYyEN+bPS7OToiygUwrYrydwI3WdB6hcaCgxUHCsP0JwLMAWYEVpgrlXJNdGJ+g8MDVvIPsuxq5f8g6TI4c6IwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdXhKMpB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdXhKMpB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF671F000E9;
	Mon, 13 Jul 2026 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783919906;
	bh=iGwWLHG2HI2aF2mm7hMfqXTCZbUeB2ycMtb8n8Isk/o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=MdXhKMpB6K+2Eb6+Lz7bRBVkpv4xk4hmSOACm20LbDSpzGQM97+q/gby+KBwR1S+h
	 YGlPHRSoIzFTGjLkCZH/gXsPaReZYPIkKkT8IjGElIPznL+eMrlpg9RStxCYWBrsPS
	 H9ReDNKC3FsTHur4Wcr8OE5r3cWb4uOPgA3tlInrnwx0ZOrhHrbwu7hjvynhgGxalo
	 gr5jrfqwSDGJD4zMCegr60xpee6PMgZGRr0RV9hdO21VUezkzqMDJOmVGGSWGxVS4k
	 Zhu9WpFUWnysECs6NT3XkMfX1foZTv8LlB1XWviKPU5J11QC28v9xxDpyH1QfQe2tX
	 LqES7WvY6SOoA==
Message-ID: <f2def8bd-4eb8-4e5f-a22f-4061297ddb03@kernel.org>
Date: Mon, 13 Jul 2026 14:18:19 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Harry Yoo <harry@kernel.org>
Subject: Re: [RFC PATCH] slab: don't assume alignment on allocators that may
 return ZERO_SIZE_PTR
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20260712120728.96628-1-kmehltretter@gmail.com>
Content-Language: en-US
In-Reply-To: <20260712120728.96628-1-kmehltretter@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OOPb532Tho3aQ04vlVQWZzyi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OOPb532Tho3aQ04vlVQWZzyi
Content-Type: multipart/mixed; boundary="------------sNkF6h0hvJAlWAsgk0NU70Gv";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <f2def8bd-4eb8-4e5f-a22f-4061297ddb03@kernel.org>
Subject: Re: [RFC PATCH] slab: don't assume alignment on allocators that may
 return ZERO_SIZE_PTR
References: <20260712120728.96628-1-kmehltretter@gmail.com>
In-Reply-To: <20260712120728.96628-1-kmehltretter@gmail.com>

--------------sNkF6h0hvJAlWAsgk0NU70Gv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


[+Cc Catalin for ARCH_KMALLOC_MINALIGN bits]

On 7/12/26 9:07 PM, Karl Mehltretter wrote:
> __kmalloc_noprof(), __kmalloc_node_noprof(), and __kmalloc_flags_noprof=
()
> are annotated with __assume_kmalloc_alignment, which expands to
> __assume_aligned(ARCH_KMALLOC_MINALIGN). All three can return
> ZERO_SIZE_PTR, currently (void *)16, for zero-sized requests. When
> ARCH_KMALLOC_MINALIGN exceeds 16, this contradicts the annotation.

Ouch.

> Compilers may use this false assumption to reduce ZERO_OR_NULL_PTR() to=
 a
> NULL check, losing recognition of ZERO_SIZE_PTR. Current GCC and Clang
> retain the existing range check through kmalloc's inline wrapper, so no=

> functional miscompile was reproduced with the current source form. Howe=
ver,
> both eliminate an exact ZERO_SIZE_PTR comparison on the same return val=
ue.
> With Clang, UBSAN also reports the invalid alignment assumption at boot=
=2E
>=20
> Changing ZERO_SIZE_PTR to satisfy the annotation would make its value a=
nd
> the range accepted by ZERO_OR_NULL_PTR() architecture-dependent. Avoid =
that
> semantic change by dropping the annotation from the general kmalloc ent=
ry
> points. Retain it on the cache helpers, which cannot return the sentine=
l.
> Allocation behavior is unchanged.
>=20
> Kernels before v7.2 do not have __kmalloc_flags_noprof().
> Backports to those kernels only need the include/linux/slab.h change.
>=20
> Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
> Fixes: f6d50ab29afd ("mm/slab: introduce kmalloc_flags()")
> Cc: <stable@vger.kernel.org> # needs adjustment before v7.2
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>=20
> Notes:
>     This is RFC because the alignment contract can be corrected in thre=
e ways:

I think it's still worth having at least a weaker alignment guarantee
and would like to vote for option 3 (or option 2, if 3 turns out to be
infeasible) unless there's something unexpected that prevents us from
doing that.

>       1. Remove the annotation from entry points that can return ZERO_S=
IZE_PTR
>          (this patch). On armv5 this increases .text by 1120 bytes (0.0=
2%);
>          no measurable change was seen on arm64.
>    =20
>       2. Cap the assumed alignment at 16. This preserves some alignment=

>          information but couples the annotation to the current sentinel=
 value.
>
>       3. Change ZERO_SIZE_PTR to satisfy ARCH_KMALLOC_MINALIGN. This ma=
kes the
>          long-standing sentinel architecture-dependent and either expan=
ds the
>          range accepted by ZERO_OR_NULL_PTR() or requires changing that=
 macro.

Some code (e.g., kmem_dump_obj()) performs (addr < PAGE_SIZE) check
either NULL or ZERO_SIZE_PTR) to see if the address is valid.

Bumping ZERO_SIZE_PTR to something smaller than PAGE_SIZE should still
work: (addr < PAGE_SIZE) check still works, and accessing it still
causes a fault. No arch should have ARCH_KMALLOC_MINALIGN >=3D PAGE_SIZE?=


--=20
Cheers,
Harry / Hyeonggon


>     On armv5, Clang UBSAN reports the invalid alignment assumption duri=
ng boot;
>     the report disappears with this patch.
>    =20
>     Clang 22 and GCC 13 retain ZERO_OR_NULL_PTR()'s existing range chec=
k through
>     _kmalloc_noprof(), so no functional miscompile was reproduced in cu=
rrent
>     code. This is an optimizer limitation, not a guarantee. For a kmall=
oc return
>     value, writing the check as "!p || p =3D=3D ZERO_SIZE_PTR" causes b=
oth compilers
>     to remove the ZERO_SIZE_PTR comparison. Built into an armv5 kernel =
with that
>     form, a zero-size allocation is then no longer recognised and is de=
referenced:
>    =20
>       Unable to handle kernel NULL pointer dereference at virtual addre=
ss 00000010
>       Internal error: Oops: 805 [#1] ARM
>       PC is at __fc_init+0x3c/0x60
>       Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x=
0000000b
>    =20
>     Without the annotation the comparison is retained and the kernel bo=
ots.
>    =20
>     Would the slab maintainers prefer removing the annotation or retain=
ing a
>     weaker, valid alignment guarantee?
>
>  include/linux/slab.h | 12 ++++++++----
>  mm/slab.h            |  3 ++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 51f03f18c9a7..1c63048f6467 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -632,8 +632,12 @@ static inline unsigned int arch_slab_minalign(void=
)
> =20
>  /*
>   * kmem_cache_alloc and friends return pointers aligned to ARCH_SLAB_M=
INALIGN.
> - * kmalloc and friends return pointers aligned to both ARCH_KMALLOC_MI=
NALIGN
> - * and ARCH_SLAB_MINALIGN, but here we only assume the former alignmen=
t.
> + * Objects allocated by kmalloc and friends are aligned to both
> + * ARCH_KMALLOC_MINALIGN and ARCH_SLAB_MINALIGN, but here we only assu=
me the
> + * former alignment.
> + *
> + * This guarantee does not apply to ZERO_SIZE_PTR, which is not an all=
ocated
> + * object.
>   */
>  #define __assume_kmalloc_alignment __assume_aligned(ARCH_KMALLOC_MINAL=
IGN)
>  #define __assume_slab_alignment __assume_aligned(ARCH_SLAB_MINALIGN)
> @@ -939,10 +943,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sh=
eaf *sheaf);
>   */
> =20
>  void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
> -				__assume_kmalloc_alignment __alloc_size(1);
> +				__alloc_size(1);
> =20
>  void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t=
 flags, int node)
> -				__assume_kmalloc_alignment __alloc_size(1);
> +				__alloc_size(1);
> =20
>  void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t=
 size)
>  				__assume_kmalloc_alignment __alloc_size(3);
> diff --git a/mm/slab.h b/mm/slab.h
> index 281a65233795..aea1373c7f83 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -28,9 +28,10 @@ static inline bool alloc_flags_allow_spinning(const =
unsigned int alloc_flags)
>  	return !(alloc_flags & SLAB_ALLOC_NOLOCK);
>  }
> =20
> +/* Can return ZERO_SIZE_PTR, so not tagged __assume_kmalloc_alignment.=
 */
>  void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t fla=
gs,
>  				  unsigned int alloc_flags, int node)
> -				  __assume_kmalloc_alignment __alloc_size(1);
> +				  __alloc_size(1);
> =20
>  static __always_inline __alloc_size(1) void *_kmalloc_flags_noprof(siz=
e_t size,
>  		gfp_t flags, unsigned int alloc_flags, int node, kmalloc_token_t tok=
en)

--------------sNkF6h0hvJAlWAsgk0NU70Gv--

--------------OOPb532Tho3aQ04vlVQWZzyi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCalR1GwAKCRCGXBN6rc5S
1sepAQCPSq/Lft9j3v5RFHcjgM5D2FnjBSgJxmunq0Y6hpDAqgD/TgeJtVhYFwt0
vuqShKFRlbK8hVusIQBWqp3nlJdkEQE=
=u9zc
-----END PGP SIGNATURE-----

--------------OOPb532Tho3aQ04vlVQWZzyi--
