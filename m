Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7D409136
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318214; cv=none; b=HaWIU9hLEb42IulDk+vsGsCpRCnMNTIc41lX1uBvt8jZRWhTCjB8cdP6zGAoNGAD075L5rZ2ClQpmU7CyklUaZAjfzIo08Q569SpgCD3oDxmwsAU4pt0DbOFzt2bRUzjumg0S+8kRLsEGN4XzwEoxnhPHtsdYWToxjHsEhw7Qdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318214; c=relaxed/simple;
	bh=Y0BkeFR+jc7KLjpu5J0dm3/R2PZPKVLNTuUhB0q6vEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBs8IP3Efe48Llh7NcNstOxb2OKTS2EE9mk3W60KLag1h43oXanRkQqtkogrFiYt9AmbUWFPXXMgaA2wZ6tXdJy5CDgCWFuCo2N11I3FpTe+1ssHMKeHxgFkqTuFvYdEI13igFpQPaSKlbHbVkVu5R/jLw9Jp9uC+NRDyA66hs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko3bdG3+; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko3bdG3+"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664d3421so351093eec.3
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318210; x=1790923010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=Ko3bdG3+5axl9UDTVv+Arag8r72WGcg3FyOp8kVtbQ46cWmQ6uQG027ytSKh0lt9NF
         e4yjMUEwqSnxy0k9KrKGKaAnzr4Y7zGSAyJQf6zTa5OBvF+EKq5vh1HSkhCb60enHbtQ
         /Ff9hvesBex6ZAPq0L3+aUGtWMo8cPgM2ZAzKsaqArkzrgbJyXz8R0BMi9LM1iCBxTLS
         T0SWAVziXkJygrVHogoTo+IUzcbOLr68wz1haPBq7BR/HM/4q6VoXr4UoWJGc4la3W5e
         jVYf9dMyGpdI+UzSRAVNcY46NVCsUyuN1ZoTOsPHscqaxW0/WNngFKpmPBRh1Kl5K+ol
         E+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318210; x=1790923010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=rKEOQT36L1huKcSKNmgKJLia3PR4TqNeOcRABVk0YyMF4TbPb8a/PC3hbDymgem+mZ
         UWuuYotLCXImFDJwrwMGhj9Knwt9SEKxk558qu8wpkei2r9GS23EGKxQZsdYdVF5i+1Z
         vLBP8exi9vYbR+bTbf+D2jP8ffoNAa9fS2JgTFYx5QTkh8k/JJL9ekfPMM5o8SQWYMmy
         6WFRxwvRpaxVYQfS7pSsHHQUF/Uh/GaYQG+jY8hsbBM88OfkvsIxL2068YP/hl9VFo7p
         jykjqZk0gq3PGQgmHLLJxDv5OpfZW8DC5fTf0XkfpIs4XJDchDJx07QE7Tu7GQFun+i8
         0scA==
X-Forwarded-Encrypted: i=1; AKwUvBx5nxanbOai9M9HN73l1PrBdeUG8SCm32+iotD4EaTBdggQ/WsZdCLeeVKzA4WlSoYD8uFn@lists.linux.dev
X-Gm-Message-State: AFuF++lVFVKDu/PynATuJvEFZChfqFz/y09M4NMKpa9fhcJuC7cqS/U4
	rx4oDFZLyiQSrksZ9tWZiB22xhwnASKl7E2MbR79RhVKtoa9zcXU3Dpm
X-Gm-Gg: AYBFou0p28yHf0eE/jmJ8c7fOguQ2PHydJrtIvmPuGjX+v9bdKuG7JktANKbCt1iHS7
	JuyAf1Xuk7Drwxi3wWKzeDTBy4jupnJexe1sfidVvWeTECEi0chPjpIb+PPgRUvJWrqgsvAwIqf
	69kCtZN+wPlEdDlkUoXJBPPLrdL6Ib6u2uv/2ttD2B4s0zoUAjk8hbZ6F0l+mcCqASOsk/TPib8
	lWl4Wf/TAc3wGZbYwskvWqhfOVHrA5nL8FfiSYDwfyJT0jK1Ox/x2eUXGC491i0FlQfPSFywrhW
	ZPvACpswuW3cO7W6xZuop0dwvZV8MXtwfozqfyYtSwiFTSF4T/xgC/L0QeWVUE+3+G3HX5YqeTi
	ptoZQj+9DeWZyN5nPF4kYs56blPZePHMeVRnoJ7MUENGJyxZ/BSYX4rfXtOmeu9lTwhwM1mYYYr
	bF2PI+5x956Z0pGSqebSF2bZxDCiKrrwJzkaBoOb/ieEOG+vsMAbi3lwut/39X+FPi4NHD5julD
	p+6ScmTkMiUz9g2KptQEypqOMUuohaZHJCo1LQk916q
X-Received: by 2002:a05:7301:160a:b0:33b:dc33:7f98 with SMTP id 5a478bee46e88-340db4b9d18mr2352154eec.14.1790318209994;
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm3789127eec.23.2026.09.24.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:06:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org, 
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com, ynorov@nvidia.com, 
	joelagnelf@nvidia.com, david@davidgow.net, fujita.tomonori@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWDWmMJgIAt1_W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <20260924151335.18402A8b-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151335.18402A8b-hca@linux.ibm.com>

On Thu, Sep 24, 2026 at 05:13:35PM +0200, Heiko Carstens wrote:
> On Thu, Sep 24, 2026 at 01:15:57PM +0200, Peter Zijlstra wrote:
> > Untested thingies for arm64 and s390x.
> ...
> > diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> > index b6ba4465f59d..8bbb082fd5e3 100644
> > --- a/arch/s390/kernel/traps.c
> > +++ b/arch/s390/kernel/traps.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/entry-common.h>
> >  #include <linux/kmsan.h>
> >  #include <linux/bug.h>
> > +#include <linux/uaccess.h>
> >  #include <asm/entry-percpu.h>
> >  #include <asm/asm-extable.h>
> >  #include <asm/irqflags.h>
> > @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
> >  #ifdef CONFIG_GENERIC_BUG
> >  int is_valid_bugaddr(unsigned long addr)
> >  {
> > -	return 1;
> > +	u16 insn;
> > +
> > +	if (get_kernel_nofault(insn, (u16 *)addr))
> > +		return 0;
> > +
> > +	return insn == 0x0001 || insn == 0x000e;
> 
> I have no idea why anybody wants to do this, but it looks like I'm not
> alone :) In any case: the check is wrong.
> s390 uses only the monitor call instruction and this should be
> 
> 	return insn == 0xaf00;
> 
> At least it is not possible to set a kprobe on bug instructions, which
> would make this "interesting".

Hey Heiko,

should i send this out along with ppc. I am not paricularly very good
with s390's assembly, but if this looks correct to you, i can send it
out.

Regards,
Mukesh
