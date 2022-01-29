Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617003FE0
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 00:25:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id z5so7630006plg.8
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 16:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/pPDd+attnJsl63O2HKUbF+O/A8INXps1SnOP74pJYY=;
        b=ZmMi/m8mJU70T7Kv/C8oVf4m938D9oPY/i7w9HyEzZkX8ZQfLSDnpE465uNVFvLURo
         ELT2NuHM0MTPAW8GnUsQs++zggWqi4hdHYNbs0V7AI0WZNGufmb1W/5ByBln2lgdyMvf
         okoCuC10ZC/71OjePfylGC7ZDr5bId3WyBoOD6EOFfSZeZJpwptCqM31ranhTQyhKteY
         puWSQv7ULMBhJc5W+qpaOeEV4Ys8AVAe0OPlR/FNZY7M69fmq6fT8Bxan0k5vO5B7Ens
         Du5JmaOtNR4ivaexI8ja30CQjn2tycvyxuQVgpINjsegiOFatUZawO0VAulStkIHeVQ3
         yOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/pPDd+attnJsl63O2HKUbF+O/A8INXps1SnOP74pJYY=;
        b=aNIcccMGNg+r4VLDpFgbIy4FtyOqmvjbgvPwNFB5c/zlg6lvqSbWjbNH3yGZGeJFw5
         izKS4RG7d+cd4IY/WbS+fHKQ/FjsbTwkk8X32/7N+Ywq8sqNwuY2UnmwVs53udfH2kv2
         GcaKdgCFDGtF9knx6M5ugr3SyKZt7hrODYpmQK5LZqmVYKH5YFY41YtnCTU8Y2uf+zf3
         yqxkRGU3vFIzet+6oUUsDDzjnrPbI0KIiT/lpkkPNBSB/78+JHaHhi1kU6engRTmho2t
         soGB+5iNML3ZO1IY1BM3/ZKYBhpHO4QDfjinKTIyvFkAws3ngSrRg9oFbnm6QX68gqmv
         6dcA==
X-Gm-Message-State: AOAM530OAWEdbB/5GZOXSxCOVfLEkxiWJ39X6XPDpmuI9LT9R6iOwQen
	w7D3D3EZW3sv4wuXn5aIr+U=
X-Google-Smtp-Source: ABdhPJxGUBwrXIsIvWjyBvE7iD7hhKKZofoG8jdKEZkaAkI6iN89JrcM0KVp7Fklh5htvME7X79KGw==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr12833133pjb.20.1643415950815;
        Fri, 28 Jan 2022 16:25:50 -0800 (PST)
Received: from xzhoux.usersys.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id nn2sm3455850pjb.35.2022.01.28.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 16:25:50 -0800 (PST)
Date: Sat, 29 Jan 2022 08:25:43 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Tong Zhang <ztong0001@gmail.com>
Cc: Murphy Zhou <jencce.kernel@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1] binfmt_misc: fix crash when load/unload module
Message-ID: <20220129002543.hjintsmbjtprwugw@xzhoux.usersys.redhat.com>
References: <20220124003342.1457437-1-ztong0001@gmail.com>
 <202201241937.i9KSsyAj-lkp@intel.com>
 <20220124151611.30db4381d910c853fc0c9728@linux-foundation.org>
 <CADJHv_vh03bhn1FX2-jc6JoH3Hm6cRiWs+iXFO-coGy_yUY1Mw@mail.gmail.com>
 <CAA5qM4Btrnp9Te2pm0s=OuDk0ASTE3-LyLt8nf0fXKxhehXUgA@mail.gmail.com>
 <CAA5qM4DdvMNeG-PndWR9vb_jXTZ3v9aBXpW9QjV66DQFny65Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA5qM4DdvMNeG-PndWR9vb_jXTZ3v9aBXpW9QjV66DQFny65Wg@mail.gmail.com>

On Tue, Jan 25, 2022 at 10:33:22PM -0800, Tong Zhang wrote:
> On Tue, Jan 25, 2022 at 9:23 PM Tong Zhang <ztong0001@gmail.com> wrote:
> >
> > On Tue, Jan 25, 2022 at 9:04 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> > >
> > > Still panic with this patch on Linux-next tree:
> > >
> > > [ 1128.275515] LTP: starting binfmt_misc02 (binfmt_misc02.sh)
> > > [ 1128.303975] CPU: 1 PID: 107182 Comm: modprobe Kdump: loaded
> > > Tainted: G        W         5.17.0-rc1-next-20220125+ #1
> > > [ 1128.305264] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
> > > [ 1128.305992] Call Trace:
> > > [ 1128.306376]  <TASK>
> > > [ 1128.306682]  dump_stack_lvl+0x34/0x44
> > > [ 1128.307211]  __register_sysctl_table+0x2c7/0x4a0
> > > [ 1128.307846]  ? load_module+0xb37/0xbb0
> > > [ 1128.308339]  ? 0xffffffffc01b6000
> > > [ 1128.308762]  init_misc_binfmt+0x32/0x1000 [binfmt_misc]
> > > [ 1128.309402]  do_one_initcall+0x44/0x200
> > > [ 1128.309937]  ? kmem_cache_alloc_trace+0x163/0x2c0
> > > [ 1128.310535]  do_init_module+0x5c/0x260
> > > [ 1128.311045]  __do_sys_finit_module+0xb4/0x120
> > > [ 1128.311603]  do_syscall_64+0x3b/0x90
> > > [ 1128.312088]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > [ 1128.312755] RIP: 0033:0x7f929ab85fbd
> > >
> > > Testing patch on Linus tree.
> >
> > Hi Murphy,
> > Did you apply this patch?
> > Link: https://lkml.kernel.org/r/20220124181812.1869535-2-ztong0001@gmail.com
> > I tested it on top of the current master branch and it works on my
> > setup using the reproducer I mentioned.
> > Could you share your test script?
> > Thanks,
> > - Tong
> 
> I can find binfmt_misc02.sh on github, and running the following
> command shows: failed 0.
> 
> ./runltp -s binfmt_misc
> Running tests.......
> <<<test_start>>>
> tag=binfmt_misc01 stime=1643178454
> cmdline="binfmt_misc01.sh"
> contacts=""
> analysis=exit
> <<<test_output>>>
> [   90.908282] LTP: starting binfmt_misc01 (binfmt_misc01.sh)
> binfmt_misc01 1 TINFO: timeout per run is 0h 5m 0s
> binfmt_misc01 1 TPASS: Failed to register a binary type
> binfmt_misc01 2 TPASS: Failed to register a binary type
> binfmt_misc01 3 TPASS: Failed to register a binary type
> binfmt_misc01 4 TPASS: Failed to register a binary type
> binfmt_misc01 5 TPASS: Failed to register a binary type
> binfmt_misc01 6 TPASS: Failed to register a binary type
> binfmt_misc01 7 TPASS: Failed to register a binary type
> binfmt_misc01 8 TPASS: Failed to register a binary type
> binfmt_misc01 9 TPASS: Failed to register a binary type
> 
> Summary:
> passed   9
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=2 cstime=17
> <<<test_end>>>
> <<<test_start>>>
> tag=binfmt_misc02 stime=1643178454
> cmdline="binfmt_misc02.sh"
> contacts=""
> analysis=exit
> <<<test_output>>>
> [   91.133399] LTP: starting binfmt_misc02 (binfmt_misc02.sh)
> incrementing stop
> binfmt_misc02 1 TINFO: timeout per run is 0h 5m 0s
> binfmt_misc02 1 TPASS: Recognise and unrecognise a binary type as expected
> binfmt_misc02 2 TPASS: Recognise and unrecognise a binary type as expected
> binfmt_misc02 3 TPASS: Recognise and unrecognise a binary type as expected
> binfmt_misc02 4 TPASS: Recognise and unrecognise a binary type as expected
> binfmt_misc02 5 TPASS: Fail to recognise a binary type
> binfmt_misc02 6 TPASS: Fail to recognise a binary type
> 
> Summary:
> passed   6
> failed   0
> broken   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=3 cstime=25
> <<<test_end>>>
> INFO: ltp-pan reported all tests PASS
> LTP Version: 20220121-9-g010e4f783
> 
>        ###############################################################
> 
>             Done executing testcases.
>             LTP Version:  20220121-9-g010e4f783
>        ###############################################################

Ya, looks like it's working. No panic on next-20220128 tree.

Thanks,
-- 
Murphy
