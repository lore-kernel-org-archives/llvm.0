Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C931850
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UX/SPs8AC13vxFn7udG5iZupPxFPMinilIfXi14X6yI=; b=p+Iu9slgFv/zhQjTx/TwgcF1bw
	KEsuiLka8WujytnL4A/5OFQfsl5izPf34rnL0qELacBy9tEMJwy6tNZcRQiogyPvG5pAT43dce+8R
	Eaw9GyGCS0OSR9cHmSizkCibJ65LocJh03+deCaAWoKQe2GmXcs58TReu9zk726IT1C2FH+CJQIel
	QrnzDO/CYybl8Ec2+sUAtfOXGvPU3l/StA1oyYlEoZq/7sxU/Tw3U9PRKDK5TrN+9t1QoLyMF7ocI
	J0Ws0b6CX2QfKaTtqFibOVVnIaSICsNmN/aO0T0timB88x9BFZ9ti/LB4q1Xx/3DjxYDCu0blVrCF
	4SqShj3g==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7F93-00FhQ8-DU; Fri, 01 Jul 2022 11:49:10 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 18CE5980022; Fri,  1 Jul 2022 13:49:07 +0200 (CEST)
Date: Fri, 1 Jul 2022 13:49:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Bill Wendling <morbo@google.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>,
	Ruud van der Pas <ruud.vanderpas@oracle.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Vladimir Mezentsev <vladimir.mezentsev@oracle.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
	Wenlei He <wenlei@fb.com>, Hongtao Yu <hoy@fb.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-toolchains <linux-toolchains@vger.kernel.org>,
	elena.zannoni@oracle.com
Subject: Re: plumbers session on profiling?
Message-ID: <Yr7fMre18pUMz9rA@worktop.programming.kicks-ass.net>
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org>
 <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
 <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
 <B0A01DE7-1B50-479A-92DF-DAFAB3F06E0F@oracle.com>
 <878rpgpvfj.fsf@gnu.org>
 <Yr638aOIaaEBPICy@worktop.programming.kicks-ass.net>
 <CAGG=3QWbW-Dang49Jx3fyNExWtL8syuMkMJmcPHA7J25cHQ0zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QWbW-Dang49Jx3fyNExWtL8syuMkMJmcPHA7J25cHQ0zw@mail.gmail.com>

On Fri, Jul 01, 2022 at 03:17:54AM -0700, Bill Wendling wrote:
> On Fri, Jul 1, 2022 at 2:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Jun 28, 2022 at 07:08:48PM +0200, Jose E. Marchesi wrote:
> > >
> > > [Added linux-toolchains@vger in CC]
> > >
> > > It would be interesting to have some discussion in the Toolchains track
> > > on building the kernel with PGO/FDO.  I have seen a raise on interest on
> > > the topic in several companies, but it would make very little sense if
> > > no kernel hacker is interested in participating... anybody?
> >
> > I know there's been a lot of work in this area, but none of it seems to
> > have trickled down to be easy enough for me to use it.
> 
> We use an instrumented kernel to collect the data we need. It gives us
> the best payoff, because the profiling data is more fine-grained and
> accurate. (PGO does much more than make inlining decisions.)
> 
> If I recall correctly, you previously suggested using sampling data.
> (Correct?) Is there a document or article that outlines that process?

IIRC Google has LBR sample driven PGO somewhere as well. ISTR that being
the whole motivation for that gruesome Zen3 BRS hack.

Google got me this: https://research.google.com/pubs/archive/45290.pdf


