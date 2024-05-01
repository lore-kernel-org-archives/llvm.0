Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320F7F;
	Wed,  1 May 2024 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714546239; cv=none; b=EBxIAN/n8xW/Mp6jA7xLXv7cpWvfQlQIlJaE7E/vJlmaoe5aePCIWs+Zb0q3ckKSexKDIHm1visc7CkQg31iyxjhDqSvbK9GnE8VluJSomhaix3jM3hupc2hIwPovzoSjn5kAKBAwU5YSlo/bLeq3LdSMQ8gg0ozzq53x/dUogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714546239; c=relaxed/simple;
	bh=EBLsOp8i7ZfqayGZ/Gsp812mpw0d+W7wnYXPoz2MiMw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIwQl2nXjj/3LNJN6+gqguJvGoP1smE8U4fTL0Rr96C0kh7mYIGxJtyDg3obHikDsSCa46z0sviPj27vljR+H67uIyUX2/ci1U9y4eUUgwEtR4DD2QHQpilKhffrON6uxkiViKogq5hqIq2QunFbxpeAMuFmshjgdQ6hLUSJCeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j6M2fiZp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j6M2fiZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D588AC113CC;
	Wed,  1 May 2024 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714546239;
	bh=EBLsOp8i7ZfqayGZ/Gsp812mpw0d+W7wnYXPoz2MiMw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=j6M2fiZpONXQJ+fkdUhxrgC76XCS3vFfeFn26IWFk4Ym+6fTnhqWaXjn9/IJQ8TIH
	 4ge4lsY8IcVM/9n+f0PPBFJXEde/JtVRkHRhFiLqG5reMObG0pbonV3XxPSzl9G/wn
	 KeAZv63PpKx4tyn9JinQM/Bl4wjEChXBlJBBWewA=
Date: Wed, 1 May 2024 08:50:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>,
	Norihiko Hama <Norihiko.Hama@alpsalpine.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [usb:usb-testing 17/35] drivers/usb/storage/usb.c:141:21: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <2024050141-remote-mockup-f933@gregkh>
References: <202405011431.PvaZHpRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405011431.PvaZHpRK-lkp@intel.com>

On Wed, May 01, 2024 at 02:32:56PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   ac6a205c5bef39d65ecd9f5dd2c1d75652c35405
> commit: 70d66b8e47e6fa031f541291e9dd3d7f0c44b41e [17/35] usb-storage: Optimize scan delay more precisely

I'm going to drop this commit from my tree now.

But really, it feels odd to have this parsing logic in a random driver
for something like handling floating point numbers "properly" from
userspace.  Why isn't this in the core kernel somewhere?  And, as that
was a rhetorical question, the answer is we probably shouldn't be
handling floating point number parsing in the kernel...

I understand the quest for handling error time outs "faster" when you
assume that you know that the error will never happen, but what's the
odds that it will end up happening...

there has to be a better way to do this.

thanks,

greg k-h
