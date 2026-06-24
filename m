Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155D3A6B76;
	Wed, 24 Jun 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293312; cv=none; b=InEe0mmw98XKT5aIsK6AMw1sBCA5bFCOlhw3ZD3Tr/sMj+Nrfhgv7T0NQq0ilTpQfQYyOPOgieB3nKfFncarn8ioT9bBYUSWJ2YazUreC9IVngsOzvLOkbXvlEczf3Ye3sPZ4rSsir4SnMQzE5BBcMP5hEmyyvR0gFNKAmYVFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293312; c=relaxed/simple;
	bh=t1nkGQcrJ6jBqiFjk1l/wvIDREH84FU2qpKlKPQ4/MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCw8NAXMshZvqaTjetzE874M426rzmXoLAyh4G5RGdS8kLEAzf4lYofDHMuBdK6um5i/0rbCzVEqAEbDlbtUOOZ0FN2jRMjoD0/xrHIFSyfwPPrUfxjRyHukngyHHaFdxAiQo5PyTRtAfE6Ac4BDDebxJUvQZfLdnnhw4LDGDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SL1bribQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SL1bribQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IH5pzL7xDJuTGOfUKdXnfgfsXZD4Qs5F0+3YJ8fUfSw=; b=SL1bribQO604ik4nFsO3yOcsvo
	YP1BVY2dSbw++rnRjFrHq4sp0ILcMSoJtpkWqv/BFxUKdgZrqUz50cSOhlK/dsUSDU7HGkdF1ax9w
	NFhoW557QX7utwmMe61s4OzzmOuvHsh+DhGeYXXV2V6956QbTH6tOIbBFmEQK3SNmgdOKNnwfBy9R
	gIsuQii1dUOQvYvcXEtdUs2ZolysyZ+Yp+B0ciScwQhs9KzpGftDNyRI33j4W/QfKEMKdtoLrMKxj
	I0drGjYnGXCv/T6vWSm+P24fN34dWGHRulcX+XaOegGA9SlgTnKyW97swcyuq5OkmMeUAmciikIVM
	u/4wzBvQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJtw-00000007mR4-2YgN;
	Wed, 24 Jun 2026 09:28:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 11F11300400; Wed, 24 Jun 2026 11:28:07 +0200 (CEST)
Date: Wed, 24 Jun 2026 11:28:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, jpoimboe@kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
Message-ID: <20260624092806.GX48970@noisy.programming.kicks-ass.net>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>

On Wed, Jun 24, 2026 at 01:57:46AM +0500, Mikhail Gavrilov wrote:
> [+Josh, +Peter: objtool question below]
> 
> On Tue, Jun 23, 2026 at 8:17 PM kernel test robot <lkp@intel.com> wrote:
> > >> vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with modified stack frame
> 
> I looked into this. It is an objtool false positive on a computed goto,
> not a problem in the patch, and not specific to clang 22.1.3.

Urrgh, computed gotos :-(

> Config has CONFIG_LTO_CLANG_THIN=y, CONFIG_FRAME_POINTER=y, KASAN and
> OBJTOOL_WERROR=y. objtool runs at the vmlinux.o link stage (per-TU
> objects are LLVM bitcode under LTO, so the single amdgpu_vm.o never
> reaches objtool). The robot hit this with clang 22.1.3; I reproduced it
> on the same config with my system clang 22.1.8 (CONFIG_CLANG_VERSION=
> 220108), so it is not a 22.1.3-only codegen issue.
> 
> What +0x186 actually is (disasm of vmlinux.o, WERROR dropped so the
> object survives):
> 
>   17f: 48 c7 c0 00 00 00 00   mov    $0x0,%rax
>           R_X86_64_32S  .text.amdgpu_vm_handle_fault+0x196
>   186: ff e0                  jmp    *%rax
> 
> %rax is loaded via an R_X86_64_32S relocation with the address of label
> .text.amdgpu_vm_handle_fault+0x196, and +0x196 is an unconditional jmp
> back to +0x13e, the head of the second drm_exec_until_all_locked() loop.
> This is the drm_exec_retry_on_contention() computed goto
> (goto *__drm_exec_retry_ptr). There is a second identical pair at +0x194
> -> +0x188 for the first loop. Both targets are inside the function; this
> is not a tail call into another function. (svm_range_restore_pages() is
> the inline stub here, CONFIG_HSA_AMD is not set, so that path is gone.)
> 
> So clang materialized the label address as mov $imm(reloc); jmp *%rax
> instead of folding it into a direct jmp to the label.

So, if my heat-addled brain isn't completely gone, then this all boils
down to something like:

  drm_exec_init(&exec);
label:
  for (;drm_exec_cleanup(&exec);) {
     ...
     if (unlikely(drm_exec_is_contended(&exec)))
       goto label;
     ...
  }
  ...
  drm_exec_fini(&exec);

Except, you've laundered that label through a computed goto to allow
multiple such constructs in a single function -- because can't have
multiple identical labels etc.

And then clang, can't untangle the web and makes a mess of it. Which is
really rather unfortunate, because indirect calls are yuck -- also
retpolines and cfi and all that jazz.

I do think this is very much a compiler issue, clang should never emit
an indirect call for this. Doing that is just aweful.

Also, note that if anybody were ever to use a guard() inside this
drm_exec_until_all_locked() construct, there is no guarantee the
computed goto will actually trip the __cleanup(). Computed goto's and
scope do not play well together. And the moment clang emits an indirect
call, it means it lost track of things and things *will* go sideways.

And the only reason you want that label, is because nested loops,
because without that, a simple 'continue' would do just fine.

That is, I think this drm_exec_until_all_locked() thing has some
fundamental problems the moment clang fails to optimize it away.
Correctness really depends on the compiler not actually ever doing a
computed goto.

> For the indirect
> jmp objtool looks for a jump table in .rodata, finds none (this is a
> single relocated label, not an indexed table), and falls back to
> treating it as an indirect sibling call. The frame is already set up
> (push %rbp at +0x5, sub $0x160,%rsp at +0x16), hence "sibling call with
> modified stack frame". Runtime is fine, the jmp lands on the intended
> in-function label; this is purely an objtool classification issue.
> KASAN probably
> tips the balance: the function is inflated with __asan_* checks
> and shadow tests, and on that body clang keeps the label in a register
> rather than folding it.

Right.

> The drm_exec_until_all_locked() / drm_exec_retry_on_contention() macros
> are used widely (amdgpu_cs, amdgpu_gem, etc.); the patch under bisect is
> just the first to put such a loop into amdgpu_vm_handle_fault().

It is also the first to cause clang to loose its mind and emit an
indirect call. Which as I've explained above, really is a problem.

> objtool question: should objtool resolve an indirect jmp whose target
> register is loaded from a relocation pointing at a .text label inside
> the same function, and treat it as an intra-function jump rather than a
> sibling call? That would cover the labels-as-values / computed-goto
> pattern that this and any future drm_exec user under LTO+KASAN will hit.
> 
> I am not respinning the series for this, the page-fault conversion is a
> pure refactor with no manual stack work. Happy to test an objtool fix,
> or to help with a drm_exec.h workaround if that is preferred over an
> objtool change.

While I do think we could teach objtool about this, I also think it
should still emit a warning, because as stated, this pattern is very
very suspect and likely broken :-(


