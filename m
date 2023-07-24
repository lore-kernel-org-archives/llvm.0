Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43075DDC8
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 21:18:23 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6b9d8b76be5so9392418a34.1
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 14:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690233503; x=1690838303;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fISgzzCd91Gj2U/gkz81qNRRRlc1K+b9y/Uqzybe3fQ=;
        b=G9WndXOG6MqvUxOm+3hJRRTKVjNZALPEZ+5jNfHzTYuWCfh9CZAKGVA+eJhG3sjKH7
         JD923k3JyPfxoCWxQBThz4yxaZQLXxv90L/v0EHvfSj2lGWKws1VSOTM7rF0DM5x2XA9
         hOtGZvxeXZodnoy57AyIdvopAxFKoQUcz58IcDw3IwdtSW2jQaxg5hfLU4hJjzcL/ha4
         4Pgelf+NhiXQ7gAUBk2LER1j7a7G+y/xeeks9+v2hFyHy3Gd3bcEpznMzUKGfboUFj99
         F3KKOMKwfmrNKGIJLf9F1FwpsMpn8qkwLQjVK5TUtf5lJQ4xVrnxlbgWGmkgOmAPniYW
         OwDA==
X-Gm-Message-State: ABy/qLaYqcKFUE+gng84efPHT3In8sm+VdWKz4aHZAxZLZFsnrbleOXR
	UWC1f9h+JgetCqKQMN1NSkN8DsmAGmyUwsrQsNopaQYF8tZg
X-Google-Smtp-Source: APBJJlHk6oTqxAMI0w9v9Q+HPlsKWKA/HtbUSkECk0SsualRSe5kQSUlByEONDF4yteCaaof/kh7pLqOuhIdzPmNrCyk5HqO1DGU
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a9d:7488:0:b0:6b9:f343:acfd with SMTP id
 t8-20020a9d7488000000b006b9f343acfdmr9566732otk.5.1690233503160; Mon, 24 Jul
 2023 14:18:23 -0700 (PDT)
Date: Mon, 24 Jul 2023 14:18:23 -0700
In-Reply-To: <ZL7fllo9Td1gJmHo@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b1f3e06014227e6@google.com>
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in init_module_from_file
From: syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com

Tested on:

commit:         910e230d samples/hw_breakpoint: Fix kernel BUG 'invali..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11e83081a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=34364e75687fa9c3
dashboard link: https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
