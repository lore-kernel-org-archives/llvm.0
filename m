Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA1E3876AB;
	Thu, 26 Feb 2026 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093313; cv=none; b=EPnSQN6PjBh7NwwaQbWp0X58qipVpxU3GUqWAU9OftXqx0u18J7xQuZI55xzvlGs4NcOpZ0rVfOx9zXyazv6dyl7zZWR4jRQGrH2mVG8wYWh52uQ199e/HPVnQwYXl8G9okJ88VbaYvxhNF4tyrCBhEUqbeIx3ZY7jqAS4JJ0nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093313; c=relaxed/simple;
	bh=FQ38PnvxBvNqj6c+N6hnt2sTlrdmHkSlsN9ES2WEBXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sY7EaqOC056m96FwRKylCYxpsm4DP44zezYPGyL+t6ASDu+xI43UXEpiwwDPBV0Zrdwv6IxnjB91prpP2R7KW8tCiFjoyMxa1uUB04HaxuDpmeCWZiyvtmqr576Aif0lExoGwt6aT+3KjHj9V+amUBvfRPOBtkSydZMLXh9vcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hWRuH/Km; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hWRuH/Km"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=zBXZdSq5j2hNRbZM5mYHlzpC/x3nG+kMnCf4g9KK/ik=; b=hWRuH/KmWRNJMNDBUDGPK1IrY6
	HABGuzPAxLwFBvUvmYeR17gvT6otnWGwRL13votQnZ205/jCaqy+Fag3wHTXr5HsymuBqBarB+mza
	hDpT5cfpAki0+otgLpJQ/gTRi6bmFvyiKmbLWbPTOoh6III5kZQikmxfxDVmKZNC6AsULZk5zFn+c
	DBZaJ46UVGhLs5mMTY6EX7PT09pZykFuMQ0vTVqT7YY8T657bc5Ox788WVVEnKHjV2makCEJZ3fDH
	0cNYdGqohUQI3VgSd0/jpWS/jef9Kr2ijC+uVMQ1KFiTdkpsfE17Fup1Mm4sFLBcUZmejmgwAY010
	JTWdJuug==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <sylvestre@debian.org>)
	id 1vvWPk-00BAQe-0O; Thu, 26 Feb 2026 08:08:04 +0000
Message-ID: <90105431-975c-44ca-85f6-c6b06e5b07a6@debian.org>
Date: Thu, 26 Feb 2026 09:08:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
To: Peter Zijlstra <peterz@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 pkg-llvm-team@lists.alioth.debian.org
References: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
 <20260225145228.GB1282955@noisy.programming.kicks-ass.net>
 <20260225185357.GA2755225@ax162>
 <MkIi2yaDV68gH2kALnJxRvmd-UcD1ghPQbW39HeuuHvZgsiCvcxdvCXJ5D8bCVNn1fKsqYOJpJc0nTIj-4sy0A==@protonmail.internalid>
 <20260225222305.GA582287@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Sylvestre Ledru <sylvestre@debian.org>
Autocrypt: addr=sylvestre@debian.org; keydata=
 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
In-Reply-To: <20260225222305.GA582287@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Debian-User: sylvestre

Hello,

Le 25/02/2026 à 23:23, Peter Zijlstra a écrit :
> On Wed, Feb 25, 2026 at 11:53:57AM -0700, Nathan Chancellor wrote:
>> On Wed, Feb 25, 2026 at 03:52:28PM +0100, Peter Zijlstra wrote:
>>> On Tue, Feb 24, 2026 at 04:16:30PM -0700, Nathan Chancellor wrote:
>>>> Using a prerelease version as a minimum supported version for
>>>> Peter, could you take this for a 7.0-rc?
>>> Yes, I can.
>> Thanks a lot!
>>
>>> I would however appreciate the Debian folks to quickly push an update
>>> to the clang-22/experimental package. Otherwise I can't run this fancy
>>> stuff myself no moar.
>>    https://packages.debian.org/experimental/clang-22
>>
>> claims that the experimental clang-22 package is at 22.1.0-rc3, so you
>> should be good.
> Ah indeed. Operator error; I forgot the -t experimental and apt claimed:
>
>    clang-22 is already the newest version (1:22~++20251023025710+3f47a7be1ae6-1~exp5).
>
> But now I am indeed at 22.1.0-rc3.
>
The stable release is now in sid:

https://tracker.debian.org/pkg/llvm-toolchain-22

Cheers,
Sylvestre


