Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96B6029
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oC7PbahrZ+zt+ZNZQK8PnJ21HqUpiAyBo5kx7bHB41o=; b=bLV9fd8LHs+alXPaXoapc8uVKG
	Me8pxfrO3IElztWtdPK6qayknLTY9nSZSMntAX9U7ZjMwQCVHIKOspWRio2SOCHBHwKuNWFGy71xD
	2w0ts05jhF33X5BjH1qpUkMS0SKMhtxg8cRizVXXi/pqF6aZM4RWie/Vtz4fxvf0gZiqdV+JDExvg
	n1hIUA8Q+tgXSMetLiZ2FIdPAApwIbwJwjZ3R9timFFQNOPdtqVyCpxjOxBmnIkoFiQptluOiQ2IT
	79srFu9U66VLuKRrYTAUko23YVlwImxmfUMPIrdnuIOoJkayHkEWJr7VktW0K8UhJdx7paFW5mdud
	g2nbreJw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC73X-009igR-Cd; Thu, 14 Jul 2022 22:11:35 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id DA89B980222; Fri, 15 Jul 2022 00:11:33 +0200 (CEST)
Date: Fri, 15 Jul 2022 00:11:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Borislav Petkov <bp@suse.de>,
	the arch/x86 maintainers <x86@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	stable <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for
 x86_spec_ctrl_current
Message-ID: <YtCUleBPU31sY0jK@worktop.programming.kicks-ass.net>
References: <20220713152436.2294819-1-nathan@kernel.org>
 <20220714143005.73c71cf8@kernel.org>
 <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com>
 <CAHk-=wjeVbrd3HOMh-t8968pMgZUFs6uP-p45Fn8qr27j8D0aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjeVbrd3HOMh-t8968pMgZUFs6uP-p45Fn8qr27j8D0aQ@mail.gmail.com>

On Thu, Jul 14, 2022 at 02:56:12PM -0700, Linus Torvalds wrote:
> On Thu, Jul 14, 2022 at 2:51 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But if this particular one causes problems for maintainers, I can
> > easily just take it right away just cherry-pick it from my own
> > test-tree to my "main" tree.
> 
> Oh, and as I did that cherry-pick, I suddenly remembered that I think
> PeterZ had a slightly different version of it - the one I picked up is
> Nathan's "v2".
> 
> PeterZ, do you have preferences? I've waited this long, I might as
> well wait a bit more before I push out whatever version people prefer.

Nathan's is much nicer; I got bit by header hell and punted.
