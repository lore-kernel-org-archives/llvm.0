Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F227702D;
	Wed,  7 Jan 2026 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767826614; cv=none; b=sbqO3V1a1yQPiW1OPfjhCcqNcNYHb3gxZvRHp9DmNJ3sd3L8VnRWQ6eGsbgp5VLDcPt2YEdRpkQKXd65UmUhcoltyyqYUEr8VYYy+Qe4mdLd6+A/gvhaj3BE0TYNOIc+yq/FS9DeE8S4aGmOU1rW+4gJMcWsy84Qy7+jl1/CGwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767826614; c=relaxed/simple;
	bh=nDPkiFqRhTm7b7eo/1f2QFK1D3kMODubgSxcFT142u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTaTv05g07vyQ3JbuloJy4pw3qCN+4lMPvmidiBwZWUBwWYby2hH55GGADQDdGfWgYoNN4/LgOCxtemOGbRjopMWsAKBiArv0lGyGqqynduf9BSEvgv3r+RRRkhAZ8FaOwk4FXTnFv9VBde50izVNMqeGZO/pX91kf9tMcsNFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiiJjtBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiiJjtBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41677C4CEF1;
	Wed,  7 Jan 2026 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767826613;
	bh=nDPkiFqRhTm7b7eo/1f2QFK1D3kMODubgSxcFT142u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiiJjtBJYrtuUzD1DpK+W+53NvnFnZrORRrLvy5IsktyLcf1R+ND/uMe8yRBfeAqI
	 eWaucesgn2Xw8r8d/OQGw6PAtcWeOJYfvZPHatAjpFjY4p39oIKZl4pgiDrc7QA5jV
	 SQFOzW3mPd630MRZPjomOISWXAtgl1XHrlvYuj0QqcP4stOvk9hbjUkT4Gnfer3l/e
	 897z4UAElsCIDDAblVd0DRrZP53IgU5PN2BJqBvLtgHAFn8jmhIL289l1Y8Onuzg44
	 iNyrDtRXlv88H7PKi2UJ+O7n/BSRyW9HqnGTxsIzMQeMhLrLx8S977ICo4HXdSN+Oe
	 St8CBn96pQwyA==
Date: Wed, 7 Jan 2026 15:56:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260107225649.GA1867428@ax162>
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

Ah duh :)

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

Right. Not to mention that these macros should have no bearing on the
ABI stability for the sake of module versioning so there is no point to
consider them during genksyms (if I understand correctly).

Cheers,
Nathan
