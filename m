Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812F3FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KaliKYYkNMqrhjKwpWKqxXm8VgZh11hwlXmN3oD3zZk=; b=SY0xVqk7mI72ydm3mgM8JYkEqJ
	m4o4HwcN5IWtxcW0tjrqFWgZDfENT2mJTaih2bwiLEgJvu+OfSF+VBrgU57c/KNKKZy7oR0ylDfLC
	eIO92nHgGmseg6OqOK549uP4e6BPwPps1+8zw9XB0FS/G4x6hiJt2MQu968Wa1jvEg4eJMqlw2lvw
	pH5mEbUrvqGls9G4XZul084lWAHpV1YxYmmPZY4Ec9gwhpCrRg+k5G6xDzcPztusUZQ5HSclTQzI6
	KAb0R1ZAa2FeYp5y3pUSRCze1KX1hdJiDsiJUK8o0Q+3+v+xpQSQ9D+mQD9nv9h2JjrYAO41WVQOp
	1eXsbBRg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPoN4-002GLi-Au; Mon, 13 Sep 2021 15:59:50 +0000
Date: Mon, 13 Sep 2021 08:59:50 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@suse.de>
Subject: Re: [kbuild-all] Re: [mcgrof-next:20210908-firmware-builtin-v4 2/11]
 drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous
 prototype for function 'firmware_is_builtin'
Message-ID: <YT91dprXpGy+ywBu@bombadil.infradead.org>
References: <202109101524.pjY4q0Dy-lkp@intel.com>
 <YTv817Srt8hoySP5@bombadil.infradead.org>
 <20210911012853.GA834679@pl-dbox>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911012853.GA834679@pl-dbox>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Sat, Sep 11, 2021 at 09:28:53AM +0800, Philip Li wrote:
> On Fri, Sep 10, 2021 at 05:48:23PM -0700, Luis Chamberlain wrote:
> > On Fri, Sep 10, 2021 at 03:41:31PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20210908-firmware-builtin-v4
> > > head:   1c69d6a17750179d68bcaf6b16f9a08d2e475989
> > > commit: 79e9fce20ee88ffe37542a66277628e6c53dde14 [2/11] firmware_loader: formalize built-in firmware API
> > > config: hexagon-buildonly-randconfig-r004-20210910 (attached as .config)
> > > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=79e9fce20ee88ffe37542a66277628e6c53dde14
> > >         git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
> > >         git fetch --no-tags mcgrof-next 20210908-firmware-builtin-v4
> > >         git checkout 79e9fce20ee88ffe37542a66277628e6c53dde14
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=hexagon 
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous prototype for function 'firmware_is_builtin' [-Werror,-Wmissing-prototypes]
> > >    bool firmware_is_builtin(const struct firmware *fw)
> > 
> > This is a lie though its defined on drivers/base/firmware_loader/firmware.h
> > 
> > >         ^
> > >    drivers/base/firmware_loader/builtin/main.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > >    bool firmware_is_builtin(const struct firmware *fw)
> > >    ^
> > >    static 
> > >    1 error generated.
> > 
> > I get these odd errors:
> > 
> > Compiler will be installed in /home/mcgrof/0day
> hi Luis, would you mind to download the make.cross tool again to give a try, it
> was updated recently to use latest clang instead of this 12.0.0?

I had clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl and this was
used already. Is there a more recent one? Just in case I rm -rf'd it
and tried again with the latest make.cross.

  Luis
