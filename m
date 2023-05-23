Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2642108F;
	Tue, 23 May 2023 17:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA6DC433D2;
	Tue, 23 May 2023 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684863927;
	bh=WDbsACUQd1IF+k1hIhlvOW4slr9SiGw/AoALXjeIN2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kvu06m8uR/gzHmaMeZ8yskr2pkb8aQ7wjeZgR2gLxnQYsiOBECwlSWO6svIkSzWth
	 Uxg6SfRCkjiME5QNfMVkwh6vNddIO1LFud6Vkbyn9ybAz29qKSYWi5j97gtXjacsWi
	 lcKTtCj1prN+eriMBCCgEGRoECtNkxJQR8vCGQDdf3ainf/r9jeaTOGJkS9Vxsguj9
	 Y7vulhJUb43smwWq6/hum2HXnSaR7ITnKcocAi+iN5R+4QPGr6jBypWluBwV+YsuHq
	 aPJViChOY61wplkuN5tJ68cIR2l4OCWRouhOQvxQj8aabWwh38HiwYW63SLZcz2KLs
	 FRsDD3RMLCVQg==
Date: Tue, 23 May 2023 10:45:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [stable:linux-5.15.y 36/9999] arch/s390/kernel/vtime.c:132:2:
 error: expected absolute expression
Message-ID: <20230523174525.GA1388474@dev-arch.thelio-3990X>
References: <202305111705.8j4cTm2s-lkp@intel.com>
 <202305111519.04845F7@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305111519.04845F7@keescook>

On Thu, May 11, 2023 at 03:21:01PM -0700, Kees Cook wrote:
> On Thu, May 11, 2023 at 05:14:16PM +0800, kernel test robot wrote:
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> > head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
> > commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
> > [...]
> > >> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives does not support instructions blocks > 254 bytes
> >            alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
> >            ^
> 
> Thanks for the report! I don't think the new errors are related to this
> removal, though. This patch was just disabling a potential build config.

Right, I am not really sure how the robot landed on this (perhaps there
was another error that was being exposed by CONFIG_UBSAN_OBJECT_SIZE
that disappeared with its removal?) but this is a problem with s390
specific code and clang's integrated assembler. I suspect it would be
fixed with one of the patches from this series that landed in 5.19 but I
have not looked too closely:

https://lore.kernel.org/20220511120532.2228616-1-hca@linux.ibm.com/
https://lore.kernel.org/Yot+xzLZETNTxNo+@osiris/

We use LLVM_IAS=0 for s390 on 5.15 in CI, hence why we do not see this.

Cheers,
Nathan
