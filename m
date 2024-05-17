Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E2E12F58F;
	Fri, 17 May 2024 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715964031; cv=none; b=HuB9/vjyn+CoT/HkQfP8MuE40jRVBvtmnksqI5uRxMzRNgp/l4L7mTWg8viV6uhPWS4ToZhqQMqqhV8MmG7i8YkYGq8q0e2OH6f6X8DD8chq7yz6WNSgGPrXXfrc3eRJ00pJgbLA9j1u0KQDNPHoL56hXn7UEdxKal4auHV1+No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715964031; c=relaxed/simple;
	bh=MpnJH7lXvg1Hyp4OFSGIGZ8fFF5JMG16MW9ZXR9kFE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrBflE9PBOPVWewcxoTBhPFr0sAtt2yyjskm/X+HB7++CkcorZSTHfbRGQoORd8R7vA1v9l1B2UwpoRGHgASWK12o1p0v7bTyIXQ5TG7BFl+r3MGEmo5S/vHib5IguL8oy2bgXrnALUUOH6bWLFS3cm9Bt+J22KIMbwZSqylh6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGatCEqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGatCEqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A26C2BD10;
	Fri, 17 May 2024 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715964031;
	bh=MpnJH7lXvg1Hyp4OFSGIGZ8fFF5JMG16MW9ZXR9kFE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGatCEqXEuQBzblyhw31ZukKidg34xgZKf6mMPwX3hP1l53RyhWvh+cHtbQekDm32
	 huZLMtSFC2hJw4VzJClpOwG0mX3oSGi0H5qibHEj7ivHYYFaAjnQBP/ChkDt5fS5mp
	 eEKq/PTFaWC2XRnKVJ3c8UsuTV+qlvLCa6sJfATDVD1FxNUCMOGVOr1jVlGD5snmni
	 N5nwckp/s/TmcVOUh8XfUMAd+zKzFg8cORkzRqztcSsY4ZB+BDgBMemJlmTDAKh6rI
	 dIY9kKwxlGeqnJ6C2WoL7fd8E8obZx9aKKgSV7t2yGu0DEXfJSVlKCVmVDHk37lT6L
	 OrCyOtBSQX4Rg==
Date: Fri, 17 May 2024 09:40:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: Re: [trace:probes/for-next 17/17] kernel/kprobes.c:1141:24: error: a
 function declaration without a prototype is deprecated in all versions of C
Message-ID: <20240517164028.GA3695607@thelio-3990X>
References: <202405170340.eyEMhYvc-lkp@intel.com>
 <87eda1pjl4.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eda1pjl4.fsf@oracle.com>

Hi Stephen,

On Thu, May 16, 2024 at 01:50:31PM -0700, Stephen Brennan wrote:
> kernel test robot <lkp@intel.com> writes:
> >>> kernel/kprobes.c:1141:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> >     1141 | void kprobe_ftrace_kill()
> >          |                        ^
> >          |                         void
> >    5 warnings and 1 error generated.
...
> I'm guessing that what's happening here is that Clang is categorizing
> the old-style declaration as a different function for which there was no
> prior declaration. When I add the "void" here, the clang error goes
> away.

I believe you are right.

> In any case, the warning is right, and I should have used the correct
> declaration here. The below patch will shut this up. If there's any
> possibility of improving the error message clang gives us here, it would
> be appreciated though.

I think Aaron Ballman, one of the clang code owners, commented on this
exact situation recently, in the larger context of addressing some of
the wording issues with this warning if I am understanding that issue
correctly:
https://github.com/llvm/llvm-project/issues/90596#issuecomment-2096081580

Cheers,
Nathan
