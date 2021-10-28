Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B0F762C82
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 14:34:53 +0000 (UTC)
Received: (qmail 1352277 invoked by uid 1000); 28 Oct 2021 10:34:46 -0400
Date: Thu, 28 Oct 2021 10:34:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul =?iso-8859-1?Q?Heidekr=FCger?= <paul.heidekrueger@in.tum.de>
Cc: paulmck@kernel.org, will@kernel.org, peterz@infradead.org,
  boqun.feng@gmail.com, parri.andrea@gmail.com, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, elver@google.com, charalampos.mainas@gmail.com,
  pramod.bhatotia@in.tum.de
Subject: Re: Potentially Broken Address Dependency via test_bit() When
 Compiling With Clang
Message-ID: <20211028143446.GA1351384@rowland.harvard.edu>
References: <YXknxGFjvaB46d/p@Pauls-MacBook-Pro>
 <20211027142720.GB1319606@rowland.harvard.edu>
 <YXqZm6XTlMGDSpMT@Pauls-MacBook-Pro>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXqZm6XTlMGDSpMT@Pauls-MacBook-Pro>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Oct 28, 2021 at 02:37:47PM +0200, Paul Heidekrüger wrote:
> On Wed, Oct 27, 2021 at 10:27:20AM -0400, Alan Stern wrote:
> > On Wed, Oct 27, 2021 at 12:19:48PM +0200, Paul Heidekrüger wrote:

> > > Address dependency in source code, lines 373 - 375 in fs/afs/addr_list.c:
> > > 
> > > > [...]
> > > >   index = READ_ONCE(ac->alist->preferred);
> > > >   if (test_bit(index, &set))
> > > >     goto selected;
> > > > [...]
> > > 
> > > where test_bit() expands to the following in 
> > > include/asm-generic/bitops/non-atomic.h, lines 115 - 122:
> > > 
> > > > static __always_inline int
> > > > arch_test_bit(unsigned int nr, const volatile unsigned long *addr)
> > > > {
> > > >   return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
> > > > }
> > > > #define test_bit arch_test_bit

> > However, I can't follow the IR code.  Can you please explain in ordinary 
> > English how the LLVM compiler manages to lose track of this dependency?
> > 
> > Alan Stern
> 
> Here's what we think might be going on:
> - In 'arch_test_bit()', 'addr[BIT_WORD(nr)]' expands to 'addr[(nr) / 64]'.
> - Since 'addr' points to an 'unsigned long', any other result than '0' for
>   '(nr) / 64' would be out of bounds and therefore undefined.
> - We assume LLVM is able to figure this out and use it to get rid of the
>   address computation all together.

Ah, that explains it.  Yes, when set is a single unsigned long (or an 
array of length 1), the address dependency is only syntactic, not 
semantic.  As a result, we should expect that compilers will sometimes 
not preserve it.

The danger, of course, is that people relying on an ordering prescribed 
by the LKMM may get fooled because (unbeknownst to them) the dependency 
in question is not semantic.  It would be great if a static checker 
could detect such things -- but this would require some way for us to 
inform the checker about when the code does rely on a dependency 
ordering.

> We ran some experiments to see how optimisations behave when 'set' is in fact
> an array and / or in global scope.
> 
> 1. Insert a 'barrier()' in 'arch_test_bit()' before the 'return':
> The dependency gets broken.
> 
> 2. Make 'set' an 'unsigned long' array of size '42', keep local scope: 
> The dependency gets preserved.
> 
> 3. Keep 'set' as 'unsigend long', move to global scope: 
> The dependency gets preserved.

That one's a little strange.  I don't see why the scope should make any 
difference, so long as the compiler knows the actual type and length.

> 4. Make 'set' an 'unsigned long' array of size '42', move to global scope: 
> The dependency gets preserved.

Alan
