Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D072
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K6+8kXKib6sIkUJI1XrdDyzZBHgx7wwZP/n9vo0a4os=; b=VdVgiyYZmpE8SOGnmjXIk3ucwC
	y0IUZolBtwAqMu4hAvE3+d8UQFQm2gnpaSsrvrlY3+v5n7gKgvXpUe7du+kjQWc2KGk2OiYs3lTSL
	6OU1UyhesLGdvgSp6k2FkSSsZQl2YCe8vifi7cNbhFgkAQ/fwvMsYX8YHAPbh58SJeydNOzXgJo63
	0PxcDrK5SSaYKqwnsU+hhxkexA4QDSbkaP3RYRGhj/nIRTUcsZG7huipFloIhhabkBnggVJ1W02ha
	kXf5LzA3qMfllzSZGcwTip8ZJLBYZmV+7Y9ANaIZst4yun6/DkYcBVyRbyIfKvwgLBc9jfR3dmygU
	jnnDVksA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkge-00FFuh-Pi; Wed, 10 Nov 2021 10:18:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 685D93000D5;
	Wed, 10 Nov 2021 11:18:36 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 51ABC20189CA9; Wed, 10 Nov 2021 11:18:36 +0100 (CET)
Date: Wed, 10 Nov 2021 11:18:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	dvyukov@google.com, seanjc@google.com, pbonzini@redhat.com,
	mbenes@suse.cz, llvm@lists.linux.dev,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Message-ID: <YYucfEepAm/pRHNu@hirez.programming.kicks-ass.net>
References: <20211105171023.989862879@infradead.org>
 <20211105171821.654356149@infradead.org>
 <20211108164711.mr2cqdcvedin2lvx@treble>
 <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net>
 <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com>
 <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net>
 <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <20211109210736.GV174703@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109210736.GV174703@worktop.programming.kicks-ass.net>

On Tue, Nov 09, 2021 at 10:07:36PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 09, 2021 at 11:22:44AM -0800, Nick Desaulniers wrote:
> 
> > I think the use of this feature (label-attributes) here isn't
> > necessary though; because of the use of outputs, the "fallthrough"
> > basic block needs to be placed immediately after the basic block
> > terminated by the asm goto, at least in LLVM.  Was different ordering
> > of basic blocks observed with GCC without this label attribute?
> 
> GCC does the same, but I wanted to have the exception stuff be in
> .text.cold, but alas it doesn't do that. I left the attribute because of
> it's descriptive value.
> 
> >  Unless the cold attribute is helping move
> > ("shrink-wrap"?) the basic block to a whole other section
> > (.text.cold.)?
> 
> I was hoping it would do that, but it doesn't on gcc-11.

I've removed the __cold on labels in the latest posting.

  https://lkml.kernel.org/r/20211110100102.250793167@infradead.org
