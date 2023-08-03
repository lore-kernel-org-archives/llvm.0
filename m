Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1AA24161;
	Thu,  3 Aug 2023 18:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3460C433C7;
	Thu,  3 Aug 2023 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691086831;
	bh=P8dowrEK0UclRupBuhUAOmRE24XQaoAE9Melikb2V6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFYHvbtYypVc+GKLHKEeKGaSiU9LR0Atnc1Mw8HXEBmQxDrA6R5DlLf2gUexl5ash
	 eSurQokkW4BjgIxSXHcPWcXu5R4wwchBnTwcvinhB4mxc+BYgCC3xvYq8Kn8V5tavp
	 L7W0AS9ZaUhUK+bTDNawzq7ld862NK5UKl8ttohY/sDYy2zDqsV26cxTpZy+w+L++l
	 sPd3enykeG4SPvngP57l2KkI0afaYwssHdf4QSELg+D6s5/vaty1emv8JieDLquhMe
	 dUE2sj3CUtNkp4VvqcgsbCz6u1HCpYpcyWms6+rJkNTh7rYgPyRC8XQ1hwkn2JH4L2
	 hWZB0Tx5d3dQQ==
Date: Thu, 3 Aug 2023 11:20:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>, "sashal@kernel.org" <sashal@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"tobin@kernel.org" <tobin@kernel.org>
Subject: Re: [stable:linux-4.19.y 5172/9999] lib/string.c:312:7: error:
 redefinition of 'stpcpy'
Message-ID: <20230803182029.GA1397709@dev-arch.thelio-3990X>
References: <202308021401.lhJd2bLx-lkp@intel.com>
 <20230802163841.GA2149436@dev-arch.thelio-3990X>
 <55fe2c8bfa678224d0ae1a568d1cb31906d50a05.camel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55fe2c8bfa678224d0ae1a568d1cb31906d50a05.camel@intel.com>

On Thu, Aug 03, 2023 at 04:03:46AM +0000, Liu, Yujie wrote:
> Hi Nathan,
> 
> On Wed, 2023-08-02 at 09:38 -0700, Nathan Chancellor wrote:
> > On Wed, Aug 02, 2023 at 02:37:36PM +0800, kernel test robot wrote:
> > > Hi Tobin,
> > > 
> > > First bad commit (maybe != root cause):
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> > > head:   767049cead76cf699707290d5aeefb3e4d0d5b43
> > > commit: 2a3687034e47c51cd4f01ce82ed16f1964008b9e [5172/9999] lib/string: Add strscpy_pad() function
> > > config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/config)
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202308021401.lhJd2bLx-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > > > lib/string.c:312:7: error: redefinition of 'stpcpy'
> > >    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
> > >          ^
> > >    lib/string.c:255:7: note: previous definition is here
> > >    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
> > >          ^
> > >    lib/string.c:318:1: error: redefinition of '__kstrtab_stpcpy'
> > >    EXPORT_SYMBOL(stpcpy);
> > >    ^
> > >    include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
> > >            __EXPORT_SYMBOL(sym, "")
> > >            ^
> > >    include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
> > >    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
> > >                            ^
> > >    include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
> > >            static const char __kstrtab_##sym[]                             \
> > >                              ^
> > >    <scratch space>:220:1: note: expanded from here
> > >    __kstrtab_stpcpy
> > >    ^
> > >    lib/string.c:261:1: note: previous definition is here
> > >    EXPORT_SYMBOL(stpcpy);
> > >    ^
> > >    include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
> > >            __EXPORT_SYMBOL(sym, "")
> > >            ^
> > >    include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
> > >    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
> > >                            ^
> > >    include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
> > >            static const char __kstrtab_##sym[]                             \
> > >                              ^
> > >    <scratch space>:202:1: note: expanded from here
> > >    __kstrtab_stpcpy
> > >    ^
> > >    2 errors generated.
> > 
> > This report/error makes no sense. At both the commit the robot bisected
> > to (2a3687034e47c51cd4f01ce82ed16f1964008b9e) and current linux-4.19.y,
> > there is only one definition of stpcpy()... Am I missing something here?
> 
> Sorry for this false alarm.
> 
> We were building some old mainline kernels and got a build error
> "ld.lld: error: undefined symbol: stpcpy", which was fixed by a later
> mainline commit 1e1b6d63d634 (lib/string.c: implement stpcpy). We
> amended the source code to include this stpcpy fix to pass the build
> for those old kernels, but made a mistake that also impacted stable
> tree which already backported it, and caused this wrong report of
> redefinition error. We will fix this bug ASAP.

No worries, I totally understand how that goes, as I have had to bisect
old versions with a newer compiler before, which results in several
patches that I need to apply to make things build... Thanks for the
quick response!

Cheers,
Nathan
