Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4C23D0
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 12:08:27 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-564b8c528f7so8029348a12.2
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 05:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692014907; x=1692619707;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJNRfP8cUatIsJc6YU7EUPAo/O9QZ6sb5iejP2DNk7g=;
        b=CFjmRA92HhUNDJzZEZWR2uMyruUUFQxiuAnqIBMkow0lCLcB5zrs9vOYDuAuDth153
         bxnKBFL+vjspvDr2RZZO9Qj6DkBlGPlj4nTOMzygqdTj9xn/1bqtZlG4ga4f3PtYklx8
         2tEsoMz9PRCT5dXjrpHx8m/VZ4/Ic8t2IsKNn2ZFk2RV50ewIvGjH/8L6NgwxVFuRPQP
         FmZPeMGmLmtMXdPwxXJMrBWACDOT+v2usAdJOAKUmKSSCG/lCkH6cgieoJTp/EIQ+SjI
         6XHouAkpR6Ht0XG7j6VUMEjfqgHYJMSn3uDFN8jEp6nh6PgSDAddZql6koKLEFEQ9quL
         gD/Q==
X-Gm-Message-State: AOJu0YyYY49tjj6VgSkWIWoSNO6EXCEptA00X7zjQkYo18qBrVXf4goR
	Ykm1Oa6FmwBk2Md2sZj+nFep9h8MlI+0pi2WJKNiig3VXqMS
X-Google-Smtp-Source: AGHT+IGfcIkUiHrqX6S1IiQDnpfA7pI0z5lomwAUYnqquL64y/gfrx5YhhnnQ+4btgQR6c0hoTwQIEUozbHJHcQ6cTPptARUW4Gu
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:c94b:b0:1b8:97ed:a437 with SMTP id
 i11-20020a170902c94b00b001b897eda437mr4164664pla.4.1692014907452; Mon, 14 Aug
 2023 05:08:27 -0700 (PDT)
Date: Mon, 14 Aug 2023 05:08:27 -0700
In-Reply-To: <0000000000000e4cc105ff68937b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083735b0602e0eb7d@google.com>
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in init_module_from_file
From: syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linan122@huawei.com, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	llvm@lists.linux.dev, mcgrof@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nogikh@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f1962207150c8b602e980616f04b37ea4e64bb9f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 4 13:37:32 2023 +0000

    module: fix init_module_from_file() error handling

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17c80763a80000
start commit:   995b406c7e97 Merge tag 'csky-for-linus-6.5' of https://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f27fb02fc20d955
dashboard link: https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12219fbf280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1278c8a4a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: module: fix init_module_from_file() error handling

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
