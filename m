Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A775122
	for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 07:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CCAC004E1;
	Sat, 19 Feb 2022 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645255151;
	bh=5N9q8YGpLg7pzimVDpcpfsBGpCNjJr17vwBuSaeLOzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3JZA0jkkKEqYPSuaw6XQokUqkc1pHcCOFjSe3Kzf8MHcYJHvrHCzic06q6mfeKNR
	 lYNN0vIvNCGoRQ8agRIGhqhtIq8cKGpX5vBVKgmd12VTQNL3YuMjIn2byIcjnmIoaX
	 vkI2LkzgzqIRBlITVjf5gJrNpIwkHLga5cTH6DnY=
Date: Sat, 19 Feb 2022 08:19:02 +0100
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
Message-ID: <YhCZ5m+uw/xqS9W2@kroah.com>
References: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
 <a5ab4496-8190-6221-72c7-d1ff2e6cf1d4@suse.cz>
 <Yg/eG4X7Esa0h1al@kroah.com>
 <c237f6d1-4219-0e6d-6aca-9c29d060bb4f@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c237f6d1-4219-0e6d-6aca-9c29d060bb4f@suse.cz>

On Fri, Feb 18, 2022 at 07:54:14PM +0100, Vlastimil Babka wrote:
> On 2/18/22 18:57, Greg Kroah-Hartman wrote:
> > On Fri, Feb 18, 2022 at 06:14:55PM +0100, Vlastimil Babka wrote:
> >> On 2/18/22 14:13, Greg Kroah-Hartman wrote:
> >> > Commit c37495d6254c ("slab: add __alloc_size attributes for better
> >> > bounds checking") added __alloc_size attributes to a bunch of kmalloc
> >> > function prototypes.  Unfortunately the change to __kmalloc_track_caller
> >> > seems to cause clang to generate broken code and the first time this is
> >> > called when booting, the box will crash.
> >> > 
> >> > While the compiler problems are being reworked and attempted to be
> >> > solved, let's just drop the attribute to solve the issue now.  Once it
> >> > is resolved it can be added back.
> >> 
> >> Could we instead wrap it in some #ifdef that' only true for clang build?
> >> That would make the workaround more precise and self-documented. Even
> >> better if it can trigger using clang version range and once a fixed
> >> clang version is here, it can be updated to stay true for older clangs.
> > 
> > It's not doing all that much good like this, let's just remove it for
> > now until it does actually provide a benifit and not just crash the box :)
> > 
> > This is only 1 function, that is used in only a very small number of
> > callers.  I do not think it will be missed.
> 
> Fair enough, added to the slab tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=for-5.17/fixup5
> 

Thanks!
