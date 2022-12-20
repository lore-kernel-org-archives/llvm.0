Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB23E8F63
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 20:11:20 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id n15-20020a056e021baf00b0030387c2e1d3so8911594ili.5
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 12:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTGxOoFEAUghGzFyM7fPV9A+UgVOuiHkhe1LVr5m9JQ=;
        b=FRsdqUdwyJrUGbyi+KQ6LZwJkRBJCQ2/h5IFPijC45iuQYy1PsgJaRlwWOWQ6a0AEu
         6rfRvOeiAEVmU9pwbuM366QkEGx3lBvvpxalEc+yWmSJzZ2T8CDWjE/HfqFdS0uK4JmB
         zpcSdZJdBaq0ityzS3pHsKnjQSqoSq5zvPzNUDV7PYwzUPUV/l4Btq8x8wo3p/0sqdcA
         1j7jGj33lR28HjdjnVVMA7/X/WYIicxSvv6AKwWlZ+EfS4QGD5D944bvEDqJfuvB1Ud5
         P6/ZQ3LNZBoIfKAW04xRu6blWqxrfDPP/u47vJatBcMnt4D+UA21GxQRVT0yvc5s/4BZ
         QD3A==
X-Gm-Message-State: ANoB5pl1YJM58D7lUm4QwieMZ8U4CbNYYXILZUceAiNFLfmW0mOxDOzy
	INUuCUWTPCzlk5INvSltFuDiQZ0UAJCt+ZGZFwCNtML3sxKk
X-Google-Smtp-Source: AA0mqf4i0Ckoew9uRuzELYUyCfvzuZI01Rm6xGBgj3U1BT1umfj764r5idt8+EJldNILxx7aK3iV5V6C6nNs2kJxxd1hLESgZGKn
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5e:870c:0:b0:6e2:cf0a:4f02 with SMTP id
 y12-20020a5e870c000000b006e2cf0a4f02mr4185685ioj.167.1671567080024; Tue, 20
 Dec 2022 12:11:20 -0800 (PST)
Date: Tue, 20 Dec 2022 12:11:20 -0800
In-Reply-To: <Y6ITdVe2DPTioPvc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005f23a05f0480a43@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in copy_array
From: syzbot <syzbot+b1e1f7feb407b56d0355@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file mm/kasan/kasan_test.c
Hunk #1 FAILED at 783.
1 out of 1 hunk FAILED
checking file mm/slab_common.c
Hunk #1 succeeded at 1335 (offset 2 lines).
Hunk #2 succeeded at 1407 (offset 2 lines).
Hunk #3 succeeded at 1415 with fuzz 1 (offset -12 lines).
Hunk #4 succeeded at 1435 (offset -12 lines).



Tested on:

commit:         c35bd4e4 Add linux-next specific files for 20221124
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
dashboard link: https://syzkaller.appspot.com/bug?extid=b1e1f7feb407b56d0355
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17af7bf0480000

