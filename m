Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613ED2F39
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 19:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88645C433C1;
	Wed, 27 Jul 2022 19:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658950775;
	bh=6QrAfTvkNV6NZKSnM4GFiCYvG9mCQyTGm1wjf+gju7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGH/vNOWi7C6FWQk9KzV2m0O+irt0iEntrgyypDc3vAc1QOIwc4IakO9QVE7OPY9M
	 ju80zSFCipphEOr2u5vf3g80FJFR8JxIAGQ4RxSRADSXKybeKYl60/QKc6+fGN7BB3
	 C8VHhhm2zeohFEvJCplqSx4WDxcOGSA3HIiYH146h7RWZPOC3q1y7IkldwVjMmjH8+
	 WYjWH17eeImpsGufgfSCiFks/xlIsRumpCqKsJh+jamgOaJQ7fy6BFKOVptNGPg/AP
	 8kJY1711kbQqW3HO7EEE/5GIEuVX4Mi2kqE3sdklDf8TGroG7w3JFaqMsknw2VHinI
	 mDUqjCIkkUjuA==
Date: Wed, 27 Jul 2022 12:39:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Justin Stitt <justinstitt@google.com>, ndesaulniers@google.com,
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, rostedt@goodmis.org, senozhatsky@chromium.org,
	trix@redhat.com
Subject: Re: [PATCH v4] lib/test_printf.c: fix clang -Wformat warnings
Message-ID: <YuGUdHVhfwjobDJP@dev-arch.thelio-3990X>
References: <CAKwvOdnN67xFL22oWfqrKjvES4vjSB3KNhm401LtoC7igO+4Vg@mail.gmail.com>
 <20220718230626.1029318-1-justinstitt@google.com>
 <Ytag6youpnmli3E1@alley>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ytag6youpnmli3E1@alley>

Hi Petr,

On Tue, Jul 19, 2022 at 02:17:47PM +0200, Petr Mladek wrote:
> On Mon 2022-07-18 16:06:26, Justin Stitt wrote:
> > see warnings:
> > | lib/test_printf.c:157:52: error: format specifies type 'unsigned char'
> > | but the argument has type 'int' [-Werror,-Wformat]
> > test("0|1|1|128|255",
> > | "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
> > -
> > | lib/test_printf.c:158:55: error: format specifies type 'char' but the
> > | argument has type 'int' [-Werror,-Wformat] test("0|1|1|-128|-1",
> > | "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
> > -
> > | lib/test_printf.c:159:41: error: format specifies type 'unsigned
> > short'
> > | but the argument has type 'int' [-Werror,-Wformat]
> > | test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
> > 
> > There's an ongoing movement to eventually enable the -Wformat flag for
> > clang. Previous patches have targeted incorrect usage of
> > format specifiers. In this case, however, the "incorrect" format
> > specifiers are intrinsically part of the test cases. Hence, fixing them
> > would be misaligned with their intended purpose. My proposed fix is to
> > simply disable the warnings so that one day a clean build of the kernel
> > with clang (and -Wformat enabled) would be possible. It would also keep
> > us in the green for alot of the CI bots.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> 
> Looks good to me:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Would you be able to take this for 5.20 or should we ask Andrew to pick
it up? It seems you two seem to split applying patches to this file and
we are trying to get -Wformat enabled for clang in 5.20.

Cheers,
Nathan
