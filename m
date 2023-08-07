Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87D17736
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 22:09:47 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6bc9d79cbf6so8998264a34.1
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 15:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691446186; x=1692050986;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbpbMWxtwQHfKpcdmTM26gLkMYaV2V50D6axm5j5Juw=;
        b=SaLCkNGsZThne8MKII46Y/LbHU1Z/Llrk3fkZ3OboFdeQRQ91QkisLwHvbpH+cfkTp
         MhriTS9fc4b+xJT/57+W9qoJNSdAoBBfJdY8o0lNGIwJ6z0XFVmzmSWV6fBDel30oF8q
         Qcn6JtxG+i2ti0gZDeZrEtUo8SusN9ZeGoHtwitsM7yH3b4O2DHgs+pC2PGqRy4HogVt
         Q3MpFc+M/EYl1CVcwW5mIUhCUGh76g4F7YOw62HVHoin3t/V9SR0UUtJqunzqzkwkT17
         i8En6usQxfDU/lCvLLYn57/PLO2fYcvQoqQkcgRBRtzYwwfFYClKKEK27xMnvK9vYrns
         pGbA==
X-Gm-Message-State: AOJu0Yzw2FixkTnlJDR1gAKPL92oi3fZuA8N7hORzLxlAy1BxBRDgHs7
	Rv3CcpGcTqhsIkY/BNiiYOWMyGEt+FPtm3jlVZf9/H0kIzvN
X-Google-Smtp-Source: AGHT+IEduFwtdxrh+dLlyzbh5NbikP80BVHQF2BeYV5I9pFjtdMLw1auLZ7MNsAr6GJ8o7Xm4UJOf0qu7vj4mp34E3NWMDrQCIWQ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:148c:b0:6b8:c631:5c5a with SMTP id
 s12-20020a056830148c00b006b8c6315c5amr12630266otq.4.1691446186238; Mon, 07
 Aug 2023 15:09:46 -0700 (PDT)
Date: Mon, 07 Aug 2023 15:09:46 -0700
In-Reply-To: <0000000000000e4cc105ff68937b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000166f9e06025c8139@google.com>
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in init_module_from_file
From: syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linan122@huawei.com, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	llvm@lists.linux.dev, mcgrof@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, song@kernel.org, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 125bfc7cd750e68c99f1d446e2c22abea08c237f
Author: Li Nan <linan122@huawei.com>
Date:   Fri Jun 9 09:43:20 2023 +0000

    md/raid10: fix the condition to call bio_end_io_acct()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15c26ba9a80000
start commit:   a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5e1158c5b2f83bb
dashboard link: https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12518548a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124ccf70a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: md/raid10: fix the condition to call bio_end_io_acct()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
