Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD72583
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 10:41:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id b185so4554464pfb.9
        for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Q8nIu0Rsw6KgcnS20mi7JEaEDHzrkWYM8DMs+/BzY=;
        b=II2sHQmmRtu+0dGDRmQU81xg03Y8pOisWMEDM7d7pco05ssgb2rZ9NsSOTO1uqORav
         8pLLJIxqwPdJOZf/Ot8L4gk1EwyxfWUMkLA9lTEpzXI+SWwOrQD/Eq/V8i9BwY+JKzwN
         +rI8Sp8nmxqI1S0Nt4krJQHV+sKkTzbE/3DaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4Q8nIu0Rsw6KgcnS20mi7JEaEDHzrkWYM8DMs+/BzY=;
        b=rN2uODZBSE4n+BzuUmT4jxLb0ZEgRvtoHvjQeiTNKqh9F+c5MP4yueU2ILU/HobTvL
         CXTOEsSlEu7f7dJapXKI1hOJpynTJK4kW952gIoGu0sORFvtp9+GExb1R6qEPpvR3zDS
         LMLmgAIXwWIg4J5eGJGaMAIexO/6yVxd0QS/7XGeMY4RXaSDuHkl9Assg7jh6y6I7RcF
         wlnJD2Rx/SW6jg4h24sNiAcGZUzkJsdaZD2mD8O8OPyn9nGFCLdRyEpgBrWpEM5eqRQ4
         eTksY7OtTT1Ol50qpKSK1j4ANbnS97q9zFa72JyK20o/EFzJ3us9rkTusezvwrQAXtrx
         OQ5g==
X-Gm-Message-State: ANoB5pnF3eH4JEyyqQRXrhuCsSo+1revm5YsovixgX4L5GtOFd0u2pWo
	isIMkgYyKxLeLd7uabasmoE5/w==
X-Google-Smtp-Source: AA0mqf5xrGosc5iI3cYWq4qcl/ehI2sTRTCHPCdWFJRh2x4nw/ET0QEtXz4u0pBkuQ6+hXsg3WiADQ==
X-Received: by 2002:a05:6a00:440b:b0:56d:9eed:61eb with SMTP id br11-20020a056a00440b00b0056d9eed61ebmr2149086pfb.4.1668163270303;
        Fri, 11 Nov 2022 02:41:10 -0800 (PST)
Received: from google.com ([240f:75:7537:3187:8d55:c60d:579d:741c])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902784600b001869ba04c83sm1344658pln.245.2022.11.11.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 02:41:09 -0800 (PST)
Date: Fri, 11 Nov 2022 19:41:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6603/7443]
 drivers/block/zram/zram_drv.c:1857:7: warning: variable 'err' is used
 uninitialized whenever 'if' condition is true
Message-ID: <Y24mwWWnRMw+KwmU@google.com>
References: <202211111624.1XZTuzHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211111624.1XZTuzHJ-lkp@intel.com>

On (22/11/11 16:27), kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f8f60f322f0640c8edda2942ca5f84b7a27c417a
> commit: 03e6c729aa640eed324de05dc588c05cc00d88d2 [6603/7443] zram: introduce recompress sysfs knob
> config: hexagon-randconfig-r001-20221111
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 463da45892e2d2a262277b91b96f5f8c05dc25d0)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=03e6c729aa640eed324de05dc588c05cc00d88d2
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 03e6c729aa640eed324de05dc588c05cc00d88d2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/zram/

Thanks. This was reported last night and we have a tiny "fixup"
patch for it.
