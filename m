Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D6A3B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 13:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F6C385A9;
	Wed, 27 Apr 2022 13:47:00 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:46:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] ftrace: Drop duplicate mcount locations
Message-ID: <20220427094658.502fcaee@gandalf.local.home>
In-Reply-To: <9b1b816cff1f479c8de0e9baa5a6ac680b84e17e.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<9b1b816cff1f479c8de0e9baa5a6ac680b84e17e.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Apr 2022 15:01:21 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> In the absence of section symbols [1], objtool (today) and recordmcount
> (with a subsequent patch) generate __mcount_loc relocation records with
> weak symbols as the base. This works fine as long as those weak symbols
> are not overridden, but if they are, these can result in duplicate
> entries in the final vmlinux mcount location table. This will cause
> ftrace to fail when trying to patch the same location twice. Fix this by
> dropping duplicate locations during ftrace init.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/trace/ftrace.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 4f1d2f5e726341..8bc4f282bb3ff4 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6496,7 +6496,7 @@ static int ftrace_process_locs(struct module *mod,
>  	struct dyn_ftrace *rec;
>  	unsigned long count;
>  	unsigned long *p;
> -	unsigned long addr;
> +	unsigned long addr, prev_addr = 0;
>  	unsigned long flags = 0; /* Shut up gcc */
>  	int ret = -ENOMEM;
>  
> @@ -6550,6 +6550,16 @@ static int ftrace_process_locs(struct module *mod,
>  	while (p < end) {
>  		unsigned long end_offset;
>  		addr = ftrace_call_adjust(*p++);
> +
> +		/*
> +		 * Drop duplicate entries, which can happen when weak
> +		 * functions are overridden, and __mcount_loc relocation
> +		 * records were generated against function names due to
> +		 * absence of non-weak section symbols
> +		 */
> +		if (addr == prev_addr)
> +			addr = 0;

Please don't use the side effect of addr == 0 causing the loop to continue
for this logic. The two are not related. Simply call continue.

		if (addr == prev_addr)
			continue;


-- Steve


> +
>  		/*
>  		 * Some architecture linkers will pad between
>  		 * the different mcount_loc sections of different
> @@ -6569,6 +6579,7 @@ static int ftrace_process_locs(struct module *mod,
>  
>  		rec = &pg->records[pg->index++];
>  		rec->ip = addr;
> +		prev_addr = addr;
>  	}
>  
>  	/* We should have used all pages */

