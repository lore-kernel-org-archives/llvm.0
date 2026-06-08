Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203723ACF1D;
	Mon,  8 Jun 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956010; cv=none; b=AvtZfziFfmiMqx+qGZw9UllT3YoHkfxkvr1nwY4ewBob0X4y5g98WGXczeLcZX2Ho8Sskbf+YF4bE9SdR0Oq6eA/zApy16J+x0jZxFqWNMFDWYAALxb35MIPqJWpiC9i35MScjN0ZrR7KTanLyDZw2vu+tsb9M8lJivBal+nAbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956010; c=relaxed/simple;
	bh=3bjPxrqKwEOuzsBWVHgsh3vwYwgXPNjOwV0NyqcBn/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsfui+bjiWXez/kuKqth2CTZMHClvA/B7w57Mttp9eDY9h+unCtTOd1DWaIkmI4wSNw18w1/pllfsClm6Bc4kJlknArYZyjOU1b17I9Yn/HhD31m6ISDAZzno12ApCXT8gW0zWu/p4IIck5zdv3IdzFqvWWs1BwlKxj439WyYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iL4SbJSV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iL4SbJSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3021F00893;
	Mon,  8 Jun 2026 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956008;
	bh=srVNVttQNEpPadV3x4J3hs3Ppt9fO7+1ro9IcbQQSfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iL4SbJSVwg61EbfNlh+bnFyUBqmUeR+9Kebg0utBFDBbwlEjKhP1erVOGfzLmHIJC
	 /K6nk0n6qAv13AWYDu90rMmY4jfQ0QBPWoHwkny7vOLnz2ntSkvmM1KO7+SeWCWkvU
	 1u27km9tq4O5rhe6QalgZAsYBHfNmk1Xm0XE+a3iQGDHblmZWdQfZIqKigSCeWGJEh
	 UP7No1PBABw29q7AC6QMUqib1Dp11eGJkY0o/nRnumIYHME17xNsU2BzUkvTFXpSYB
	 PZK8ffP0Y/8rmugSC+JFKY3tnK8X82i8QwMeXe0ekGy5KFX1J3nwXQQFrMMnCZNbQ0
	 0QLBMUQO0mLFA==
Date: Mon, 8 Jun 2026 15:00:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [brauner-github:vfs-7.2.misc 28/28]
 fs/smb/client/file.c:3237:23: warning: converting the result of '<<' to a
 boolean always evaluates to true
Message-ID: <20260608220004.GB2340474@ax162>
References: <202606080831.mf22xxxh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606080831.mf22xxxh-lkp@intel.com>

On Mon, Jun 08, 2026 at 08:49:58AM +0800, kernel test robot wrote:
> Hi Jori,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://github.com/brauner/linux.git vfs-7.2.misc
> head:   0da79c259ad0554b36761a7135d4f92eb7c46263
> commit: 0da79c259ad0554b36761a7135d4f92eb7c46263 [28/28] vfs: uapi: retire octal and hex numbers in favor of (1 << n) for O_ flags
> config: s390-randconfig-002 (https://download.01.org/0day-ci/archive/20260608/202606080831.mf22xxxh-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606080831.mf22xxxh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606080831.mf22xxxh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/smb/client/file.c:3237:23: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
>     3237 |                         break_lease(inode, O_WRONLY);
>          |                                            ^
>    include/uapi/asm-generic/fcntl.h:20:21: note: expanded from macro 'O_WRONLY'
>       20 | #define O_WRONLY        (1 << 0)
>          |                            ^
>    1 warning generated.

This should be resolved when

  https://lore.kernel.org/20260607-breakleasefix-v1-1-658dce536d15@kernel.org/

is applied.

-- 
Cheers,
Nathan
