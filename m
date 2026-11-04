Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756498;
	b=qF8Z2VjJyQZ6XO8aBlAJxFRrxsPQX0ZVwqse6ZSHx0JNqVhb1izyoizTZGgL5hEme+pA
	 GbY6VWmIOPso0uxrab1qIzAACvQ4C5I3Xoy6tVdmaYiZXvBGzUuJcFV00MgcYGgtRijGU
	 egVrE3p3TC5khfXwUiCPXYfo0u6PUt4gg2vH2EfYuxS7ByNd5qg71o4x04ToNFNitHVjH
	 Do6pFgLPsfiYoE1Rlo/5ac7uqoxKHGKKUw/sXX5ge0e4fpKiVjUdecMSxvNzdSE+VdycB
	 9lv5VQf+lpKxewm5UGJW7qoaBUJMAGslC+ofxglmtCurG0pOa/Tl3VXjaLmlNCs1fpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756498;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nrEpzo2FbyYGf4WoydGR8O8NAthTAxRR3fiKImw2LBY=;
	b=FpFtptiJY3xHFKY3kD4yGsGKVOh2ThdjM4McXISEg+rXqEYuq8VZX/CeS+ssb+yJcZ3M
	 Jz0KC1rWP+EYWhQ/SdIUV+EzB6qnZeGRmIEcEu3zqbspEFn0opNMaHOdvNwF6DSxzcuL/
	 QxVOcTEm96895mwiLwRqHzxSrrBPUSy5UBiNSYy5uzGL/w1yl2//XrhbBReYKtfudhs9J
	 M9sI1sIG+7lyctW1B9msVuBUO2SEMtocI6g/FRXkgNESJ2BdDN0TWleI0BHlF68meBirO
	 Xn3Xoh+SQKwKIyKBAfaWSgzYVCop8N5hhVL1FTLxmvndPeB0cKJDCFGIQiCXvAKeeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2KAliKC;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F076606D80E
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 01:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F076606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2KAliKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793756498; x=1825292498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vDr2JILrP7CXpfLgY8bKxkAuyrvod5DOQU34EM2moew=;
  b=c2KAliKC7pExndXfYaCKkJIJPiMYnKFyeJN/Y5wtwPxWO/stcOJiix58
   PbzD4IUAvZCM/DgFjE8PqbYNvuBD1YTJ7Rg2bwhwVY5Vq4sN3fi8QdOzV
   4AoHvYSxWwyASzX2IkQaWISfug3KK85T+9/MXwA+eus9VjkXDespwGsU+
   ozpLYYsUSnsO/Jf0TzRVBeWdR7u1XeRCExGA+mnY3ttQJBCKv5him0+0Y
   KB2DRm0OEejZfaj1ZdeE+tm7aXdwd9Us0bb6Vy8GeXwDKya0xDl20C0At
   wjeUNrojb97FR/9HGwBU8GSKx/H8tRVbrMAuiqJsZ7s1Ej8d1g/K+9UHW
   Q==;
X-CSE-ConnectionGUID: /TKcFNuMT+6Ws4sIANNWow==
X-CSE-MsgGUID: 5Z/jlHzYTnaBVpuvCvZatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2509026"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2509026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:41:37 -0800
X-CSE-ConnectionGUID: nOdDaauHReGtVTXCAtE9IA==
X-CSE-MsgGUID: z881yAwyRF2NYDW1Ta5Bng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6912924"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:41:37 -0800
Date: Tue, 3 Nov 2026 17:41:35 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Youling Tang <youling.tang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
Message-ID: <auqNT3yNeA1ujmW3@tassilo>
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103060658.696994-1-martin.ankerl@gmail.com>

> +#ifdef CONFIG_X86_64
> +/*
> + * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
> + * builds with -mno-sse, and clang then drops the builtin without a warning.
> + */
> +static inline void prefetch(const void *x)
> +{
> +	asm("prefetcht0 %0" : : "m" (*(const char *)x));
> +}
> +#else

One thing you should check if the inline assembly pessimizes the code on
gcc. Normally builtins can be better optimized. Or keep using the builtin
on gcc to be safe.

-Andi
