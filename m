Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7F29B2;
	Tue,  6 Dec 2022 12:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB09C433D6;
	Tue,  6 Dec 2022 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670329900;
	bh=76+0QVP3BEzcYKmRdFwbVc478/RVNeVmoqRI4kQNeSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McsU9JJxT+RJt2vKuR/dOEeDybDq9JM/wMRV34dU9qPctkHeFxp1TCrmcstQGbGxR
	 Eb22DaMjHed30mX/rul8lgCbuRaVT92/bfB4WJEZaFpUjckitsw+JaPlAqPXwkMriB
	 lY3His23Qv81E0riMKOwvCBdzIP4o9lFEoSsyBZ0=
Date: Tue, 6 Dec 2022 13:31:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/2] drivers/usb/gadget/legacy/webcam.c:174:3:
 error: field designator 'bmInterfaceFlags' does not refer to any field in
 type 'const struct uvc_format_uncompressed'; did you mean
 'bmInterlaceFlags'?
Message-ID: <Y482Krr7Ko49ocEI@kroah.com>
References: <202212060347.MaTRoCo0-lkp@intel.com>
 <926df743-9c43-9471-3c67-3df9f4e18204@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <926df743-9c43-9471-3c67-3df9f4e18204@ideasonboard.com>

On Mon, Dec 05, 2022 at 08:20:25PM +0000, Dan Scally wrote:
> Oops, forgot all about the legacy version. Sorry Greg - let me send a v2.

Now dropped from my tree, thanks.

greg k-h
