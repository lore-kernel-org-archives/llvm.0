Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EB2FD1B6;
	Mon,  5 Jan 2026 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627329; cv=none; b=XU3UGCSpxphOG/lkXJU04sYvF8GVk2WJDPjBOcILP41TqmUwF/r/NhZ6zXH/z3qzyFg80ecsMV3IfptHfY6wM623EuRNLIe43g0xJDHul/J6ahME2esAaRpY6alqw4IyrfE8aNSX1vp2PAYNjkGQxzKiWDotoGQ/S1z32mxDlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627329; c=relaxed/simple;
	bh=O4aBjEbbObV3cNtGvoDkesjGiNuLHJOfZI0S/+mkDO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFdkUAxmbBPZSdv0geOi/Tn4jiit7p57Gt/p55kWC3TrsES9R1t4skPo+8174m/z+hmmqBwEVVp5JRomuG4+4prpMA0z/cY19k+5cSHwT8jYXAPCvyxdnqHTCKS4yMzKkW6I3YZIOeaSmw9m1HC0jiIHXjkt2DT/ajd9KO3ieJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sVDc9Vwf; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sVDc9Vwf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dua1dCY1BlwzgYeD5iOt6sOUoTdhebb29bX4E+I1q5I=; b=sVDc9VwfVaKh6SxeyD7rLbxGPw
	mIkFftZvVQ8l0TyyWYILIBvggJT8LgTG3GKMMXTswfP7sMdHak5m6gK9WXEAnGq8B0v5UIPOLPJV4
	dgXN8LMF3yEHxC7CqMMxTNN7lOGN/7wEa13SVh3mXY5Y8lpaYcrNSGAOO21ua9q1PFrOTiFrkU5RA
	5/81Jc4EeJ8sxx5MB73huze1sUBVCnKd8zf26cI7fOH40Gkuk/W4S95j77YhWb4scXVQiQ5/7SIPl
	PFz9dxPJZqsIBNv0hM1SI8Dl9V04UQ0ZWck0Gok/6sFD9721LOhU7KROA5KKDp8I/7lv5YOqOBUGx
	SH8GAZRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmc5-0000000AYJq-3uld;
	Mon, 05 Jan 2026 15:35:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 70615300E8E; Mon, 05 Jan 2026 16:35:20 +0100 (CET)
Date: Mon, 5 Jan 2026 16:35:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>, hca@linux.ibm.com
Cc: Marco Elver <elver@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
References: <202512222219.F6EkVNmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512222219.F6EkVNmQ-lkp@intel.com>

On Mon, Dec 22, 2025 at 10:11:10PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
> commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512222219.F6EkVNmQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
> Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
> >> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
> Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?

Heiko, I'm seeing these warnings, and I can reproduce in a local build.
But I have to note that its just one more of an already existing string
of similar failures.

I don't see anything like this on x86, not have I had robot reports for
other architectures. As such, I'm considering this a pre-existing s390
issue.

Please let me know if this is something you want me to look at
nevertheless.
