Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A007473;
	Mon,  6 Mar 2023 21:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8D6C433D2;
	Mon,  6 Mar 2023 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1678138557;
	bh=eeL3yF5/z9u8Q98xDXdcjhA5DDOEaAWf57JpsGEhuU8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g0cw6FRmCbUWP72trklrsURxRd99uhpLyvUjHO36/LYRwJmWJOOdx2jVC1DaXpDAg
	 iBR1FiZhH/739RX+huyT6g2K6OYyaJZ6CcS3DY9vptjmnxgWqhhCb1i7rEXRGrf089
	 IYfWs9vR19Rfve/+Fr1V777bGLlb2xShqFjF4T3c=
Date: Mon, 6 Mar 2023 13:35:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: ye xingchen <ye.xingchen@zte.com.cn>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 3/16] Inconsistent kallsyms data
Message-Id: <20230306133556.25521ed48724db0ef280c345@linux-foundation.org>
In-Reply-To: <202303042034.Cjc7JTd0-lkp@intel.com>
References: <202303042034.Cjc7JTd0-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 Mar 2023 20:40:53 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   8e66dbeb1a7d8e0dc9d392a5f29c2570ee9379a2
> commit: 21baac5614dc603df6cd2783a7427a0ce7689632 [3/16] Kconfig.debug: fix SCHED_DEBUG dependency
> config: arm-randconfig-r003-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042034.Cjc7JTd0-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=21baac5614dc603df6cd2783a7427a0ce7689632
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-nonmm-unstable
>         git checkout 21baac5614dc603df6cd2783a7427a0ce7689632
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303042034.Cjc7JTd0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> Inconsistent kallsyms data
>    Try make KALLSYMS_EXTRA_PASS=1 as a workaround

I can't imagine why this would happen :( I guess we wait and see if
others hit it and are able to fix.


But at least I get to fix a 10 year old bug!


From: Andrew Morton <akpm@linux-foundation.org>
Subject: scripts/link-vmlinux.sh: fix error message presentation
Date: Mon Mar  6 01:32:53 PM PST 2023

This comes out as

   Try make KALLSYMS_EXTRA_PASS=1 as a workaround

but we want quotes:

   Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

Link: https://lkml.kernel.org/r/202303042034.Cjc7JTd0-lkp@intel.com
Cc: kernel test robot <lkp@intel.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---


--- a/scripts/link-vmlinux.sh~a
+++ a/scripts/link-vmlinux.sh
@@ -291,7 +291,7 @@ fi
 if is_enabled CONFIG_KALLSYMS; then
 	if ! cmp -s System.map ${kallsyms_vmlinux}.syms; then
 		echo >&2 Inconsistent kallsyms data
-		echo >&2 Try "make KALLSYMS_EXTRA_PASS=1" as a workaround
+		echo >&2 'Try "make KALLSYMS_EXTRA_PASS=1" as a workaround'
 		exit 1
 	fi
 fi
_

