Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC89A35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD6DC340E9;
	Mon, 14 Feb 2022 18:57:40 +0000 (UTC)
Date: Mon, 14 Feb 2022 13:57:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, chongjiapeng
 <jiapeng.chong@linux.alibaba.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/ftrace.c:7157:20: error: unused function
 'ftrace_startup_enable'
Message-ID: <20220214135739.60b2149e@gandalf.local.home>
In-Reply-To: <Ygp64CsyyKyRykqE@dev-arch.archlinux-ax161>
References: <202202132037.4aN017dU-lkp@intel.com>
	<20220214102000.1d3af66e@gandalf.local.home>
	<Ygp64CsyyKyRykqE@dev-arch.archlinux-ax161>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Feb 2022 08:53:04 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> I will be honest, I don't know why the robot flagged 172f7ba9772c as the
> commit that introduced this warning but it seems legitimate if
> CONFIG_DYNAMIC_FTRACE is not enabled, since ftrace_startup_enable() is
> only ever used within an '#ifdef CONFIG_DYNAMIC_FTRACE' block so I guess
> the stub is unnecessary?

I'm all fine for clean up patches, but I don't like "new warning" message
reports for things that use to be OK, but now are a warning.

In other words, if a bot updates its warnings, it should do a full pass of
the kernel before it starts on new commits, to flag all existing warnings
as OK (but possibly work for someone to clean up), but should not ever send
as a new warning message to the authors.

So, I'm going to ignore this. If someone wants to send me a clean up patch,
I'll test it and take it, but I do not have the time to clean up new
warnings that use to be OK unless they uncovered a real bug.

-- Steve
