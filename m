Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34715AF1;
	Sat, 18 May 2024 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716043863; cv=none; b=HymTrBNMdSRFyXmNRbZuLWLghuIPXJJno1mz40LYHdrvHqTnCbvlbhAn6GXS/SKtcag4ntaMEwkNzO0zYiiPXK4oeDN/LR5O1JfqH5qXQyNFD2DJvCjXSfzZAaOupDzxAh1JlSY4ZHxRI1NgnKZcVysUZDCXs6iANtKmaaylyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716043863; c=relaxed/simple;
	bh=q5tPNws3AwDYs7kJHEm5atSYOH23N45nLi8bdhxydbM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rwaRPWlw4YB+2FpTi2D3HPrCXAm1IC/cO1DeoH7coUG5qcuOU7fqwTvL0rlemzAOMwezxxuCbgzq+xzRH86eJK7uWE/3bUAO6zsgm1By9tUdQmOY1pyPJH0vz6ywE0Co7VpmsFl/bqjk51Z/ARPhl7VMkaDLYpr8WNuA5QjbBec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qeoHYAmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qeoHYAmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927E9C113CC;
	Sat, 18 May 2024 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716043863;
	bh=q5tPNws3AwDYs7kJHEm5atSYOH23N45nLi8bdhxydbM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qeoHYAmq2CzcCKxH7WSJm8zlq81y5/+t9u3yI8MAYhBzxajNLCJdk9L74Ru9Y4G/m
	 yMuMMASgpAOGEwwQwugqLs8EaDpO9iwgu4TQwEveidaxuqRyI7EMfaR3mhWsllUsA5
	 LIWQRoRs0pdMxUTrGvk77Sqc/aMxPOTr0YMliYzKydJSo5YfNag7XwxdQa0+/fV3Gp
	 jzBdbs51arVzJlshG6ihh8QPhekPnSfDPPfEmZ07Nv9WjlQQpmHSwXpYNAj9g4ggeI
	 TGVPVUL763vFwkrtu+kNwlDF52KGx05XkWaAD57GWmDFmflXdGYnR1fuhAA1Iei3co
	 7RZXR3JkJVn2w==
Date: Sat, 18 May 2024 23:50:59 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: Re: [trace:probes/for-next 17/17] kernel/kprobes.c:1141:24: error:
 a function declaration without a prototype is deprecated in all versions of
 C
Message-Id: <20240518235059.3c3a0065a9980e8eb09f68b4@kernel.org>
In-Reply-To: <87eda1pjl4.fsf@oracle.com>
References: <202405170340.eyEMhYvc-lkp@intel.com>
	<87eda1pjl4.fsf@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 May 2024 13:50:31 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> kernel test robot <lkp@intel.com> writes:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
> > head:   1a7d0890dd4a502a202aaec792a6c04e6e049547
> > commit: 1a7d0890dd4a502a202aaec792a6c04e6e049547 [17/17] kprobe/ftrace: bail out if ftrace was killed
> > config: s390-defconfig (https://download.01.org/0day-ci/archive/20240517/202405170340.eyEMhYvc-lkp@intel.com/config)
> > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170340.eyEMhYvc-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405170340.eyEMhYvc-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from kernel/kprobes.c:23:
> >    In file included from include/linux/kprobes.h:28:
> >    In file included from include/linux/ftrace.h:13:
> >    In file included from include/linux/kallsyms.h:13:
> >    In file included from include/linux/mm.h:2210:
> >    include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >      508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >      509 |                            item];
> >          |                            ~~~~
> >    include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >      515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >      516 |                            NR_VM_NUMA_EVENT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >          |                               ~~~~~~~~~~~ ^ ~~~
> >    include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >      527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >      528 |                            NR_VM_NUMA_EVENT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >      536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >      537 |                            NR_VM_NUMA_EVENT_ITEMS +
> >          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/kprobes.c:1141:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> >     1141 | void kprobe_ftrace_kill()
> >          |                        ^
> >          |                         void
> >    5 warnings and 1 error generated.
> 
> This certainly reads as an error in my patch. I tried to carefully
> include three declarations:
> 
> 1. CONFIG_KPROBES && CONFIG_KPROBES_ON_FTRACE (the extern decl)
> 2. CONFIG_KPROBES && !CONFIG_KPROBES_ON_FTRACE (a static inline)
> 3. !CONFIG_KPROBES (a static inline)
> 
> To double check, I actually used an ifdef visualizer[1] (written by a
> coworker) and as far as I can see, I did this correctly...
> 
> When I pull probes/for-next and the 0day compiler configuration, I do
> reproduce the build error.
> 
> However, I'm not 100% confident that this is a real error. I ran the
> build with make V=1, and found the clang build command to build the
> kernel/kprobes.c command. I replaced the "-c -o kernel/kprobes.o" with
> "-E", so that I could simply browse the preprocessed source code. I cd
> into the build directory and do:
> 
> $extremely_long_clang_command ... -E $srcdir/kernel/kprobes.o \
>     | grep kprobe_ftrace_kill
> extern void kprobe_ftrace_kill(void);
> void kprobe_ftrace_kill()
> 
> ---
> 
> When I do a GCC cross compile (s390x-linux-gnu-gcc) using the same
> configuration file, with "W=1 V=1" I do see:
> 
> /home/stepbren/repos/linux-upstream/kernel/kprobes.c: In function ‘kprobe_ftrace_kill’:
> /home/stepbren/repos/linux-upstream/kernel/kprobes.c:1141:6: warning: old-style function definition [-Wold-style-definition]
>  1141 | void kprobe_ftrace_kill()
>       |      ^~~~~~~~~~~~~~~~~~
> 
> I'm guessing that what's happening here is that Clang is categorizing
> the old-style declaration as a different function for which there was no
> prior declaration. When I add the "void" here, the clang error goes
> away.
> 
> In any case, the warning is right, and I should have used the correct
> declaration here. The below patch will shut this up. If there's any
> possibility of improving the error message clang gives us here, it would
> be appreciated though.
> 
> Masami, would you like me to send this to the list, or do you just want
> to fix up the commit? My apologies for this, I should have run the "make
> W=1" prior to submission.

Sorry, that is my mistake to missed the issue. Linus alreay fixed the
error (I confirmed).
I also forgot to run W=1 build. Let me fix my process.

Thank you,

> 
> Thanks,
> Stephen
> 
> From 324849fd366b8d2d4367ed2cd6f74621099439e1 Mon Sep 17 00:00:00 2001
> From: Stephen Brennan <stephen.s.brennan@oracle.com>
> Date: Thu, 16 May 2024 13:48:32 -0700
> Subject: [PATCH] kprobes/ftrace: fix old-style function declaration
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  kernel/kprobes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 166ebf81dc450..4f917bdad1e11 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1138,7 +1138,7 @@ static int disarm_kprobe_ftrace(struct kprobe *p)
>                 ipmodify ? &kprobe_ipmodify_enabled : &kprobe_ftrace_enabled);
>  }
> 
> -void kprobe_ftrace_kill()
> +void kprobe_ftrace_kill(void)
>  {
>         kprobe_ftrace_disabled = true;
>  }
> --
> 2.43.0


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
