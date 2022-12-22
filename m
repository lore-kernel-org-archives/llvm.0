Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6723AE;
	Thu, 22 Dec 2022 22:20:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 89CC7C8EBA;
	Thu, 22 Dec 2022 22:18:12 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D30FDFF804;
	Thu, 22 Dec 2022 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671747483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESfp7KKpAv+avOXeJxpUY9MFmNEp8Wj0BEaSoWNYEX4=;
	b=IQeEa1NkDyMzeZwyRZz+H3vBsHce6qEwJqgotnLErnSrXf9DCIRwTBisELdDhfebXWq3p2
	IjEYbKAgjOvqDB01Md1NEUqvgOytjZ970pFarz9SjoekU8KA1ejxZ9VIVMdqM0FRDmn8AK
	e0F/oEWeZuImmn4sAJ7hJLauJp8qORTO60b+Ef8Mx+tFkyEsnOFswzOrXGT1oyC/F9T9ji
	1nYIGrlE/ddatvOo5O3eg8pPNVM2UdMUpU3z6tVcZJBHeNk536U39bqDLTQattxR0dcKgS
	o80K5PEO01n41nX3HTKP3Fl+QDnizklqWg8b5av7LJZoKG4Iaxq11yTh5O7yRg==
Date: Thu, 22 Dec 2022 23:18:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 15112/15174]
 drivers/rtc/rtc-ds1307.c:1717:35: error: call to undeclared function
 'i2c_client_get_device_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <Y6TXmiGfTRsdhfEQ@mail.local>
References: <202212151358.BAYk9OKz-lkp@intel.com>
 <20221215075745.r2fclxb2plqh53uc@pengutronix.de>
 <20221222220812.c5c5azlcl64ewkbc@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221222220812.c5c5azlcl64ewkbc@pengutronix.de>

On 22/12/2022 23:08:12+0100, Uwe Kleine-König wrote:
> Hello Alexandre,
> 
> On Thu, Dec 15, 2022 at 08:57:46AM +0100, Uwe Kleine-König wrote:
> > On Thu, Dec 15, 2022 at 01:31:15PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   459c73db4069c27c1d4a0e20d055b837396364b8
> > > commit: ad6d474d82dfb346573146d1bb0d818a720314fd [15112/15174] rtc: ds1307: Convert to i2c's .probe_new()
> > > config: hexagon-buildonly-randconfig-r004-20221214
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98b13979fb05f3ed288a900deb843e7b27589e58)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ad6d474d82dfb346573146d1bb0d818a720314fd
> > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >         git fetch --no-tags linux-next master
> > >         git checkout ad6d474d82dfb346573146d1bb0d818a720314fd
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/rtc/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > Note: the linux-next/master HEAD 459c73db4069c27c1d4a0e20d055b837396364b8 builds fine.
> > >       It may have been fixed somewhere.
> > 
> > This is fixed by commit 662233731d66 ("i2c: core: Introduce
> > i2c_client_get_device_id helper function") which should be an ancestor
> > of the blamed commit.
> > 
> > FTR: This is currently the only commit with this problem (i.e. a new
> > user of i2c_client_get_device_id that isn't an ancestor of
> > 662233731d66):
> > 
> > 	$ git log --pretty=oneline --abbrev-commit --ancestry-path 662233731d66..next/master > l
> > 	$ git log --pretty=oneline --abbrev-commit linus/master..next/master -Si2c_client_get_device_id | grep -F -x -v -f l
> > 	ad6d474d82df rtc: ds1307: Convert to i2c's .probe_new()
> > 
> > (If someone knows a single command to get this information, let me
> > know.)
> > 
> > The idea was to pull
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_device_id_helper-immutable
> > 
> > before applying the patch.
> 
> The patch for ds1307 didn't make it into Linus' tree yet. Do you still
> have it on your radar for the next merge window? Would it help you if I
> resent it?
> 

It is on my radar for the next merge window, no need to resend (this was
simpler for me)


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
