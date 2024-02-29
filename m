Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485942A8C;
	Thu, 29 Feb 2024 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709250832; cv=none; b=ChufQ5T127liqT/rjru8z5LqBHQxsqLzpzJKuOPcKQyotfncLWKC7A0RB4g8Gv/lVPa+bpkYr+yPkxmfWcKtpOm4aFk2pvNRBnH5d6KoJLiaqKPkIRJtj5fQ9WVpWeOhg27OH3d1nnguPh+6LWcQKjqaYTU5Cuy2+tKQbHz5Crw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709250832; c=relaxed/simple;
	bh=eHl8B1CMIHuSaQlPbbcBDyQ4UjfGLvJoMWAmDGjFEh8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heOUriTP390cUWRi7nWIJ1S5E4kiYKN5yf/v/b/0zr1d2OoOQDvfu+xQBjJi7YAs1TnXVJAwuRkVbq0UJozKtPhwE9xLqv6IAG9od5Fy+TnlCvbn16ISY8H6lAdXG+OD8qLO9vQqc6tCjvw7Hhy4InqXFL1jC5bIoHMMs2vjLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28593C433F1;
	Thu, 29 Feb 2024 23:53:51 +0000 (UTC)
Date: Thu, 29 Feb 2024 18:55:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against
 a string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240229185558.70b6ea86@gandalf.local.home>
In-Reply-To: <20240229234455.GA1020819@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
	<20240229180616.48d2c0eb@gandalf.local.home>
	<20240229234455.GA1020819@dev-arch.thelio-3990X>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Feb 2024 16:44:55 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> > I don't build with clang, does this quiet the warning?  
> 
> Unfortunately, it does not. I tested with LLVM 17.0.6 from kernel.org:
> 
> https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> If there is no other way to silence it, we could potentially use the
> diag infrastructure to silence it, I could look at that tomorrow.

Is it the exact same warning? I wonder if I make it into an if statement,
it would be better?

#define __assign_str(dst, src)						\
	do {								\
		char *__str__ = __get_str(dst);				\
		int __len__ = __get_dynamic_array_len(dst) - 1;		\
		if (__builtin_constant_p(src))				\
			WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
		else							\
			WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);\
		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
		       EVENT_NULL_STR, __len__);			\
		__str__[__len__] = '\0';				\
	} while (0)

Then the compiler may be better in optimizing out the "bad" portion.

-- Steve
