Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C942EEDA;
	Mon,  3 Aug 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781381; cv=none; b=FMZWapJb4+Wy+ZQOT2HwrSto4L/Wpl+MBdIhWdNKQwGS0XbS+uKGkVbv7Cx7AcMTGE7YsqdiraBgm3fUIHRScp9kfCMmZ7219QqtTeyqOcNEa2XHmi0UMbft/IB6rO8MMh7SoEvDsIE3TzKAjKrUzvauE1Goo5GD7ziG9zRqNUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781381; c=relaxed/simple;
	bh=QgQIzuXIMtFauEuo/gKRRtQ3UOZuxeRRJTqv9Kg24b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM2Ae95dFBD7BemITlYa6/fNF/k4O2Ax5O0UaYqJ6JVo4M8E7yNaBPG/OJRg0vF8i9sqjYqDo+waUSI8nSvC7cylgpBAD4njKkE8SAtSHnYwwtKO8ZTlaOMlEx0BCsKo/jFV8uORd4c2Y0hGf3bDwrpfHkNU5S5nzOlmwsCahw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7Zee/Mx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7Zee/Mx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946B11F000E9;
	Mon,  3 Aug 2026 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781379;
	bh=MpH62FMFtWUxRfc3axL/EWkSaCRGMx2miOZKjiP1hxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k7Zee/MxHzLWUTss9GKG+pbzKLIwtX8fAkHQ7bqeOrhMLjo9PR3khRQJ/tXXr+UHC
	 2z6O8JtxCh8EkUK62MyK10oQbaoVWi+Jduul4P4nzBS1osrbduvjWm22FwsJZxnNnh
	 +gSL1ucabzOLZTU6e18UG2d/Lq0oxKebJN1/znoVMczAMHmbJF0TSiYNixS2fz4Qdd
	 AVhm859dRTDKksUgxx9qa9FwaCceL6qUQa41jb8/gFT+4rYqFDy4jmcMcGTqGYf7YR
	 1wGiO3E/pXEjDeYy3eB7Iw8a86yY05o+FfCQfADdm5Jps3aOjn/edbNir5I1rKqnoZ
	 i7LN/twwZtpLQ==
Date: Mon, 3 Aug 2026 11:22:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Rohit Thapliyal <r.thapliyal@samsung.com>, ndesaulniers@google.com,
	ardb@kernel.org
Subject: Re: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for
 unwinding
Message-ID: <20260803182255.GC1067866@ax162>
References: <CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>

Hi Maninder,

On Wed, Jul 29, 2026 at 09:11:01AM +0530, Maninder Singh wrote:
> Ping! Any comments?

I am not that familiar with this code but maybe Nick (whose address I
have now updated to point to a better one) or Ard could help take a
look? Original patch is at

  https://lore.kernel.org/20260624054916.1571701-1-maninder1.s@samsung.com/

but I have left it inline as well.

> > show_stack() can be called for any task, however c_backtrace always unwinds
> > frames based on the "sp" register. This results in printing the backtrace of
> > the current task instead of the target task.
> > 
> > Try with normal TC:
> > ==================
> >        for_each_process(p) {
> >                sched_show_task(p);
> >        }
> > 
> > [7.433271] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
> > [7.433633] Call trace:
> > [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_stack+0x14/0x18)
> > ..
> > [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminfo_proc_show+0x6c/0x930)
> > [7.434019]  r5:8158e300 r4:8b4882d0
> > [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_read_iter+0x148/0x4bc)
> > [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg_read_iter+0xb8/0xc4)
> > [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (copy_splice_read+0x228/0x308)
> > 
> > It should unwind frame based on passed "fp".
> > (CONFIG_UNWINDER_FRAME_POINTER=y)
> > 
> > With fix:
> > =========
> > [13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2     ppid:0      task_flags:0x208040 flags:0x00000000
> > [13.934165] Call trace:
> > [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x208)
> > [13.934654]  r10:8100bbf0 r4:8116f440
> > [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14/0x28)
> > [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
> > 
> > Additionally, the extra manipulation of "sp" register appears unnecessary in the "current"
> > task also since the "fp" register is already provided.
> > 
> > Signed-off-by: Onkarnath 
> > Signed-off-by: Maninder Singh 
> > ---
> >  arch/arm/lib/backtrace-clang.S | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> > index 290c52a60fc6..993410a6afd1 100644
> > --- a/arch/arm/lib/backtrace-clang.S
> > +++ b/arch/arm/lib/backtrace-clang.S
> > @@ -105,10 +105,6 @@ ENDPROC(c_backtrace)
> >  		moveq	mask, #0xfc000003
> >  		movne	mask, #0		@ mask for 32-bit
> >  
> > -/*
> > - * Switches the current frame to be the frame for dump_stack.
> > - */
> > -		add	frame, sp, #24		@ switch to false frame
> >  for_each_frame:	tst	frame, mask		@ Check for address exceptions
> >  		bne	no_frame
> >  
> > -- 
> > 2.34.1
> 
> 
> 

-- 
Cheers,
Nathan
