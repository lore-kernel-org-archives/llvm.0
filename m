Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8F8825
	for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 16:02:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99d90ffed68so252526466b.0
        for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691942549; x=1692547349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5ugHtb+gFLqHmdHj/rIBNWAy0u9pV9CjmqakNJzIxY=;
        b=Oj0mSsS46jeV/oUT5MAXfcjss6McfNfiKYQrraiQMRL8sTJBw4d8L4S8yxi/lYj7/A
         7r3S5rxoqAmN6oWXyEodKqbZEwXf6+pND145SyK6r7I//24q0FiBkBdxVi4vJltOF7bT
         lO4vZDPaKABMHKqKaR3tn6kp7YpOPeVcnRgOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691942549; x=1692547349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5ugHtb+gFLqHmdHj/rIBNWAy0u9pV9CjmqakNJzIxY=;
        b=Qqt6YjZu3enfgWZG44nFqepokyPq54n/Rqk1eFF5bLVvb6BnasSmkQMUPLHBU6+H9n
         t/u7sW+WwiVX16cFuZW8LEvk8IvmqY+1SC8YmwkVIEBAp113eX0oYEEeLxacdoMwa1Va
         y6YeLlKKhBADHUkUlleG7GjQv+lGgzWFGSJezVF0+CEAejvN/Q5mJPDCFg0qc6pMomwX
         gUwEmKOKaWmHtJAJiR3HfH7doNi+X+ZDxT64c3vGNfv0QeGJeEt3QW6A8dcBSqMKlDhB
         IKNcnvAR+m76ND4RsX8MdskEUAvGg/Q8W3ujpU1gfjLJsb3aNMV5BgZd5GkWJt+OHUGi
         0eyw==
X-Gm-Message-State: AOJu0YwWL6Et9P+7SWGv4EP9EjEM0EacxiBDZh5N4Gj6zDgSi8pjjPwP
	6QywPyV3HjCYGIlSDk8Tnf4LYErrdkNlhLqrLZsOOoJ6
X-Google-Smtp-Source: AGHT+IFJ8vaE/sVSGQ3FOoyNnz8ByWr9l22PNTo9o43eKgnilYCd86fXmRpa2kAEmTFPXsuBoI4d9Q==
X-Received: by 2002:a17:907:2717:b0:99b:4bab:2841 with SMTP id w23-20020a170907271700b0099b4bab2841mr7679604ejk.26.1691942548700;
        Sun, 13 Aug 2023 09:02:28 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id d18-20020a170906345200b0099297c99314sm4730641ejb.113.2023.08.13.09.02.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 09:02:27 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so7414515a12.0
        for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 09:02:27 -0700 (PDT)
X-Received: by 2002:aa7:c683:0:b0:523:3e27:caa7 with SMTP id
 n3-20020aa7c683000000b005233e27caa7mr6430259edq.20.1691942547533; Sun, 13 Aug
 2023 09:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000094ac8b05ffae2bf2@google.com> <000000000000ab16cf0602ce0f9d@google.com>
In-Reply-To: <000000000000ab16cf0602ce0f9d@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Aug 2023 09:02:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsitvsCyu0+Pu8Hdmzd6XaCjugktE5aQVjUbCRYgQU=Q@mail.gmail.com>
Message-ID: <CAHk-=wjsitvsCyu0+Pu8Hdmzd6XaCjugktE5aQVjUbCRYgQU=Q@mail.gmail.com>
Subject: Re: [syzbot] [modules?] general protection fault in sys_finit_module
To: syzbot <syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com>
Cc: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Aug 2023 at 06:38, syzbot
<syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit f1962207150c
> ("module: fix init_module_from_file() error handling")
>
> dashboard link: https://syzkaller.appspot.com/bug?extid=9e4e94a2689427009d35

Looks right. Apparently syzkaller had two different bugs attributed to
this. It was already marked as fixing syzbot issue
x=9c2bdc9d24e4a7abe741

#syz fix: module: fix init_module_from_file() error handling

             Linus
