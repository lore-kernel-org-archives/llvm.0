Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629104;
	b=w0gLZPC+k65rz0KKH+uefL+ctQ5l2R8TiojBPjFM8uuPUrJsvoVVcJCFSiYgjsv6kQZU
	 0tRSbD3FHUOQJpXLzP+pE9NMSAIPHObOyzwMg20A8vXeN5qSzxBbG8stYHJAaFV0WW9c+
	 SsWZFybOel8ufv7kqhEis0hvF4QTUh5vSDLoyrWYmPdQYdxepj7GUBssf5jxO0Ul8QIHu
	 UoVzIy+qj7EIR4ccuUfFLeA6aM4FP3bZewTCDIYnjlchfjsbSXzBI8ot4+dF4rwx/tBQb
	 buBfwS86/0bbOSf3wWX4isoaT71sauAMV6tan980NLNnHBaPeunfuJ1dQWFD10S+YLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
	b=pc5vILZ9vBo42QE7kCMpf93YxC0RVSQiCqSadDXqKoxjWZtjJ4Ccf07bviyZuZrOiojB
	 vSCCTFIJBsbl5uTepgOnhSKfZwXHNTOhledDiPv9Ez5xG2pkbEERo7C6dK6TC9O61umth
	 jqUx6Eir1A8fMa6QlRiXUMVltWmN3JnoE6Qnjyn4FrLZY9knaYzfZBdT781oySCoB/pXQ
	 M5YfUkvX3B6qqDEXFLudA1PW/nMMEump7mtgyBP4NSMXrLRfbwqp7nvadtw5tFuCsdP1N
	 88rXx64tApo6AFtiWNri1lgvOWXI8AA2hsTDAYR0SXDDqvUCzzPnyQ7GwuAgkbUvY4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XqdD5mZO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2377606A695
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 17:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2377606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XqdD5mZO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5013386f8f.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 09:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629102; cv=none;
        d=google.com; s=arc-20260327;
        b=boYueTb/J5pql0wrb8x+w4wA7tT+uLfHECHCxBFBG2S8s56xxuxA4hPSRquAeVDhXI
         F2kACr2tNizA39Kml7qKYA1TCg0DiXEI27E2ITsFog6bTnNI8kTdoRIEijfvU93NRoPL
         mzxkE7jLGoUzC/Rg5Daj0so0ihQKGsPHTs0c4BmmdAHR87REJC8omJ1w1CWEhKwXebet
         stLNP3w51ruodnzUdib2ey+bCmHdDrHRH/2cqqohQf/ESrydDbHYkpfmMxIuOqDz7r20
         mPp+CmjaGFNDQrf7exGlNrbWkf+TDMsQP0tuAgsY7Q5KHu7nW5x9fF6P3mpyd6sEu/bT
         AllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        fh=jOXSQTLKMiU07okVITuRAa1Zk47WAtURGJfq6S2VhsE=;
        b=YY1AcejzFkBsARnIu6EuWdMlkcdcy8tib04pEUk9aUUI5l+TL8Yne2cE2/0MxbP3Cr
         XBfXvIx9KxIUg/LG7HvWT4gI6ijo5mMwxbn78sDvFXXBpzC8aw8/IaIEcTDl3zNLT2pc
         Ca7gYZjLGmmvY80pgerIz8VMJDyBCyw0rUGRDdDtaiw3glzUuRPDFuiNRFQBoRzJMbIz
         hE/w2hMzV5DZtA1pkY0TLKbO/33g2KpGDcSTmRHchOwzGxJvyOQHOhZKEM/d+WTASTKq
         IBBNlKs8dScxaw/COHhN07NoLRVUDoA2cLuZ+9dczGLODGHOREhseGa2p1i8e10fZAKG
         bwCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629102; x=1796233902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        b=XqdD5mZOHI7eNEmXZq/FoTly/vRz8ZHFdz/ZxmIyKjQume6FXMrmcW0IoxNYzvrpAX
         OFe1JV2elmkTN1GnUGmZdL8GrFZ5TfEEPuBPyNxbA8QzX545aBF1w0aVtUPoRUf+TDX/
         wVfvAt4AouYwZyVmyg355YLTf/nkXbSIh0hr4+5GpCx4k6WsR4b4KwUOnBXyx02UdzVX
         e+xy6jsYFe9hAU9wQWoCgbvbwE7g9S4pasDRIVWrVDyuBwElFWYMmFRRc/Mj0sev9qAG
         JcjDICvVo3TpYi394kOC5fYbyVGDBK1xGj4F3DG3SkgFh0eN1Gl7t0k7YayENUNyDofL
         61aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629102; x=1796233902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        b=cnbnZMZ1+BJOM5+qRG+LJSV7bDx0wqIhujbjve3vB1rZGpLcxYTj7G6999jSkKFb9I
         yKgg4F6FULF91dCctmmeJ8WyvgLgMT10XvTlQF+BaqgQ2VdgKIKVHeh3BBQSF8AD0uMo
         lWZ97tzWulwx3hLH9to1DZBEUhzhZVXJbQTdfxxrJ6O/BVniXBj8to3TqKUruaUGxK4v
         W5/jlrDRsDvtxYJsk03KvIjLZUDm6ifYIlRN3Cn/Pp9C2BrcjG/poy2GG8IAvC9tUYML
         qpO6TW1L/gDqjcDVwkue8Fbl5FVOvjMjw/FF6bdOGO7++MAoWx5grSLpbB0qaPUwDLxh
         +txw==
X-Forwarded-Encrypted: i=1; AL+hErH1d62uP6NdvSZzhD29ARmCMn4hTWh1qwxVW69WSkDaXqtID1OYvOrRi6x7w9FWBQfS9YAh@lists.linux.dev
X-Gm-Message-State: APuU4Z+m/7l5t1u1SzrLbF6HxDrfd0PXFC5wpD424yzkVZyFvYaVDGRR
	i2YTjlmxPoJlCZ24Ne8hEjWz+iYITDrtwHvRGuJ4IacgDZEnYY9OKw1QwYMJN5tLUSp7vONkalT
	gj1ztxLV59Xt1AdHfi56aJ5g7F1J5ylrsGl4gWwk3
X-Gm-Gg: AZFdTZevFEk6vsaT9tDcs1oBplNfS4fyLipKhePRKVKuHneo76pNRhKKI7uzXrakeZ1
	piDQhlEAoGE7+CMT0Pd9XKuZtl1WTLfwG+/LVi0rs6ezOIoSa7FlPq+Pkpod9IpFw8j0GE4cVTJ
	PUxCqTjEzdh7fQgieqAsCqcdimGAoArIQEJX7C0YfQOUrEhCiIoUq7Ilgu+xo+uoqU5u+EjlflS
	CCV0yXXQjHXzl/29PlRQusSsJIbvZV3i+fU0bMDtqDe8gBcBVfwUGl7QpstOJ6O7qG/pbOJ6StD
	WxN8SjV6hONUxMejzwN1f2B87eZJcZYE0tE622HPhr7NNiLD+JK4p2GolB+J5Wx0/NntTPvw3+r
	cwtUAEtgzz6KT0GByizR7h5599zRqS37E9PuXNveqdJdkEmaUkRLxU0zplctPH9ZVYMma5gcgSi
	6H+ETdck3X2WuzedL2FfUp6Ia1rf9vOrYOs04GZTRQ4eKYj20v/xccdXWRTHxRV5IjOnjYUck6i
	NyO84Qg51y8FBu3am1+oGsbvBX1oOnj9B4MHA==
X-Received: by 2002:a05:6000:2201:b0:4a8:663b:63e3 with SMTP id
 ffacd0b85a97d-4abaa976b48mr45498627f8f.4.1795629101291; Wed, 25 Nov 2026
 09:51:41 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
In-Reply-To: <20261125174035.1412724-1-nysal@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 09:51:30 -0800
X-Gm-Features: Aa3M54o9X1WdWJoRSllfktiwX4MIEHpsBnKmPf0mGd1gEpiEdAxkLV-H4qy3pQ0
Message-ID: <CAKwvOdkW5+xUCg-8Qp=1wJkNFXAJZTmTDuxBi6hKDuiNxUYiDQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] powerpc: Implement cmpxchg128()
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Jeevitha Palanisamy <jeevitha@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, SJ Park <sj@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:41=E2=80=AFAM Nysal Jan K.A. <nysal@linux.ibm.com=
> wrote:
>
> This series adds arch_cmpxchg128() and arch_cmpxchg128_local() for
> little-endian POWER8 and later, using lqarx/stqcx. This enables
> HAVE_CMPXCHG_DOUBLE and HAVE_ALIGNED_STRUCT_PAGE, which gives us:
>
> * SLUB's lockless __update_freelist_fast() path (avoiding slab_lock()).
> * kmalloc_nolock(), without which BPF task-local storage creation fails
>   with -ENOMEM, and the selftests task_local_data_race and
>   struct_ops_assoc (timer subtests) fail. BPF Arena kfuncs were changed
>   to be callable from any context. kmalloc_nolock() replaced kvcalloc()
>   in the arena allocation paths because kvcalloc() may sleep and take
>   ordinary allocator locks, while kmalloc_nolock() can run in NMI or
>   non-sleepable contexts.
>
> The lqarx and stqcx. instructions require the 128-bit operand to reside i=
n
> a consecutive even/odd register pair. In the Power ISA, the operand uses
> big-endian register layout where the most significant and least
> significant 64 bits are in the even and odd registers respectively.
> Until now this could not be expressed in inline asm without hard
> register constraints [1].
>
> GCC now supports this through the PTI mode attribute [2,3] for PowerPC
> and it will be available in the upcoming GCC 17 release. Backports have
> landed in the GCC 14, 15 and 16 branches. GCC 16.2 is the first release
> which has PTI mode support. For older GCC releases and clang there is a
> fallback implementation with hard register constraints.

Is there a feature request in llvm's bug tracker? If so, can you link
to it? If not, can you please file one, then link to it?
https://github.com/llvm/llvm-project/issues

>
> Additionally, this series enables PPC_HAS_LBARX_LHARX for Power10, which
> was previously omitted in the Kconfig.
>
> [1] https://github.com/linuxppc/issues/issues/463
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106895
> [3] https://gcc.gnu.org/pipermail/gcc-patches/2026-April/712831.html
>
> Nysal Jan K.A. (3):
>   powerpc: Add support for 128-bit cmpxchg
>   powerpc: Implement 128-bit cmpxchg fallback
>   powerpc: Enable lbarx/lharx for Power10
>
>  arch/powerpc/Kconfig                   |   8 ++
>  arch/powerpc/include/asm/cmpxchg.h     | 100 +++++++++++++++++++++++++
>  arch/powerpc/platforms/Kconfig.cputype |   4 +
>  3 files changed, 112 insertions(+)
>
>
> base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
> --
> 2.52.0
>


--=20
Thanks,
~Nick Desaulniers
