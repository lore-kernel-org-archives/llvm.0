Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68A27453;
	Thu,  4 Dec 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856647; cv=none; b=Ngw55OeBqVwtcr74FBTFaARdobMAYe0tb6xcUpbF5JXS1TS3jCIw1CN4326nUi/fm9QRiBdUQSUbQaPFnGNvOHPRHqlwGJ1gkphkaj4PeBnWp4MKB09RKBpB2mWV2+SZSKLy0MkCCYDDOGqbihh/2fcOFHHCaMpfRh5lyC0Tieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856647; c=relaxed/simple;
	bh=aCJprhDQ14ctciYtDw+l9JzoxqaZhwa/OEk2icj/PVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRzO3c850f+wWKUl1hoylrBffbLEH4nelhyjAA8CLqVDs1dzTgtvGDkm5kNNdZjGJMAKqCnNtlR1hAA55wQBWaOU86hNOmdJBc6e6NJfgk0TsV/GD9rwUTpWyn3ke8+Lo7md4OyoKI5ClQ5tRHxs2tHKGXGYegwcS1LkOjHLRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l1xTwWrG; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l1xTwWrG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764856639; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=60z/geyFr3iyPIcOdTYFrnP2HLi0uj0xFDSeRjMgiwU=;
	b=l1xTwWrG1hhvKmxNAxddLmD20RKg0FnV4hnSJY0HwrgLL1Ji7EhBVa+4QzCfdSOapz2zr4807wkSVQZ2svdwqWCzAimKKlNzAZhStA0PEgMimSNc4l8yJ04BRBq0SIhz/csL1XZx+cq1K/JUgz6sDeZeoyp32uQb2T68SqRcoVM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wu4Zmgb_1764856636 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Dec 2025 21:57:17 +0800
Date: Thu, 4 Dec 2025 21:57:14 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 9966/13055] kernel/watchdog.c:74:22: warning:
 unused variable 'hardlockup_si_mask'
Message-ID: <aTGTOi5creA4v3AK@U-2FWC9VHC-2323.local>
References: <202512030920.NFKtekA7-lkp@intel.com>
 <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>

On Wed, Dec 03, 2025 at 02:44:53PM -0800, Andrew Morton wrote:
> On Wed, 3 Dec 2025 09:05:30 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   47b7b5e32bb7264b51b89186043e1ada4090b558
> > commit: a9af76a78760717361cccc884dc649e30db61c8b [9966/13055] watchdog: add sys_info sysctls to dump sys info on system lockup
> > config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
> >       74 | static unsigned long hardlockup_si_mask;
> >          |                      ^~~~~~~~~~~~~~~~~~
> >    1 warning generated.
> 
> I'm testing the appended patch but it needs checking please.
> 
> The comment for hardlockup_si_mask says
> 
>  * bitmask to control what kinds of system info to be printed when
>  * hard lockup is detected, it could be task, memory, lock etc.
>  * Refer include/linux/sys_info.h for detailed bit definition.
> 
> but the variable depends on "COUNTS_HRTIMER".  The comment doesn't
> mention hrtimers and I don't see why it should.  Not sure what's going
> on here.

Yes, it is a little weird. Logically the 'hardlockup_si_mask' should be
under the CONFIG_HARDLOCKUP_DETECTOR, which is what my original patch did.

I did a quick check, and there are 3 types of hardlockup detector:

	 HARDLOCKUP_DETECTOR_PERF
	 HARDLOCKUP_DETECTOR_BUDDY
	 HARDLOCKUP_DETECTOR_ARCH

IIUC, most archs will use the first 2 types, which will both select
HARDLOCKUP_DETECTOR_COUNTS_HRTIMER (lib/Kconfig.debug), which is kind of
a _proxy_ to select SOFTLOCKUP_DETECTOR which needs hrtimer for its
implementations.

And only very few arch may chose the 3rd architecture specific implementation,
which was in 0day bot's kernel config.

In arch/powerpc/Kconfig
	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI

In short, for most cases the hrtimer is used for soft/hard lockup detector.

Thanks,
Feng




