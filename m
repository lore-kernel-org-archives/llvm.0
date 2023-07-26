Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA711105;
	Wed, 26 Jul 2023 04:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBD4C433C8;
	Wed, 26 Jul 2023 04:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690346361;
	bh=8yUdwCy91Mt23SHJNZC0QXx+iDIrX1yn878Ac5Vh1zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3emtIFomUMlTrtVaugLU9jaKRHApIs2pL4ke6TLOGe6S45ye9z6zsU6wVBBYwcIK
	 USZWZ5wt7P7EjUSqssRRTHkwSS3ikuiuG16NR/gQGhYURhbiQ5mq/5wJGYwu6VcUxJ
	 oJ7BnToUwow12/8bfgJGES5YfWI2jTNb+F9AqEOA=
Date: Wed, 26 Jul 2023 06:39:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Ladislav Michl <ladis@linux-mips.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
Message-ID: <2023072653-viewable-harmonics-09e0@gregkh>
References: <202307260537.MROrhVNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307260537.MROrhVNM-lkp@intel.com>

On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot wrote:
> Hi Ladislav,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   ac47051f0bb8ccf1eaedb296a19fcb541474db53
> commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3: dwc3-octeon: Convert to glue driver

Ladislav, I've dropped your dwc3-octeon patches from my tree now, please
fix up and resend when you have this resolved.

thanks,

greg k-h
