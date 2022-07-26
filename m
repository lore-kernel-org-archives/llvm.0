Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D2F4C8B
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 16:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12119C433D6;
	Tue, 26 Jul 2022 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658852661;
	bh=e5WQ82QXiZdaq5B32yptMF6AnsdJVIz/qzufzzfmS/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwOg6aQmG22CNWStkrQHr4DLs+p3YhotUzffLeuIsod50WyU9yA5cn4XBvNxtJY7n
	 dibpTmLbOEGA0/TCJfoa/RAQ94BZXDfIMG6kboFjoUITcGKJ7ZpujBMpIkRqvtnIL9
	 G9bxZsZHPnMoqDPk7WQ0t1URIR168BBlzWNyS+Cw3b5XMcjLU4ChlESkFzU7DHwFoV
	 GmYfhqOWIQWSwMH8ST6+f9CiuT+AkvUIwyYIQFl9q0G9Cd4ISXfk2o0ZgIFa0YKlq0
	 Vt+0wOkm8d9WZnwBZySXiiGfopAduw+k2yefTR3/AxnaC1GCyTQxBY0Y61Hr4hzKua
	 BU2hV1NC2DbSA==
Date: Tue, 26 Jul 2022 09:24:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: kernel test robot <lkp@intel.com>, jikos@kernel.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	benjamin.tissoires@redhat.com, spbnick@gmail.com,
	j.witteveen@gmail.com, stefanberzl@gmail.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 6/7] HID: uclogic: Add support for UGEE v2 mouse frames
Message-ID: <YuAVMwTxIo2q6Wgd@dev-arch.thelio-3990X>
References: <20220717144333.251190-7-jose.exposito89@gmail.com>
 <202207261047.hUEFf74G-lkp@intel.com>
 <YuAMzSBcfsyGMjNy@dev-arch.thelio-3990X>
 <20220726161455.GA3260@elementary>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726161455.GA3260@elementary>

On Tue, Jul 26, 2022 at 06:14:55PM +0200, José Expósito wrote:
> On Tue, Jul 26, 2022 at 08:48:29AM -0700, Nathan Chancellor wrote:
> > On Tue, Jul 26, 2022 at 10:33:25AM +0800, kernel test robot wrote:
> > > Hi "José,
> > > 
> > > Thank you for the patch! Yet something to improve:
> > > 
> > > [auto build test ERROR on 0cb1fc0988e32bda84c2b7218e0c761af1430baf]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/XP-PEN-Deco-Pro-S-support-for-5-20-uclogic/20220717-224559
> > > base:   0cb1fc0988e32bda84c2b7218e0c761af1430baf
> > > config: x86_64-buildonly-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220726/202207261047.hUEFf74G-lkp@intel.com/config)
> > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://github.com/intel-lab-lkp/linux/commit/10fcf5d5cca4657c53477c392b1fb675d72cfda3
> > >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> > >         git fetch --no-tags linux-review Jos-Exp-sito/XP-PEN-Deco-Pro-S-support-for-5-20-uclogic/20220717-224559
> > >         git checkout 10fcf5d5cca4657c53477c392b1fb675d72cfda3
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)
> > 
> > Unfortunately, LTO makes this warning kind of cryptic but it seems like
> > the wrong template size is being used? This appears to resolve the
> > warning for me.
> > 
> > Cheers,
> > Nathan
> > 
> > diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
> > index 2407e927d1bf..dd4b1ed6fd1e 100644
> > --- a/drivers/hid/hid-uclogic-params.c
> > +++ b/drivers/hid/hid-uclogic-params.c
> > @@ -1205,7 +1205,7 @@ static int uclogic_params_ugee_v2_init_frame_mouse(struct uclogic_params *p)
> >  
> >  	rc = uclogic_params_frame_init_with_desc(&p->frame_list[1],
> >  						 uclogic_rdesc_ugee_v2_frame_mouse_template_arr,
> > -						 uclogic_rdesc_ugee_v2_frame_dial_template_size,
> > +						 uclogic_rdesc_ugee_v2_frame_mouse_template_size,
> >  						 UCLOGIC_RDESC_V1_FRAME_ID);
> >  	if (rc)
> >  		return rc;
> 
> Hi Nathan,
> 
> Yes, I was about to send v3 fixing it. As you mentioned, I copy-pasted
> the wrong template size.

Good to know! At least we caught it early :)

> I really need to learn how to enable those warnings in my dev
> environment. My toolchain didn't complain about this.

CONFIG_FORTIFY_SOURCE will be the configuration that can catch these
issues but I did not see a warning from clang without LTO, so it is
likely the case that LTO helped the compiler see through translation
units that the size was not correct.

> Thanks for pointing me to LTO. I didn't know about the CONFIG_LTO_*
> options, I'll play a bit with them.

If you have any questions about it, feel free to reach out to our
mailing list (llvm@lists.linux.dev), we're always happy to help!

> Thanks a lot for looking into this,
> Jose

Any time!

Cheers,
Nathan
