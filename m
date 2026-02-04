Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8F1EE7B7
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 01:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167356; cv=none; b=iziaoyjDesDESw5FvY70ozm0HucB7X5KQ8gJlLPRv72HeVlUmdxncIFQ06+UvaJgoT+3k3145kKaP/Xqh1qAmQDqcj8R219iY1+8Br4WxyhmTosXGIdfulsEH73xQCs/lyeUNhirp2XVELUTg7QzN3vVBfGVkb+nlaA2iPhLufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167356; c=relaxed/simple;
	bh=/9HVvPdr8HQCtfTWppNf6n84GxbfsGIRo3YUXCxq7pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A85hV0nw1vgMOFDcov+OKETiNmgyoe19+97zPX0UsW+FvBSIYnOCHuSkfkiRcehMlm0XdK8tHIoLMthKDF/GCTiCze34R9T18EBSryDMG5csISgUmZ2c+5wSPabK9BqynXncU5wfTiljZ7yClCWkMyVpeRnh+agM8fZUUAxxfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtSrqet4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtSrqet4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770167356; x=1801703356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/9HVvPdr8HQCtfTWppNf6n84GxbfsGIRo3YUXCxq7pk=;
  b=UtSrqet4fBi2X5dFZ/N04fWKp6mt1OUYn8VDD5SIjUibidl2uJN1xvQd
   NGTt79nQWUvEH3gmp/46uS6ojI3JnnYcX36+evhVyK1sXUVUTBdLRPcDQ
   BIpWfhEHxpkV4FBjbqLV5w7RMVmWbVvupFi5kKvdh7YKBObXaTpm2Lvg2
   bLbEiTZxxwVx1fBQ5EM1RycIyrJb7k4wvFSHem3Iuo+yE3U6sRBm4lMWL
   s+VDyAe0cMJwGW65YGfxLh0xheSsPkYzdrTTxXIaPW8BYx2iE8vkAjTQU
   UaMV0UDj22283I+m4L5N67pcAnjUwjxo6/tjPk9RUtVNKJRs9kk/OUjXT
   Q==;
X-CSE-ConnectionGUID: f0ZmS0oUQHSUjGBmfnvMuw==
X-CSE-MsgGUID: crmlM90ASs+7/9ZgTWTReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88926473"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="88926473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:09:15 -0800
X-CSE-ConnectionGUID: oKdSBW3ETHqmD0iExfH6cQ==
X-CSE-MsgGUID: tI4URy7TRB65xA6sz/1xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209662651"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:09:11 -0800
Date: Wed, 4 Feb 2026 03:09:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sunrpc: Fix compilation error (`make W=1`) when
 dprintk() is no-op
Message-ID: <aYKcNds-XsVLRjcC@smile.fi.intel.com>
References: <20260204010415.2149607-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204010415.2149607-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 02:04:15AM +0100, Andy Shevchenko wrote:
> Clang compiler is not happy about set but unused variables:
> 
> .../flexfilelayout/flexfilelayoutdev.c:56:9: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> .../flexfilelayout/flexfilelayout.c:1505:6: error: variable 'err' set but not used [-Werror,-Wunused-but-set-variable]
> .../nfs4proc.c:9244:12: error: variable 'ptr' set but not used [-Werror,-Wunused-but-set-variable]
> 
> Fix these by forwarding parameters of dprintk() to no_printk().
> The positive side-effect is a format-string checker enabled even for the cases
> when dprintk() is no-op.

Note, the alternative fix is to add __maybe_unused all over the place.
With pros and cons I consider my approach better.

-- 
With Best Regards,
Andy Shevchenko


