Received: from mail-dy2-f18.google.com (mail-dy2-f18.google.com [74.125.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0B442397
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317971; cv=none; b=VgIMORI3nn6+7AY3+GQ+OfF3ip3aKh9HP+eD+4tYoSRV0X8JAmYcCsXhF/hl/WqyAS0hfibH5G0pLup9SunK0kj4jQMx3/mcM+xaRygY2Pg04WZiwluGUxBxQq7YuOZm9uSoKTkEqR8CeeceAnnP02GNto9FWa/Ar/Pt0GxB8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317971; c=relaxed/simple;
	bh=xOahPn69qqJwSaHXWqegaZpvObEwTRDPSZd6wMIDrN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApuQGE6zjalkFHZLtLWj6jPjjYAX4KtsdeRXoRF2ZSlUG51jz/S3o+lmu33a+OmTaYeFjhucEHSifZxGgj/L36/0evp8ptDPLBKvrXGDjnbBPXEDzmuVHFnnsloJjiN5JWrCG+vDiZZ6i2m5g4ofJ52eHAorbByB+VF6TWOb3mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNSanSrY; arc=none smtp.client-ip=74.125.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNSanSrY"
Received: by mail-dy2-f18.google.com with SMTP id 5a478bee46e88-34213ed0b18so27070eec.1
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317966; x=1790922766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff013h9UPO5JfvQ6KOoQNBZOiCtGEKIOGbWYKhP5c+0=;
        b=GNSanSrYdcNVKfUrE+AUiXe83MrIq37JnTXnnMy2xLtLukD6cbqJYyio4QpptWPRD8
         T/k5VyhoEnqhU71UROa4QVPRWm9Uyewuv/4KYdEg/qO6SJUo/ujv1aPLOO84WZwNA69t
         CHHQWxJSnrlLGlKp8g9TR4q0N1W5aGYcCioq/tyEyKQaJANcBF0NqfLS1XeeREpQ07hj
         cORfBsl6uhZeLrDSi6K111oSKjmkuh3imfte/Dut1ziYKzrog35K3kxU2zq/2owqzYSu
         G1eRphC2gk7kNHWJotJUdyOmw4s3jdbZJz/agvBza4gYkSON6fFEUffzO1OLs37Sj/m0
         CXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317966; x=1790922766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff013h9UPO5JfvQ6KOoQNBZOiCtGEKIOGbWYKhP5c+0=;
        b=dpaG5b/zgVbwJj86Sjua9R466xWHMrTyfTKue05MqLa3Y77RdiAGAWlVJPeorW56YZ
         U0fe3deKrjAdu4X5fvLrU49QQoWLAj39OBs9yPZ4GoDayoJFDuCc+NOQtpu61JlVJ2+/
         ryWFBaD+kXXHTVL4d7eNkyrrCiZn96XfzQabhgfOCxu6MVwDOsGnUptSbEzxYSe9quIt
         Cm++XIJj/dSpBClowXlU3fsTlvFQwFh1OP2f9BSixoqvgAJ6Pt4xs1ChHhImqE1OGff2
         TK0kyVywrvHC3yyM4jPS8DfwJwJr8A5IXU/aJn6RDI7DFZOgy1V6oLORPcfbZJol2um2
         u6Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzrBQp6UKLlJhSycjY8Wj6VfUzw3DK1wJy5WyVoyuUJF3gGVFK8mnSDUq2yXurq05J1RMZg@lists.linux.dev
X-Gm-Message-State: AFuF++lc6kSDVjVnzyMo54slvWHIEFSiEa5iyCZkR9S2CX7mjZM/qdEl
	pZ5d9JQVjSR9TuDuu4yHad2wwVHOhuSH+ax3G1Yg3n22edbKlxtss6XA
X-Gm-Gg: AYBFou3ZyXTv3S5Hz0DgVtK+s5t3ItsJW1TKgfERHN2i6Wws00mYGag3sGzwTA0GQ4X
	igMGtK+bcUXzMJdPWix3AaK+nNkoqRqjTckovmD07G+cvH5AP+uxLLlqvYk7DTEZDdN3T+v8Ete
	Y5zM8aX81neMNnUxDbrMFN4oy1D/AP2kKwYZUj622fVq/a178fcozHAUYsfuzYuvdTt0pRSfx1V
	9GFSKeiQnvT6DhPSOa8fzj8x9hCCArse7Jza7zPc+oso2CCBauJbwnvWPBHVjDmHmmdffTOXmYn
	W8qx9kSJlxggMMqklgwShf53uwAXR8VQmP5Coaa/CjVM1hz7LRwpSXOn65RNqAodhWoD2VH6HOU
	x9a5uNs4xPVyqouo0CbS70wS42qd0Q89IHugnvjiMYP6wVnHW/7vU1n91SuW7w1k+uj18420YJQ
	vC8bEuq3iAjRYaS0WCChBkLgqngycDuEe+Pltnk4T/8KSMNW9ABShcJAqELD34uWPfwAXtjKarT
	b5DHfCydx1qMAGB6pGn2jJ9KrlN5YFNXaheupxtBi41
X-Received: by 2002:a05:693c:87c3:10b0:33b:c478:a545 with SMTP id 5a478bee46e88-34002be4604mr3482720eec.8.1790317965974;
        Thu, 24 Sep 2026 23:32:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm5786357eec.9.2026.09.24.23.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:32:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:02:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, 
	will@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, 
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
Message-ID: <arYUiddxIDeLYj8v@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <arUbw_TIA0Uj7oXT@J2N7QTR9R3>
 <20260924125253.GY776954@noisy.programming.kicks-ass.net>
 <arUgNdqpA5U8EjjP@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUgNdqpA5U8EjjP@J2N7QTR9R3>

On Thu, Sep 24, 2026 at 02:05:57PM +0100, Mark Rutland wrote:
> On Thu, Sep 24, 2026 at 02:52:53PM +0200, Peter Zijlstra wrote:
> > On Thu, Sep 24, 2026 at 01:46:59PM +0100, Mark Rutland wrote:
> > > What problem is this trying to solve?
> > > 
> > > Mukesh's original patch seems to be trying to check whether we compiled
> > > things correctly (such that the bug_table entry points at the expected
> > > insturction), and I don't think that warrants a runtime check, but (as
> > > per my reply to him) I don't understand why that's a thing to check in
> > > the first place.
> > > 
> > > On arm64 we only call is_valid_bugaddr() under do_el1_brk64() ->
> > > call_el1_break_hook() -> bug_brk_handler(). We only call
> > > bug_brk_handler() when HW has taken a BRK exception with the BUG_BRK_IMM
> > > immediate, and that can only be triggered by executing the right
> > > instruction (BRK #BUG_BRK_IMM), which we ONLY use for BUG(). and WARN().
> > > 
> > > So I don't see why any change is necessary here.
> > > 
> > > If the HW has somehow taken a BRK exception from any other instruction
> > > (which would presumably be a HW bug), there won't be a bug_table entry,
> > > and so __report_bug() will fail to find an entry, and will return
> > > BUG_TRAP_TYPE_NONE, same as for the !is_valid_bugaddr() case.
> > 
> > Right, so I wasn't at all sure what he was doing, Rust is still mostly
> > unreadable garbage to me.
> > 
> > But I figured I'd much rather see him use is_valid_bugaddr() to do
> > runtime checks than whatever dodgy games he was playing with that label.
> > 
> > So *if* doing runtime checks is what is wanted, then is_valid_bugaddr()
> > needs to actually work, because then it grows a user outside of the BRK
> > handler.
> 
> Thanks; I think we're aligned. :)
> 
> Before we delve into implementation details, I'd like to understand the
> problem Mukesh is trying to solve.
> 
> Mark.

Hey Peter and Mark,

It's not as a problem, it's something i faced while implementing the
ARCH_WARN_ASM, the generated assembly was not correct so i wrote a test
for it, I sent it out along with the same patch[1] but then the
discussion led to it being for all archs so I sent it out as an RFC to
know others opinion.

After Peter's last comment i found is_valid_bugaddr can use a bit more
work(atleast on ppc) so i think i am going to drop this and go ahead
with improving is_valid_bugaddr.

Regards,
Mukesh

[1]https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
