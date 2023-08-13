Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0212C9D
	for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 13:38:30 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1bb98659f3cso41017955ad.3
        for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691933909; x=1692538709;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=neJnpZX6yQ9QkvvT9QAkP8Ws3ecBujJ1QULkPMiV29E=;
        b=TBicTw0xO4y6s0UrTv/IxMnYk5PrRfad/kCtQBvdvgOItpB4cIzJlRkt0RHVnHCiav
         Itomg/YNI+GwUY4Rumh7QnaZDJt7gtPmyAjgfGhGfBnUTkuYWIg+laitNHMbUaNFaKEe
         UIwdB/BmNcfwSbi02cuaS/nuc8PlWbOB+1t2FxG7DsOYG92uw7QgF/SC16/4hVacBPJu
         teC0JWM4dNtkst4akt5Hk6+VTHZDDAYlWADDVtP53Va6ooXog+A1X0e9ikcsf+IHalxp
         UZklAjVv5gQdViWXlPkEdRr08rDtVmOTSwZivehZY76qgHuovmCzw4oClzSHa5HCZypT
         9/QA==
X-Gm-Message-State: AOJu0YyjwOmjOChf9np+vV35eoLL5FlquHJXyOZ04QReoPvvHjjVBE/f
	lDPNdMu07FfSu//Ez7gUUmDNIml8fM54aWDxBTmkTfvOgNbc
X-Google-Smtp-Source: AGHT+IFvUtqXr76zu2wT3itQvPjtzRoxdBW7cC6qINSUywu2YLhPJ1DCvGf+u/vcRaSITgKK9wNgpHfjYiUe7vo70HM9pGod+tZJ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:d4c4:b0:1bb:a78c:7a3e with SMTP id
 o4-20020a170902d4c400b001bba78c7a3emr2668812plg.3.1691933909651; Sun, 13 Aug
 2023 06:38:29 -0700 (PDT)
Date: Sun, 13 Aug 2023 06:38:29 -0700
In-Reply-To: <00000000000094ac8b05ffae2bf2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab16cf0602ce0f9d@google.com>
Subject: Re: [syzbot] [modules?] general protection fault in sys_finit_module
From: syzbot <syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	torvalds@linux-foundation.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f1962207150c8b602e980616f04b37ea4e64bb9f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 4 13:37:32 2023 +0000

    module: fix init_module_from_file() error handling

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=148a0a03a80000
start commit:   995b406c7e97 Merge tag 'csky-for-linus-6.5' of https://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=71a52faf60231bc7
dashboard link: https://syzkaller.appspot.com/bug?extid=9e4e94a2689427009d35
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d6670ca80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103be50b280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: module: fix init_module_from_file() error handling

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
