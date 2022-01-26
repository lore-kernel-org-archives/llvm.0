Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232A22C80
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 05:23:55 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v186so68238226ybg.1
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 21:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BmNhY6FQW/GrrzMUwo58dyScPyirrw0g3CZ9jNL4l2w=;
        b=qms8N3moNDRD+/zKbUAk2ww2ayLOF0zLPPwvXzOUoQNW27ceiMM7w9iOK3v6so+gFv
         NxdTlmmH8RVifgQL/YzfUl7HgFnwEoy/rnWgnnBc9El4tLvZ5Fwuh57Y2TQAhdIJS3Fr
         V+L1yjLtS40JNVvlZYPnQn/OyhNsOcYJZIpzC8Tc3EQtb/UHPxQbiE4+fZ9EAbQaEALp
         MxePubsggahRdW21qs9tuNKL7j6qJJi7vbMbHDN0ratudWKnO+tQPy1FFCECD7CNHvwN
         eprmhh68BqZ+0JG9eazFzxIIKgLaIbxWoxcqUZMTRgZAlUPdPiEstJV/LDzh1w6M8Q6Z
         vjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BmNhY6FQW/GrrzMUwo58dyScPyirrw0g3CZ9jNL4l2w=;
        b=rvS/fOtl8XIYPnZwmdTe+UUrBXAnE8aCttMZ1x7qo12lTXKJc4gqamM2en8tzwXRgL
         MfnLIdjYKTYErfP7FHbcUmX7dtRyNUwoYhoBagZsFzfXbMBZNIp8TmsQiAeByjlPdKR7
         0nTYR3fFC1UgVHFPws4Co8L19TmRJoXIF1Czz4P00oAJpABQJgjauZ8XoZg/zG4J2vLS
         p5JgdpIsOR+S/cTRTASjiRvt1A3wYW2oI3FFZmBo9kFVE34ad9gdNNnzChnINWkJx+D4
         WpeKlAIpbyUf02iEU/zdQfMXJcSs7fwfwKVKX0kLalUD6cYcebr8/aPB95AyK1GkqSZ1
         eoTA==
X-Gm-Message-State: AOAM533zpujFxzRumxpNNvAUBhS3xfwZbk4FHjUcEgY5N3Yf7e4RCDbh
	vRwTPQ0fc9au37wCyXYYREt6VXAz5dMf+02IiYk=
X-Google-Smtp-Source: ABdhPJwSAB5RAnuO1XryMa2zwDZqE9o0YmCGlcohJkr0T/0G49+lz8m3Wt8I/nqj9KzoPm/W9g5/SllzaZjqRNmuyPs=
X-Received: by 2002:a25:42d7:: with SMTP id p206mr34188694yba.182.1643174634013;
 Tue, 25 Jan 2022 21:23:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124003342.1457437-1-ztong0001@gmail.com> <202201241937.i9KSsyAj-lkp@intel.com>
 <20220124151611.30db4381d910c853fc0c9728@linux-foundation.org> <CADJHv_vh03bhn1FX2-jc6JoH3Hm6cRiWs+iXFO-coGy_yUY1Mw@mail.gmail.com>
In-Reply-To: <CADJHv_vh03bhn1FX2-jc6JoH3Hm6cRiWs+iXFO-coGy_yUY1Mw@mail.gmail.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Tue, 25 Jan 2022 21:23:43 -0800
Message-ID: <CAA5qM4Btrnp9Te2pm0s=OuDk0ASTE3-LyLt8nf0fXKxhehXUgA@mail.gmail.com>
Subject: Re: [PATCH v1] binfmt_misc: fix crash when load/unload module
To: Murphy Zhou <jencce.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 9:04 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
>
> Still panic with this patch on Linux-next tree:
>
> [ 1128.275515] LTP: starting binfmt_misc02 (binfmt_misc02.sh)
> [ 1128.303975] CPU: 1 PID: 107182 Comm: modprobe Kdump: loaded
> Tainted: G        W         5.17.0-rc1-next-20220125+ #1
> [ 1128.305264] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
> [ 1128.305992] Call Trace:
> [ 1128.306376]  <TASK>
> [ 1128.306682]  dump_stack_lvl+0x34/0x44
> [ 1128.307211]  __register_sysctl_table+0x2c7/0x4a0
> [ 1128.307846]  ? load_module+0xb37/0xbb0
> [ 1128.308339]  ? 0xffffffffc01b6000
> [ 1128.308762]  init_misc_binfmt+0x32/0x1000 [binfmt_misc]
> [ 1128.309402]  do_one_initcall+0x44/0x200
> [ 1128.309937]  ? kmem_cache_alloc_trace+0x163/0x2c0
> [ 1128.310535]  do_init_module+0x5c/0x260
> [ 1128.311045]  __do_sys_finit_module+0xb4/0x120
> [ 1128.311603]  do_syscall_64+0x3b/0x90
> [ 1128.312088]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 1128.312755] RIP: 0033:0x7f929ab85fbd
>
> Testing patch on Linus tree.

Hi Murphy,
Did you apply this patch?
Link: https://lkml.kernel.org/r/20220124181812.1869535-2-ztong0001@gmail.com
I tested it on top of the current master branch and it works on my
setup using the reproducer I mentioned.
Could you share your test script?
Thanks,
- Tong
