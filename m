Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB211FDA
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 08:12:38 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id 3-20020a6b1403000000b007588213c81aso1583671iou.18
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 01:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472758;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=wZ56gcfC7PE4ZJ2Rdqt2PQtEvg4t+1BmaSd8123aJ4xs8WJCewZ+ZR5LWmPhZ73eHw
         +WaXM96UyqhsNBY6iJSwo0v9kfnz9ZDkhKH7qNTHcv5KQICN9zSKWkyxn7WSNWHUAvzi
         CM6QgawMucZdOj6d13f6uH1LAZUTPxUoTeW6Jq2bleK/GauH/5rUlqo2RH9cfhYhcC4c
         t6yTDieEeWPGDn7LvHhq0NDMpyDWj0kSW30x7G0CizF19rS9EWzOsjyMokLNPwiO2STd
         utGO9KjhnS7VE185o1H4Dxjcv+5brp/uVibWvHSKXKVuspakaWfkD+LfPz5I/rPTfmCP
         22HA==
X-Gm-Message-State: AO0yUKVr9bsyrujxM8uqwiPWFHPlPP90Qqua5jK4KAWsSSlzI5K+yWVx
	ncsU2GV3H8Ueeu4O8icVGByw5cVqPuDj9wpMMvE3qJvNA1yJ
X-Google-Smtp-Source: AK7set+OeAVbohPc7fpUZXumhTbjxoLQEP7JyCfjRAlXeHVD1nz99SDwJbphcHiy2E96tJ+2fMwLwaeYs8l51/MGknUjMu6mQ3lk
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:128f:b0:313:fa72:d9aa with SMTP id
 y15-20020a056e02128f00b00313fa72d9aamr2273525ilq.0.1679472758036; Wed, 22 Mar
 2023 01:12:38 -0700 (PDT)
Date: Wed, 22 Mar 2023 01:12:38 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000027262305f778b938@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_listxattr
From: syzbot <syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dvyukov@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, zengheng4@huawei.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
ntfs: fix panic about slab-out-of-bounds caused by ntfs_listxattr()

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=9fcea5ef6dc4dc72d334

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos
