Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B88533D3
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 14:11:46 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 22KE1vIf026472;
	Sun, 20 Mar 2022 15:01:57 +0100
Date: Sun, 20 Mar 2022 15:01:57 +0100
From: Willy Tarreau <w@1wt.eu>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "'Ammar Faizi'" <ammarfaizi2@gnuweeb.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Nugraha <richiisei@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH v1 3/6] tools/nolibc: i386: Implement syscall with 6
 arguments
Message-ID: <20220320140157.GB26349@1wt.eu>
References: <20220320093750.159991-1-ammarfaizi2@gnuweeb.org>
 <20220320093750.159991-4-ammarfaizi2@gnuweeb.org>
 <2e335ac54db44f1d8496583d97f9dab0@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e335ac54db44f1d8496583d97f9dab0@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi David,

On Sun, Mar 20, 2022 at 01:10:33PM +0000, David Laight wrote:
> And using xchg is slow - it is always locked.

Note that we don't really care here, as it remains minimal compared to
an mmap() call.

> One possibility might be to do:
> 	push arg6
> 	push %ebp
> 	mov  %ebp, 4(%sp)
> 	int  0x80
> 	pop  %ebp
> 	add  %esp,4
> 
> Although I'm not sure you really want to allocate 4k pages
> for every malloc() call.

Well, it depends. I would argue that we don't even need malloc() but
on the other hand this is essentially used to write small regtests so
we don't really care about the waste here if someone really needs it.

I'd rather get Ammar's motivations for malloc() in the first place.

Willy
