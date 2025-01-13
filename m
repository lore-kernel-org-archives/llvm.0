Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796341F866F;
	Mon, 13 Jan 2025 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812718; cv=none; b=bEJfuVmFnu5gnxGGXw+iBuYJjpMySSpTJ5lqSIwXfxbOpQQAifl2MZ0G7Sd9FZJkyclroEC/GAeajpFXsTxIMTr0MG+iJEnPqpMOAhzYJacJAQtm+6BGrUj5NbF05hWlL1KnGTdGEBaM4P92Hq0mKAAlt6fhCzjUAbV/FQneYtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812718; c=relaxed/simple;
	bh=UO1gi2oS/JXrFx4apuxKv2m/7hFZDVzyl0sSwK+BzNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpYS0AaIKHaoHVK7LkLmuafZvbImn1VI/OY2JxvRCjlGn5cbXyQeBecYbzdA23zy6MmiBIUSqfGqgoFn5ggG1DLs1PD6kYEABD3IrGN7IBqNT5h/EKDaBYqNNYShlCmUQ6AxxrQS42iKKIFjT2jSRMKAGcSoG05EJHhysd1sCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRP6xrmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRP6xrmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9D5C4CED6;
	Mon, 13 Jan 2025 23:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736812718;
	bh=UO1gi2oS/JXrFx4apuxKv2m/7hFZDVzyl0sSwK+BzNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRP6xrmqgtJNZq9dv4NIwjfyltXzm49Y9Z4nir5jE5yNV09qN7FJAsHK2nhU84nyY
	 BuXSxAT4/h8AHvpJl+l7kLbZ+rO/0MEjiDKBC/nfkH5nIlBjhRLsIWi9pEgGykcB4i
	 oDZf3YGTKdLp2QPJRF0FMEtnAQcvTnmKHX460k1dUtt/w3lq2mwDXuyRSXjLthTVVF
	 MBDwSU0x9AQszoHA8Nyub3UKHpTQBQ7vaD6lib+6FZv2770xjDGFIXuNf0bjDXy0i+
	 oIvAVHQohLYNToaAtoe79JnLTv4qI4lP0aISKQCZyRmgSWw4ogYt+eaBs6DTOUGa5g
	 1O3v/1ihT7how==
Date: Mon, 13 Jan 2025 15:58:35 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Klaus Kusche <klaus.kusche@computerix.info>,
	Nathan Chancellor <nathan@kernel.org>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: "Bad or missing .orc_unwind table. Disabling unwinder." Clang 19
 problem? 6.12.8 problem?
Message-ID: <20250113235835.vqgvb7cdspksy5dn@jpoimboe>
References: <b248a0fb-e182-42e3-abf5-83945ee992f6@computerix.info>
 <20250113214122.g4lluwpzj3tnamx3@jpoimboe>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113214122.g4lluwpzj3tnamx3@jpoimboe>

On Mon, Jan 13, 2025 at 01:41:24PM -0800, Josh Poimboeuf wrote:
> On Mon, Jan 13, 2025 at 06:29:10PM +0100, Klaus Kusche wrote:
> > 
> > Hello,
> > 
> > I've submitted a bug report to kernel bugzilla,
> > but it was closed with a hint that I should contact
> > the maintainers and LKML.
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=219685
> > 
> > You are listed as the maintainers for x86 stack unwinding.
> > Any ideas about that problem before I submit it to LKML?
> > 
> > Is it possibly related to 
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=219686
> > 
> > which appeared at the same time?
> > Should it go to the clang maintainers?
> 
> Hi Klaus,
> 
> Thanks for reporting it.  Indeed it's probably related to the build
> warning:
> 
>   vmlinux.o: warning: objtool: start_unlink_intr+0xb7: can't find switch jump table
> 
> It's probably a kernel bug, possibly triggered by the new compiler.
> I'll see if I can recreate.

[adding some folks]

Nathan, I think this is a Clang 19 issue, where one of the jump table
entries is pointing past the end of the function.  When we saw this in
the past I think it was due to some leftover optimization, where the
jump table entry ended up unused so it was harmless.  Are you aware of
any recent bugs in that area?

Maybe objtool should just ignore such entries?

-- 
Josh
