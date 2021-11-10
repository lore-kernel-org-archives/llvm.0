Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C472C87
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 12:57:35 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1AACEZvq030022;
	Wed, 10 Nov 2021 06:14:36 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 1AACESJE030011;
	Wed, 10 Nov 2021 06:14:28 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 10 Nov 2021 06:14:28 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
        x86@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        dvyukov@google.com, seanjc@google.com, pbonzini@redhat.com,
        mbenes@suse.cz, llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Message-ID: <20211110121428.GD614@gate.crashing.org>
References: <20211105171023.989862879@infradead.org> <20211105171821.654356149@infradead.org> <20211108164711.mr2cqdcvedin2lvx@treble> <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net> <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com> <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net> <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com> <20211109210736.GV174703@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109210736.GV174703@worktop.programming.kicks-ass.net>
User-Agent: Mutt/1.4.2.3i

Hi!

On Tue, Nov 09, 2021 at 10:07:36PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 09, 2021 at 11:22:44AM -0800, Nick Desaulniers wrote:
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
> > ("shrink-wrap"?)

Shrink-wrapping is something else entirely.

>>  the basic block to a whole other section
> > (.text.cold.)?
> 
> I was hoping it would do that, but it doesn't on gcc-11.

A cold basic block can never dominate a non-cold basic block.  GCC will
fix things up when it notices this property is violated, so marking
random blocks as "cold" will not be very effective.


Segher
