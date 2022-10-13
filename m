Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAB4416
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 19:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E190C433D6;
	Thu, 13 Oct 2022 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665690792;
	bh=Qx1KlZnF7+ikVk5dYvpIX6odcOKyqGjw+oVFuOjeeGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsDEu9rsIbZ9ALTY8xgjTGxMBZgf/lzDoM44Y19AA6od5ET7ZlpUpzSa0L26yBXKC
	 WXy4H9FTap6wmDy5+srznvNrloE3JbxlwgSSAZ/NDnyyV5t0dp/jh6p52arQBg0mEH
	 tNJzhzzAKvrQDz/DWJ5ro8sjP3Lxw0sWBTI1oRyZhqzWabJugu+6urFMC0cqxL4XZb
	 ew0Chj5C9m7ZDdoVwp7ibFh9OIvtW2YSjEwfow48/tp2FhV0Z39vi7U1f2ZgPGnJYy
	 oz+sFlOtWrImqddOEGkfMHdEMNfWoa74zpJz2mnCtBJseUhK1Oa7tBEXbA0dR0SORb
	 yaOwH1YGZwjOA==
Date: Thu, 13 Oct 2022 12:53:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: sound/soc/codecs/src4xxx-i2c.c:28:34: warning: unused variable
 'src4xxx_of_match'
Message-ID: <Y0hspolUEMPePK9y@dev-arch.thelio-3990X>
References: <202210070151.yWxzUNdm-lkp@intel.com>
 <4f2e69e1-c9a2-0197-341c-c8c0bc9fda1c@flatmax.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f2e69e1-c9a2-0197-341c-c8c0bc9fda1c@flatmax.com>

Hi Matt,

On Fri, Oct 07, 2022 at 10:51:11AM +1100, Matt Flax wrote:
> Hi all,
> 
> Can this test system be updated to catch of_match_ptr usage ?

of_match_ptr() evaluates to NULL when CONFIG_OF is not enabled, which
means the compiler cannot see that the variable was used in the macro
after preprocessing. Additionally, if this driver is built into the
kernel (i.e., when MODULE is not set), MODULE_DEVICE_TABLE() is defined
as an empty macro. These two situations together cause the warning:

$ curl -LSs https://lore.kernel.org/llvm/202210070151.yWxzUNdm-lkp@intel.com/2-config | rg "CONFIG_(OF|SND_SOC_SRC4XXX_I2C)"
# CONFIG_OF is not set
CONFIG_SND_SOC_SRC4XXX_I2C=y

Making of_patch_ptr() match pm_sleep_ptr() would resolve this warning
for this driver and many more. I have gone ahead and send a patch for
this (and put you on cc):

https://lore.kernel.org/20221013195153.2767632-1-nathan@kernel.org/

Cheers,
Nathan

> Here is the decleration :
> 
> static const struct of_device_id src4xxx_of_match[] = {
>     { .compatible = "ti,src4392", },
>     { }
> };
> MODULE_DEVICE_TABLE(of, src4xxx_of_match);
> 
> Here is the usage (in the same file) :
> 
> static struct i2c_driver src4xxx_i2c_driver = {
>     .driver = {
>         .name = "src4xxx",
>         .of_match_table = of_match_ptr(src4xxx_of_match),
> 
> 
> On 7/10/22 04:21, kernel test robot wrote:
> > Hi Matt,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   833477fce7a14d43ae4c07f8ddc32fa5119471a2
> > commit: 4e6bedd3c396014ba70de2b4c9995c8e024e82b3 ASoC: codecs: add support for the TI SRC4392 codec
> > date:   8 weeks ago
> > config: hexagon-randconfig-r045-20221006
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e6bedd3c396014ba70de2b4c9995c8e024e82b3
> >          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >          git fetch --no-tags linus master
> >          git checkout 4e6bedd3c396014ba70de2b4c9995c8e024e82b3
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > > > sound/soc/codecs/src4xxx-i2c.c:28:34: warning: unused variable 'src4xxx_of_match' [-Wunused-const-variable]
> >     static const struct of_device_id src4xxx_of_match[] = {
> >                                      ^
> >     1 warning generated.
> > 
> > 
> > vim +/src4xxx_of_match +28 sound/soc/codecs/src4xxx-i2c.c
> > 
> >      27	
> >    > 28	static const struct of_device_id src4xxx_of_match[] = {
> >      29		{ .compatible = "ti,src4392", },
> >      30		{ }
> >      31	};
> >      32	MODULE_DEVICE_TABLE(of, src4xxx_of_match);
> >      33	
> >      34	
> > 
> 
