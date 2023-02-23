Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FD28EF;
	Thu, 23 Feb 2023 14:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D62C433D2;
	Thu, 23 Feb 2023 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677161681;
	bh=U424HFE2d9+blKr+2QZgF0GS4aFZVKNHKUFchfOFvzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YA96T9m5qRIiZqUb/tb+ln+dVRbemOlI2bp9Rya7CdvodphnCJBVE3xurCyBoVu7X
	 umWxdxUdDZ1vA/JM/0BAaLLGtCFgQc2w+qog/S6qma0PtL2OzW3xu7fBoeCnBilJuf
	 cdE7MFtSyKmb78+6NO+oatXRfgcchZF/jWXA1qwg=
Date: Thu, 23 Feb 2023 15:14:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: kernel test robot <lkp@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.4 15/15]
 kernel/bpf/core.c:1570:3: error: implicit declaration of function
 'barrier_nospec'
Message-ID: <Y/d0zwDQmCJ33SFu@kroah.com>
References: <202302232136.AWzwjCvb-lkp@intel.com>
 <Y/duzncICkBE4wSe@biznet-home.integral.gnuweeb.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/duzncICkBE4wSe@biznet-home.integral.gnuweeb.org>

On Thu, Feb 23, 2023 at 08:49:02PM +0700, Ammar Faizi wrote:
> On Thu, Feb 23, 2023 at 09:31:08PM +0800, kernel test robot wrote:
> > tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.4
> > commit: 3bb990ea37595b41a1f06a551e5dd35372ea404a [15/15] uaccess: Add speculation barrier to copy_from_user()
> ...
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302232136.AWzwjCvb-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> kernel/bpf/core.c:1570:3: error: implicit declaration of function 'barrier_nospec' [-Werror,-Wimplicit-function-declaration]
> >                    barrier_nospec();
> >                    ^
> >    1 error generated.
> 
> It's missing #include <linux/nospec.h>. The fix for this is:
> 
> Upstream f3dd0c53370e70c0f9b7e931bbec12916f3bb8cc ("bpf: add missing header file include")
> 
> That one needs to get backported too. Or just fold that in to maintain
> the bisectability (for stable kernels).

Thanks, now queued up, I missed that follow-on patch.

greg k-h
