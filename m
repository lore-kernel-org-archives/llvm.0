Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430D199D6
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BdKb5EmyKQh6zjXSRICZvTdMTUVxdIjRuHFxEMonPvc=; b=Rz+hDcVLb9XQV177cM2trZLLbk
	Kt/DuViUTHSjgbNEa3maGTfhUAs1FAMrRGE04688hSkGYV8UIwcCILnnHbgoUzGAstoVXbOu83lK3
	y6EA0pNHP5eAs7HBtE8JO7MX7td1Mu7+BhlVW+eySmLe76iGmc5IRouiZnoFYz6P/gdE/TXe8XZrQ
	X5Y6+JInDPYtq94aUxh68pTnKQNnm34M7yjHcX/3TiAihi84q99tZeZebgsLqY4DZRDx+M5WGKJtN
	uyvVFDwfHLLL9mG8qfuvxNm5Sl8CUXrXCAG+OC9W6fnDaRgdUoL1nyV95JSnT8pBGSXIImaypR7gu
	5Xs7oLJw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNKN-00FWXy-2L;
	Thu, 21 Sep 2023 17:19:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D0F483002F1; Thu, 21 Sep 2023 19:19:00 +0200 (CEST)
Date: Thu, 21 Sep 2023 19:19:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <maskray@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for
 annotations
Message-ID: <20230921171900.GB29413@noisy.programming.kicks-ass.net>
References: <20230920001728.1439947-1-maskray@google.com>
 <20230921072655.GA14803@noisy.programming.kicks-ass.net>
 <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
 <20230921153537.GG14803@noisy.programming.kicks-ass.net>
 <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>

On Thu, Sep 21, 2023 at 09:26:43AM -0700, Fangrui Song wrote:

> I do not see why absolute things need 12 byte entries.
> We can freely use `.long .text.foo` even in ELFCLASS64 object files.
> There is no risk of overflow (the ultimate link .text.foo may have an
> address of 0xffffffff........) since the section will be discarded.

And you're sure no toolchain is going to be clever and tell me that the
absolute relocation will want to be 8 bytes and does not fit in the 4
bytes allotted?

Because clearly that is something some clever assembler is going to
complain about any day now.
