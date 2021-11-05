Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394E2C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 10:22:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b15so12056548edd.7
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 03:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=67g/16Zrh0Kxtmp5M9YzHHZvRj8XJzzpY2MX8AJR3cc=;
        b=aD+xqcgPV/MXOkur99WgvJZCB0/7YNGmqyxJCDBKrVDYsUXPkM2DKQx/BX4eMBChGE
         8/hic/T1epL2A6eXSPVFTjvMcktH3e04O4Uk7nX65hsyDJifgKv5HIR/7jBJx1b2CngD
         MUWaCjT4n26mcGzYd2lvn8NG2magx7x+ES0QYecVf3mMI4jEaYW7gc5ZUqGYTn3GxRKX
         QMVMkIJYhS4ReQMQUhbVcuogqtOWWGIrjtHPc6HwS4nBs0uKW98Wx4MIsX68Vpe7gqhs
         cRC4jmuR/SZUNcqLI+L2fGQpq9J+dCS5lmdyZzz+wJGVh92u4Ik9WP3SZoyxe3kENF7A
         G7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67g/16Zrh0Kxtmp5M9YzHHZvRj8XJzzpY2MX8AJR3cc=;
        b=4RZWRw7k+VJcOmwzmtUsfT0zYUT1ArCp6YuorPtSMR+CdiKevtXlGUTvM3UNIpHRR1
         feXkUQMvvii8AGaFY5Xhe9BABZZ3j6SEizOMO1A/ksOt43g/eVmCl1vYPl9c6iQJ+Z7G
         uOBYmWaqGSY8IjE+S3DgWlSSER20LtbMDHUz/6O99J2Sj00Zfh7ipn2GtXa9xFD2Lvmx
         3Hv399ezmYiDvZ6V+cjOuTy5iEITawUD05UpfNIfbjId90fzqBT4hCeoBWVxNBWS6PJ9
         LaKNIO1d/48ucKpyu27El5pF9vKe3LQrFg0t3r9zMjQdRL0iKjaw/QGyGDL5iL/8RTth
         VAIw==
X-Gm-Message-State: AOAM531j3lDP+kf7Day7BxMAYF38+Cu0VmJVQzaZJ8HZTW2d0Q1WgYMJ
	GGDfrN1ecVkg5XtuYFq341yB+IBSeoBVAIeu1eg=
X-Google-Smtp-Source: ABdhPJyQ8QgEkhTclPmA0LiYhDy5SN5jNlQGb3fx94SJBTWnhL9yOitBK+z8bFm/WQggIv+dxZjizkG01SoeS9tQGaI=
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr78350545edt.359.1636107744161;
 Fri, 05 Nov 2021 03:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111050644.9HQjbpIQ-lkp@intel.com>
In-Reply-To: <202111050644.9HQjbpIQ-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Nov 2021 12:21:48 +0200
Message-ID: <CAHp75Ve=ByJ+KMFXsH6sYQeM+FAzgYBX80TqdVfb5_YFLX3sdw@mail.gmail.com>
Subject: Re: drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking
 address of packed member 'pixelformat' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
To: kernel test robot <lkp@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 12:24 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c1e2e0350ce37f633b5ce3ce1cdf4428513fc2a2
> commit: e927e1e0f0dd3e353d5556503a71484008692c82 v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
> date:   9 months ago
> config: mips-randconfig-r011-20211101 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e927e1e0f0dd3e353d5556503a71484008692c82
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e927e1e0f0dd3e353d5556503a71484008692c82
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/media/v4l2-core/v4l2-ioctl.c:303:28: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]

Yeah, I discussed it with Sakari a few months ago. Dunno what is the outcome.
TL;DR: some are easy to fix, i.e. by dropping __packed, the rest needs
more thinking...


-- 
With Best Regards,
Andy Shevchenko
