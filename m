Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827A11C86
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 21:41:37 +0000 (UTC)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1bb72ad88f8so2203577fac.1
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 14:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690234896; x=1690839696;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=di6kLt4kiOi9HIX9Zl3sHUse4426YeJyuKx98IZXml0=;
        b=Vo42yDq9IKydowe5Te5e6vyfY2sxC9uHIZEL5h9nzUWCoKiCuIxObFpTbox/E6+3am
         iYf2zEp/ut/Tkzd+xGaVTZZp8EBEvfQIw1QRmtGoR+3TtOPhvseQW0dLZTo/FFqTnIaY
         iItA6dcKUNJqYOwt5BFTL6gDXeNu6B73pwbEar+YRlQcGLGtKWPtcihsneSn27eKg30z
         3DjKL7r0c4Y/tJZ2gbmqHlnEmtbQzuQcYcH3geOCc5I7EG8ccYx3jv9C7vWMIUupd1Dp
         O/luUtyACK/sFczsCMYL5ukMVzMTDFp/pe4ROH3yXVlE9iy3i5IkpAyCNSMPUS/H+7C2
         TwDA==
X-Gm-Message-State: ABy/qLZuvxMR22iN+oEwYASH4olw5q00o2fr5/8JsIIjdr/GLDSDE4JV
	mjRIPHWqB9PhWFVSsDDuD5WNi7Xn/GrDKm78Xh5898z2EFBC
X-Google-Smtp-Source: APBJJlEHgKxbiRqzAo1p5ExJxSaFpMdx4xL8bTDt7lWT7iVoKpAvcWJPdTYgcDdzSeBNd2JY6Wg309G2oeLjLyHxKN+KQCnnhWMe
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:c7af:b0:1bb:470c:901c with SMTP id
 dy47-20020a056870c7af00b001bb470c901cmr7990684oab.7.1690234896203; Mon, 24
 Jul 2023 14:41:36 -0700 (PDT)
Date: Mon, 24 Jul 2023 14:41:36 -0700
In-Reply-To: <ZL7fogwmV+JJcrVN@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009347d50601427a92@google.com>
Subject: Re: [syzbot] [modules?] general protection fault in sys_finit_module
From: syzbot <syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com

Tested on:

commit:         910e230d samples/hw_breakpoint: Fix kernel BUG 'invali..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=156bed06a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d182f762168e165e
dashboard link: https://syzkaller.appspot.com/bug?extid=9e4e94a2689427009d35
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
