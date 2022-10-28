Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9632F28E8
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 16:25:19 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id f15-20020a056e020b4f00b002fa34db70f0so5392956ilu.2
        for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 09:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0M2eNGrrFy1lqBx+Mbj7u6/ivikymdyJDCkEXUlOf4=;
        b=YZbLDQEcmbiWyBI1ISN/IJDRCbTG/2EozLkpT/o2FqO8DnuKG7GDk6HwvDRK9U6ApL
         ohnfyJjiGr5/S+rSW53bOR+mLVcVeIBavYXRG4KQ/cIz0xJLwYqWAz4dlm8AD/3Z80vW
         lDgdrnZo6MbTzYjBMNMj4ZkJDS573L/vfDIwFFAcQ6mADyOIFIUN0765OF1Jc95FXnb7
         h9SXRKktC0zoxEgUTecZjR4CingQdLuA5xUIOCKkQqaja6QIyrAy6YnAsUn0gTqvsTOJ
         AFBPP89JhxJ1xgbOGx8loI1K9I3vulOyhgQFO8HL/IOErdX5MubWQM4LUja/zL3jY3Y3
         513Q==
X-Gm-Message-State: ACrzQf1Dl0tDzL3BYaU4hmZZWIICp8GuAj+xdJYi/7Li5Z6ybhMmxfMT
	/5zacY7HyLxBGAMNSKVsdWTzPorOAkKapJugsyWQrf70QO4p
X-Google-Smtp-Source: AMsMyM4+dAFAySyvCpcZ0y/ApLfH48HExaDis7YotuSsW4mMSrDjl7EZangPlAlQPtKflrLKT035o6bJhkEHpeYNzXQn4FKwZnPt
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bee:b0:2fc:793c:aa5c with SMTP id
 y14-20020a056e021bee00b002fc793caa5cmr127203ilv.126.1666974318783; Fri, 28
 Oct 2022 09:25:18 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:25:18 -0700
In-Reply-To: <CAKrof1NyNjozshnGPgxKHuBoKgnd79tC50M44UL_DfeVBad+Kw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ef38d05ec1ab476@google.com>
Subject: Re: [syzbot] WARNING in btrfs_block_rsv_release
From: syzbot <syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com>
To: 18801353760@163.com, clm@fb.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yin31149@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com

Tested on:

commit:         493ffd66 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17bdd716880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=dde7e853812ed57835ea
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11e315ce880000

Note: testing is done by a robot and is best-effort only.
