Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDD1A8F9A;
	Fri,  3 Jan 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919525; cv=none; b=O+lKKkbz7DATvKFYzFQzPsIFw/JnFQYq+kAfEbinXQqTOWkKE4dh5RSwtwjYD8IAZgRcthZ8HtM0Xi5tffLUOvLO8eqqTLOzc0uwG4i25RN36aPvrzbRmR7BC1DNe1aXzU7U/WcCnwNEIv3j+ie3r/ZzYu5q7D7hhWifZ5HfwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919525; c=relaxed/simple;
	bh=WCyjIyp3grD2pz0xW5GurNfJAHhq0+LARXWQFH0VOnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGcnu019cpWUj/iknpsiathkFFpU+y9ZcddF/KZxM/PW+2wB4l0rSiMeyjKnpBZAcyqbf2g7tLMOtdRn19hR3McUfdgg3vhBxi3gipIXZ8rHB1Ic6roSEmEO/vHi0VnPda3YwMT15Fz7EU+IY9WE585uOYFL38irIto2U8Ismm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=accNN66M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="accNN66M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903DAC4CECE;
	Fri,  3 Jan 2025 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735919525;
	bh=WCyjIyp3grD2pz0xW5GurNfJAHhq0+LARXWQFH0VOnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=accNN66M7kV+oqx77fzZ5EYWkD51VMZn0aE16maMHL1DWAq0AH4BkRE+Iq91bBuLW
	 v+WmcpG3mFK7Vx4FvcbCURmKJAZHn0VL3UX3LrDCPWzTl5qBwd3XabS/vKkSiwy/wh
	 VjAkKrrVgzuEi+YKWwCoWuJjl+XSQnOWKZxt44cs=
Date: Fri, 3 Jan 2025 16:52:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Brian Norris <briannorris@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:15: warning: declaration of 'struct
 completion' will not be visible outside of this function
Message-ID: <2025010347-outright-fifteen-a9c9@gregkh>
References: <202412241917.orLfjA92-lkp@intel.com>
 <Z3bdT0DrjcV6UzHe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3bdT0DrjcV6UzHe@google.com>

On Thu, Jan 02, 2025 at 10:39:11AM -0800, Brian Norris wrote:
> On Tue, Dec 24, 2024 at 07:37:20PM +0800, kernel test robot wrote:
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from drivers/base/test/platform-device-test.c:3:
> > >> include/kunit/platform_device.h:15:15: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
> >       15 |                                                  struct completion *x);
> >          |                                                         ^
> >    1 warning generated.
> 
> Same:
> 
> https://lore.kernel.org/lkml/20241213180841.3023843-1-briannorris@chromium.org/
> Subject: [PATCH] kunit: platform: Resolve 'struct completion' warning

I guess it should have been cc:ed me.  I'll go dig it up now...

thanks,

greg k-h
