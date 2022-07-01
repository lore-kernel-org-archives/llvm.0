Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B41855
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0/2zvonDcE3Fklpe/jarNXLTTDqCN2xFbwhTdVMbRho=; b=F6BYYBOSnF6QrD1t3Oziop62MF
	3VjhUBpC4lFaMLIGRMl32DI5uYtwFrEw4YPo0pNH+97ooDPQHISHAb2Ki3OE+1Ogu64u77WvL+z40
	Z0iE2A3Mi5/uRafY2WmLrH2BnqfwK7dlX62jnJ5/p6OienKV6ohiEdHTx5wIDURfJDfPX+pOeuF9W
	TRGCx7RIrvSt2yNnZ2NqghxGdwnsmZRjYeMafZ5vlz5S2yG5aU+b0m9K98+rnyGmkFuxIRHi+ajWT
	E59zMAcJSXcNZsBPDSjjfb8xC2GzFvRiE9qjOEZEYiklU4yDC1TUn8wL4JjWPVzT7GLMAJk8CAdKb
	uQAa7hfA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7CWw-00Fe4k-40; Fri, 01 Jul 2022 09:01:48 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id A278F980017; Fri,  1 Jul 2022 11:01:37 +0200 (CEST)
Date: Fri, 1 Jul 2022 11:01:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Jose E. Marchesi" <jemarch@gnu.org>
Cc: Ruud van der Pas <ruud.vanderpas@oracle.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Bill Wendling <morbo@google.com>,
	Vladimir Mezentsev <vladimir.mezentsev@oracle.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
	Wenlei He <wenlei@fb.com>, Hongtao Yu <hoy@fb.com>,
	Ingo Molnar <mingo@kernel.org>, linux-toolchains@vger.kernel.org,
	elena.zannoni@oracle.com
Subject: Re: plumbers session on profiling?
Message-ID: <Yr638aOIaaEBPICy@worktop.programming.kicks-ass.net>
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org>
 <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
 <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
 <B0A01DE7-1B50-479A-92DF-DAFAB3F06E0F@oracle.com>
 <878rpgpvfj.fsf@gnu.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rpgpvfj.fsf@gnu.org>

On Tue, Jun 28, 2022 at 07:08:48PM +0200, Jose E. Marchesi wrote:
> 
> [Added linux-toolchains@vger in CC]
> 
> It would be interesting to have some discussion in the Toolchains track
> on building the kernel with PGO/FDO.  I have seen a raise on interest on
> the topic in several companies, but it would make very little sense if
> no kernel hacker is interested in participating... anybody?

I know there's been a lot of work in this area, but none of it seems to
have trickled down to be easy enough for me to use it.
