Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6648BD51
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859129; cv=none; b=SQhCh3CLTUtnbBuiOZBroZi1uDCTl1c0Kyc83lq2So3Nq52SHCRKDiKxCjnCnNavd6A4bFlc+m5rbzZ1hMgXiPxdz8IDPDygGORqQ90/hTfBzyggd70sdDJvrL2dCUBHAFrWB/ME4tDhrE6kSAOMR/nqi3A0SGvdeA9X4NXGl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859129; c=relaxed/simple;
	bh=hi3lp0E2aSUN+zJyHwhZ8vbO5xY8PwjZrHRwNIbvsY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkRn01QTnC4132x8gja5W1PKjLl6KJKmWz5vhGgSQ0PCWBmn4AS4VhtXmjIhWHM0+CSp9B08nEeEFpNZwrTqIcC2oqbh2bYUcU8W62ELsXSm+aUejWrGgsaEW1/lGzVdtaGQqTR/7/XsndsrTOj5wWozY6fomyR9s4iTldxBQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=zDH5+Xh8; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="zDH5+Xh8"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gHB5M48yTz1XM6Jl;
	Fri, 15 May 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1778859122; x=1781451123; bh=B72l22WnGcl/1t0rqH+UDWbg
	QgRqSMV2ncCh79OadAw=; b=zDH5+Xh8Upgn1HldX/zmZ4rjxXuNIkmJJDQhc/QY
	ddnerBPlOrTcuCQPttio1RSw2ff9nSO0QUllPrnEP5vKgZAk1g0OGO1qbzyM8tB3
	YPom0nLS1S6FqbZb8B81h84/5ylp1mEAtCC2pSy0h4gGjQHubbeU9vBPoe5b1OFh
	OfSaxQKJLwWE7HcA3n+zLMDCDzD/pCQWKeAfFsHBAGtqJSFD6HyGR6B5PuqC2Yqh
	o8K7raKOE52wvrXp8F1PsWtxwoP578voyJiG96wq1AjMrkDSbiQHTcRV9AB/xMPx
	zJIG+gNvUdYwj6c1yuaUNFPPJlLb8j3fkp98GxR8RXRQdQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xgjhlCQ6PjK9; Fri, 15 May 2026 15:32:02 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gHB5C1pDsz1XM5kt;
	Fri, 15 May 2026 15:31:58 +0000 (UTC)
Message-ID: <1ed5f5ca-7176-4003-be14-40d2608ffeb5@acm.org>
Date: Fri, 15 May 2026 08:31:58 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tip/locking/core v3] compiler-context-analysis: Bump
 required Clang version to 23
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260515124426.2227783-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260515124426.2227783-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 5:43 AM, Marco Elver wrote:
> Clang 23 introduces several major improvements:
> 
> 1. Support for multiple arguments in the `guarded_by` and
>     `pt_guarded_by` attributes [1]. This allows defining variables
>     protected by multiple context locks, where read access requires
>     holding at least one lock (shared or exclusive), and write access
>     requires holding all of them exclusively.
> 
> 2. Function pointer support [2]. We can now add attributes to function
>     pointers just like we do on normal functions.
> 
> 3. A fix to use arrays of locks [3]. Each index is now correctly treated
>     as a separate lock instance.
> 
> 4. A fix for implicit member access in attributes [4]. This allows to
>     use __guarded_by(&foo->lock) correctly.
> 
> Overall that makes it worthwhile bumping the compiler version instead of
> trying to make both Clang 22 and later work while supporting these new
> features.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
