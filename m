Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B875C92
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 18:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2B6C433C1;
	Fri,  9 Sep 2022 18:00:08 +0000 (UTC)
Date: Fri, 9 Sep 2022 19:00:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [ammarfaizi2-block:arm64/linux/for-next/misc 2/2]
 arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function
 'do_softirq_own_stack'
Message-ID: <Yxt/ICkxAH/+tn08@arm.com>
References: <202209091157.akimiv18-lkp@intel.com>
 <a37a1b71-e7b4-4b7a-9aec-a9ce64d13d84@www.fastmail.com>
 <69409ea6-6daa-7973-c950-c6ca9ad96f50@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69409ea6-6daa-7973-c950-c6ca9ad96f50@bytedance.com>

On Fri, Sep 09, 2022 at 03:07:36PM +0800, Qi Zheng wrote:
> On 2022/9/9 14:30, Arnd Bergmann wrote:
> > On Fri, Sep 9, 2022, at 5:12 AM, kernel test robot wrote:
> > > tree:   https://github.com/ammarfaizi2/linux-block
> > > arm64/linux/for-next/misc
> > > head:   2d2f3bb897a3de4190b1b6b296c3429d01327554
> > > commit: 2d2f3bb897a3de4190b1b6b296c3429d01327554 [2/2] arm64: run
> > > softirqs on the per-CPU IRQ stack
> > > config: arm64-randconfig-r023-20220907
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
> > > 1546df49f5a6d09df78f569e4137ddb365a3e827)
> > > reproduce (this is a W=1 build):
> > >          wget
> > > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> > > -O ~/bin/make.cross
> > >          chmod +x ~/bin/make.cross
> > >          # install arm64 cross compiling tool for clang build
> > >          # apt-get install binutils-aarch64-linux-gnu
> > >          #
> > > https://github.com/ammarfaizi2/linux-block/commit/2d2f3bb897a3de4190b1b6b296c3429d01327554
> > >          git remote add ammarfaizi2-block
> > > https://github.com/ammarfaizi2/linux-block
> > >          git fetch --no-tags ammarfaizi2-block arm64/linux/for-next/misc
> > >          git checkout 2d2f3bb897a3de4190b1b6b296c3429d01327554
> > >          # save the config file
> > >          mkdir build_dir && cp config build_dir/.config
> > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> > > O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > > > arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function 'do_softirq_own_stack' [-Wmissing-prototypes]
> > >     void do_softirq_own_stack(void)
> > >          ^
> > >     arch/arm64/kernel/irq.c:81:1: note: declare 'static' if the function
> > > is not intended to be used outside of this translation unit
> > >     void do_softirq_own_stack(void)
> > >     ^
> > >     static
> > 
> > 
> > I think we are missing an "#include <asm/softirq_stack.h>"
> > in arch/arm64/kernel/irq.c
> 
> Indeed. Hi Catalin, do I need to resend the v4 version? Or can you help
> me to apply the following code change to the for-next/misc directly?
> Both are fine for me, depending on which way is convenient for you. :)

I'll fold this in, that's the easiest.

Thanks.

-- 
Catalin
