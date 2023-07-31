Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924E182DA;
	Mon, 31 Jul 2023 15:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472A3C433CB;
	Mon, 31 Jul 2023 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690818548;
	bh=IiqjtFljpF3JFBsgdPWDkjyDlc2GqaguJSDXrS94mrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo84xOZQ19JMnvS1yPw9YGAtTMoMhJjihcZ2js3t+lNfe3qW7IbwgNzn32zAITt5f
	 DDLVJrLte8TxT90Qh4Moz5PRiwcx9+uCHKRtgMiJNP2Ae/eGjCJLmp0j2ffUTIDlXX
	 oMLDFKKwteCAsw1Lcbhl8bFyUnSsJyHaI48UGqumQpY7qLr4/sv4R0qhyq3FUjcuVM
	 McHxI0pxh7Yq7C6ZskiGYAv8wwXijg9rfeOSWJfA7qQkbF8HUUJ/7r5lmqoRlZtGIf
	 a9WJI0jiJkRqb3wm5rpeeMm4xmc/Qh2UqKS3T7W1jp25leUwGmpflLvJ4XBh2YcZ2o
	 MLrRG6XZvdawA==
Date: Mon, 31 Jul 2023 08:49:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ladislav Michl <ladis@triops.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
Message-ID: <20230731154906.GA1823389@dev-arch.thelio-3990X>
References: <202307260537.MROrhVNM-lkp@intel.com>
 <2023072653-viewable-harmonics-09e0@gregkh>
 <fbceb8e5444eab23788501b002926e07f54fdd7c.camel@triops.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbceb8e5444eab23788501b002926e07f54fdd7c.camel@triops.cz>

Hi Ladislav,

On Fri, Jul 28, 2023 at 08:48:20AM +0200, Ladislav Michl wrote:
> Hi Greg,
> 
> I'm sorry for late reply (travelling)
> 
> On Wed, 2023-07-26 at 06:39 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot wrote:
> > > Hi Ladislav,
> > > 
> > > First bad commit (maybe != root cause):
> > > 
> > > tree:  
> > > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-
> > > testing
> > > head:   ac47051f0bb8ccf1eaedb296a19fcb541474db53
> > > commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3:
> > > dwc3-octeon: Convert to glue driver
> > 
> > Ladislav, I've dropped your dwc3-octeon patches from my tree now,
> > please fix up and resend when you have this resolved.
> 
> As I didn't find a better place to ask, I'm asking here:
> all registers are 64bit and driver is now using GENMASK and BIT
> macros to access their values. Reported problem comes from 32bit
> configuration, where BIT is UL(1) << (nr) and BITS_PER_LONG is 32.
> Is using GENMASK_ULL and BIT_ULL preferred way to go here? I'm not a
> bit fan of "fixing" code just to silence warning on irrelevant
> configurations, but will do it unless someone points me to better way.

I am not Greg but I see you did not get a response on this yet. Yes, you
should use the _ULL macros to ensure the values are always 64-bit, which
will avoid this issue altogether.

Cheers,
Nathan
