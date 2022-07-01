Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717D3C1E
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 16:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137EC3411E;
	Fri,  1 Jul 2022 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656692874;
	bh=CfrRwJeGcqujZMKzXtTS5dmHXhzhyLZ2PysUxfIWMb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJ1PXtBex6m8EajNJwd7sY7UdPUKfnHO+rmOkoVaIN7EXb3ZoOS1mys+vRewtoQ+K
	 CTmgdKIDT45a+ugRneNynFUu3e0aTfcgMBfF4LzPFUhkoGY+2bNvgBbi3RuECusKrG
	 jXKOdi6w3Q5CAY24ZqrSqWCKQsSOOZ+ncTgkDgtcI9LSZHi5a4tNbZ/6pNtBTLvVlV
	 PqQ2es7Irzl+DW8umFoLlPxga1U02DWVfzTU0Z/WfvAsc2XMvSb2JnlwrWhN91OvYU
	 AF1FP/XlGt+YyOPkAgIH9PLWb0I9edASU/zexnWUlv14T87mt8pDU55eJB9iEneWZh
	 OT5gVq5eSlqhg==
Date: Fri, 1 Jul 2022 09:27:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [char-misc:char-misc-linus 3/3]
 drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <Yr8giNcxMQyxx+KZ@dev-arch.thelio-3990X>
References: <202207011658.rHJFVLWA-lkp@intel.com>
 <Yr63Zyvj49o8U/ti@kroah.com>
 <67a09516-ec1f-d0b6-c027-fd52159318ed@linuxfoundation.org>
 <Yr8VIT2vjvGYrbmR@dev-arch.thelio-3990X>
 <1c13496a-9e45-38b6-1563-c09d412cf576@linuxfoundation.org>
 <6e148c41-4a31-f173-f5ea-d52e115c268c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e148c41-4a31-f173-f5ea-d52e115c268c@linuxfoundation.org>

On Fri, Jul 01, 2022 at 10:09:45AM -0600, Shuah Khan wrote:
> On 7/1/22 9:52 AM, Shuah Khan wrote:
> > On 7/1/22 9:39 AM, Nathan Chancellor wrote:
> > > On Fri, Jul 01, 2022 at 08:48:11AM -0600, Shuah Khan wrote:
> > > > On 7/1/22 2:59 AM, Greg Kroah-Hartman wrote:
> 
> > > > > > All warnings (new ones prefixed by >>):
> > > > > > 
> > > > > > > > drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> > > > > >              if (!ucr->rsp_buf)
> > > > > >                  ^~~~~~~~~~~~~
> > > > > >      drivers/misc/cardreader/rtsx_usb.c:678:9: note: uninitialized use occurs here
> > > > > >              return ret;
> > > > > >                     ^~~
> > > > > >      drivers/misc/cardreader/rtsx_usb.c:639:2: note: remove the 'if' if its condition is always false
> > > > > >              if (!ucr->rsp_buf)
> > > > > >              ^~~~~~~~~~~~~~~~~~
> > > > > >      drivers/misc/cardreader/rtsx_usb.c:622:9: note: initialize the variable 'ret' to silence this warning
> > > > > >              int ret;
> > > > > >                     ^
> > > > > >                      = 0
> > > > > >      1 warning generated.
> > > > > 
> > > > > Odd, gcc doesn't show this for me.  Shuah, can you send a follow-on
> > > > > patch to fix this?  The warning does look correct.
> > > > > 
> > > > 
> > > > gcc didn't complain when I compiled either. I will send a follow-on patch.
> > > 
> > > Unfortunately, GCC won't warn for most uninitialized variables by
> > > default after 5.7, which included commit 78a5255ffb6a ("Stop the ad-hoc
> > > games with -Wno-maybe-initialized"). They will potentially show up at
> > > W=2 or with an explicit KCFLAGS=-Wmaybe-uninitialized (it does in this
> > > case):
> > > 
> > 
> > Thank you.
> > 
> > > | drivers/misc/cardreader/rtsx_usb.c: In function ‘rtsx_usb_probe’:
> > > | drivers/misc/cardreader/rtsx_usb.c:678:16: error: ‘ret’ may be used uninitialized [-Werror=maybe-uninitialized]
> > > |   678 |         return ret;
> > > |       |                ^~~
> > > | drivers/misc/cardreader/rtsx_usb.c:622:13: note: ‘ret’ was declared here
> > > |   622 |         int ret;
> > > |       |             ^~~
> > > | cc1: all warnings being treated as errors
> > > 
> > 
> > This is a bug and a good find. ret should have been set
> > in the if (!ucr->rsp_buf) before going to error handling.
> > 
> > I wonder if it would have been flagged if ret were to be
> > initialized to 0. Something to experiment.
> > 
> 
> I had to try. As I suspected initializing ret will mask this bug.
> 
> KCFLAGS=-Wmaybe-uninitialized will not flag it even though
> the bug still exists. It will return 0 w hen memory allocation
> fails.

Right, if the variable is unconditonally initialized at the top of the
function, it can never be flagged as uninitialized but that doesn't mean
the value is correct for every branch within the function.

> Initializing isn't always the right answer for these kinds of
> warnings.

I would say "unconditional initialization", as ret has to be initialized
somewhere to fix this warning, right? If you are referring to clang's
'ret = 0' suggestion, I agree that it can be misleading (especially in
the case of suggesting initializing dereferenced pointers to NULL...,
see [1]) but at the end of the day, it is still on the programmer to
analyze their code fully in light of the warning before implementing a
fix. Clang cannot know that the return code should be set in the if
statement rather than at the top of the function.

[1]: https://github.com/llvm/llvm-project/issues/51901

Cheers,
Nathan
