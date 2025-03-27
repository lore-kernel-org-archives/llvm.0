Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8A2185BD
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086764; cv=none; b=kgl68KkB9ECzEI9N5SMIx71wfRc+1afPXPSvyT9RLfx23uRhFwMFy7n8M1KFe+Ntpn0XXUQi3aG4mcxY1/UeCpeVHbkPUHiqaXiyQblDWTnsFPJO5U1woh4JLckFUZOjEHRUbE4+JHt1EMbM/g57n1xBJe97DnHPAarLyi7Macw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086764; c=relaxed/simple;
	bh=bBLBi+/uszXJrNS0RExv+HyTwvtK2Dqw8vfB6OTf6tQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=prnneCDyK8Jg8YN3zcL9A0tHz5o2rPxXvkKIpmYaXCnkTckHky5ITEwnDeSPur6gzixYvCxF6hqpjYL1u9mlREJ+9SdwuHydsSBoD/iGG6RdLKfK8dU2+t1TbsHtPQFtnjdaDmegay19svjaNm4lW/969K/efU4alnD9HJ/EkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d586b968cfso19051085ab.1
        for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086762; x=1743691562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O31EDqZnf42bmiyYjE9Gv1Kig77RT2Jp/txzXzrDTBI=;
        b=iHBRtrEJL62DQ3rDcwZ6VqW3JYjbhc58hyT1zmUcbPJIRkE8ejngDlb2GPTwv34QsV
         pkW79Y4WucnFeCpRXmzUrvMRBDsuUNBG/cUdzwV6qWZSwH+Xp+gYnH4HqOBeOaaCGHnX
         Ma2ny/u0vqYOiF/Xab4JeziKij1sPgoISeHU7atx1dxS2q74Av0Fo7FEbCGc3aoRr5jX
         WoH0qMGHWGBI+w9SLdt2+1DR7o5P9UO6OwVif5f5Ugf8He0+UWOqMk/fxVktydKrZN2O
         QNexz8BwdyWTW6Xod70efGE0mfjKDkSwg1QuiHCMBejK3x1Qw7NAtQgY+MmS5quwHk0u
         Qxdg==
X-Forwarded-Encrypted: i=1; AJvYcCXsENAWOO2Xor0XJ5HWsnzBsITiVVoD9gGANFxRkXxcPIqxIy4sIQkkz4zHHJqVVL6Xy3ZY@lists.linux.dev
X-Gm-Message-State: AOJu0YxkmOaFXy5TTB13JZOekyCa+euvC6Tcs7uLEaZm/bpcbACKO/9z
	dylbUV9c5LvzMxTTjOkeWzAmW2dbFnPgim75d1YGPq634xSOA5qYz34A3wG/vGBCtexfbA+GKp7
	NObVuYEO/x+A29TdsjflIlgLNOIHdU9m/gnrgGuCRnFJSaQDQYxtIoCo=
X-Google-Smtp-Source: AGHT+IH3/YAoWyMyOT2ZmZKztUVHp0JJQajrmaritGZ7UtKATN1DB+AKdKLwXrPb1fsB9Cnl/8Zof7ODuhfQc/4UsqLHRutL++np
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1646:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d5ccdd1496mr40599045ab.7.1743086762074; Thu, 27 Mar 2025
 07:46:02 -0700 (PDT)
Date: Thu, 27 Mar 2025 07:46:02 -0700
In-Reply-To: <Z-ViZoezAdjY8TC-@mini-arch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e564aa.050a0220.2f068f.0031.GAE@google.com>
Subject: Re: [syzbot] [x25?] possible deadlock in lapbeth_device_event
From: syzbot <syzbot+377b71db585c9c705f8e@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	eric.dumazet@gmail.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-x25@vger.kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, ms@dev.tdt.de, netdev@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, pabeni@redhat.com, sdf@fomichev.me, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/net/wan/lapbether.c:376:36: error: 'netdev' undeclared (first use in this function); did you mean 'net_eq'?


Tested on:

commit:         1a9239bb Merge tag 'net-next-6.15' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=95c3bbe7ce8436a7
dashboard link: https://syzkaller.appspot.com/bug?extid=377b71db585c9c705f8e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a66bb0580000

