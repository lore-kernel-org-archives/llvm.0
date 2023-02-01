Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9107A21
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 07:54:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id cf42so28027542lfb.1
        for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 23:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0diAaeCGuTZlOnZxWXSitLoB/1kBFfQP3ozqLMthdrY=;
        b=lF1UqyudEA09FkqGGF5NmMuHvah8KKfPO3eWxAubAvEp7iQ9LhiLV+T8p4K8BfqCkI
         o5XDl4XUegL87wDptfNUHusoDNEWwR3kFLY8uWxHBNe6XtsuzkcfE7wHub8jBpu78zJ3
         8u1P4xOeiohBEfpUULqu61VPZz9Xew9ZVJI6Yz75XRZe614dAnDNrWbqS7E5xSrbl2U7
         96TkvetBtlpEr4RcP2JS1DfMs9a6a2wTTGBG1810gECpndWZgdeP3309sd66sbxpUGhw
         AE378mpGhvx2hHZVLhvgMzMtgL07iSV3ITOMMuFfTEgj1ZCx285Z7z0BsGCManr5FYdf
         DJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0diAaeCGuTZlOnZxWXSitLoB/1kBFfQP3ozqLMthdrY=;
        b=UFnrzm+5EM5QzwcpT25DSQDJNRU/BxCZA4/hIP9NUsf9OaV4G2lOsP+sR5tHwQMszn
         n7T7bN69q/umksTxzVpUfW0b10PSmdvLqTuAhUzwOLDxFklSgUPL/vFOvqSdD0oJFOwr
         lzo3nL4/6HIBv4dfXll9YlIwJvr5/JXVZdogGYO2M6KfptY4Tu6GvM12meA0pevWSIC8
         7k+Tu63OWwruoedx3B0BTKqyDQxDnjF4toV27lAVH55AObk1XLfMaW4gOigufMAxGRpz
         2US7XTRrCwNNEWjmXFE2gRF/qngHz3IhHkAAGVq2i8UU7lio3nk57Ru4v/cav9ZVg+jW
         SApg==
X-Gm-Message-State: AO0yUKXKSeEyEN7yOZhhCEPRp1eKZstmEKouWVqd7Yvq8k8cNd2AevwU
	kYEFahpMEanVA/vmcQ3F3QNLAFA9udXkwCAiOdRYqw==
X-Google-Smtp-Source: AK7set/pcUtZ6NpoWDLM7Q0eQN46Pgx8dTWbO5ck5QVBIuUe66c4GmhgfonlDo7ZR0OVUA9vhbz0YNjfIAEBW1Cds4k=
X-Received: by 2002:a05:6512:b01:b0:4cc:8686:8c87 with SMTP id
 w1-20020a0565120b0100b004cc86868c87mr152383lfu.188.1675238069550; Tue, 31 Jan
 2023 23:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000008be6b405f01164f8@google.com> <0000000000005eca3205f391aade@google.com>
In-Reply-To: <0000000000005eca3205f391aade@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Feb 2023 08:54:16 +0100
Message-ID: <CACT4Y+Ym4=mzMO6XNB0fYQJMo_QvUpYwkC1K7cmwr_XwKSdwzA@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in ntfs_set_ea
To: syzbot <syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Jan 2023 at 17:17, syzbot
<syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Oct 10 10:15:33 2022 +0000
>
>     fs/ntfs3: Check fields while reading
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d9c385480000
> start commit:   02bf43c7b7f7 Merge tag 'fs.xattr.simple.rework.rbtree.rwlo..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
> dashboard link: https://syzkaller.appspot.com/bug?extid=8778f030156c6cd16d72
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b8f57880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175ca3a3880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Check fields while reading
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable, let's close the bug report:

#syz fix: fs/ntfs3: Check fields while reading
