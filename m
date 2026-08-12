Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9E440A2D
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540475; cv=none; b=YpMxA6uaVvIRHJDSpgfRyE6RGkU0mBoH/sKT92szz8kZiw1Qbj4aZqNKZPwRq2L7es39XKmCJ3basm9fuPqM/haQ3xHdT6WgI2e3Mu+FayrpASmd11SBw+U2Z95g2/Xyetz1EyuTtHEJH8n8nhouruU1mBQUYlaXG3NwcOxZJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540475; c=relaxed/simple;
	bh=7NbnZ3oa/RtGinQgKVF9pKDMVERXfqX9/LOk9QyatAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3KMnYmBnrDxFvlorQpXUO2dIuMrBiH2cxCcKgv9j6KHKyTBTDNbiUAYhhR0pQsnUtXsgYtdhkaMOz7dbXpLe86QEh6j0RW+4y+FnClv86sV33DVSLgdPRCkg3YbzXy+HcuFICnMHIgiciMp8jinzUPcy3TnK/2kbCMQI0C7rPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JxzODKxl; arc=none smtp.client-ip=91.218.175.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JxzODKxl"
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7NbnZ3oa/RtGinQgKVF9pKDMVERXfqX9/LOk9QyatAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786540471; v=1; x=1787145271;
 b=JxzODKxljgM9jI5XGu4jQTRMrXavpNnvMnx3HqoguuMG/a1HhEIxFNUMGIyOmr5gJfzsA/o5
 Vr8zXF4C7nvnenuo1PYS3kFhmxvYzeYnohcL0iuc+hLPzsZm/X5+gAsFyU2YSDQYkfbPQ7ePbPw
 gy+nJuWzIJnAiZb7X4IOGGPI=
X-Envelope-To: llvm@lists.linux.dev
Received: from linux.dev (54.71.19.239)
	by smtp.migadu.com with ESMTPS id ee06e5b49e57f9a5;
	Wed, 12 Aug 2026 13:13:26 +0000
Date: Wed, 12 Aug 2026 13:13:12 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <anxxPkqbVgnikp6R@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
 <amjnf5gz0xP5PTSB@J2N7QTR9R3>
 <amn7cBQ-cqs2XlKV@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amn7cBQ-cqs2XlKV@linux.dev>

On Wed, Jul 29, 2026 at 02:02:52PM +0000, Jose Fernandez (Anthropic) wrote:
> One idea I would like your opinion on is an in-range
> allocation preference for BPF trampolines, since execmem seems to
> have the shape for it on arm64 already.
[...]

Hi Mark,

Quick update on this, also for the others on the thread waiting on
the perf side. After some internal discussion we decided to try
adding CALL_OPS support on kCFI kernels directly, instead of the
in-range allocation above. The section argument Sami added to
-fpatchable-function-entry in clang 21 turns out to be enough to do
it with kernel changes only. We have it working as a local series and
I plan to send it as an RFC in the next couple of weeks. Mentioning
it now in case you are already looking at this or have thoughts
before then.

Thanks,
Jose
