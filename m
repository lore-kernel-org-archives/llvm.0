Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336D1D90B3;
	Sat,  1 Mar 2025 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740845762; cv=none; b=BJQ4Ezjx12xdv/HNiBiFjCzt6Zv2N5+lWY/QY69MRMXLsJVd2c5t+upAl3NenuipFDvBZ/9NdGQOuHWgBQZDQu811dSseWbRNQxdpSi1O1Doh9g4k5L8rUYs5LMSm9ZTx/N95k56uilCMKL3Xj+TljNo4gYRiA9lzV+qa1lNGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740845762; c=relaxed/simple;
	bh=60MHNXWMx76GDBQsFqvK/tov8tN6UhpUoBlyfNEAoRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpE/w0XyHPOZUJ0u4MtbGHlsGakGbHtYO95G8KEqkw5T7B0jHtLI2CfTGPjHgj3pqx/kTslarQcCenmLJB+Sh4GIPQfKTVlMBaU+HY2HrGTSg2DtO9X7QbS5vEYRF6xqeNxV4xBVFVHwa2oFYlDROW+xRJTScWQIjOLqFGUUO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=KqwC7HEA; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="KqwC7HEA"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Z4qts6vDJz9sWm;
	Sat,  1 Mar 2025 17:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1740845750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ul8bZXenFHpg9BMoi4vIqA5nMxGKbbJQpmgRbcz2gwo=;
	b=KqwC7HEAT8RbXUBixSyliTh0U//W3DZZEx+D2nVX8qesV/S/tnm8Hx0KJST4zoQCzSyvs+
	JRm9AgdnWARLf8ujpDpLyJ5Wac9cJqNGvbQ+xaz8EVNZQ0rSHrIJfvmC3dWcjbnms7qnyT
	cEq+l7n4lj+OYyCw43Orhvin0hU+i/j6Oi33T90EQw0M/Y8QWtETiQ2/WMklPYuPPN7wuM
	Q/UOKHxIQAZ2XKL271Z/WWOCAmlbHBK9MTFTOMJWDAJBMAzGmofYzFdlHPtfxrGzZyp2My
	UtutLfRv62NY6SQppih0vN73gmZHtLUg1nFC5vQF6LJGA2op72gpzWxBy1VAIg==
Date: Sat, 1 Mar 2025 11:15:46 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 2357/7423] drivers/bluetooth/hci_vhci.o:
 warning: objtool: .text: unexpected end of section
Message-ID: <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>
References: <202503011220.Y2e5vz4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503011220.Y2e5vz4w-lkp@intel.com>
X-Rspamd-Queue-Id: 4Z4qts6vDJz9sWm

On 25/03/01 12:30PM, kernel test robot wrote:
> Hi Ethan,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 

Thanks for the email, kernel test bot. I'm not sure my patch would be
the cause of this error, especially since my patch did not touch
bluetooth at all. Only the ham radio driver. 

I did find an email [0] from a year ago with the exact same error in
the same file.

Dan, what your thoughts?

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c0eb65494e59d9834af7cbad983629e9017b25a1
> commit: 3b147be9ef08247bb74a801b4e95f9a626a27322 [2357/7423] hamradio: baycom: replace strcpy() with strscpy()
> config: x86_64-buildonly-randconfig-006-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011220.Y2e5vz4w-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011220.Y2e5vz4w-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503011220.Y2e5vz4w-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/bluetooth/hci_vhci.o: warning: objtool: .text: unexpected end of section
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks,
Ethan

[0]: https://lore.kernel.org/llvm/202401250927.1poZERd6-lkp@intel.com/
