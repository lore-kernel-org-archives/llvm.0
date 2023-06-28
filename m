Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C724C8E3;
	Wed, 28 Jun 2023 15:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF122C433C0;
	Wed, 28 Jun 2023 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687966766;
	bh=kHh+sYBCt/nKBznzRlFaUB0KuqMGCD9lLNqnOwpcU4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trR9vzqoI7oumADi+xmhgUwnls6FmHdYHnhdtB6UhMD5V6+VYqGHkZhCqSUggYa2N
	 YTiNyyXaa4YXXEtILp8J57bAHOtrjvn72gV3kXN8IcYO8i+4H2REw4purf2ywHoK6c
	 LcHIrTV01NZgarNrdZMSSZ38krekzHYXJYy0Wc5FOGeRU49EIrVTG3yEP+LPp8h9kJ
	 ccQ90SkqPx4cYJ5VBpWdydBaO+eCYJTkponC5YxP2yBI8fVR7BQsyv4RAQvetUQMHm
	 Osm9t/xdpa+vlb1ubjuqp3ybqljuFlyqUuR3r1rMsUgQL8x8DXGeZw6cDfH1Vd/HxO
	 OrVG0EpdGmlAQ==
Date: Wed, 28 Jun 2023 08:39:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	kernel test robot <lkp@intel.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [EXT] Re: [linux-next:master 5324/12162]
 drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable
 'allowlist'
Message-ID: <20230628153923.GA254367@dev-arch.thelio-3990X>
References: <202306250025.savpMM8L-lkp@intel.com>
 <20230626065345.2i562lyf23fantlm@vireshk-i7>
 <PAXPR04MB8304F58EE8AE785A8B823C09EB24A@PAXPR04MB8304.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8304F58EE8AE785A8B823C09EB24A@PAXPR04MB8304.eurprd04.prod.outlook.com>

On Wed, Jun 28, 2023 at 01:33:40AM +0000, Zhipeng Wang wrote:
> Hi,
> 
> I'm sorry for responding so late. I have also tried to reproduce this issue many times and I have not reproduced it.

I can reproduce this with the configuration that the robot provided,
even with GCC.

  $ curl -LSso .config https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/config

  $ make -skj"$(nproc)" ARCH=i386 CROSS_COMPILE=x86_64-linux- W=1 olddefconfig drivers/cpufreq/cpufreq-dt-platdev.o
  drivers/cpufreq/cpufreq-dt-platdev.c:105:34: warning: 'blocklist' defined but not used [-Wunused-const-variable=]
    102 | static const struct of_device_id blocklist[] __initconst = {
        |                                  ^~~~~~~~~
  drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: 'allowlist' defined but not used [-Wunused-const-variable=]
     17 | static const struct of_device_id allowlist[] __initconst = {
        |                                  ^~~~~~~~~

The W=1 is the key here, this warning is not enabled in a normal build. This
configuration does not have CONFIG_OF=y, so of_match_node() is just defined as
NULL, meaning these variables are indeed unused.

However, I am kind of confused as to how the robot landed on 3b062a08698 as the
problematic commit, as I can reproduce these warnings without it.

Cheers,
Nathan

> > -----Original Message-----
> > From: Viresh Kumar <viresh.kumar@linaro.org>
> > Sent: 2023年6月26日 14:54
> > To: kernel test robot <lkp@intel.com>
> > Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>; llvm@lists.linux.dev;
> > oe-kbuild-all@lists.linux.dev; Linux Memory Management List
> > <linux-mm@kvack.org>
> > Subject: [EXT] Re: [linux-next:master 5324/12162]
> > drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable
> > 'allowlist'
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report
> > this email' button
> >
> >
> > On 25-06-23, 00:28, kernel test robot wrote:
> > > tree:
> > https://git.kern/
> > el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&dat
> > a=05%7C01%7Czhipeng.wang_1%40nxp.com%7Cb56973a98c0a4d280b3b08d
> > b761218c0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638233
> > 592364533126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat
> > a=l0W3DFSqCzfqoAhQfDNg78n7oghKqGh6U3eJiYu2e60%3D&reserved=0
> > master
> > > head:   8d2be868b42c08290509c60515865f4de24ea704
> > > commit: 3b062a086984d35a3c6d3a1c7841d0aa73aa76af [5324/12162]
> > cpufreq:
> > > dt-platdev: Support building as module
> > > config: i386-randconfig-r035-20230624
> > > (https://dow/
> > >
> > nload.01.org%2F0day-ci%2Farchive%2F20230625%2F202306250025.savpMM
> > 8L-lk
> > >
> > p%40intel.com%2Fconfig&data=05%7C01%7Czhipeng.wang_1%40nxp.com%7
> > Cb5697
> > >
> > 3a98c0a4d280b3b08db761218c0%7C686ea1d3bc2b4c6fa92cd99c5c301635
> > %7C0%7C0
> > > %7C638233592364533126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> > LjAwMDAiLCJQ
> > >
> > IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
> > lTqIr
> > > SUSMrl2NuciVHPbNVDL37S%2BDVLq4XJEUmECswA%3D&reserved=0)
> > > compiler: clang version 15.0.7
> > > (https://git/
> > >
> > hub.com%2Fllvm%2Fllvm-project.git&data=05%7C01%7Czhipeng.wang_1%40
> > nxp.
> > >
> > com%7Cb56973a98c0a4d280b3b08db761218c0%7C686ea1d3bc2b4c6fa92c
> > d99c5c301
> > >
> > 635%7C0%7C0%7C638233592364533126%7CUnknown%7CTWFpbGZsb3d8e
> > yJWIjoiMC4wL
> > >
> > jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> > 7C%7C&
> > >
> > sdata=rbR0wNca0Re2A1bcgnWWPd2fnN9MffgPeQWi6xAUXlU%3D&reserved=
> > 0
> > > 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > reproduce:
> > > (https://dow/
> > >
> > nload.01.org%2F0day-ci%2Farchive%2F20230625%2F202306250025.savpMM
> > 8L-lk
> > >
> > p%40intel.com%2Freproduce&data=05%7C01%7Czhipeng.wang_1%40nxp.co
> > m%7Cb5
> > >
> > 6973a98c0a4d280b3b08db761218c0%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > 35%7C0%
> > >
> > 7C0%7C638233592364533126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> > wLjAwMDAiL
> > >
> > CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sd
> > ata=Zw
> > > GhEuk0ektPmokBAcblpoWl12DI1nQV2KBwXvq%2FkAE%3D&reserved=0)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > | https://lo/
> > > |
> > re.kernel.org%2Foe-kbuild-all%2F202306250025.savpMM8L-lkp%40intel.co
> > > |
> > m%2F&data=05%7C01%7Czhipeng.wang_1%40nxp.com%7Cb56973a98c0a4d
> > 280b3b0
> > > |
> > 8db761218c0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6382
> > 3359236
> > > |
> > 4533126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> > 2luMzIi
> > > |
> > LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=7Bf57OarO
> > %2BQ1W
> > > | 16XJ0%2BIvKMiEIQHj0REd0Oztz5jH0U%3D&reserved=0
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused
> > > >> variable 'allowlist' [-Wunused-const-variable]
> > >    static const struct of_device_id allowlist[] __initconst = {
> > >                                     ^
> > > >> drivers/cpufreq/cpufreq-dt-platdev.c:105:34: warning: unused
> > > >> variable 'blocklist' [-Wunused-const-variable]
> > >    static const struct of_device_id blocklist[] __initconst = {
> > >                                     ^
> > >    2 warnings generated.
> > >
> >
> > Hi,
> >
> > Do you have any patch to fix this ? I am not sure why the error is coming here
> > and I am not able to reproduce it too.
> >
> > --
> > viresh
