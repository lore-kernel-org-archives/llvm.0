Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0728E8
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 15:29:19 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id w6-20020a6bd606000000b006bcd951c261so4525760ioa.2
        for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 08:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGvPUBMEmwEn0TdkvjUpBwVv8//3CS3caUnadTGNx2c=;
        b=NFNw+94eZgDovjfNCJFh2QgdPR8q+x8KXGMDV4RknynH5i3CtiEIUQpMfvc+BHrX3g
         PlYGC77alzk3WLelmyT/xyBsWFafFWV3Nht0cyqQ+t0gGF8TY+TsictqzI3OolWsRBk1
         4IX7Yu5UW4S0C6bPa4yhIgaVHt8g0cMbiurAdjyjDhAQhsJv3LUbdTiPHZobnC6BOPCf
         X5ixq2euOXtbmJQUip5E5ylUm+aFdAMVLXGyt4aBeFfOUNp1b9JaGh3PI2CHffj6Lh1+
         8N9Q73C6EjC9o9BVHD49AKhRttgCcXBFsGuO5+DZJXBO41ptGQOpWS4Mf73ylfMP46GR
         AXCg==
X-Gm-Message-State: ACrzQf1Jb4BMRlClebkx74BZi/qLpJ6IC9VlsdW6qeXoov9w/gWHf9+E
	iE/KV5aiyrvusbY+xaQ2Pnp9Y0QcG/NhlSgdFbIGJ3z0ma/S
X-Google-Smtp-Source: AMsMyM69hxBCHtw7/2qrDY0fKxAuiNmJIQhPdoRkK902NMT+PIh6vY8xF3mmbVikSsLhk9tBbIz22LRe00jRBK77aiqOumcNXqIW
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cf:b0:2f8:e698:51c0 with SMTP id
 s15-20020a056e0218cf00b002f8e69851c0mr31830983ilu.73.1666970958444; Fri, 28
 Oct 2022 08:29:18 -0700 (PDT)
Date: Fri, 28 Oct 2022 08:29:18 -0700
In-Reply-To: <20221028150501.5159-1-yin31149@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d4408a05ec19ebee@google.com>
Subject: Re: [syzbot] WARNING in btrfs_block_rsv_release
From: syzbot <syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com>
To: 18801353760@163.com, clm@fb.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yin31149@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/btrfs/block-group.c
patch: **** unexpected end of file in patch



Tested on:

commit:         493ffd66 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
dashboard link: https://syzkaller.appspot.com/bug?extid=dde7e853812ed57835ea
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=121ea041880000

