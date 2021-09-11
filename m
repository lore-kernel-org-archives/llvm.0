Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED633FC3
	for <llvm@lists.linux.dev>; Sat, 11 Sep 2021 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MiKD/3VblObUlCghGk2DElY4TP2D0ZiLYLEamH4ybBQ=; b=w98jPBYpmugVA+Sm4g8tTo3/dq
	UyBLuCxHre20NV4EK+0EBSID+3Q8zb0pQHhPQZESXhf4zHESgUf60sELSaSM5MWwU/IEWJBZylGpN
	j9y4HXdQ9iJdgeBls8Xn9TELg+t7ODMOxzvSvIZxmqU3pUIM3I67Z5Id6uAHHOHloHPak6qnSf1yA
	D/TavWc2rWL+IPEHTvZbHepuITLBC8VxE5D1Aqqzo5BQnuF7DE7fH2dMRbJA6yyR5R+nSIKg6Wl5m
	E1sAxP277oZy08Bu3S5OW6HGSA3SYox+8wlGb2/jfAKHK41qqBe7zjb63D/m9gRwZ0HO4Z54nLyhW
	PtcaMwnA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOrBv-00E5K2-Gg; Sat, 11 Sep 2021 00:48:23 +0000
Date: Fri, 10 Sep 2021 17:48:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>
Subject: Re: [mcgrof-next:20210908-firmware-builtin-v4 2/11]
 drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous
 prototype for function 'firmware_is_builtin'
Message-ID: <YTv817Srt8hoySP5@bombadil.infradead.org>
References: <202109101524.pjY4q0Dy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109101524.pjY4q0Dy-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Sep 10, 2021 at 03:41:31PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20210908-firmware-builtin-v4
> head:   1c69d6a17750179d68bcaf6b16f9a08d2e475989
> commit: 79e9fce20ee88ffe37542a66277628e6c53dde14 [2/11] firmware_loader: formalize built-in firmware API
> config: hexagon-buildonly-randconfig-r004-20210910 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=79e9fce20ee88ffe37542a66277628e6c53dde14
>         git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
>         git fetch --no-tags mcgrof-next 20210908-firmware-builtin-v4
>         git checkout 79e9fce20ee88ffe37542a66277628e6c53dde14
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=hexagon 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/base/firmware_loader/builtin/main.c:36:6: error: no previous prototype for function 'firmware_is_builtin' [-Werror,-Wmissing-prototypes]
>    bool firmware_is_builtin(const struct firmware *fw)

This is a lie though its defined on drivers/base/firmware_loader/firmware.h

>         ^
>    drivers/base/firmware_loader/builtin/main.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    bool firmware_is_builtin(const struct firmware *fw)
>    ^
>    static 
>    1 error generated.

I get these odd errors:

Compiler will be installed in /home/mcgrof/0day
cd: received redirection to
`https://download.01.org/0day-ci/cross-package/'
lftpget -c
https://download.01.org/0day-ci/cross-package/./clang_hexagon/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl.tar.xz
tar Jxf
clang_hexagon/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl.tar.xz
-C /home/mcgrof/0day                                                    
make --keep-going
HOSTCC=/home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/clang
CC=/home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/clang
LD=/home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/ld.lld
HOSTLD=/home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/ld.lld
AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump
OBJSIZE=llvm-size READELF=llvm-readelf HOSTCXX=clang++ HOSTAR=llvm-ar
LLVM_IAS=1 CROSS_COMPILE=hexagon-unknown-linux-musl- --jobs=24
ARCH=hexagon
  SYNC    include/config/auto.conf.cmd
    HOSTCC  scripts/basic/fixdep
    /home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/clang:
    error while loading shared libraries: libtinfo.so.5: cannot open
    shared object file: No such file or directory
    make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error
    127
    make[2]: Target '__build' not remade because of errors.
    make[1]: *** [Makefile:594: scripts_basic] Error 2
    make[1]: Target 'syncconfig' not remade because of errors.
    make: *** [Makefile:771: include/config/auto.conf.cmd] Error 2
    make: Failed to remake makefile 'include/config/auto.conf.cmd'.
    make: Failed to remake makefile 'include/config/auto.conf'.
      HOSTCC  scripts/basic/fixdep
      /home/mcgrof/0day/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin/clang:
      error while loading shared libraries: libtinfo.so.5: cannot open
      shared object file: No such file or directory
      make[1]: *** [scripts/Makefile.host:95: scripts/basic/fixdep]
      Error 127


I have a feeling these issues are not correct...

  Luis
