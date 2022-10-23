Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173367B
	for <llvm@lists.linux.dev>; Sun, 23 Oct 2022 12:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBEDC433C1;
	Sun, 23 Oct 2022 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666528549;
	bh=B2lqztaj37lTTjsRSUExxu/gfXdiQBDzzA9CQRws0Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvoC1wDqT9WKnL7pqw5VeYQeGqsRl421kB7JzuYMWC9TxtMgNsXmqRfvnVlNRTDAH
	 nWnL+7xplLNC3UBqT534RE238IMI5/3KWn3BtVX3x4WSfJIXb2FSoYpaZBgla2imSj
	 1c7R8mkZ1OcW49RRAkHm7//lBO5NeXwfYoiOJPIY=
Date: Sun, 23 Oct 2022 14:35:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 12/23] arch/arm/mach-s3c/devs.c:30:10: fatal
 error: 'linux/platform_data/s3c-hsudc.h' file not found
Message-ID: <Y1U1Ij3/t2vqjl4Y@kroah.com>
References: <202210230210.NvXmltv5-lkp@intel.com>
 <7e16694e-c52a-4e8f-b138-e22c8ed3f136@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e16694e-c52a-4e8f-b138-e22c8ed3f136@app.fastmail.com>

On Sat, Oct 22, 2022 at 10:58:51PM +0200, Arnd Bergmann wrote:
> On Sat, Oct 22, 2022, at 20:04, kernel test robot wrote:
> >
> > All errors (new ones prefixed by >>):
> >
> >>> arch/arm/mach-s3c/devs.c:30:10: fatal error: 'linux/platform_data/s3c-hsudc.h' file not found
> >    #include <linux/platform_data/s3c-hsudc.h>
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Ah right, so the patch that removed the #include is in a separate branch
> and not yet in linux-next. It might be easier if I just take this patch
> through the soc tree as well.

I agree, I'll go drop this from my tree, feel free to take it through
yours instead.

thanks,

greg k-h
