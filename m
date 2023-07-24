Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6A10788
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 19:47:35 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a3a8d12040so9969327b6e.3
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 12:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690228054; x=1690832854;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpU/pq4NcXq5eoCMak+87h/qMFbXrT3YYZv+5M6Z810=;
        b=UWjGJ2BNieqr1QF1acS+vhwBfsPy/5ifLK5M9rdLbIDKtAdRuvR1ypJS5AgWwJGsoW
         DQO+W2c7BkaESHnaFn2g5Z1Ksv6pIeicd3utb5K0FGJg39asCjfjioe4WoP23UvBUTP5
         ri2ZY3IOqatKYrFCHjFdiQHpLdcydvqXWEZs9lDC6EOPvtMy/MM61Xb9Z8lbuyFHVl4d
         bXAasGvWaP6CQ2i1CbJanywfMT9+jVYb/Ymu8FoC8CQzNukJ7Wy1Xp8anrK6lWJS6eO/
         i+yXmiat8rGhe3QirZLxavXsDr/c6QKWJhWNHreVfl4pV+ky6uqdbepdtlf2U4PrsJfR
         0tEA==
X-Gm-Message-State: ABy/qLZmMb4VtWyeqyBaKt90+QcXtlLExAtIO/EFOAmUYnwi1gTJ4op1
	2arDLGEqorvYpvOiyRB5lj6mBCtWh2H25WvsuzuiiCX2ChoX
X-Google-Smtp-Source: APBJJlFhOkXgA1GDXy6ZXZyeXWFwikYSsd/PZ9QEgWnWucvf96IBK7XT0JXjTa9x+AGx3ADzu3aYiG7whxxn3I6COqeIsSFrzEVO
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1211:b0:38d:ca0a:8e18 with SMTP id
 a17-20020a056808121100b0038dca0a8e18mr20908707oil.2.1690228054801; Mon, 24
 Jul 2023 12:47:34 -0700 (PDT)
Date: Mon, 24 Jul 2023 12:47:34 -0700
In-Reply-To: <ZL7UedKQUDAUThHM@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cbc360060140e291@google.com>
Subject: Re: [syzbot] [modules?] WARNING in init_module_from_file
From: syzbot <syzbot+9c2bdc9d24e4a7abe741@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git on commit 910e230d5f1bb72c54532e94fbb1705095c7bab6: failed to run ["git" "checkout" "910e230d5f1bb72c54532e94fbb1705095c7bab6"]: exit status 128
fatal: reference is not a tree: 910e230d5f1bb72c54532e94fbb1705095c7bab6



Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 910e230d5f1bb72c54532e94fbb1705095c7bab6
dashboard link: https://syzkaller.appspot.com/bug?extid=9c2bdc9d24e4a7abe741
compiler:       
userspace arch: arm64

Note: no patches were applied.
