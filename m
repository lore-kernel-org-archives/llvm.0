Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD24C9D
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j2447HleS4DZ4bCY1Uc5ZeerWZpk2ShbXplreI9Wu+I=; b=XKwsXUL7HkZMtobsnhd4VwDrt7
	18FvZmDomuG990H123wQK+O+zNBnYHwYW9vebxqpw/njGrNYO7Nqkjws21CoRMC8M2jTp62mdHNP8
	YR9n6s/l6z7O8qGepB7Doc/pHeqtbSY2Zb/W7WeHB08KOlVgA+vit2hI4/V2MJwq6HOPsd0fYqsMV
	wrACJfOaHUqer5Y85dSzOgNlPq8mBXQ+EMtbc2L3ipN+jWBwsdACtpfA2xdgG93zK94W3DtK3Nmsa
	w+LBaSWt9AoBaM/20fg2AlqIFoyNw1TeQqdrw3DwxbbltF3/eQMS/eyHEYDGGwQUz/uMt6z6XmI03
	qi2H6FFQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgOn-0063I6-TP; Mon, 15 Aug 2022 20:09:22 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 47A81980264; Mon, 15 Aug 2022 22:09:20 +0200 (CEST)
Date: Mon, 15 Aug 2022 22:09:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	ceph-devel@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
Message-ID: <Yvqn8BqE7FdB6Ccd@worktop.programming.kicks-ass.net>
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <Yvny9L3tw1EolqQ4@worktop.programming.kicks-ass.net>
 <CAHk-=whnEN3Apb5gRXSZK7BM+MOby9VCZe3sDcW34Zme_wk3uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whnEN3Apb5gRXSZK7BM+MOby9VCZe3sDcW34Zme_wk3uA@mail.gmail.com>

On Mon, Aug 15, 2022 at 08:58:21AM -0700, Linus Torvalds wrote:
> And no, disassembling the instruction wouldn't kill us either (we know
> it's a "mov" instruction, so it's just the modrm bytes), but again it
> really didn't seem worth the pain. The generated code with the fixed
> registers wasn't optimal, but it was close enough that it really
> doesn't seem to matter.

I'm not at all suggesting we do this; but it might be
insn_get_addr_ref() does what is needed.
