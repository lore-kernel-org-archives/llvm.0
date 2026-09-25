Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286AF374A19
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 04:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311250; cv=none; b=hRk2T99q739t7Llc8Icv/xmD9R8MRNlqj6Oe6Y8vbtzPRhcjXOk+V3tCjaU1ZgwhowSykKwECv8dQoAWSNaqvsZyexun69dBZVgfglHYkAZxo8lQf06bTBWs2NsYhnIDg5x7ccCjEdIuIgBmu5UN7KRaipSkl4NYN4HcfPwgFZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311250; c=relaxed/simple;
	bh=nc//00UX5nLrzlcPRwZdsOCugNvIuS44f43pgVSjYZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIDQkbXelAFBvoOSLXf9VITBtlBxTkOKYddTXs//k8lKSTnDYlPO5zSUrr54UfNoFjzISutJElt1Jvm0LP7wmIKQJKkXiPDhVctOwCwaOWqHqS7w+3i7A3zwTEJVMJrvgTPwb5ynTb7Yn/e/6y8Wd/xFtL/Xt2XBWZ5Kd0ildfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giuTjT0V; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giuTjT0V"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so323226a91.1
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 21:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311248; x=1790916048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=14MXQzJGNSJiHny7BrCIDsUY2XvMualsJzu7fkY6FZ8=;
        b=giuTjT0VpvHYXhTteHX+y+rInMK0Lenx+Ke/vzHvU9cAoLKwQoXeu6xId0FVacKPzT
         Vd4httEkJnaQ8bntpDWu/QAzTQJuQeu0O5kNFcjm5VP7HumfMmabqjccvHjwr3ccSyqj
         MCZGUn9gkYfgn9f6C1vZxVMwkzK3D7JZHXvN5aosZPYQ+zEVLgO3nnR7mJAhfZkayPH3
         /xLTt44s+eWI1zKVIcfPsoEtGFioVv/ZTYK4dy8ab2SmNJIBe/0z+DjY0uGpl7rwJuLn
         4lw/Bs6suZ3eSsKOBatM+zVByKKF9lhaDEv8CpO4hxJHpyoU8U4Ra/v0tFycMZmfVd2S
         +9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311248; x=1790916048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14MXQzJGNSJiHny7BrCIDsUY2XvMualsJzu7fkY6FZ8=;
        b=vUZfd+6O1h+3NWrqEFY42VE/dRDcFjxY+QihXiwzQyA0Zde8bBMTXCThftO0s9iyDS
         dBu4AFAz+rTyTwgYlW9ZLEQbeWm+aUH+H3iTpa3uT/9Yc/PYR6g9MXhvv8acIBTtXUZ4
         x+pUm2aLeKjRKyL3AvEOMG/99LpmsjclH6GACyfj+ORcej3ieFWcwiR3waYJWDMFqoKR
         NrvWVGFRTaTSwq7fHckx887F08YKmMvyJqoeBPn8qGndTeYCe1A7dGrFwExYuJdRkaBw
         wrrLpTQl820b+3NTqrru95fsQIt1cUYc21Tum2619sf9Bce+u8aBDWi1oXuemoeE7398
         +lnA==
X-Forwarded-Encrypted: i=1; AKwUvByegPVJmWNIOA+3nDKGYi/6rIGC2NLXnOipU1pUUmtzrZDlS9jyX9NMMV0wVQWDUfUIjihP@lists.linux.dev
X-Gm-Message-State: AFuF++nbJtKKUA5uE2gVlLj7dQxIbYFScJbXuyu+LxYyTAO2YEHAgRZN
	DNF6XQEprUvLyL2zQhtLHP11gE8O13HZKyp9XgUpZRrKJ1ulBCp/8ex4
X-Gm-Gg: AYBFou1k1lXekHi+LPlMfAWA1QlpVToSLbmqJhTQLJUwlcPc2yZqW9HO30ky7XQHL6x
	H/lnszFPsqoAMtndQ+fqbB42qm0R+2PJFZ9B1LRwvUhwZqdyrhH8AUA5bAdOeV1EAWUvIAS30GQ
	omT9CQOnRPK2mw/V/U3Z1+XksxgZ8zv8lLrvo8KfdY6fIw3p0IrrOgOPCDnXo9mrhGkBnjH1RPX
	LrvEOCBH/Uvb2pop3KkHnyWsCc5Zk9xetyDc+URov1pGy0CF3MJz22SfDy7kJ+5CcjrqFbFgMgu
	aKF5sHNSDsEsgJYqVJubGlEIGhMowlkdi+1nXsyLaO4wYBxgN2+EwCU3wIVvGCn9Y+O6WgZJHKu
	UEDU4CLAOahtZPdzNmk9wC55q564/u2DtX8XQokKQk+2DZw0vs/PursKaY5BQagybXWSTpANcr3
	t0S1pqDS5Mpy3jZ7s72oBXVLSm6gbOChFL8tfAvBY8OY38lInWlMos6MkC6vUeU1wM5BIlpp9YF
	y3jxI87Dqxo
X-Received: by 2002:a17:90b:2745:b0:39e:5c75:acbb with SMTP id 98e67ed59e1d1-3a098ad3c68mr3886722a91.11.1790311248198;
        Thu, 24 Sep 2026 21:40:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm192594a91.5.2026.09.24.21.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:40:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 21:40:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
	Justin Stitt <justinstitt@google.com>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Subject: Re: csky ICe (was: Re: [PATCH v4 2/3] slab: improve
 KMALLOC_PARTITION_RANDOM randomness)
Message-ID: <4e2ea11c-7227-4790-af7c-67ffc86a12b1@roeck-us.net>
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
 <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
 <arUZWKjKr5I5tlOj@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUZWKjKr5I5tlOj@elver.google.com>

On Thu, Sep 24, 2026 at 12:36:40PM +0000, Marco Elver wrote:
> On Tue, Sep 22, 2026 at 07:58AM -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> > > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > > to identify the allocation site. _RET_IP_, however, evaluates to the
> > > caller's parent's instruction pointer rather than the actual allocation
> > > site; this would lead to collisions where a function performs multiple
> > > allocations.
> > > 
> > > With the generalization to kmalloc_token_t, we now generate the token at
> > > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> > > 
> > > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > > the address of a local label, which is considered broken by both GCC [1]
> > > and Clang [2] because label addresses are only expected to be used with
> > > computed gotos. While the generic version more or less works today, it
> > > is known to be brittle. For example, Clang -O2 always returns 1 when
> > > this function is inlined:
> > > 
> > >         static inline unsigned long get_ip(void)
> > >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> > > 
> > > To provide a reliable unique identifier without breaking architectures
> > > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > > to _THIS_IP_ where architectures provide a safe implementation, and
> > > falls back to a zero-cost static marker where _THIS_IP_ is broken.
> > > 
> > > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> > > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > > Signed-off-by: Marco Elver <elver@google.com>
> > 
> > With this patch in the tree, I get ICE erors when trying to build
> > csky:allmodconfig.
> > 
> > Example:
> > 
> > Error log:
> > sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> > sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
> >  1202 | }
> >       | ^
> > (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
> >         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
> >             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
> >                     (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
> >      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
> >         (nil)))
> > during RTL pass: final
> > sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
> > 0x779b51e2a1c9 __libc_start_call_main
> > 	../sysdeps/nptl/libc_start_call_main.h:58
> > 0x779b51e2a28a __libc_start_main_impl
> > 	../csu/libc-start.c:360
> > 
> > This happens with lots of files, not just this one. It is seen with all
> > versions of gcc starting with at least v13.x. Reverting this patch fixes
> > the problem. Bisect log is attached for reference.
> > 
> > Any idea what I could do to avoid the problem other than stopping to build
> > csky:allmodconfig ?
> 
> No idea what gcc is falling over here, but the below patch could be a
> workaround/fix. Does that work better?
> 

Yes, it does.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ------ >8 ------
> 
> From: Marco Elver <elver@google.com>
> Date: Fri, 8 May 2026 14:51:45 +0200
> Subject: [PATCH] csky: Implement _THIS_IP_ using inline asm
> 
> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
> 
>         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> 
> In particular, the address of a label is only expected to be used with a
> computed goto.
> 
> While the generic version more or less works today, it is known to be
> brittle and may break with current and future optimizations. For
> example, Clang -O2 always returns 1 when this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> <linux/instruction_pointer.h>) using an architecture-specific inline asm
> version. Additionally, avoiding taking the address of a label prevents
> compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> BTI) under control-flow integrity schemes.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/csky/include/asm/linkage.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 arch/csky/include/asm/linkage.h
> 
> diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/linkage.h
> new file mode 100644
> index 000000000000..04afd3583e25
> --- /dev/null
> +++ b/arch/csky/include/asm/linkage.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_CSKY_LINKAGE_H
> +#define __ASM_CSKY_LINKAGE_H
> +
> +#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=r" (__ip)); __ip; })
> +
> +#endif /* __ASM_CSKY_LINKAGE_H */
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 
