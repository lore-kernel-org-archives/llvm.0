Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C901917E4;
	Mon,  9 Dec 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769502; cv=none; b=kN5ioK3c6GEIAi/BzmaUZjeTxZRW5SjDWhNi1V5s0P2xX7yl/LM2jqSWnseTrTWj2qdMybHi++aYUYbj6/ElN9A5ciycB9hLmK/0IU9157hsmvsRC8Xy3D5jOc7FUxQOsLDVv7MZpJZ6+OqDNOG9eDX4LuJN0ASeJGoRphzo47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769502; c=relaxed/simple;
	bh=BbA4t37gNDuPaVp+phA5si3yZnk3BtKkyG3dbN7F6lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgTB8+I6QMTUJaQRnWzx+LI6cFjiTUEArl1fiN2+/JAUNVWVwdD0pH6mKuBE0XONIyRSNmRtM9Ta+8FEmgFMIHWutMwQE2YeeKwiCxlniKp8PibX5+sXdYiRYtBVrJEWu1yKVaWxjusaYb3ubZnPjpODHcnYSmBajSbxB1Tee+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEQXEGrr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEQXEGrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8216BC4CEDF;
	Mon,  9 Dec 2024 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769502;
	bh=BbA4t37gNDuPaVp+phA5si3yZnk3BtKkyG3dbN7F6lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEQXEGrr9QDBONh4Ctq6YL0U8KHT9HaXGr1gSHgekHVEJr6T5DcDmD7SpTZ/20azn
	 vGZJzP96pQkxzNbKkwcqY42hVSd8PxSY0v2aBF2QEIt2ktd1uy9Ec/Tsgknt8P28uU
	 1yKBGL9lndSRfMg5Pbbs6GAHqusCWHSSu0Gh/URt2V+PovrtIvp/b+yR1Z1d7RCLRv
	 H89mSeNPW5Euh62hBEgCs/jeplHbt++9sgV31sJQp8n8Y1ppq/9s5J6rZRrNSOpJDn
	 Y1Y415UC0/5PF879/PUPOd4b70sIGhetmTe2nEqAhnsoLJZZxDtvfEBNRftnwdZO1p
	 ITMx4aIJoo1yg==
Date: Mon, 9 Dec 2024 18:38:21 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Michael Kelley <mhklinux@outlook.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [hyperv:hyperv-fixes 5/11] drivers/hv/vmbus_drv.c:2510:45:
 error: call to undeclared function 'secs_to_jiffies'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <Z1c5HfhCCd44LntZ@liuwe-devbox-debian-v2>
References: <202412091658.m9g4L9gw-lkp@intel.com>
 <fba68cce-2445-4a1d-a609-b6308a62c1b3@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fba68cce-2445-4a1d-a609-b6308a62c1b3@linux.microsoft.com>

On Mon, Dec 09, 2024 at 08:52:27AM -0800, Easwar Hariharan wrote:
> On 12/8/2024 9:50 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
> > head:   b8ea8cd0fbd358feee3e9172c5ef8afd671e0d11
> > commit: eced6df67f6b76889e80ded109a73ca5fac1e5cd [5/11] drivers: hv: Convert open-coded timeouts to secs_to_jiffies()
> > config: i386-buildonly-randconfig-004-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/config)
> > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/reproduce)
> > 
> 
> Hi Wei,
> 
> It appears hyperv-fixes needs to be rebased on 6.13-rc1 to provide
> secs_to_jiffies() from commit b35108a51cf7bab58d7eace1267d7965978bcdb8
> (jiffies: Define secs_to_jiffies()). I suppose you'll do that before
> sending the PR to Linus.

Yes. I will fix that up.

I originally based it on 6.13-rc1, but that tag was broken. Now that
6.13-rc2 is out, I'll rebase on that.


> 
> Thanks,
> Easwar
