Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F067B
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:30:27 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 32KMmfUC015937;
	Mon, 20 Mar 2023 17:48:41 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 32KMmevv015936;
	Mon, 20 Mar 2023 17:48:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 20 Mar 2023 17:48:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: Linux 6.3-rc3
Message-ID: <20230320224840.GG25951@gate.crashing.org>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com> <20230320180501.GA598084@dev-arch.thelio-3990X> <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com> <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net> <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com> <20230320220631.GA637514@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320220631.GA637514@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i

On Mon, Mar 20, 2023 at 03:06:31PM -0700, Nathan Chancellor wrote:
> It seems like clang takes into account that the branch has no effect on
> how uninitialized err is, although it does acknowledge there may be
> control flow where err is not used uninitialized because it is not used
> at all by stating "when used here". I guess GCC does not make this
> distinction and places it under -Wmaybe-uninitialized. I could be
> totally wrong though :)

In one place we have the comment

  /* Re-do the plain uninitialized variable check, as optimization may have
     straightened control flow.  Do this first so that we don't accidentally
     get a "may be" warning when we'd have seen an "is" warning later.  */

It seems we miss a similar case here?

In any case, please open a PR if you want this fixed.  Thanks!


Segher
