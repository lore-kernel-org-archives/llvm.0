Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3174681
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE32C34114;
	Wed, 13 Jul 2022 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657729625;
	bh=QsCvpn2gWQQ1jAoqmKwmo/Cv3eyEdtKIBceRVgAOtxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZPtdVxsPialzeevmLca0Myws6u+ggFFxfdSyrByJNe/SP5gpXevDD1NpAM8cu8sC
	 BpDecMgFuJS7TdqW7J7+2GuZoBqeA+p0aZ5rz6xC6j+TPlqCBESwHEIuU9vQVg8ikJ
	 qzDNd3RNsCqqRR64oyz+o/dACayVru8aCSpxjbvOKKZuk0kGxSLMq2mApVn4lRTsmW
	 3sMjxNwZMNkmQkKWNE+YZ2b4J1yXbHzoKpGcyEcsBR0ThC4L9+JfbBl1OqpXLK4m8k
	 AmXW35S/ShAEifVdHrvvJzQxTASyBbNiw7N0IFsBWM+B5ndKuLoqe0daeHdKZlyBqY
	 OfEf5gs73l3GQ==
Date: Wed, 13 Jul 2022 09:27:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for
 x86_spec_ctrl_current
Message-ID: <Ys7yV0VGXyxX3VWj@dev-arch.thelio-3990X>
References: <20220713152436.2294819-1-nathan@kernel.org>
 <Ys7xUVjpNyXY0nXf@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys7xUVjpNyXY0nXf@hirez.programming.kicks-ass.net>

On Wed, Jul 13, 2022 at 06:22:41PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 13, 2022 at 08:24:37AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> >   arch/x86/kernel/cpu/bugs.c:58:21: error: section attribute is specified on redeclared variable [-Werror,-Wsection]
> >   DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
> >                       ^
> >   arch/x86/include/asm/nospec-branch.h:283:12: note: previous declaration is here
> >   extern u64 x86_spec_ctrl_current;
> >              ^
> >   1 error generated.
> > 
> > The declaration should be using DECLARE_PER_CPU instead so all
> > attributes stay in sync.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: fc02735b14ff ("KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > 
> > v1 -> v2: https://lore.kernel.org/20220713152222.1697913-1-nathan@kernel.org/
> > 
> > * Use asm/percpu.h instead of linux/percpu.h to avoid static call
> >   include errors.
> > 
> >  arch/x86/include/asm/nospec-branch.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
> > index bb05ed4f46bd..10a3bfc1eb23 100644
> > --- a/arch/x86/include/asm/nospec-branch.h
> > +++ b/arch/x86/include/asm/nospec-branch.h
> > @@ -11,6 +11,7 @@
> >  #include <asm/cpufeatures.h>
> >  #include <asm/msr-index.h>
> >  #include <asm/unwind_hints.h>
> > +#include <asm/percpu.h>
> >  
> >  #define RETPOLINE_THUNK_SIZE	32
> >  
> 
> When I tried this earlier today I ran into cyclic headers, you sure this
> works?

Yes, I did my regular set of x86 builds with clang and they all passed.

Cheers,
Nathan
