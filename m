Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208574E1D9;
	Fri,  1 Mar 2024 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709319416; cv=none; b=rUrlPjezmkX93xeCc3pQsQK4E5I8A4AnjeZBAJYS3/16h7pc3s19J9CDb9Do9+X4yf4iygnbRJAl0CWQ6jehU17xTIhEUSGo12aDkDg2DyAhMBP3DWUdiA2A7PDFgz5kbdbOXOywXJLTQ0cYWbKZfzW4jpoYCAFPdQu8nmuqoSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709319416; c=relaxed/simple;
	bh=ixWIf3mGntb55Uaoc3hoSC7H2H1Sly8VgKfMorZCa94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AktyOdIW4VUp4JSIDQSsGTTJOaC2yV45318fntHN396yKKnZ09QShF/hSSXPiLiKw2c6c1qwGytT63IPO3/MaGcBrwTAummS15NJI82u7xeow/c92d3Toz1cP/1rSnf2Ggt7HQo+WdhGiLDEvu2v9jtxufgfAu1KFDvqaxcc4pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D4EC43390;
	Fri,  1 Mar 2024 18:56:54 +0000 (UTC)
Date: Fri, 1 Mar 2024 13:59:03 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>,
 vaclav.zindulka@tlapnet.cz, Jamal Hadi Salim  <jhs@mojatatu.com>, Jiri 
 Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against
 a string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240301135903.543c7947@gandalf.local.home>
In-Reply-To: <20240301184620.GA150304@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
	<20240229180616.48d2c0eb@gandalf.local.home>
	<20240229234455.GA1020819@dev-arch.thelio-3990X>
	<20240229185558.70b6ea86@gandalf.local.home>
	<20240301041131.GB577965@dev-arch.thelio-3990X>
	<20240301104753.7ca87282@gandalf.local.home>
	<20240301184620.GA150304@dev-arch.thelio-3990X>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Mar 2024 11:46:20 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> However, your suggested change appears to cause
> -Wincompatible-pointer-types when building that configuration fully,
> although it seems to be the inverse problem as above, so maybe the same
> __diag macros can be used to shut it up as well.

It should not be quieted.

> 
>   In file included from net/core/net-traces.c:37:
>   In file included from include/trace/events/qdisc.h:153:
>   In file included from include/trace/define_trace.h:102:
>   In file included from include/trace/trace_events.h:419:
>   include/trace/events/qdisc.h:116:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
>     102 |                 __string(       dev,            qdisc_dev(q)    )

Yes, and that's a real bug which I also hit and reported:

  https://lore.kernel.org/all/20240229140513.72b2795a@gandalf.local.home/

And posted a patch for:

  https://lore.kernel.org/all/20240229143432.273b4871@gandalf.local.home/

And I'll need to apply that before I can make this fix.

Thanks,

-- Steve
