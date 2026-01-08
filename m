Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36035EDDF;
	Thu,  8 Jan 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858699; cv=none; b=q7bHucEw5KRMRIwZ9ATq1pQ3jZa0Ur0AEtuux1GWpj28bxznZ0RumzuvU3lCTPwr5wzm7ipwlD5uco6nBEF7/k4/rSo+Sep0vQDx3ZHrlFxdN/mrr9ZJRoOlZKtvUmVCL2BAVVTwFDYwroE8y5P4McnQSt2CLYatu8GnzFT9Mms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858699; c=relaxed/simple;
	bh=o37JmA6QJH1hbZFK9vO5ltkmQsosx5rm+4xSmP+zFVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTGWW58ahWWTva4lK+7H6RiS/rA8c3vkwi2OmTNMQUqAJ88Ino338Pv95EAm99kFJYG1qm26F0DrooqLCFfc4+0HGXYdIXOG440vrixaGShvh8/U9bs7ZsyuEmoGqdst2kuIlZP7DbXNsWcdtkFRQoA0Vr7D++xBUvFqNnQh5UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CJlAPp4s; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CJlAPp4s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WPIxHBWiw96iLy1xvwa+oy84tFE4iZyCkxekN8uy5JA=; b=CJlAPp4saS4WMN9g6FW4QazfOQ
	MGM2knCKVrvnseqvsIgqj0aIGPR6jNN8+5AjuyhsmzDrdDBAvNPCVj35KtkdxybawOU+m4+u6uOhQ
	VkpIQCRew1zl2RW/w1TwZXpaGEPCo1Ajj2n23J2u8CYRIHK5s2adUW33SGAGmmhWyvifFHsMjDzQ/
	ParRkmlZOxahT1W9bYmUlueX8GtDnTytvpfJy8IKLeU0L3NQNMRnEIIxcGwtbE6zPnPJiSv738YS7
	MCzA/G43kl/O2J1IZZIBaPeq2usLmiJcMTx+hZHnmZqz8naXJTeaEVslljFNECFH6Jnb/0KJ+TDwf
	9k8WOFUQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdknl-0000000Cg2w-1oB1;
	Thu, 08 Jan 2026 07:51:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 047E030031E; Thu, 08 Jan 2026 08:51:25 +0100 (CET)
Date: Thu, 8 Jan 2026 08:51:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260108075124.GF272712@noisy.programming.kicks-ass.net>
References: <202512222219.F6EkVNmQ-lkp@intel.com>
 <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
 <20260107114608.10536C6a-hca@linux.ibm.com>
 <20260107204549.GA846948@ax162>
 <aV7fxXjaOBtHhI9X@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV7fxXjaOBtHhI9X@elver.google.com>

On Wed, Jan 07, 2026 at 11:35:49PM +0100, Marco Elver wrote:

> This works:
> 
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -6,7 +6,7 @@
>  #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>  #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>  
> -#if defined(WARN_CONTEXT_ANALYSIS) && !defined(__CHECKER__)
> +#if defined(WARN_CONTEXT_ANALYSIS) && !defined(__CHECKER__) && !defined(__GENKSYMS__)
>  
> I guess the genksyms parser just can't deal with some of the syntax
> (just like __CHECKER__).

Oh excellent, I'll go stuff it in.
