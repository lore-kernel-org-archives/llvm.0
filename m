Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDF4650;
	Tue, 29 Nov 2022 07:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B20C433C1;
	Tue, 29 Nov 2022 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669708641;
	bh=7AbtWrQlp9k8KrQa4srgg7iZ5jQvg6rumAPM9dssCt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTCyIskEq823x7c0vN32SRGKw7/eEgt1jeKd+3Zn0KIV1XCw5335MwKsSQb3PgD7q
	 oa6VSlxG6gN8wFh6oXzM9rPbILDjZOzJKQAWhb1eed1s+loHt1RaSazTVfgpsqUAxg
	 sBTDDdUoAaKDCutsS0Cx3QWYIDer7R672QXLkR10=
Date: Tue, 29 Nov 2022 08:57:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/23]
 drivers/usb/gadget/function/uvc_v4l2.c:266:3: warning: unannotated
 fall-through between switch labels
Message-ID: <Y4W7Xw6OA9GLzXmH@kroah.com>
References: <202211290734.P9mHcjpl-lkp@intel.com>
 <Y4W6/0Ql3dI+ePXF@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4W6/0Ql3dI+ePXF@kroah.com>

On Tue, Nov 29, 2022 at 08:55:43AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 29, 2022 at 07:22:43AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   465d4dd073f72a6348577ed0f7aa4aa00c9264bc
> > commit: a6f523ee41bfe7ef71110d4ae556339d0520efdd [2/23] usb: gadget: uvc: add validate and fix function for uvc response
> 
> Michael, I'll drop this commit from my tree now, please fix up and
> resend.

Nevermind, I fixed it up myself, it was trivial.

greg k-h
