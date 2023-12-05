Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960636A020
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS363X2o"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d0a5422c80so22448225ad.3
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701801506; x=1702406306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5TUAzi7j6XeiF4+c49iyLDkQjLI2ZKA3/LaFVYktmw=;
        b=cS363X2ov9R+GaC8G14e0GUDuKidc/X/CbhHpax2OjwkRzWkdyroyNzWG+mlloK9qX
         QVwY2mNjvf33UZHdvBW6UQ33cTmKo7zvaSlv3VLHkcshviaFH0Q8uxq2BUQnts8VQqjU
         HZL1Z9rN0b22HRZ4wr+YQkMVMYNCLzYFhxk4YincryW253myiUWgu3SpooFXPp1ZvMzw
         XziVnp+MJwzoSdhnn8ajdHp64d0/AmuRYl5qokqZQM2SZW5nllyXXen1e5VtxXtOcT+d
         DVF/TDAj+03CsB7Wo+7hlpO0lWpUoFNRPiWDOK3wR388CVsfsfETCewbjhwo8sQLfxPn
         L5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701801506; x=1702406306;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5TUAzi7j6XeiF4+c49iyLDkQjLI2ZKA3/LaFVYktmw=;
        b=EBN/EHn7cnAYcwt26FnzAZBtodScHQ0eZi3Tz4VwHYSrsZQVpzhIwy0mZaNUtQin0+
         igceRQPVD4EXkrLOwmQq1Ug0/JQnC9QY5cP7BbAwmZcUSQPYPb7NakLR9ko18N8w9AVS
         bwM/XagdIgm6K5yq+4OQ5MV2hrV6H8h6kOCU3UaVtropkbPWOp6SM3tCVOSj1y5qEouc
         baoFuSUc3CIrWI01ZxkSRoBJ9W3CznZLBS40nlhU+VN9YqAb0J6vGAeSLklxB33Rk1Wl
         fZjEl5xHPlJd/h+EEda/H5jxO6m+bO9WQNEv0TVZxrKSkaRzbIEP3BoML2LsN+vkGzPH
         1uKg==
X-Gm-Message-State: AOJu0Ywnp7zP7CTBG/5/yTgFEN6X17C5oJKM7Cgo5/LyZp2Ko2nJqfx9
	tSbJSaKwkF1GkexyW5FHiXI=
X-Google-Smtp-Source: AGHT+IHK2rlOIoxSOejGVPqn/6zmQ7Wz5TlFj7g3GnusOfOePMb5aG/wfh8ryyMjsb6DEOLUnGaiCg==
X-Received: by 2002:a17:902:e804:b0:1d0:9e59:35e2 with SMTP id u4-20020a170902e80400b001d09e5935e2mr4843794plg.123.1701801505837;
        Tue, 05 Dec 2023 10:38:25 -0800 (PST)
Received: from localhost ([98.97.116.78])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b001cc131c65besm10574713plg.168.2023.12.05.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:38:25 -0800 (PST)
Date: Tue, 05 Dec 2023 10:38:24 -0800
From: John Fastabend <john.fastabend@gmail.com>
To: syzbot <syzbot+06dbd397158ec0ea4983@syzkaller.appspotmail.com>, 
 andrii@kernel.org, 
 ast@kernel.org, 
 bpf@vger.kernel.org, 
 cong.wang@bytedance.com, 
 daniel@iogearbox.net, 
 davem@davemloft.net, 
 dsahern@kernel.org, 
 edumazet@google.com, 
 john.fastabend@gmail.com, 
 kafai@fb.com, 
 kpsingh@kernel.org, 
 kuba@kernel.org, 
 linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 nathan@kernel.org, 
 ndesaulniers@google.com, 
 netdev@vger.kernel.org, 
 pabeni@redhat.com, 
 songliubraving@fb.com, 
 syzkaller-bugs@googlegroups.com, 
 trix@redhat.com, 
 yhs@fb.com, 
 yoshfuji@linux-ipv6.org
Message-ID: <656f6e2050d_2df272086c@john.notmuch>
In-Reply-To: <0000000000004f438d060bc6e988@google.com>
References: <0000000000004f438d060bc6e988@google.com>
Subject: RE: [syzbot] [net?] WARNING in tcp_recvmsg_locked (2)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8470e4368b0f Merge branch 'net-cacheline-optimizations'
> git tree:       net-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12094286e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f8715b6ede5c4b90
> dashboard link: https://syzkaller.appspot.com/bug?extid=06dbd397158ec0ea4983
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1247bee2e80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1285243ce80000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/90007d08e178/disk-8470e436.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b55270de1cdc/vmlinux-8470e436.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2237d34b6fec/bzImage-8470e436.xz
> 
> The issue was bisected to:
> 
> commit 965b57b469a589d64d81b1688b38dcb537011bb0
> Author: Cong Wang <cong.wang@bytedance.com>
> Date:   Wed Jun 15 16:20:12 2022 +0000
> 
>     net: Introduce a new proto_ops ->read_skb()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1087c0d4e80000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1287c0d4e80000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1487c0d4e80000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+06dbd397158ec0ea4983@syzkaller.appspotmail.com
> Fixes: 965b57b469a5 ("net: Introduce a new proto_ops ->read_skb()")
> 
> WARNING: CPU: 1 PID: 5130 at net/ipv4/tcp.c:2396 tcp_recvmsg_locked+0xa54/0x2490 net/ipv4/tcp.c:2396

I'll take a look. Thanks.
