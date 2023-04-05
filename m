Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393E7FC
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 08:12:44 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id c83-20020a6bb356000000b00758333e1ddfso21781248iof.14
        for <llvm@lists.linux.dev>; Wed, 05 Apr 2023 01:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682363; x=1683274363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=wN6bzPBWuaaG+MWRO0wP7kU4oXuwMosYMQYYrQMmvrxQpF7Pu7fGftN9NwwQHsEYTY
         zBiS8qIHsJVxdFdM/LJ81mGFnkw7Dvwtsmaxxmkr1m1W5dxNYtENvx9dJxoCOXHXjQHr
         oIgT7kxD8x4wzjlYNi9rysXyyAunFpptsf5KLLJWRf260vq+kkGdBtJbATIGSoy9e4U0
         Qzptkf0wJrYPBocQLxRgdQ03L+coN3ROI/Q9YqBCNx3ToYG1G9qHnRcTY9e4KXtU6N96
         oElwDmRYrkG3414hPdTRa5BtIPbRh6XYQ/yj3aaNEfK0XebfsqqtPLuBR4Dx0u+ZtuQQ
         FWUQ==
X-Gm-Message-State: AAQBX9dU9te4NjZPoE69752gZryctrgj7w7xfEBcXkiioJ4Clh0sHzuV
	Lf9etOhyydp0nlww1KcPV6/EyrtpF5r6/Je0Ab3LInaYVVg3
X-Google-Smtp-Source: AKy350ZyVVhmfk37CIGtaHVEI8ebtCHBWRXU7IGTuYY1ef3zGWS13ZFf/61/y86g7vr0rwkMISqHAld/pmURWrbxbO0dO3eRblY8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5d:8881:0:b0:753:2ab8:aff7 with SMTP id
 d1-20020a5d8881000000b007532ab8aff7mr3011620ioo.1.1680682363776; Wed, 05 Apr
 2023 01:12:43 -0700 (PDT)
Date: Wed, 05 Apr 2023 01:12:43 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045f34305f8925bd3@google.com>
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
