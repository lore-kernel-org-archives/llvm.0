Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1D63C5
	for <llvm@lists.linux.dev>; Wed,  3 May 2023 08:13:47 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-33156204adcso7438335ab.1
        for <llvm@lists.linux.dev>; Wed, 03 May 2023 01:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101627; x=1685693627;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=gXOczpauFWnZWcDm4kl2flKZMulSXBBzQ+/CsCuSaFyQOnQlmgd74csXlUGNmJiTl0
         Yghlhpv8cCT0GdHu7MmSnRI7NDS8uUCl/OFh1ZauubGoMVwgdPPcQbgdn2tfxXdPfdcb
         HFszFpxH+uX4a54nNP96Ov2RkiOJr03odtuFeWcUh8z+Qgf+V4s8B+gxUZaLPIoeBBMh
         VjvjI97gINJYJI6n1iznZaH6e+HLoI4LD//XNrZx3oh4VdfwlhCI5Vh5abjb7psOJ96s
         CTblPA8col+NaKYfcZMvTq8cA59QHxiv58j4z62JQ3mrYcwdu6YemjZgfF6yssfKFVYb
         3EnQ==
X-Gm-Message-State: AC+VfDwpfTrKfsscUE/t8hPZL9vYxjNUOwUnwxOa7sBG1scfEER02euc
	BxHSrXu/J8iJV1SmX7tRU2MptTDfCl9xlb64XjCa4lXvD0S1
X-Google-Smtp-Source: ACHHUZ4NVzKP5o5qLjz8lnTbsNdZPzLd+UgjpGHxihuqz06jFvkDRLvZe3mMdYN+wHv4ymgQ9efnXeYiDcMRaRtdZ2IP0Ji28Jka
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:d484:0:b0:331:57f3:6af3 with SMTP id
 p4-20020a92d484000000b0033157f36af3mr1042879ilg.1.1683101627167; Wed, 03 May
 2023 01:13:47 -0700 (PDT)
Date: Wed, 03 May 2023 01:13:47 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bba0005fac5a2c6@google.com>
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
