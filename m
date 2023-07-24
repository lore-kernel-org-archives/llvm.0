Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1A9470
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 19:56:34 +0000 (UTC)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1b44332e279so8840393fac.0
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 12:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690228593; x=1690833393;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0HbIfON9h7OtlOqGplVgAJ/Ron1dfOFrue7VmqDYzg=;
        b=St3aQpWYvwNVakzx7Kj3ssdei9cKmQDBvUkjpLPw59fuB2heBf9p1LAfCFTvuzBFNx
         rfOj1krHGP+N2nXU4d866AMfSoCExgxF2qpnZy9B0v7wecn9NSjsNSRBq6XMtqgV8peE
         1zvF6YUqRissXPhU4FLgM3x1g0uj3sU89oefxW6bmA095zF5ATkd/Zlit4z5DtBaDZWl
         6I++sDs2U3lBzxZiDQSpV+p8p3VmP/zL0DYXDT0/jzGMsBgSh6kubC+xWvSQKxbA5A7Q
         DX0+uGZ01FgwhMUmv8wVBTZMltMNB3yLmk3N6Ob4IyfbfqyR29NJyQOCh+VNULWMtncS
         W1Qg==
X-Gm-Message-State: ABy/qLYxoWDMP6QVGVAF5MstES5hEfFygGmCb3CNh3WQRUb6n9ZV8OkJ
	urlPe7ugmSejN390H5ZNEFrRudF2BJT+hnR2SrXmeOMOipJJ
X-Google-Smtp-Source: APBJJlGy8FHZDVrssAfEDgGHScfjKPZjYZWznrOxt65Wocsqqyr5rTphmuoPNIEOMBE7bKR1W0V4AWAMQMX5N468FTXqgMvgSHHN
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:955e:b0:1bb:51ab:a7bc with SMTP id
 v30-20020a056870955e00b001bb51aba7bcmr7056676oal.1.1690228593534; Mon, 24 Jul
 2023 12:56:33 -0700 (PDT)
Date: Mon, 24 Jul 2023 12:56:33 -0700
In-Reply-To: <ZL7Una9vhJpX+dkb@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e82d5806014102a7@google.com>
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in init_module_from_file
From: syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
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
dashboard link: https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
compiler:       

Note: no patches were applied.
