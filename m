Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B57481C4
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cfc42c748eso33125815ad.0
        for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 15:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215825; x=1701820625;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vN2Ir+Y4JmS/bZdrwe9hRvn9LSobTrbuzI+1V9ZVUoI=;
        b=lq8ZBnltZ+ZGhDzigtzXVTCGFcIV8hlF/09iZ+RVwV6aRnT8qZGuNqXOHEwoRCMv4k
         U4xsyS5IJVBjQQGOtGSaLrvM4MU/mmdmQdBAlubCf4EIVlXRaI9gOK3u8ir2UQ8VVaVo
         Ku3fgkF2gJwtRZ5+8l32PVFPqlKkbzTvE8J8vk1rZDPqocOt3lLTwkw9t7FG/mJ4OjH1
         w49SVame2hA0MECV0VfIZEX4uq9ZQC7TwiN2tFoU1Y1xm9m5Hj818tvXVGJISWuu827U
         DV6RSPMOxrqvm5fFfvDMRbwG0ZkAeG/2s090NJX/QUMi41X6ajsH/KVt3r1wFbZo+NPk
         8RnQ==
X-Gm-Message-State: AOJu0YyX8qdnANE2cpC3CPh2qs9AQaCuqki8X2e2VqeJTpdGweQ5oJGG
	hY/tPPMzlFKPkVEG7xEXCenmRGWAOqtjfFdWR3nhr8iqOO9T
X-Google-Smtp-Source: AGHT+IEBmKxuYKtQ/S0w/Sxr+C51n7BNjuA3UdTFIXPrhy6pf4y+36y7PctlYRTxRWgVazDQbWRHjB0qaDOjWNcdvHmORUl52cwI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:903:4282:b0:1cc:2f2a:7d33 with SMTP id
 ju2-20020a170903428200b001cc2f2a7d33mr3456055plb.2.1701215825023; Tue, 28 Nov
 2023 15:57:05 -0800 (PST)
Date: Tue, 28 Nov 2023 15:57:04 -0800
In-Reply-To: <000000000000efc64705ff8286a1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000efd864060b3f2cf0@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in rate_control_rate_init (2)
From: syzbot <syzbot+62d7eef57b09bfebcd84@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, johannes.berg@intel.com, 
	johannes@sipsolutions.net, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b303835dabe0340f932ebb4e260d2229f79b0684
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Sat Jul 23 20:08:49 2022 +0000

    wifi: mac80211: accept STA changes without link changes

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=125a86dce80000
start commit:   a214724554ae Merge tag 'wireless-next-2023-11-27' of git:/..
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=115a86dce80000
console output: https://syzkaller.appspot.com/x/log.txt?x=165a86dce80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=abf6d5a82dab01fe
dashboard link: https://syzkaller.appspot.com/bug?extid=62d7eef57b09bfebcd84
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a4fc64e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1363b22ce80000

Reported-by: syzbot+62d7eef57b09bfebcd84@syzkaller.appspotmail.com
Fixes: b303835dabe0 ("wifi: mac80211: accept STA changes without link changes")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
