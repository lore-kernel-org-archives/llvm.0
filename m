Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104BC1F93A;
	Mon,  5 Jun 2023 15:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2741CC433EF;
	Mon,  5 Jun 2023 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685979497;
	bh=YcHeirLAh1zNkO191A5ThOHmeGZln7ce23rqNg9phqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hON4Xux7CHL3dRDzQOVaOyIh4MMUO4KT+PiccyED2BbprTbtnO0wyDTjZTwt6kckn
	 NnuKB3fJEJ135E7eWUNdhdIo/1P9GRBDVdPUKE5HcibCb43xw4vsrY8ov+x+cJxTVb
	 itlaA09ZxsHB4itMpqcEPSfXwjq9KNjZoNePtIAY=
Date: Mon, 5 Jun 2023 17:38:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vlad Buslov <vladbu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [stable:linux-5.4.y 3300/8640] net/sched/cls_flower.c:296:12:
 warning: stack frame size (1040) exceeds limit (1024) in 'fl_classify'
Message-ID: <2023060543-unhelpful-reclining-63af@gregkh>
References: <202306051816.mO3hqt7d-lkp@intel.com>
 <873536xfus.fsf@nvidia.com>
 <20230605153209.GA2480995@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605153209.GA2480995@dev-arch.thelio-3990X>

On Mon, Jun 05, 2023 at 08:32:09AM -0700, Nathan Chancellor wrote:
> On Mon, Jun 05, 2023 at 03:11:24PM +0300, Vlad Buslov wrote:
> > On Mon 05 Jun 2023 at 18:59, kernel test robot <lkp@intel.com> wrote:
> > > Hi Vlad,
> > >
> > > First bad commit (maybe != root cause):
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> > > head:   cf0b1e5482eaeb4db15c9e703267483dba88b575
> > > commit: 5f2e54391893c67b709a64b280417ca0318adb73 [3300/8640] net/sched: flower: fix parsing of ethertype following VLAN header
> > > config: mips-randconfig-r013-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051816.mO3hqt7d-lkp@intel.com/config)
> > > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
> > > reproduce (this is a W=1 build):
> > >         mkdir -p ~/bin
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install mips cross compiling tool for clang build
> > >         # apt-get install binutils-mipsel-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5f2e54391893c67b709a64b280417ca0318adb73
> > >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > >         git fetch --no-tags stable linux-5.4.y
> > >         git checkout 5f2e54391893c67b709a64b280417ca0318adb73
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/sched/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202306051816.mO3hqt7d-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >>> net/sched/cls_flower.c:296:12: warning: stack frame size (1040) exceeds limit (1024) in 'fl_classify' [-Wframe-larger-than]
> > >    static int fl_classify(struct sk_buff *skb, const struct tcf_proto *tp,
> > >               ^
> > >    1 warning generated.
> > >
> > >
> > > vim +/fl_classify +296 net/sched/cls_flower.c
> > >
> > > e0ace68af2acfe Paul Blakey            2019-07-09  295  
> > > 77b9900ef53ae0 Jiri Pirko             2015-05-12 @296  static int fl_classify(struct sk_buff *skb, const struct tcf_proto *tp,
> > > 77b9900ef53ae0 Jiri Pirko             2015-05-12  297  		       struct tcf_result *res)
> > > 77b9900ef53ae0 Jiri Pirko             2015-05-12  298  {
> > > 77b9900ef53ae0 Jiri Pirko             2015-05-12  299  	struct cls_fl_head *head = rcu_dereference_bh(tp->root);
> > > 77b9900ef53ae0 Jiri Pirko             2015-05-12  300  	struct fl_flow_key skb_mkey;
> > 
> > The stack usage of fl_classify() has already been addressed in later
> > kernels by commit 0af413bd3e2d ("flow_dissector: work around stack frame
> > size warning") which moved mkey into fl_mask_lookup(). Not sure what
> > else can be done since my commit just adds a new flow dissector fields
> > that are needed to correctly parse packets with multiple VLAN headers.
> 
> 0af413bd3e2d seems like a reasonable cherry-pick for linux-5.4.y to me
> if the warning is showing up there, which seems like the only thing that
> needs to be done for this report.

That sounds good to me, now picked!

greg k-h
