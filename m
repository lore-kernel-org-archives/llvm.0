Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EF268
	for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 20:26:22 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1BBKKThb015069;
	Sat, 11 Dec 2021 14:20:29 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 1BBKKRTs015068;
	Sat, 11 Dec 2021 14:20:27 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 11 Dec 2021 14:20:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "'Jann Horn'" <jannh@google.com>, Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Potapenko <glider@google.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
Subject: Re: randomize_kstack: To init or not to init?
Message-ID: <20211211202026.GB614@gate.crashing.org>
References: <YbHTKUjEejZCLyhX@elver.google.com> <CAG48ez0dZwigkLHVWvNS6Cg-7bL4GoCMULyQzWteUv4zZ=OnWQ@mail.gmail.com> <d35ca52c81e7408ba94210c6dbc30368@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d35ca52c81e7408ba94210c6dbc30368@AcuMS.aculab.com>
User-Agent: Mutt/1.4.2.3i

On Sat, Dec 11, 2021 at 05:01:07PM +0000, David Laight wrote:
> From: Jann Horn
> > void bar(char *p);
> > void foo() {
> >   char arr[512];
> >   bar(arr);
> > }

> >         call    memset@PLT

> There is plenty of userspace code that allocates large arrays on stack
> (I bet some get into MB sizes) that are correctly bound-checked but
> the expense of initialising them will be horrid.

Yes, you need ulimit -s much more often now than when the default limit
was introduced (in 1995 apparently); back then it was comparable to main
memory size, now it is a fraction of a thousandth of it.  But because of
the same you do not need to increase the stack size for pretty much
anything in distros now :-)

> So you end up with horrid, complex, more likely to be buggy, code
> that tries to allocate things that are 'just big enough' rather
> than just a sanity check on a large buffer.

Yes.  The only problem is this will touch memory that is cold in cache
still (because the stack grows down and arrays are addressed in the
positive direction).  This is a pretty minimal effect of course.

> Typical examples are char path[MAXPATH].
> You know the path will almost certainly be < 100 bytes.
> MAXPATH is overkill - but can be tested for.
> But you don't want path[] initialised.
> So you cane to pick a shorter length - and then it all goes 'TITSUP'
> when the actual path is a bit longer than you allowed for.

If you do this, you probably want to warn for any non-tail functions
that have such a stack allocation, because over-allocating there is
pretty bad.  Or maybe you want to warn whenever you omit the
initialisation even :-)


Segher
