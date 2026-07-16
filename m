Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC919335067
	for <llvm@lists.linux.dev>; Thu, 16 Jul 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190817; cv=none; b=d5bR4Jp8Lmo+7mVVj9kKPNULg9k/su4V7wJ+rT0u0Q6LfJSY5j1umYQCaHgMLm9cuYgC6yBTUpZKzSixYPyKt+3Jq8lUzKvjWpSkBkXw8N4ps48LRW3aD/kNWdYXA7YllMs491ZbZQiE2DHWYP/yY5TOr3VJRyuU3NetEj0gu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190817; c=relaxed/simple;
	bh=meMV833twy+M3kckbAZuDmxLqhSdiBHtNmygGhrlTOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t471YbsJ74zaTsCgozCccA8XugkcIqmdyMer+zX/JyYX53B0gQPrFBTte/KRbY/VMGpFiM2oBSVolXFt9BbmQPo76YOMUT+vOM0PX9528wLn3Ns76nF9agke3Uyx3Prc0kbwTWWrlloBAw3klUn0oB0sq10U8DPYoH8Q2SIBxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pQnUVSZu; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pQnUVSZu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784190810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aysM4zCJuYKcQ7H3MwjGz/e2ioD0RBt8r3o6u+1jaQs=;
	b=pQnUVSZuK2pQvfb21Sm5day6IZ2hJs1lV1PrmOU2qdAEA2vBzj3+Bg39/du/TyyXCk0YrB
	i17CPiTZ9HquuRAd0ykrG7371TTLYoopsb0smFY7StHcTSVQweifp4UyU3MpmzB3RZRmzk
	+kGNumWOvyzxSRuXY09TAEyL+gjMgdQ=
From: George Guo <dongtai.guo@linux.dev>
To: xry111@xry111.site,
	wangrui@loongson.cn,
	chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com
Cc: kernel@xen0n.name,
	joe.lawrence@redhat.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/12] objtool/klp: Fold LoongArch paired ADD/SUB relocations into PCREL
Date: Thu, 16 Jul 2026 16:33:21 +0800
Message-ID: <20260716083321.14515-1-dongtai.guo@linux.dev>
In-Reply-To: <d89e9c660f06489c59c2f1f7fae0547abbefac71.camel@xry111.site>
References: <d89e9c660f06489c59c2f1f7fae0547abbefac71.camel@xry111.site>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Xi Ruoyao,

> Hmm, is this a flaw in LLVM?  We have
>
> config AS_HAS_THIN_ADD_SUB
>     def_bool $(cc-option,-Wa$(comma)-mthin-add-sub) || AS_IS_LLVM
>
> so we are already expecting LLVM to emit R_LARCH_64_PCREL always instead
> of ADD64/SUB64.

Yes, it looks like a gap in clang.  I measured the full matrix for
".quad sym - ." on the LoongArch box (GAS 2.43.50, GCC 14.2.1, clang
21.1.8):

                          default       -Wa,-mthin-add-sub
  as / gcc, local sym     PAIR          THIN
  as / gcc, extern sym    PAIR          THIN
  clang,    local sym     THIN          rejected (no such flag)
  clang,    extern sym    PAIR          rejected (no such flag)

  THIN = single R_LARCH_64_PCREL
  PAIR = R_LARCH_ADD64 + R_LARCH_SUB64 at one offset

Two facts fall out.

GAS defaults to the pair and needs -mthin-add-sub to thin.  The kernel
passes that flag (arch/loongarch/Makefile), so on GAS both cases are
thin.

clang has no -mthin-add-sub.  It rejects both -mthin-add-sub and
-Wa,-mthin-add-sub as unknown arguments, so cc-option drops the flag and
clang uses its default.  Its default already thins a locally-defined
"sym - .".  The logic is there.  But it does not cover an extern
"sym - .", which stays a pair.  There is no lever to force it.

So the AS_IS_LLVM branch in AS_HAS_THIN_ADD_SUB (commit a7e083772456)
reflects clang's default, and that default thins local but not extern.
This is the case your commit 120dd4118e58 flagged ("Clang has some other
issues"), still present in clang 21.

In the kernel it shows up in __jump_table.  A static key defined in the
same file (e.g. netstamp_needed_key) gets the thin form.  A tracepoint's
key (__tracepoint_netif_rx, defined in another TU) gets the pair.

It only breaks the klp-diff path, not a normal build.  The pair is
rejected by elf_create_reloc(), which allows one relocation per offset.
klp-diff hits that when it clones the __jump_table entry and re-creates
its relocations.  A normal objtool run only reads relocations, so it
never creates two at one offset.  That is why "make LLVM=1" builds fine
but klp-build fails with "duplicate reloc".

This patch folds the pair back into a single R_LARCH_64_PCREL, but only
in the klp-diff clone path (convert_reloc_sym), and only when the SUB
half targets the relocation's own position, i.e. a real "sym - .".

I am not sure this belongs in objtool, though.  Would you prefer:

  a) keep this, so klp-diff tolerates the pair on current clang; or
  b) treat it as an LLVM issue to fix (clang should thin the extern
     case too, matching what it already does for a local symbol), and
     leave objtool as is?

I have not found an existing LLVM report for the extern case.  I can file
one.

Thanks,
George
