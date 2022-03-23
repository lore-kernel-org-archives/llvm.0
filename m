Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AB61378
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 07:10:20 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 22N7A16E014195;
	Wed, 23 Mar 2022 08:10:01 +0100
Date: Wed, 23 Mar 2022 08:10:01 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: David Laight <David.Laight@ACULAB.COM>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Nugraha <richiisei@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH v2 3/8] tools/nolibc: i386: Implement syscall with 6
 arguments
Message-ID: <20220323071001.GA14186@1wt.eu>
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org>
 <20220322102115.186179-4-ammarfaizi2@gnuweeb.org>
 <8653f6784a9b4272a59a75a530663567@AcuMS.aculab.com>
 <a8eeec1d-656d-15a3-dde5-0f8cc8c5956b@gnuweeb.org>
 <20220322121338.GD10306@1wt.eu>
 <22fd9709b3a64a548226741b682ca155@AcuMS.aculab.com>
 <2eba5687-6b63-ceb2-3fbd-3d236727ea11@gnuweeb.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eba5687-6b63-ceb2-3fbd-3d236727ea11@gnuweeb.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 23, 2022 at 01:29:39PM +0700, Ammar Faizi wrote:
> On 3/22/22 8:37 PM, David Laight wrote:
> > dunno, 'asm' register variables are rather more horrid and
> > should probably only be used (for asm statements) when there aren't
> > suitable register constraints.
> > 
> > (I'm sure there is a comment about that in the gcc docs.)
> 
> ^ Hey David, yes you're right, that is very interesting...
> 
> I hit a GCC bug when playing with syscall6() implementation here.
> 
> Using register variables for all inputs for syscall6() causing GCC 11.2
> stuck in an endless loop with 100% CPU usage. Reproducible with several
> versions of GCC.
> 
> In GCC 6.3, the syscall6() implementation above yields ICE (Internal
> Compiler Error):
> ```
>   <source>: In function '__sys_mmap':
>   <source>:35:1: error: unable to find a register to spill

Now I'm pretty sure that it was the issue I faced when trying long ago,
I remember this error message before I found it wiser to give up.

Willy
