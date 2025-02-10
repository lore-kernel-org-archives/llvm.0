Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFE25B668
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212386; cv=none; b=ffj+0IpQHxaMCVTveA3xr+l/ZFyblkpUUTp82sF5PD8bqAh2IorRti4hYh9Eg4Yx30sosZzmF1umwUJfNWmJJcdtoqG2Y38sCFy82f6z+tONPD02zuYeeO+zxgMpBdlZXLmWGaPzNCc2G7owqQBU/vnDiEnXj+u7/Hu7qnBu0Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212386; c=relaxed/simple;
	bh=HWtRt2BbPxkx6dYsnwANWY0bVemXsHeP7E6++7kc5R0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsEmziSePqFmfb0h4M3gpJJIdXTnPl+6f12wAdMee060Veckubq8prV8HKxqI0e6WMD2VQe+ozvjILAXq+Ajcqm+OJ8+3tGEjCcMP1LQBb5wzVrJmVsGn+Mvbo1Sts3Vv9TwzSA34mzwi2J1vuTvs/dApkB5j1h5UmCwYoR6knY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfS3ykvq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfS3ykvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB44AC4CED1;
	Mon, 10 Feb 2025 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212385;
	bh=HWtRt2BbPxkx6dYsnwANWY0bVemXsHeP7E6++7kc5R0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mfS3ykvqcHf8y4ZZzZLfFsdzkX7nz/a6Oirsx/6PNPLg+wZMoFVXUftSKFX20gCtZ
	 /KdQNGF40uZHRN9Kb5Tdqrclhl/PryQ3pOBaGUC/tRTaivm3Qp99oILPUbeaUIk1jS
	 UC+lMLrFIn9BHGyhN45kX0IlOafdAUkIa96hRKB6+jFffEb7kZGSFEzIUGQT8maDlV
	 JjwPteKHXI46K3Q63ZPA9wCIuyblJdCLFbi5+6z3y4Ryuzew4Ix1AZN1x11fZ6heCs
	 6b/cw/5/AkFwsokbHIBJnYRWS1zR+5hO0dc837QOcAyxNucq3hsLlR6BjM55+LBKGD
	 YM23UWjLcN5SA==
Date: Mon, 10 Feb 2025 10:33:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Bart Van Assche <bvanassche@acm.org>,
 linux-mm@kvack.org, Ivan Shapovalov <intelfx@intelfx.name>, Vlastimil Babka
 <vbabka@suse.cz>, David Laight <david.laight@aculab.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, David Rientjes <rientjes@google.com>, David
 Hildenbrand <david@redhat.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Joel
 Granados <joel.granados@kernel.org>, Sourav Panda <souravpanda@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
Message-ID: <20250210103303.6ab646d0@kernel.org>
In-Reply-To: <CAHk-=wiSuP=s4vzdT3TLjDfcj4XJDDvOO1bDj2Zd2EJNc6o=KQ@mail.gmail.com>
References: <20250131191231.1370466-1-bvanassche@acm.org>
	<20250207164926.6daeac77@kernel.org>
	<CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
	<20250207173813.5081ba76@kernel.org>
	<CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
	<20250208033351.GB3305705@ax162>
	<CAHk-=whe1UZUGKbtaaRV7CfS=sGtB2ouYAriryZ6bscE+5AFhA@mail.gmail.com>
	<CAHk-=wiSuP=s4vzdT3TLjDfcj4XJDDvOO1bDj2Zd2EJNc6o=KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Feb 2025 20:24:18 -0800 Linus Torvalds wrote:
> > I will take your patch to move it to W=2.  
> 
> Ok, applied and pushed out as commit 8f6629c004b1 ("kbuild: Move
> -Wenum-enum-conversion to W=2").
> 
> Jakub, hopefully this fixes your situation,

Much appreciated, thank you!
