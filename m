Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BC7F;
	Wed, 14 Jun 2023 08:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E56C433C0;
	Wed, 14 Jun 2023 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686731109;
	bh=qv7ZrgSm9Ln/aGp/kiqgz0NRobfFBMT5o4e8ivb7x+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEW1hxUSaszh3VxIvcwfyXi4Kfr4/7zx/rnmonlUEXpqIcfOMqNCl2xpf+jGl3aRo
	 pP+g/7PcOB0y2YLmlHweHYKrz7mMiONUez4GsdQj4g6NCymOopkh4GEM36s3pgD1CL
	 rJ9GQ88EwtMSLv5c+I9yl12Pbwkzc2u0DHA5HLLj/HDOftvMZPN99VwuwamOQjgqdA
	 aLCo0Nhrx5iSl2xcBGGCb5OkqPY+PDnB2/mdxKkOvlhWTuDVqht+PBNmloGxZJPpnw
	 bSB3YoBZ8HlnyJWqulYay2+OMxOgl69hJ12uOP7XJH9fTgLu73bj2diiDv8Z00ubNA
	 YQTl8EuvYHM7g==
Date: Wed, 14 Jun 2023 10:25:05 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [linux-next:master 2238/9385]
 drivers/gpu/drm/i915/display/intel_display_power.h:256:70: error:
 declaration of 'struct seq_file' will not be visible outside of this
 function
Message-ID: <20230614-stadien-gasbetrieben-f9cbfc4343b8@brauner>
References: <202306132237.Z4LJE8bP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202306132237.Z4LJE8bP-lkp@intel.com>

On Tue, Jun 13, 2023 at 10:39:01PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
> commit: ef104443bffa004f631729dfc924f0b84abbd602 [2238/9385] procfs: consolidate arch_report_meminfo declaration
> config: x86_64-randconfig-r036-20230612 (https://download.01.org/0day-ci/archive/20230613/202306132237.Z4LJE8bP-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ef104443bffa004f631729dfc924f0b84abbd602
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout ef104443bffa004f631729dfc924f0b84abbd602
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306132237.Z4LJE8bP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <built-in>:4:
>    In file included from drivers/gpu/drm/i915/display/intel_display_power_well.h:10:
> >> drivers/gpu/drm/i915/display/intel_display_power.h:256:70: error: declaration of 'struct seq_file' will not be visible outside of this function [-Werror,-Wvisibility]
>    void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);

This seems odd. Arnd, any idea?
