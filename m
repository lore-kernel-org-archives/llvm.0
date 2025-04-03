Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA00230985
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707954; cv=none; b=NaAQYY1VrvtemNYVvXOw2R+lpt+vZh5jogbxNP8zdElzn6qh1tZZo9wABp3O4SYHe5Ls8DypTFrM3sO3t7nP4OYveX4mr3CWxMaMs6Y92i/tGjE/CqSGTBdqoSGHGml7zdG/lkeGRORwFFj2Qqv107ySeX3iMH/k0Ew1b04BUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707954; c=relaxed/simple;
	bh=IbyUkp6kCh6S6vBIK5UVHOSIuVr1OBes+HRbtrN9NoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVeBdaE02uzV+/prmswTtPTn/kE1wQKbdAuVcUYchv8EGKotifYfSyWPZzPpGnNxhzqYS+3AuhlhFfvklUZAmqGJZn3hFZ+Z4lOoOitcpcs9gJns7rrkemf5gi9f7M0tdJBJoS4RNMlcJVVMT6paIs5fijDMgxjvwehTbHxVegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lo09+bro; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lo09+bro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2558C4CEED;
	Thu,  3 Apr 2025 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707953;
	bh=IbyUkp6kCh6S6vBIK5UVHOSIuVr1OBes+HRbtrN9NoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lo09+bro5SDyBXuu7a6KK2nZ8bB4QBIM/NG9DYp0YzZNEgTxpn6B9y+lWx3zbPQ+9
	 5cXiE/FyIozkiigZGUAb15G+QsaKlrrHCnlHu+UN3k1AYN3TcIYDPEskSMgmsCe6v1
	 cdhJQvalFIyAnNHZYP9c4Z04ybblyH+bGh+Pn2rMh9Zc3C5Bpa8TGRC65/P4yodFNH
	 nQMSNsTd92xXdLUHpuPzBKh8fHFV2Ha8jSg+JXlrr8n65SbhoeaCxUSq8HtNNCzy6b
	 XHvMAGeQy1SdozdIhynAgfcaEkXYqZ8XC1z16L7BHUZz7z/Ge3eBuQZObb0H2icrIh
	 8MI+UVl1SghBg==
Date: Thu, 3 Apr 2025 12:19:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-um@lists.infradead.org, Johannes Berg <johannes.berg@intel.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] um: mark rodata read-only and implement _nofault
 accesses
Message-ID: <20250403191910.GA3085607@ax162>
References: <20250210160926.420133-1-benjamin@sipsolutions.net>
 <20250210160926.420133-2-benjamin@sipsolutions.net>
 <20250402221254.GA384@ax162>
 <413669a192e65d67059245d38c03828f85d20717.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413669a192e65d67059245d38c03828f85d20717.camel@sipsolutions.net>

On Thu, Apr 03, 2025 at 08:20:23AM +0200, Benjamin Berg wrote:
> Hi Nathan,
> 
> oops, that is a little logic bug in the code. When we are coming from
> userspace, we may be running as part of a user task and have an mm. And
> then the new "current->pagefault_disabled" logic is skipped. So when
> prepend_copy is doing its nofault copy to evade a lock it is crashing
> instead of failing gracefully and retrying.
> 
> In segv_handler, can you try moving that into a separate "else if"
> block just above the "current->mm == NULL" check?
> 
> Something like the patch I copied below.

Thanks, I applied that change, which shows a slightly different crash
message now:

Modules linked in:
Pid: 24, comm: mount Not tainted 6.14.0-rc5-00002-gd1d7f01f7cd3-dirty
RIP: 0033:_end_0+0x38/0x45
RSP: 00000000648bfca0  EFLAGS: 00010206
RAX: 0000000000000000 RBX: 00000000609c7ff8 RCX: 00000000606350b8
RDX: 00000000648bfc5e RSI: 0000000000001000 RDI: 0000000060c0c000
RBP: 00000000648bfcc0 R08: 0000000000000000 R09: 0000000060c0c780
R10: 0000000000000000 R11: 0000000000000206 R12: 00000000648bfd60
R13: 0000000060c0c900 R14: 0000000060c0c9f8 R15: 0000000000000007
Kernel panic - not syncing: Segfault without recovery target
CPU: 0 UID: 0 PID: 24 Comm: mount Not tainted 6.14.0-rc5-00002-gd1d7f01f7cd3-dirty #1
Stack:
 600c25f9 00000007 609c7ff8 608c4780
 648bfcf0 601533da 601533bb 648bfd60
 648bfdb0 608c4780 648bfd10 60152ece
Call Trace:
 [<600c25f9>] ? copy_from_kernel_nofault+0x0/0x64
 [<601533da>] prepend_copy+0x1f/0x51
 [<601533bb>] ? prepend_copy+0x0/0x51
 [<60152ece>] prepend+0x60/0x67
 [<60153389>] prepend_name+0x1f/0x51
 [<6015336a>] ? prepend_name+0x0/0x51
 [<60152bbd>] prepend_path+0xb9/0x1d8
 [<6003cb91>] ? um_set_signals+0x0/0x3b
 [<60152e27>] d_path+0xce/0x115
 [<60186805>] proc_pid_readlink+0xa1/0x17d
 [<6012b192>] vfs_readlink+0xec/0xee
 [<60138930>] ? touch_atime+0x0/0x162
 [<60120351>] do_readlinkat+0xbe/0x13a
 [<6011f92b>] sys_readlinkat+0x10/0x14
 [<6002cabb>] handle_syscall+0x7b/0xaa
 [<6002ca40>] ? handle_syscall+0x0/0xaa
 [<6003f695>] userspace+0x289/0x4a5
 [<6002a8e3>] fork_handler+0x56/0x5d

> diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
> index cbe924a0fa87..8a2e68d07de6 100644
> --- a/arch/um/kernel/trap.c
> +++ b/arch/um/kernel/trap.c
> @@ -330,20 +330,20 @@ unsigned long segv(struct faultinfo fi, unsigned long ip, int is_user,
>  			panic("Failed to sync kernel TLBs: %d", err);
>  		goto out;
>  	}
> -	else if (current->mm == NULL) {
> -		if (current->pagefault_disabled) {
> -			if (!mc) {
> -				show_regs(container_of(regs, struct pt_regs, regs));
> -				panic("Segfault with pagefaults disabled but no mcontext");
> -			}
> -			if (!current->thread.segv_continue) {
> -				show_regs(container_of(regs, struct pt_regs, regs));
> -				panic("Segfault without recovery target");
> -			}
> -			mc_set_rip(mc, current->thread.segv_continue);
> -			current->thread.segv_continue = NULL;
> -			goto out;
> +	else if (current->pagefault_disabled) {
> +		if (!mc) {
> +			show_regs(container_of(regs, struct pt_regs, regs));
> +			panic("Segfault with pagefaults disabled but no mcontext");
>  		}
> +		if (!current->thread.segv_continue) {
> +			show_regs(container_of(regs, struct pt_regs, regs));
> +			panic("Segfault without recovery target");
> +		}
> +		mc_set_rip(mc, current->thread.segv_continue);
> +		current->thread.segv_continue = NULL;
> +		goto out;
> +	}
> +	else if (current->mm == NULL) {
>  		show_regs(container_of(regs, struct pt_regs, regs));
>  		panic("Segfault with no mm");
>  	}
