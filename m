Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578C2FE56A
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253416; cv=none; b=WLzxFm5hR46e9J3oHa/F+p0ewpFxbOh1zJMn/l2fc7ahep8vntwse+ltSvnTz9DC8meCVuWFLMUAQp34VN2zad+HMIDbGHoE1Q7psS5cvuli94wqQD8ci2Iqybx3Yu1xwXr8aH+30GF9UiKpLfEwK4mDxXgBcTO3AbapeYfAaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253416; c=relaxed/simple;
	bh=CLLX1WGSyy5uutnydf7E+boNfhnOuNdZ5bWoEr7Diic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vfr8vI4EbL4yB7YrxmlxT54iW56hCX6R5tTaCSc9/j/D7Q5dACVaz3YKG6roAUIbMDaprWiXA+WAN2UnFpotdhiDlRSzTl8+wVVpIyDjhHo8Sze/jYyldNToGasWjXeoK5fK4ZRguTR37zZPXJxB6+kPkrzm7IDsmfPYVhs4bQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tCX689gV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tCX689gV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so22841385e9.1
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790253413; x=1790858213; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gAR7nTOPxRo/mfR2u3OdcokbjHynlMhWcl3pdNDsUgo=;
        b=tCX689gVYDcS54Y6ko7c4qpL1V96B+LtV+Lz/u/q26uvxAb3Z0B0VpFS2jEjvFsR0X
         KoWpEP1I7A2eLPd5ks4etTFKWKsAVUFRi+A1kV8M5wpV3sOn7UJyKCNJj1gLAHTu/JJx
         GjeqOR7Ekxg/xolR+D9YNmOLEnztJ9GMn1HRNxHBm3v4r9Ybhq8UIQF2TdqGC3e9mCJh
         cJvJxkCjdooTGxW9wkXIvhdqfwNVoDSpkGG8QijYnqmbcALkPe+y0fdNzcra1sOqTTSn
         0Pl+I2iwKd+RQFNcS9vGOxnRIpatfNAJ8oaGfxxWOp87oTVCaxRMqPA4QcUfcy50hFiK
         pbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253413; x=1790858213;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAR7nTOPxRo/mfR2u3OdcokbjHynlMhWcl3pdNDsUgo=;
        b=1/ilaHH8Y+k2j5evDqCiG/wVBVXTRgWo/0X6qRmGYrC/PDHDum+JzkUaYk6tYTUXh/
         24dfCsJk6j6trru+l8mKmEmjVTPd48OpliEYDTFxc6RxWB+q+qpvqGfbAT+N6DEhZYQZ
         +mZPXlBEjA52VPz4iugCMoZTOGCJJazxlGYqS8laUfbzWa/jL4j2KBCGt3ZLHWow1jBQ
         d2KfoQBFH6buGuteX/fbvV4n7kAd/svJbysnsldd2+E7k0U2KZERk8Vb2a5FfHfwcJcG
         THfZ91ZZS9iRjmeh1ySifQGJ3dXclT7mPV4FfxQ0GsnGYIotl0PvAgaamsphUysRrRW3
         pK8w==
X-Forwarded-Encrypted: i=1; AKwUvBxAa2IXCjOhWPAJ3i2a1bJ5xhTvNiV7uFzsshuw5QrR7yRI1mr95VVF5eHEWZqAhhxqtjB9@lists.linux.dev
X-Gm-Message-State: AFuF++mF0jb6+JcejAfGFflLKLTNdJZ8tQP3RLGgBuxxy/NfSg4MJRbJ
	9pH/i/xPpOJhxRDUChn0ijraudmkeKM48nJ5QP/wxUZmESZlafa6LQ0y4uN1eEL7VA==
X-Gm-Gg: AYBFou05AKuUgx7MB16SF15IFVFnxYBJfik3taunemR6oPUDm7zF34wEPcWSd54yAaH
	rjJm2EpwYA94d7OZ+1jtkibnH6Ysd669763r8LtuFVIxCtTMzOCNT5x6harw4i3rLl+oafNaZna
	HfN94OOI5L1p/joiJYE8a8JwDCmR/jhW7EQa3VksLGbcdsXjb1ne1WRqBKrGm12I1S/gl8gzllv
	c1LAVkpYAuCFgZXuMGXSI+0raq9OAF61ZPkia3WaWjZi+UVMVhAkCtFgURYrt5rQTLNLQwuYYHz
	ikdtzOVnrMunHCMKZ8Ye0HOaxRHmrjJaMqSFqEmN0Zes+33/FeJiRfmwlF4KF1O0vrVPAfEviUY
	nJBcMBenGUEnbSmjGF/205lPKQRHN0y3AbHLQ66zea3MAaPZH2XZeaVIb7kM1rFKh1MAsWuaYpD
	1rlBFnlkiH2IXRFnHqNDlpm4nBcq1ceZgmpP1ioTIXUNVr1vFDNzaCh0w37X1tCpm3cJOOoaZBn
	Frf44xLAwYOMaJNghIQv8SB3Xy1Os123HNlsZcmyw==
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr38631215e9.35.1790253412640;
        Thu, 24 Sep 2026 05:36:52 -0700 (PDT)
Received: from elver.google.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4cc01sm56905385e9.3.2026.09.24.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:36:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:36:40 +0000
From: Marco Elver <elver@google.com>
To: Guenter Roeck <linux@roeck-us.net>
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
Message-ID: <arUZWKjKr5I5tlOj@elver.google.com>
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
 <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 22, 2026 at 07:58AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> > 
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> > 
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> > 
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> > 
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
> > 
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> With this patch in the tree, I get ICE erors when trying to build
> csky:allmodconfig.
> 
> Example:
> 
> Error log:
> sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
>  1202 | }
>       | ^
> (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
>         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
>                     (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
>      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>         (nil)))
> during RTL pass: final
> sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
> 0x779b51e2a1c9 __libc_start_call_main
> 	../sysdeps/nptl/libc_start_call_main.h:58
> 0x779b51e2a28a __libc_start_main_impl
> 	../csu/libc-start.c:360
> 
> This happens with lots of files, not just this one. It is seen with all
> versions of gcc starting with at least v13.x. Reverting this patch fixes
> the problem. Bisect log is attached for reference.
> 
> Any idea what I could do to avoid the problem other than stopping to build
> csky:allmodconfig ?

No idea what gcc is falling over here, but the below patch could be a
workaround/fix. Does that work better?

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Fri, 8 May 2026 14:51:45 +0200
Subject: [PATCH] csky: Implement _THIS_IP_ using inline asm

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g. ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/csky/include/asm/linkage.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/csky/include/asm/linkage.h

diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/linkage.h
new file mode 100644
index 000000000000..04afd3583e25
--- /dev/null
+++ b/arch/csky/include/asm/linkage.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_CSKY_LINKAGE_H
+#define __ASM_CSKY_LINKAGE_H
+
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=r" (__ip)); __ip; })
+
+#endif /* __ASM_CSKY_LINKAGE_H */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

