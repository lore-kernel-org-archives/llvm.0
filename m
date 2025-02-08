Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F570522F
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 02:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981102; cv=none; b=jnAnL68V5DOTtnYKwzzF+oPo51Fl7aRUAa5/Ih11/G88b4TfOPJN9JkpCtqgOlXGS51CVR3P3hc4ed0IKjH5BtMZkegSaKo1oVjD1X5VQrYZ+8p+9LdAdnjFmgHVVkl3yJTZbUSh4I5E3dI3hUwpEEHtGbFgU4hMhEWjW8sKveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981102; c=relaxed/simple;
	bh=GyKun2jCx4bFpm2ztZa6ChkmElK9wbJagO4KMfSPEQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LekWVEe2JNwWY5avJF9zAkhjV4hRPVfBZ/It2KRhyzS5PdCdBVVTONPCu7gjlAeHe1ZmHOmrjPcbc9oHDRB1o3JQ+kpMmm53arRFWpD4gEEldYZGJ6ZD1vy+eYI0wvD0NZWWfsQ72N7Oava1G8yhPNKrLV5AE4zt6kuQMo6pgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Buo7VuA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Buo7VuA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7973C4CED1;
	Sat,  8 Feb 2025 02:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738981101;
	bh=GyKun2jCx4bFpm2ztZa6ChkmElK9wbJagO4KMfSPEQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Buo7VuA+wqlpwL/QHEGsFqasbaOomFpM/tgqsG0+mp2qoZiE9PXRTZH+rIvl8Dltf
	 n695V9OX1QvmTokZ0eWZ07C5rEfLl67PdaYLoxnrH0TgCb3SnS0/3107QP/R0f29DB
	 7A3rJ9YwcKACfEyAoh4cqt2SIsB8Pta8FrOuT0/DXjW/A+3yl3LDvfQJa4tduCOVmn
	 F2ZL9+ozzwnQHfBFncMmu9toCIjaI8jcfT/wSVDbdhzm2H7+UnxxFY8VU+K2vQXt1S
	 +f2a+L1CpIriu6icJA43ItUw6qPkPvsnRYNI+5Dghk7uOU4DUBHOhh3vgJ8aXZ70gm
	 OsgqKPb6nIuyA==
Date: Fri, 7 Feb 2025 19:18:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bart Van Assche <bvanassche@acm.org>, linux-mm@kvack.org,
	Ivan Shapovalov <intelfx@intelfx.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Laight <david.laight@aculab.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Rientjes <rientjes@google.com>,
	David Hildenbrand <david@redhat.com>,
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
	Joel Granados <joel.granados@kernel.org>,
	Sourav Panda <souravpanda@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
Message-ID: <20250208021816.GA3305705@ax162>
References: <20250131191231.1370466-1-bvanassche@acm.org>
 <20250207164926.6daeac77@kernel.org>
 <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
 <20250207173813.5081ba76@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207173813.5081ba76@kernel.org>

On Fri, Feb 07, 2025 at 05:38:13PM -0800, Jakub Kicinski wrote:
> On Fri, 7 Feb 2025 17:01:00 -0800 Linus Torvalds wrote:
> > On Fri, 7 Feb 2025 at 16:49, Jakub Kicinski <kuba@kernel.org> wrote:
> > > Could we possibly please still consider taking this in for 6.14? :(
> > > Since the warning comes from vmstat.h pretty much every object file
> > > generates this warning. clang 19 is getting more widely used now,
> > > its making it hard to see new warnings.  
> > 
> > So:
> > 
> >  - I build the kernel with clang, but I don't have clang-19, so it's
> > kind of pointless sending patches that DO NOT EVEN EXPLAIN WHAT THE
> > WARNINGS ARE.
> > 
> >  - and even if you explain *WHAT* the warnings are, please also
> > explain *WHY* they are valid and should be cared about.
> > 
> > Because honestly, W=1 is literally meant for "warnings that aren't
> > necessarily valid". That's why they aren't on by default.
> > 
> > So no, I'm certainly not applying unexplained random patches that
> > don't bother to explain the what or the why. Not for 6.14, not ever.
> 
> I thought I'd ask.. :) FWIW this for every single object:
> 
>   CC      net/core/request_sock.o
> In file included from ../net/core/request_sock.c:14:
> In file included from ../include/linux/tcp.h:17:
> In file included from ../include/linux/skbuff.h:17:
> In file included from ../include/linux/bvec.h:10:
> In file included from ../include/linux/highmem.h:8:
> In file included from ../include/linux/cacheflush.h:5:
> In file included from ../arch/x86/include/asm/cacheflush.h:5:
> In file included from ../include/linux/mm.h:2224:
> ../include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>   505 |                            item];
>       |                            ~~~~
> ../include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>   512 |                            NR_VM_NUMA_EVENT_ITEMS +
>       |                            ~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>   525 |                            NR_VM_NUMA_EVENT_ITEMS +
>       |                            ~~~~~~~~~~~~~~~~~~~~~~
> 3 warnings generated.
> 
> > Fix the patch. Explain the problem. And possibly just disable the warning.
> 
> That'd be great. Nathan, would that be okay with you?

FWIW, I sent a patch to move this warning to W=2 in October and pinged
it in December:

https://lore.kernel.org/20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org/

'b4 shazam' tells me that it is still applicable on Linus's tree so
maybe he can just apply it directly?

Cheers,
Nathan
