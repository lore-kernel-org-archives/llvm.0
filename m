Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9186F523;
	Fri,  1 Mar 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307946; cv=none; b=RVh7F+b8KczcNgk9MZ6Q6lWhnLRvXhC4HMxpttWHb90qGaXdZSb9BE+gZNoIJEpIFDeUYnp9lMhpSD+La/yxD1CZZP2oG8RNUrL45zA7kJhq75GVAe0yxmQbzcpyDlUBOD2r6IkKOLhlbIAXvXGKKShoZzNoiu8YtN9O2nryx4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307946; c=relaxed/simple;
	bh=OXX/VyXUZcqNFfjQkG2rgLucQBvbDsqFanqroRvImgc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVahDlLzUw0YCRd4lEHL1vPFJQwqSt5606l7jI/a4Ke8tgHQi53psSuV88wyA5L0+G45DQZul1UprrOkx7M32urJJc6dwlUODehXs4Mj8eRS9+XmABtJP0hyhGQMqFW9f2aPnskzr11jNSJXZQ8rIG0tEX8ljllR7rkpgqGo+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195BAC433C7;
	Fri,  1 Mar 2024 15:45:44 +0000 (UTC)
Date: Fri, 1 Mar 2024 10:47:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against
 a string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240301104753.7ca87282@gandalf.local.home>
In-Reply-To: <20240301041131.GB577965@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
	<20240229180616.48d2c0eb@gandalf.local.home>
	<20240229234455.GA1020819@dev-arch.thelio-3990X>
	<20240229185558.70b6ea86@gandalf.local.home>
	<20240301041131.GB577965@dev-arch.thelio-3990X>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Feb 2024 21:11:31 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> > #define __assign_str(dst, src)						\
> > 	do {								\
> > 		char *__str__ = __get_str(dst);				\
> > 		int __len__ = __get_dynamic_array_len(dst) - 1;		\
> > 		if (__builtin_constant_p(src))				\
> > 			WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
> > 		else							\
> > 			WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);\
> > 		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
> > 		       EVENT_NULL_STR, __len__);			\
> > 		__str__[__len__] = '\0';				\
> > 	} while (0)
> > 
> > Then the compiler may be better in optimizing out the "bad" portion.  
> 
> No, that does not work either, I diffed the warnings and they are
> identical minus line numbers. I don't think clang takes
> __builtin_constant_p() into account in the front end but I could be
> wrong. In fact, I think clang (and even gcc sometimes) will still warn
> for code even if it is within an 'if (0)' block, it's been used as
> justification before in commit 37b47298ab86 ("sched: Disable
> -Wunused-but-set-variable").

Hmm, well, the original warning was indeed a bug, but I think that the
__builtin_constant_p() should be the fix. So clang helped in finding the
bug, but is being stupid about allowing the solution (unless it thinks
"some-string" is not a constant?).

I'll add the patch regardless and even keep the reported by. But I'll
replace the "closes" link with just "link" as it's not technically closed.

-- Steve
