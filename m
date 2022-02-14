Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F77A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 15:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855FCC340E9;
	Mon, 14 Feb 2022 15:20:01 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:20:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: chongjiapeng <jiapeng.chong@linux.alibaba.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/ftrace.c:7157:20: error: unused function
 'ftrace_startup_enable'
Message-ID: <20220214102000.1d3af66e@gandalf.local.home>
In-Reply-To: <202202132037.4aN017dU-lkp@intel.com>
References: <202202132037.4aN017dU-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Feb 2022 21:03:29 +0800
kernel test robot <lkp@intel.com> wrote:

> All errors (new ones prefixed by >>):
> 
> >> kernel/trace/ftrace.c:7157:20: error: unused function 'ftrace_startup_enable' [-Werror,-Wunused-function]  
>    static inline void ftrace_startup_enable(int command) { }
>                       ^
>    1 error generated.

Strange. I always thought that static inline functions do not cause
warnings when not used? Especially, since they are often in headers when
things are turned off. Or is it because this is in a C file?

Is this a new warning caused by a commit, or is it a new warning because
the compiler now complains about it?

-- Steve


> 
> 
> vim +/ftrace_startup_enable +7157 kernel/trace/ftrace.c
