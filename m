Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D717BA6;
	Sun, 26 Oct 2025 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761454297; cv=none; b=m7c2vtYvzLry3h+MHmN8H6UwEEu2OmpLKWswOessQTqyMfPix3UbsNPGMVrt3J3/TbHzCvvVePS+H/p5tIKvj2grKMyaNJE/81fnE+VGC+VWALc6mvGBFf3INdIturom0jzEKD6kjR3M2Wzd2yNRBqSq9g9Mtx5/U2lGqtQ0ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761454297; c=relaxed/simple;
	bh=jPmY9EuaikqLfsyh48vPZOJpqI2dti5YZlMz2+bkIUI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tGTK6VCQ5rSFuy3PJgo2VBgXFfahqwx3xOcjCUkgPmAgJYASL5CQjDYZGSylL+VkTxR1RzlYfLfDP+HINUfDPCiEhuKnyO5VeYPXWHkGPzEk+xSn2ftK6TpMtaLEZRqsGMjLzEy5ZqtjFaouhfJquTQLGL+98qOzRYxnqiCaa3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jISZLSQS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jISZLSQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A5BC4CEE7;
	Sun, 26 Oct 2025 04:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761454296;
	bh=jPmY9EuaikqLfsyh48vPZOJpqI2dti5YZlMz2+bkIUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jISZLSQSCwqRaR+wnHgDJfumz4BjQrB1NVVE9UVd662AW6j84/NyVOSq/QzRUQ7if
	 MIzUZIOcoTBOFJ3B4XmuRDhok10sFz4JALbtCNiDwXB6Z03ERRA3+AArGfKfaz9+i7
	 7K7fGGVYo/chdbr/Q9nk8lQvmIRhenVha5M6vmew=
Date: Sat, 25 Oct 2025 21:51:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Douglas Anderson <dianders@chromium.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 40/49] ld.lld: error: undefined
 symbol: hw_nmi_get_sample_period
Message-Id: <20251025215135.d947785ef3edcb7b725cfcf2@linux-foundation.org>
In-Reply-To: <202510240701.eB6r97V3-lkp@intel.com>
References: <202510240701.eB6r97V3-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Oct 2025 07:44:47 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   b0165d26ed76a1d8825e54ddc5c0b62db5113f13
> commit: 5ec1304ad3434337b407db8e6e3bf6e2964c045f [40/49] watchdog: move arm64 watchdog_hld into common code
> config: arm64-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240701.eB6r97V3-lkp@intel.com/config)

CONFIG_WATCHDOG_PERF_ADJUST_PERIOD isn't set.

> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240701.eB6r97V3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510240701.eB6r97V3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: hw_nmi_get_sample_period
>    >>> referenced by watchdog_perf.c
>    >>>               kernel/watchdog_perf.o:(hardlockup_detector_event_create) in archive vmlinux.a
>    >>> referenced by watchdog_perf.c
>    >>>               kernel/watchdog_perf.o:(hardlockup_detector_event_create) in archive vmlinux.a

Thanks, I'll remove this version of the series from mm.git.
