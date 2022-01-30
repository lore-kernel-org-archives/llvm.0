Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57329CA
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 20:35:15 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id nn16-20020a17090b38d000b001b56b2bce31so11684220pjb.3
        for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 12:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HhCfzXrJfpfzHpYFIeIiF4SObfvNlEvOkXD0dTt9Bes=;
        b=aI9B7t7nlxry+lWbS6lAs3mP/ob2ZO0xOgR5o3hf6lQhcxUVW2AI2w8Rw/O1FYynpm
         5Wy4OfR++fmAkF2jXLUfiV0nv5PFrdc2wfTBZ7QplaqtH/CKfgT6DdZRGusktwVOIItR
         9RmnWVnD0EyNXCq+BL+y3ASpxxKtKcmqgBPOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HhCfzXrJfpfzHpYFIeIiF4SObfvNlEvOkXD0dTt9Bes=;
        b=A9oYttWeos+x2ih2rK6ZzwRJ5qOWv521v9t3GpaMIpvGsBkwD2t0ms2yPC2rQYkNS/
         17MkJQzKRkAMFR+eAy+LV8JdtlrItZ4yWLNWAPdJ+IBgwY0fBsjybfE+gIV1Syqt1ELc
         KyGxni/Yp8XhFVglKhZ4pfrueAki9AlDRMPNCyEPpAnpWsVJwhhHQ8XjepI27I7yPapU
         nly6ytF7G2BFg1RLrA+SUVXplIBc57HqyTPmnxYDIcO3ZOwemzh1qXr1X6q1iW/DG16U
         BnYN6UCkkEBiznb/yCxp+LJPong/fak6Me2JI4Ti8qSJ/RsQTt+DAo/B0DzJO9kozrpv
         kEsg==
X-Gm-Message-State: AOAM530Yfr0m+sb2AiWu+MrFb/dRo6rrAvkf/v0nuH+/Vw9D9EYYXCKX
	y3UsRyk10ke2tqSJAFffubD1jQ==
X-Google-Smtp-Source: ABdhPJxcxIPFWYWKzE1XOlatp1pBNOxZIXCv9oIzp/3JWkb5ov8UyOIpHcJBVM75drURUF2dFlNWYQ==
X-Received: by 2002:a17:902:dcc9:: with SMTP id t9mr17491178pll.15.1643574914677;
        Sun, 30 Jan 2022 12:35:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l2sm16080704pfc.183.2022.01.30.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 12:35:14 -0800 (PST)
Date: Sun, 30 Jan 2022 12:35:13 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <202201301234.D62394C08@keescook>
References: <20220130183653.491292-1-keescook@chromium.org>
 <202201310303.HQlCsvvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201310303.HQlCsvvd-lkp@intel.com>

On Mon, Jan 31, 2022 at 04:13:30AM +0800, kernel test robot wrote:
> Hi Kees,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linux/master]
> [also build test ERROR on linus/master kees/for-next/pstore v5.17-rc2 next-20220128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Kees-Cook/lib-test_string-c-Add-test-for-strlen/20220131-023726
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220131/202201310303.HQlCsvvd-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/d22fe883339c5141953dbca980b51466ac3e2329
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Kees-Cook/lib-test_string-c-Add-test-for-strlen/20220131-023726
>         git checkout d22fe883339c5141953dbca980b51466ac3e2329
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash M=lib/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/test_string.c:188:30: error: initializer element is not constant
>      188 | static const int strlen_ce = strlen("tada, a constant expression");
>          |                              ^~~~~~

Thanks; this is expected -- the strlen() in -next is currently broken
(and will be fixed in the next -next).

-Kees

> 
> 
> vim +188 lib/test_string.c
> 
>    181	
>    182	/*
>    183	 * Unlike many other string functions, strlen() can be used in
>    184	 * static initializers when string lengths are known at compile
>    185	 * time. (i.e. Under these conditions, strlen() is a constant
>    186	 * expression.) Make sure it can be used this way.
>    187	 */
>  > 188	static const int strlen_ce = strlen("tada, a constant expression");
>    189	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Kees Cook
