Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D046A2
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 08:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655194040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u5FFZJbMGepFeO9MKDW07tv29kCIYqf1wa6DFklYaWI=;
	b=UClWx+8J/sCMaq7YYQTQU+I7zso/Vqyz/UPaxbpudtUmnqF2+SKU6A+Zb5iqAVr8rH1OI2
	wTOBVavRZgHdCNnJ0MfiuUL4JQKtcsKyKRA4k4TRMGk6e/uKV4EfzjkrcXOWcudWjeBivp
	Vc33Jdl1S3uZtLiPRAoGQIOhvbTI4jM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-HWYu0fGZMeidDFU_AegTkw-1; Tue, 14 Jun 2022 04:07:19 -0400
X-MC-Unique: HWYu0fGZMeidDFU_AegTkw-1
Received: by mail-lf1-f70.google.com with SMTP id br5-20020a056512400500b00479a5157134so4176637lfb.5
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 01:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5FFZJbMGepFeO9MKDW07tv29kCIYqf1wa6DFklYaWI=;
        b=e2jmBXtHxINLl0VbrVJMQ+nZUflRJzRGhfFTmzMZOQZN9lMivjXQ74fFm8g5RCYDH1
         8FgXVDrNl9a4r525OGFRhjUpipvJTEHpLdlBkl6qTQgYJrsXkeB/+r8cXDdPpi8cRiRM
         URsGkdFYuPUbAJrxvuTwAm6HAgY3/Sw8h3W2r+fr95cwYOvCp8YFM2okTwiZyiitcoaD
         xFHtU9naTt5wx57hIPcSVBXVtyoPPVDM4XRqFbGF7bcIX3h4QbVklqEVEK3jDXuY5V2H
         6RF2Dtrn7OWedbcCFCvFrjsH/vFPw034Z0QZzqGMH6kr2ysWe1tmJ66FqPWmJkyoAqzd
         nDgg==
X-Gm-Message-State: AJIora8Alhy3BI+UkszsglDGfP6DvT8FxglxdAjMKvrAYQcV2k3L4VbK
	cFTslU2xQA+gi4DwZcUn6OZBpsgQkABPJFg0Pj2GGRGMHmhQk6t+r4/gzaMYypRoRjeml4T+Xo5
	s8USLO/vEspXcMaPi0NuAKB/IqOClrg==
X-Received: by 2002:a2e:b52f:0:b0:258:f682:b7f9 with SMTP id z15-20020a2eb52f000000b00258f682b7f9mr1763711ljm.323.1655194037912;
        Tue, 14 Jun 2022 01:07:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYtiOBWY0tJ9aS6xRrlCbNlQLEAtW1TvYhCA79U27SkZcGBxHTt0UMcRLc5i+rhqg+eDwTO+tVYCm2j/ulmPY=
X-Received: by 2002:a2e:b52f:0:b0:258:f682:b7f9 with SMTP id
 z15-20020a2eb52f000000b00258f682b7f9mr1763698ljm.323.1655194037708; Tue, 14
 Jun 2022 01:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000008ea7ac05e09b46a6@google.com> <CACT4Y+Z8fdbQ9Kq1gHSha2q7a6RrOajbPKrSVCFyLNS95XkVgQ@mail.gmail.com>
In-Reply-To: <CACT4Y+Z8fdbQ9Kq1gHSha2q7a6RrOajbPKrSVCFyLNS95XkVgQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Jun 2022 16:07:06 +0800
Message-ID: <CACGkMEuK=bYcpNfjcsh64K0_-nYX2btw9Mi9uWsCYcfENBcHuA@mail.gmail.com>
Subject: Re: [syzbot] upstream boot error: INFO: task hung in hwrng_register
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot <syzbot+6da75abeed821109137b@syzkaller.appspotmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux@dominikbrodowski.net, 
	llvm@lists.linux.dev, mpm@selenic.com, syzkaller-bugs@googlegroups.com, 
	Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 4:36 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Sat, 4 Jun 2022 at 10:46, syzbot
> <syzbot+6da75abeed821109137b@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    032dcf09e2bf Merge tag 'gpio-fixes-for-v5.19-rc1' of git:/..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14409a93f00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=99f457384a4fea79
> > dashboard link: https://syzkaller.appspot.com/bug?extid=6da75abeed821109137b
> > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+6da75abeed821109137b@syzkaller.appspotmail.com
>
> +Jason, Laurent
>
> This started appearing at the same time as 'task hung in
> add_early_randomness" bug reports:
> https://syzkaller.appspot.com/bug?id=256d08cc261a3c38832064a33df4c928b3cd0ef0
> https://syzkaller.appspot.com/bug?id=be1d99e09e499aed3939dc678718371984104e5c
> https://syzkaller.appspot.com/bug?id=1cd11df5d984c694e3e7fc9fe271389b2340bed0
> https://syzkaller.appspot.com/bug?id=35496bafab4c3f81f0b0d6d72c69787300629740
>
> Is this also fixed by "virtio-rng: make device ready before making
> request" patch?

Yes, I think so.

Thanks

>
>
>
>
> > INFO: task swapper/0:1 blocked for more than 143 seconds.
> >       Not tainted 5.18.0-syzkaller-13760-g032dcf09e2bf #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:swapper/0       state:D stack:21080 pid:    1 ppid:     0 flags:0x00004000
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5116 [inline]
> >  __schedule+0x957/0xec0 kernel/sched/core.c:6428
> >  schedule+0xeb/0x1b0 kernel/sched/core.c:6500
> >  schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6559
> >  __mutex_lock_common+0xecf/0x26c0 kernel/locking/mutex.c:679
> >  __mutex_lock kernel/locking/mutex.c:747 [inline]
> >  mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
> >  add_early_randomness drivers/char/hw_random/core.c:69 [inline]
> >  hwrng_register+0x3bf/0x680 drivers/char/hw_random/core.c:599
> >  virtrng_scan+0x3e/0x90 drivers/char/hw_random/virtio-rng.c:205
> >  virtio_dev_probe+0xa03/0xba0 drivers/virtio/virtio.c:313
> >  call_driver_probe+0x96/0x250
> >  really_probe+0x220/0x940 drivers/base/dd.c:634
> >  __driver_probe_device+0x1f4/0x3f0 drivers/base/dd.c:764
> >  driver_probe_device+0x50/0x240 drivers/base/dd.c:794
> >  __driver_attach+0x35f/0x5a0 drivers/base/dd.c:1163
> >  bus_for_each_dev+0x188/0x1f0 drivers/base/bus.c:301
> >  bus_add_driver+0x32f/0x600 drivers/base/bus.c:618
> >  bus_add_driver+0x32f/0x600 drivers/base/bus.c:618
> >  driver_register+0x2e9/0x3e0 drivers/base/driver.c:240
> >  do_one_initcall+0xbd/0x2b0 init/main.c:1295
> >  do_initcall_level+0x168/0x218 init/main.c:1368
> >  do_initcalls+0x4b/0x8c init/main.c:1384
> >  kernel_init_freeable+0x43a/0x5c3 init/main.c:1610
> >  kernel_init+0x19/0x2b0 init/main.c:1499
> >  ret_from_fork+0x1f/0x30
> >  </TASK>
> >
> > Showing all locks held in the system:
> > 2 locks held by swapper/0/1:
> >  #0: ffff8881468d4170 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:835 [inline]
> >  #0: ffff8881468d4170 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1054 [inline]
> >  #0: ffff8881468d4170 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x353/0x5a0 drivers/base/dd.c:1162
> >  #1: ffffffff8d24ccc8 (reading_mutex){+.+.}-{3:3}, at: add_early_randomness drivers/char/hw_random/core.c:69 [inline]
> >  #1: ffffffff8d24ccc8 (reading_mutex){+.+.}-{3:3}, at: hwrng_register+0x3bf/0x680 drivers/char/hw_random/core.c:599
> > 2 locks held by pr/ttyS0/16:
> > 1 lock held by khungtaskd/29:
> >  #0: ffffffff8cb1eee0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x30
> > 2 locks held by kworker/u4:4/56:
> >  #0: ffff888011c69138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x796/0xd10 kernel/workqueue.c:2262
> >  #1: ffffc900013e7d00 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work+0x7d0/0xd10 kernel/workqueue.c:2264
> > 1 lock held by hwrng/755:
> >  #0: ffffffff8d24ccc8 (reading_mutex){+.+.}-{3:3}, at: hwrng_fillfn+0xec/0x470 drivers/char/hw_random/core.c:503
> >
> > =============================================
> >
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000008ea7ac05e09b46a6%40google.com.
>

