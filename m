Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CC2C87
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 14:16:57 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 09F526105A;
	Wed,  6 Oct 2021 14:16:55 +0000 (UTC)
Date: Wed, 6 Oct 2021 10:16:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, x86@kernel.org, Kees Cook
 <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <20211006101654.6a5be402@gandalf.local.home>
In-Reply-To: <20211006135417.tvdns3ykpgupi47q@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
	<20210930180531.1190642-7-samitolvanen@google.com>
	<20211006032945.axlqh3vehgar6adr@treble>
	<20211006090249.248c65b0@gandalf.local.home>
	<20211006135417.tvdns3ykpgupi47q@treble>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Oct 2021 06:54:17 -0700
Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> But this macro is used in other places as well:
> 
>   https://lkml.kernel.org/r/20210930180531.1190642-10-samitolvanen@google.com
> 
> And many of them aren't internal to a function like the above symbols,
> they're actual functions that are called in other ways.
> 
> DECLARE_UNCALLED_FROM_C() ?

  DECLARE_NOT_CALLED_FROM_C() ;-)

Straight and to the point!

"uncalled" is a strange word.

-- Steve
