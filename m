Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305EF4280
	for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I4LbsDeMsT9PAzJ2X50ulKRjmZGAas7W4QaYBWmBc+c=; b=Vh1QuQPvLdKK7Q1gALKLp5ebnY
	VReCh60MtZR8uf4Wbqto6ILSSDF3OcCYeHUJ0OsDU9b/S2DKgycXIhWsKP0hNw7sAj/mcHT5FYnWJ
	8AykbnXvWaLSMIxI3H9vsidoGHmrA/Lh40OmEHcHolID/vHfnyZk0DBiht9GVpYq6+xpUIm1hdCfo
	Dme8w5aWqhrOZEA1YAsQVj6aQtuxs6HMt4ybKge1pkOBi0hYfbHpd17HXaoN+/qYCHMmGj/1hoxBi
	l3DGbg04Mlnil6LX9rceP/bQh/sXPaX6gas9YkXoJAwQf0VQeFrffdgaSU1g33rMhT5e9Z4t3j2OX
	A2xKo5sg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nT0j2-000AEP-Je; Sat, 12 Mar 2022 12:20:00 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 39C4B98791D; Sat, 12 Mar 2022 13:20:00 +0100 (CET)
Date: Sat, 12 Mar 2022 13:20:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/ibt: Fix CC_HAS_IBT check for clang
Message-ID: <20220312122000.GB28057@worktop.programming.kicks-ass.net>
References: <20220311195642.2033108-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311195642.2033108-1-nathan@kernel.org>

On Fri, Mar 11, 2022 at 12:56:42PM -0700, Nathan Chancellor wrote:
> Commit 41c5ef31ad71 ("x86/ibt: Base IBT bits") added a check for a crash
> in clang. However, this check does not work for two reasons.
> 
> The first reason is that '-pg' is missing from the check, which is
> required for '-mfentry' to do anything.
> 
> The second reason is that cc-option only uses /dev/null as the input
> file, which does not show a problem:
> 
> $ clang --version | head -1
> Ubuntu clang version 12.0.1-8build1
> 
> $ clang -fcf-protection=branch -mfentry -pg -c -x c /dev/null -o /dev/null
> 
> $ echo $?
> 0
> 
> $ echo "void a(void) {}" | clang -fcf-protection=branch -mfentry -pg -c -x c - -o /dev/null
> ...
> 
> $ echo $?
> 139
> 
> Use this test instead so that the check works for older versions of
> clang.
> 
> Fixes: 41c5ef31ad71 ("x86/ibt: Base IBT bits")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Urgh... not pretty, but that's what we gotta live with I suppose.

Thanks!
