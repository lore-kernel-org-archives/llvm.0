Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646836F91F;
	Wed, 24 Jun 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300109; cv=none; b=IaBasXAyOqHDV3O3rxvnTBIdsEz8q5fZzyFCIYT8DHZW1rGyULDW7WuLISHV18HYH/8bPigaLHHxtze8G9QYTTp0FInniMF5sNW1aVyOzNmfXpm5OG0rs9lLTjPdQWqsXR0CM/HGaUf2xiE5JOtZ4MYPzjmR5z4fZpAQ7iNZgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300109; c=relaxed/simple;
	bh=DWN8Fgp+equdBW0/ld200wMrCQHT5Nbwqr31jAaWcFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shyy5qr5t7r4WF71NAoGHFtjntyoyTXhHJSPQGnRlPfu5iVSst+Jr/i8pGkSSPSVue+A4AGgZOfWhotWCActW6wdd+GjddlEoVCtVz+y4fAtLw7mjl2hsxVNkvBXmX0CDUTzvBsEdN4JrHbm5vRoBWDeT5C3DAxBfN3jAmoceHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rYOyB4sd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rYOyB4sd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PA9DTBSzn1UL3Wv3IwL5QKdG4Z9P/48RZQoKgvbQ6rM=; b=rYOyB4sdzFVb+Yh7aeFNicdhnJ
	F+zLJq+zlLbom1pPK4I8qqNFQ8wu5i+7uZkKPy6I5RdnVbXKINhzkJCDdXodgeq/9RIhrliyIUyas
	WydsRkeqxMYz/ZBWCU/aAQz8V9j1/TAJnNohx/UlplQMfBXgg/CcYtpADxkQhgP7TfVDvoAXgMAyo
	Kjk4eG1mHPxdyejZFcPHMDwaYLJ1UZ8TL+/TunEA67vaYJ51tffe+M4Obhs5I+PmkwM7Q2UsXLtUX
	0wLyF7HjGMqX1nG13cMJ705pnvstNrd84paVjYc6Xt8CcruXxQeeW/Of+gsKvUfxy/Tc92bRzqEG+
	lTjwljxQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcLfs-00000002GM4-29n1;
	Wed, 24 Jun 2026 11:21:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4DE6300400; Wed, 24 Jun 2026 13:21:43 +0200 (CEST)
Date: Wed, 24 Jun 2026 13:21:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	kernel test robot <lkp@intel.com>, jpoimboe@kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
Message-ID: <20260624112143.GG49529@noisy.programming.kicks-ass.net>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
 <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>
 <20260624105658.GB48970@noisy.programming.kicks-ass.net>
 <0ff5f3f7-c2d3-4b56-95ad-400626d8abb9@amd.com>
 <20260624111611.GC48970@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624111611.GC48970@noisy.programming.kicks-ass.net>

On Wed, Jun 24, 2026 at 01:16:11PM +0200, Peter Zijlstra wrote:

> @@ -121,7 +110,8 @@ _label:									 \
>   * guaranteed that no GEM object is locked.
>   */
>  #define drm_exec_until_all_locked(exec)					\
> -	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
> +	__drm_exec_retry: __maybe_unused;				\
> +	for (bool __drm_exec_loop __maybe_unused = true; drm_exec_cleanup(exec);)

An alternative would be something like:

	while (drm_exec_cleanup()) 				\
		if (0) {					\
		__drm_exec_retry: __maybe_unused;		\
			continue;				\
		} else

But that still breaks the multi case.
