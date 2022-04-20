Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BC10F3
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 16:39:45 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id e194so2420761iof.11
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JzS2G8lh8IFf105c1rGwkDws5NXApyWthp6AQcgQ72g=;
        b=UycO/TOyAzaFWtYuRL1zPTZPpSLu8Q9LC3yn+mV/OIoI6GRnKAxyF2IjUBFBljxOY4
         wFEzi5gvhlgDpWuBY4NPrIMekiM77ZYeMqB6FTZB8YTEnGgzMRJ858GPdAAWRc0PtJFt
         nFK3q2c+zxqlstAQuiElymuS6Ej8lULYzydds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JzS2G8lh8IFf105c1rGwkDws5NXApyWthp6AQcgQ72g=;
        b=1yE6Rqc1ywR1V4lGkXQKu12CdIv3HxkoA6JhsVZbx6U6PUyraJYwvpdb5pliLgwFpC
         uqNd8vo/nKG9TR4H5IAdrHg+46dqaOFETqgR3jqwYuIfbfn4hulDMJMXycWWlB1032oj
         Wa6/UzzV2xIV72Z4UdbA+vnPqXRMXXUAWXxQfLS7UETgId+jD6Zvo/IxQQzyeMAzf7RG
         od5RhNyWeefqxqCGcyG8A6It3qu/T45GjEaibOp0pXGDCf/KZT5mFa5MToOyZn88cn3D
         vd3nwTHMIOtgMcMCsGx6R/t7MFuD9Z3qXSuaQa0E1fwQZGVCuueKfWXIttUZHQ9mUUQo
         X7wA==
X-Gm-Message-State: AOAM532XSeEZcDQf6oMxI018YhBGNUzmIvKkTJSaSrNOMnaZK7IlczPS
	Ai4zcardeB9X/Yk7Vv4LS+GpCeqcEWzbKOcBa/Z23w==
X-Google-Smtp-Source: ABdhPJx4/BAeX68qPJZ8pZ+6C2GHRTFtvqy+1dPqrhWNa8EYBtp9UJv+wakF3VTU3A4yo2dvIBzU9lU0Uw6s1mC9UrU=
X-Received: by 2002:a02:2410:0:b0:323:fb30:183c with SMTP id
 f16-20020a022410000000b00323fb30183cmr10471216jaa.2.1650472784775; Wed, 20
 Apr 2022 09:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202204201732.oTzYh0Xo-lkp@intel.com> <20220420134918.GZ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220420134918.GZ4285@paulmck-ThinkPad-P17-Gen-1>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 20 Apr 2022 12:39:33 -0400
Message-ID: <CAEXW_YSieVAKUushETvppRAsbKrt0rkFrfYo8qgTK96tXwkqYg@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev 28/28]
 kernel/rcu/tree_nocb.h:1213:3: warning: misleading indentation; statement is
 not part of the previous 'if'
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 9:49 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Apr 20, 2022 at 05:57:46PM +0800, kernel test robot wrote:
> > tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
> > head:   ad68d8bf085421e4f22731c8b64c0b774a154e06
> > commit: ad68d8bf085421e4f22731c8b64c0b774a154e06 [28/28] rcu/nocb: Add an option to offload all CPUs on boot
> > config: riscv-randconfig-r024-20220420 (https://download.01.org/0day-ci/archive/20220420/202204201732.oTzYh0Xo-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://github.com/ammarfaizi2/linux-block/commit/ad68d8bf085421e4f22731c8b64c0b774a154e06
> >         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
> >         git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
> >         git checkout ad68d8bf085421e4f22731c8b64c0b774a154e06
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
>
> I am dropping this commit, and thank you for your testing efforts!

I discussed privately with Paul and things are a bit late for -next as
other testing efforts are underway. So we'll revisit this patch in the
future. Just wanted to clarify to the onlooker that Paul isn't
dropping it because of a NAK or anything ;-)

 Thanks,

 - Joel
