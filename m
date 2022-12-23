Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65BA48A
	for <llvm@lists.linux.dev>; Fri, 23 Dec 2022 17:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF6AC433D2;
	Fri, 23 Dec 2022 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671816670;
	bh=fgXCLKllqkTCFcfNQk0a1yJ2up7pVcPAhTTWJrO18Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBAf03ZRc2RIIPJwGh4VAPTSrPWKDmgaPJqBGC61Rqig7wTFQ9vu/i5Cuc0wf0LAK
	 DzhilCsBlJ7bDvXUEOK8RE8fp4nlGInRPGcs609jSjNj3rZHm7jzqCU6u9ItG0brrs
	 Dqo+kbLSWglXCvdtnvyV7Hro1y+K4BYMEV/VumSCtAOWYNRKP1l129Fzv5+BfKbBcb
	 b7EwsO7hD6WPjRfc8Cg1lNEaqVrMOivJ7UHzN0yLocC1/7/n2zCnjjg89cqy3wXXkH
	 FaRD1RrRJm4Ft/5X2GfpE/+v+BDrWZMgrJz6YYfi7ZAcDpGgyOAAXo+n88rehcI4Ns
	 6heHSrgQC/Zmg==
Date: Fri, 23 Dec 2022 10:31:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, LLVM Mailing List <llvm@lists.linux.dev>
Subject: Re: [PATCH v1] driver core: Silence 'unused-but-set variable' warning
Message-ID: <Y6Xl3M7Tx+c2SCa9@dev-arch.thelio-3990X>
References: <20221223145137.3786601-1-ammar.faizi@intel.com>
 <Y6XDAiMAMLniR9PG@kroah.com>
 <7f61b046-c6f2-1dd6-98e9-e5b49b3c7dde@gnuweeb.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f61b046-c6f2-1dd6-98e9-e5b49b3c7dde@gnuweeb.org>

On Fri, Dec 23, 2022 at 10:31:57PM +0700, Ammar Faizi wrote:
> On 12/23/22 10:02 PM, Greg Kroah-Hartman wrote:
> > Ick, no, that's horrid and is NOT ok for kernel code, sorry.
> > 
> > Please fix the compiler, this is not a "fix" in any sense of the word
> > and is not going to work at all for kernel code.

It is possible that the compiler should not emit
-Wunused-but-set-variable when the variable is assigned the return
value of a function marked with __attribute__((warn_unused_result)) but
neither compiler does that today, you'll see the exact same warning from
GCC 12.2.0:

  drivers/base/module.c: In function ‘module_add_driver’:
  drivers/base/module.c:36:13: error: variable ‘no_warn’ set but not used [-Werror=unused-but-set-variable]
     36 |         int no_warn;
        |             ^~~~~~~
  cc1: all warnings being treated as errors

This has come up before too:

https://lore.kernel.org/20210726201924.3202278-2-morbo@google.com/

> Agree.
> 
> Sorry for the noise. It turned out I messed up my clang compiler flags.
> I forgot to do a "git reset --hard" before recompiling.
> 
> This has nothing todo with the upstream kernel.

This warning is in W=1, which are warnings that we want to turn on at
some point but the current instances need to be fixed first, so I would
say this is still relevant to the upstream kernel.

Cheers,
Nathan
