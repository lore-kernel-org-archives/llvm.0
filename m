Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B962C82
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635773835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgWA21RbnVHNJqYVTGhY7Yn3OnV0VV8UOaMkbZYsosU=;
	b=FVzg9lAEDnPr4XaIsqBlDD7N0FQPYMc2FE31z3y882uvG29wqgwbql4uHAuMNE3IdWyfh0
	gu/KvreexshaXE3ng+2ac3pD5kihTr33aJOyoXiRjFRdqI32N8OsckMxBV5VvwFxRU6zBy
	NxgmlEl7Y9GLvbQmgG9boMOKfQnSAgo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-DKtAkwjeOgmby40eacLiow-1; Mon, 01 Nov 2021 09:37:11 -0400
X-MC-Unique: DKtAkwjeOgmby40eacLiow-1
Received: by mail-ed1-f72.google.com with SMTP id o22-20020a056402439600b003dd4f228451so15545668edc.16
        for <llvm@lists.linux.dev>; Mon, 01 Nov 2021 06:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wgWA21RbnVHNJqYVTGhY7Yn3OnV0VV8UOaMkbZYsosU=;
        b=mXOZ1PPRy8M5YW2cG9idPgtP4hvxAEeeyGwB1+HH/lkf4GNGvO4LvO96u5jVXxAbiP
         BPMQB4afJfy8xqOLrnC2ItOZUzAXHDIQMXIIgqKAM9ajjULcqnpTagBIt1jB3lK0+PIP
         NpAnjkuk64BXlzBXqr5U/X0Z0XEaFhEiZBgLez3FU2yY53ozGhYozcTt7bAgpm+WUc3w
         TASnrY+xDu9C34yzG3Fd/2xCbcrbigErPAvpR3KUZI50xz46mH0qt41b0tjoBdg2F3Su
         7CJDmr++UmPUGaannLQbI4Vb1WcrSqYhf8NXp9PJMNsgGa6GHOIC2vWGWl2XKPIVYfxh
         Ou6Q==
X-Gm-Message-State: AOAM533r0mgxn6XeBIPonYNjrum7uKkLxTnUdYM1OHj33rO61cP/yVUl
	cz9djvHAf1apMn6DFsc9r+coXcQHk8VTl8CHM764HLCYVFudqUn4Q4e9aQCW9UWMkByMduX985q
	HR+torLQhkEPDRw==
X-Received: by 2002:a17:906:7d48:: with SMTP id l8mr27921156ejp.106.1635773830180;
        Mon, 01 Nov 2021 06:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWZv3U+QmniDANZEr4DQ+HnTJLnVf970DRUk1goa2HV9d2mYiMDrbyzv10yCoN4cuvXH5n9w==
X-Received: by 2002:a17:906:7d48:: with SMTP id l8mr27921137ejp.106.1635773830030;
        Mon, 01 Nov 2021 06:37:10 -0700 (PDT)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id b2sm8919031edv.73.2021.11.01.06.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 06:37:09 -0700 (PDT)
Date: Mon, 1 Nov 2021 14:37:08 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: [rostedt-trace:for-next 58/100]
 samples/ftrace/ftrace-direct-multi.c:8:6: warning: no previous prototype for
 function 'my_direct_func'
Message-ID: <YX/thIXtDzfhljX7@krava>
References: <202111010507.F9ud1mUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202111010507.F9ud1mUL-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2021 at 05:46:26AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
> head:   93d76e4a0e0112b320c4f0e2a3930ad634628c58
> commit: 5fae941b9a6f95773df644e7cf304bf199707876 [58/100] ftrace/samples: Add multi direct interface test module
> config: x86_64-randconfig-r024-20211031 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/commit/?id=5fae941b9a6f95773df644e7cf304bf199707876
>         git remote add rostedt-trace https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
>         git fetch --no-tags rostedt-trace for-next
>         git checkout 5fae941b9a6f95773df644e7cf304bf199707876
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> samples/ftrace/ftrace-direct-multi.c:8:6: warning: no previous prototype for function 'my_direct_func' [-Wmissing-prototypes]
>    void my_direct_func(unsigned long ip)
>         ^
>    samples/ftrace/ftrace-direct-multi.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void my_direct_func(unsigned long ip)

hum, that can actually be static.. I'll check

thanks,
jirka

>    ^
>    static 
>    1 warning generated.
> 
> 
> vim +/my_direct_func +8 samples/ftrace/ftrace-direct-multi.c
> 
>      7	
>    > 8	void my_direct_func(unsigned long ip)
>      9	{
>     10		trace_printk("ip %lx\n", ip);
>     11	}
>     12	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


