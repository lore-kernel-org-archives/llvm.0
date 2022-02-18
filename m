Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D4B4AB8
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75124C340E9;
	Fri, 18 Feb 2022 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645207070;
	bh=dP5b+VA+uAx3bJhnVmVq20KQ+X+9Cy6qAmDwVZSVETA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvDPAbFjC/4BDN5N4QWsBAXqH2By2fN9OfvYaiEa2EMGl4mymWW8xR+qlQyNEIuA8
	 TPqKYelwYUzcA6s0HPFMHH/nhichKTgj+hHrBc37kVQaDoNGGuLZTVgIDxzZ9up4Nv
	 3l394mt2DHKY8m9e4DnwbzD5MGioZ5eock/RE5GY=
Date: Fri, 18 Feb 2022 18:57:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Micay <danielmicay@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] slab: remove __alloc_size attribute from
 __kmalloc_track_caller
Message-ID: <Yg/eG4X7Esa0h1al@kroah.com>
References: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
 <a5ab4496-8190-6221-72c7-d1ff2e6cf1d4@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5ab4496-8190-6221-72c7-d1ff2e6cf1d4@suse.cz>

On Fri, Feb 18, 2022 at 06:14:55PM +0100, Vlastimil Babka wrote:
> On 2/18/22 14:13, Greg Kroah-Hartman wrote:
> > Commit c37495d6254c ("slab: add __alloc_size attributes for better
> > bounds checking") added __alloc_size attributes to a bunch of kmalloc
> > function prototypes.  Unfortunately the change to __kmalloc_track_caller
> > seems to cause clang to generate broken code and the first time this is
> > called when booting, the box will crash.
> > 
> > While the compiler problems are being reworked and attempted to be
> > solved, let's just drop the attribute to solve the issue now.  Once it
> > is resolved it can be added back.
> 
> Could we instead wrap it in some #ifdef that' only true for clang build?
> That would make the workaround more precise and self-documented. Even
> better if it can trigger using clang version range and once a fixed
> clang version is here, it can be updated to stay true for older clangs.

It's not doing all that much good like this, let's just remove it for
now until it does actually provide a benifit and not just crash the box :)

This is only 1 function, that is used in only a very small number of
callers.  I do not think it will be missed.

thanks,

greg k-h
