Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8D360;
	Thu, 15 Dec 2022 06:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65BCC433EF;
	Thu, 15 Dec 2022 06:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671087250;
	bh=Y0VduMH2uHkZPHUsYgEgyPdnMJqk708V/hfAdEN6UQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krYgeZ0GusO4mnX6JxsjGK8M9A62uUF49Bqp9Tx4p4TBdFWDndHJEY74F434YuzP7
	 caLx7frg07jeszY+w0cK8snXdxZi4tJNEz6w/Q6SPVY6WOPfFheViqhYAxNx+WZ+gG
	 7TWpaDfQ9t632Kod4Ylqpg+PAGbPeGYpFHA98yTE=
Date: Thu, 15 Dec 2022 07:54:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:queue/6.0 2/3] drivers/rtc/rtc-cmos.c:1482:2:
 error: call to undeclared function 'rtc_wake_setup'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <Y5rEj5BlyG8i+3sl@kroah.com>
References: <202212150451.HA4pSpOT-lkp@intel.com>
 <Y5o7sSLj1fcG3xIY@mail.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5o7sSLj1fcG3xIY@mail.local>

On Wed, Dec 14, 2022 at 10:10:09PM +0100, Alexandre Belloni wrote:
> Hello,
> 
> You are going ton need https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=db4e955ae333567dea02822624106c0b96a2f84f

Thanks, now queued up.

greg k-h
