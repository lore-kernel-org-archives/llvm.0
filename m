Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2646258A
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 19:16:29 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 22KJGJcQ027355;
	Sun, 20 Mar 2022 20:16:19 +0100
Date: Sun, 20 Mar 2022 20:16:19 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Nugraha <richiisei@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/6] tools/nolibc: Make the entry point not weak
 for clang
Message-ID: <20220320191619.GA27312@1wt.eu>
References: <20220320093750.159991-1-ammarfaizi2@gnuweeb.org>
 <20220320093750.159991-3-ammarfaizi2@gnuweeb.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220320093750.159991-3-ammarfaizi2@gnuweeb.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ammar,

I've had a look at this one.

On Sun, Mar 20, 2022 at 04:37:46PM +0700, Ammar Faizi wrote:
> Budilig with clang yields the following error:
  ^^^^^^^
BTW please fix the typo in the final commit message.

> @@ -183,7 +183,9 @@ struct sys_stat_struct {
>  
>  /* startup code */
>  asm(".section .text\n"
> +#if !defined(__clang__)
>      ".weak _start\n"
> +#endif
>      ".global _start\n"
>      "_start:\n"

So it seems that I was wrong and that .weak is an alternate for .global
and not a complement. As such, instead of adding all these #if, please
simply remove all .global.

Thanks!
Willy
