Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C02A23A1
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5qjyT+ZKelgJd14rLylT5OWqzGIhr+cM5+hmXw+z1ks=; b=vtxXtq6lyyGnmOQCvptEhOc4kd
	9Mk9/G3y9yJsU3rG11DJg7uufbhi1tcznol8gzNChBKRSR3q6acBC6SCg5YpGNf/FlscIRDWyej6v
	Qu7e32jyFeeA32ccazORQpuzjwncy9gjKVRYkaQfCiFZhadfbK9lwFErcx8G5cB5xdkJEb7P/o1Ye
	hOgvQtD3duxvYglhM9j3lizp42/3O7SIK+9plV0GbNPdOHQUszsJNurUryHyEn+FMn6a7vn9d+3pP
	9qkFOROW8pruhgArn0Fhf3SciLssYS4LxJZEIH+EyHdg+DHfjmbiK0SAqqhxfw5gTlWnnTQ8w5PwX
	7qTtm5tw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNar4-005p3W-H8; Fri, 25 Feb 2022 13:41:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A3839300067;
	Fri, 25 Feb 2022 14:41:52 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8077A235EF288; Fri, 25 Feb 2022 14:41:52 +0100 (CET)
Date: Fri, 25 Feb 2022 14:41:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Cc: x86@kernel.org, joao@overdrivepizza.com, hjl.tools@gmail.com,
	jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
Message-ID: <YhjcoHh0ar9K6QrA@hirez.programming.kicks-ass.net>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org>
 <202202241627.EEF3D5D2@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202241627.EEF3D5D2@keescook>

On Thu, Feb 24, 2022 at 04:35:51PM -0800, Kees Cook wrote:

> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -36,7 +36,7 @@ endif
> >  
> >  # How to compile the 16-bit code.  Note we always compile for -march=i386;
> >  # that way we can complain to the user if the CPU is insufficient.
> > -REALMODE_CFLAGS	:= -m16 -g -Os -DDISABLE_BRANCH_PROFILING \
> > +REALMODE_CFLAGS	:= -m16 -g -Os -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS \
> >  		   -Wall -Wstrict-prototypes -march=i386 -mregparm=3 \
> >  		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
> >  		   -mno-mmx -mno-sse $(call cc-option,-fcf-protection=none)
> 
> This change seems important separately from this patch, yes? (Or at
> least a specific call-out in the commit log.)

It was to not stuff endbr in realmode code. *something* complained about
it (and Joao independently mentioned it on IRC).

Could be I hit some compile fail somewhere and this was the cleanest way
to simply make it go away.

I'll go mention it somewhere.

