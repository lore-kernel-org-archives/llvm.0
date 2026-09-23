Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429E43DA20
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144912; cv=none; b=qK8xYwPfwQrCazR/vu8pXmV71D6qwXcq6PVBk9txoC02xpqLdEvQ3o37hCBliozbIc9+z89aSQ+luyqBOHXrUXQf62R2U4rVVIyj7ECZxsbFL9oxhJKmMKe0eIedY+JJrgt6fjJNoN/cN91BkJlvzCAhrqnb9DLSCzy33uk34rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144912; c=relaxed/simple;
	bh=4G5stfYL+d2I3arosXAulfA419oGwxz6L8v47Lllkwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KToRfnSjhRoP4Ytym39tzuvVYSeSrxaTnyDQyfr1sNl714f6Rx2Y6a4gQ9CVEDzlmeiU7aTlKsMq1AVI2Kzymw/HexfCwXyHeJddkSPGYL94/mEw/PdqkL5u/3bqRq7BGBBwcsPjBLXTfRkwd9rNczInrmYjv4enuNCl175M7cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdwzPrmk; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdwzPrmk"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32dbbe82e13so482418eec.0
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144910; x=1790749710; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hUFOEJST1qHgvJkQDivOVNilsD3f7PYYgSWMm8/mzk=;
        b=fdwzPrmkMNsICInvUqF9e4k/pCeJX1Y9o9c8FB68Le004lTS7uZ1s+cNvzicWwXcC9
         YP+ZcjuYFU9Wk6F7IJbxJic1Q+gtuvY8hogveUXj00vsxpu41cNQbl4pjpCQkL8aD6IH
         nyrMKlNMF2hkenKZyn1ZzYWDWZqiFwSuK736PHPL79jcsp900F0zG/1fLBH6V++AEKpH
         2eC+222+DmIqjVlxLM/z5leyp8wN7Yb54yd44ykPyqgXGjk+fbKiXTyhdqsQdCTZuPix
         PyhBuC3L07Yw/pIy6uZPoR6NIpg8EdTtx/pXW2EYOXeYTqNgLQfb3j0P1rTE0rUP0qY4
         jj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144910; x=1790749710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hUFOEJST1qHgvJkQDivOVNilsD3f7PYYgSWMm8/mzk=;
        b=001JOW5HxwI3hoZpolxUgxTJrJlABGE1G22nj8JMj8h+0ZCqpCIzARbYGXkNAB18aa
         OSlAANNfToVCO3gILZtO8QRGZmBlHPXKDMA12iOYGK+fkhfPCbnU7CF7eBdRXJ/9b11S
         IWBHanee7Bdw0Tto+CcqIyvVjXVgWz5lddCzd0AnJWgFX9YgtdKdHvVtXl0xtut38BDC
         TM4fDDaGRjroc9EEOBJ0qxtgZrRoNi60UyRfb/onZ3TgmIt0deKOgV3n6CCDbkrDtDGO
         SYONLGRlKF8tSQ2tvgJzRZgiBKnli/ZT6crrtKz4Am/KgiN5bvZoKZkc510S2yvZXU1L
         0SSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvqiAm0/p03TWZTrg2eENNXFmaQTv5qd/rGAvGuLVpxqIn2UWpp3bt8ALSTAl50hCn2VSZ@lists.linux.dev
X-Gm-Message-State: AFuF++nZJRH0sqJ2BxHSqNY5b4qZaUFAidHRoNWGNd9tBYFoQjkmAug2
	V0XBaKvhL64/WG1QS8yuOX7vygPlnSqzy7bl4SOWEkkP1MONQ17R4mxv
X-Gm-Gg: AYBFou2vzyi8gAieZbcsxOzU5nhnEA9hLr8czRtAY3ALBeLQ4NqzBWTM96aWWltvx4t
	Qh7JbrqgethM2udujAnLG6FWs8UKBzDiUyfuF57N3jE+qtG8agaYiPEiNweH56T8NF+F+/1LPzg
	BHiJUzrzV50hGIzdaq1ynvmQU5L7KzH+GOK1gUXR0qq2+75Vvp6ScatkqOw79O6do/0aM0sUvOd
	Kodbtj+u5kSPgGdm2KrQcAAqPBK/DGQ1b6BW01zNW5WTz8htuV/zs+96IV3IJjkpMqoEVnAndYy
	zLb4LuGlcq/VMC53PpbNqKbmk8VzLoV7zOJj53qkn/pVEEqVy/+RoD3LYi316oS3DYkK31TVxKO
	GLU4F3B+VsB1h1P3MWwcDf3+gsX/W9XFJDJ17IIr/GkYZ8wqbNk12z1ctJWunSXOCimadR4bpEj
	tKrcJ5J30ObOL+YayiUTFBLESZvTNEfN68zTGGNc9nwBeqW3zI8D4vdSqt6ID+PVW5N3m9r3j48
	aB5FCGB8ke7vQvyQEOd5VI5S2xp+6DS8s4JemdCWy/7Mx6zZnjuUQ==
X-Received: by 2002:a05:7301:3a86:b0:33e:5c4f:f46e with SMTP id 5a478bee46e88-33e8d8d2598mr1603719eec.30.1790144909601;
        Tue, 22 Sep 2026 23:28:29 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e97236754sm3074867eec.29.2026.09.22.23.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:58:13 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, thuth@redhat.com, 
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922064735.GS4121339@noisy.programming.kicks-ass.net>

On Tue, Sep 22, 2026 at 08:47:35AM +0200, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 11:20:00AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
> > bug_addr displacement — i.e. the arch's trap label reference resolves to
> > the trap instruction — by calling find_bug() with the exact virtual address
> > of the trap, mirroring what the real trap handler does.
> > 
> > To support all architectures, each arch that implements ARCH_WARN_ASM now
> > defines ARCH_WARN_ASM_TRAP_LABEL, a string constant naming the local label
> > at which the trap instruction is placed:
> > 
> >   x86       "1"     (ud2 at label 1:)
> >   powerpc   "1"     (twi at label 1:)
> >   riscv     "1"     (ebreak at label 1:)
> >   arm64     "14471" (brk placed at 14471: by __BUG_ENTRY_END)
> >   s390      "0"     (mc at label 0:)
> > 
> > The label is used consistently: in ARCH_WARN_ASM itself, in the
> > bug_addr back-reference inside __BUG_ENTRY / _EMIT_BUG_ENTRY, 
> 
> 
> > diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> > index 23ab05438269..6cca8880660e 100644
> > --- a/arch/x86/include/asm/bug.h
> > +++ b/arch/x86/include/asm/bug.h
> > @@ -62,8 +62,9 @@ extern void __WARN_trap(struct bug_entry *bug, ...);
> >  #define HAVE_ARCH_BUG_FORMAT_ARGS
> >  #endif
> >  
> > +#define ARCH_WARN_ASM_TRAP_LABEL "1"
> >  #define __BUG_ENTRY(format, file, line, flags)				\
> > -	"\t.long 1b - ."	"\t# bug_entry::bug_addr\n"		\
> > +	"\t.long " ARCH_WARN_ASM_TRAP_LABEL "b - ." "\t# bug_entry::bug_addr\n" \
> >  	__BUG_ENTRY_FORMAT(format)					\
> >  	__BUG_ENTRY_VERBOSE(file, line)					\
> >  	"\t.word " flags	"\t# bug_entry::flags\n"
> > @@ -101,7 +102,7 @@ do {									\
> >  	"99:\n"								\
> >  	"\t.string \"\"\n"						\
> >  	".popsection\n"							\
> > -	"1:\t " ASM_UD2 "\n"						\
> > +	ARCH_WARN_ASM_TRAP_LABEL ":\t " ASM_UD2 "\n"			\
> >  	_BUG_FLAGS_ASM("99b", file, line, flags, size, "")
> >  
> >  #else
> 
> Not really a fan of that. And I can't really tell what you're doing with
> it either. The kunit is in Rust and thus unreadable :-(
> 
> I would rather you fix up is_valid_bugaddr(), some architectures seem to
> have an always true stub because of the callchains always being from the
> break instruction.

Hey Peter,

thanks for the suggestion. I will fix up the is_valid_bugaddr for
powerpc. I am not very good with other archs asm but i can do it for
ppc32 and ppc64.

Regards,
Mukesh
