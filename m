Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAC84A2B
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 01:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978695; cv=none; b=Fq2w8bs/T9rvhPDT4qdKmOJ/8EEpVp9DgcR5VPMiMG5nxHKv4tTndga7GON3eAhHsSxw9tOd4MoxdLfXJ4RvXbC2kPGkXERqnT5f2fcDD6O8dxFsAdES784EZLF1gBl7WgKE1jWvr2z6smucD7tousqzCjy34fYWSQUPnuFB/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978695; c=relaxed/simple;
	bh=9l26VWfyG6FsKW9zKg4RNpZKAegl42nCqtAfIqEGxIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yae3iny+jhmHlin7pyrdXj3ZO4+IXHVeSo6MPff/o+wDQxc+6uqH27wnpPowIYYJV/Qp/dLOp4GSD2C8ZuYu63VmiRVxaa5BXczvDrJbuLPVJ+LpfBIUO9CRMaM9IgTsuGU8fiF1rum31gW36QWAyTPyiHDmAXPCnw4Aa9xO/XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlzZCPDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlzZCPDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78F7C4CED1;
	Sat,  8 Feb 2025 01:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738978695;
	bh=9l26VWfyG6FsKW9zKg4RNpZKAegl42nCqtAfIqEGxIY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZlzZCPDR6frw7KJxzRCPiADB+gLu2f8e3ztrgjFvQnYIndS/LlGF9AI78X3QfSREH
	 Ry23qgzZBd6wAsEP7fl7sV4Nf5j/gTjCCF5FXPV5bdeRLqmr89VoChyeNMX6Xi6593
	 DaW3Idb1pAe3HpMWxyLyRq7eeHuOavfMIwxerVCFWg9gXN4BI25nChPJRZSAcLK4Cr
	 Idx+OoaKGmjRS3kQsPxz2gfKwBTDP58QOPwHILs9JPFn16CVZpDCzMj23QPas/ftB0
	 9ojBD+jl9ZpGnVls51lRexFxpC/IcAkY7uCFmZTSeKLoGg2eX/TQOOKs30yu/MK7Gz
	 fXN68Kr5C4N7w==
Date: Fri, 7 Feb 2025 17:38:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, linux-mm@kvack.org, Ivan Shapovalov
 <intelfx@intelfx.name>, Vlastimil Babka <vbabka@suse.cz>, David Laight
 <david.laight@aculab.com>, Nathan Chancellor <nathan@kernel.org>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, David Rientjes <rientjes@google.com>,
 David Hildenbrand <david@redhat.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
 Joel Granados <joel.granados@kernel.org>, Sourav Panda
 <souravpanda@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
Message-ID: <20250207173813.5081ba76@kernel.org>
In-Reply-To: <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
References: <20250131191231.1370466-1-bvanassche@acm.org>
	<20250207164926.6daeac77@kernel.org>
	<CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Feb 2025 17:01:00 -0800 Linus Torvalds wrote:
> On Fri, 7 Feb 2025 at 16:49, Jakub Kicinski <kuba@kernel.org> wrote:
> > Could we possibly please still consider taking this in for 6.14? :(
> > Since the warning comes from vmstat.h pretty much every object file
> > generates this warning. clang 19 is getting more widely used now,
> > its making it hard to see new warnings.  
> 
> So:
> 
>  - I build the kernel with clang, but I don't have clang-19, so it's
> kind of pointless sending patches that DO NOT EVEN EXPLAIN WHAT THE
> WARNINGS ARE.
> 
>  - and even if you explain *WHAT* the warnings are, please also
> explain *WHY* they are valid and should be cared about.
> 
> Because honestly, W=1 is literally meant for "warnings that aren't
> necessarily valid". That's why they aren't on by default.
> 
> So no, I'm certainly not applying unexplained random patches that
> don't bother to explain the what or the why. Not for 6.14, not ever.

I thought I'd ask.. :) FWIW this for every single object:

  CC      net/core/request_sock.o
In file included from ../net/core/request_sock.c:14:
In file included from ../include/linux/tcp.h:17:
In file included from ../include/linux/skbuff.h:17:
In file included from ../include/linux/bvec.h:10:
In file included from ../include/linux/highmem.h:8:
In file included from ../include/linux/cacheflush.h:5:
In file included from ../arch/x86/include/asm/cacheflush.h:5:
In file included from ../include/linux/mm.h:2224:
../include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  505 |                            item];
      |                            ~~~~
../include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  512 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~
../include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  525 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~
3 warnings generated.

> Fix the patch. Explain the problem. And possibly just disable the warning.

That'd be great. Nathan, would that be okay with you?
