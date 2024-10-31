Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EE119DFA7
	for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381885; cv=none; b=XuL0ieKlUEKipzhunMHy3J0xkJ7CkZvjlvf52Jbh3/YH0KR8bBoX/noAkTprmiVB/BpKsyebuaZpQ8DGeWb0NtJPF83PF9hqFQZOlOKzg0FMf2CN0/ImTcijnoJ85q7QUesX97Ow0ABgCwWBEfHpyfnk4+swU0a8NUHbxRC0Vus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381885; c=relaxed/simple;
	bh=m8js9PKWrGpGx/94c0m/t/kG4l17mJ472kJ3T9476rQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HHaCC1Gly4T1CCShFaBiFPsxRM1vX6iosneAiLXRl8N6QzePe9+UsLyMrPnP13NEWlmnmgc+JDJnRoWMCCzbmNf5qLr6++pmie4MH5GMUSAh7iknnbe3lF4q7alNKXtcfSagIsXT9mxZPLNHG4Z0A166zjskYzqvyRI1xKt9ErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a4f32b0007so7751625ab.1
        for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 06:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730381882; x=1730986682;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2wb21YsWwCYTNPoCuhRPi219SLTEoWZUiwx8XtsEeA=;
        b=r524QF4dU6BLwTAbgOxxCmXQyFR9ksQsZT0KCEZjc8bneeu25Fbt5kjBzmfo8YxLZF
         xyE2o4uGI9pvP4HxZwOhKhSWEvxkeer4Pl0Ae/c0yJTemuqy6BCr7XI3v5taVIAdEIif
         CjaTXnC3qBOeUUyRCxogEJEj3aBnKF4YUIw/O2AoMPAshFmgocMTcxKsf5IJ00t3BZdd
         hKTjEhuxo4VAQBcpWEe88Kpn9nGuD7QoC27cVQ80QuXMXvoR4gt8c9dvbH1rugB+aOt5
         /ltf0mrMVozdnYObtPIzhcslApMwCkbRHt9hTgCbYsDrmKNEKpmGwATBCoVma2FQppWQ
         YRkw==
X-Forwarded-Encrypted: i=1; AJvYcCXMTKDh7dvOVkW7bb56kU1kc+siHuMO8P65HnneylzXfJxJouj6l0ylFHhdwADjQCQs+LtH@lists.linux.dev
X-Gm-Message-State: AOJu0YwQUKjIJKJdF/qProTB0NKeGiOZwIGzz9TEabuEj6M50WaeSb2z
	JAQKuyqf6MsUy5YdhVTfY4Y/quZQhvxXQ2jdxQMLWIQ/P+IyIWz101XMy1kdo8//CFIqSViBEud
	tOu/El8S3Ot+A4WD8+7UxrIOLKgD7mE+443Ofw5S1Gs7aNHreZXpYEk8=
X-Google-Smtp-Source: AGHT+IE5AIK7chWjS9Qwruux0+MNbD0t873UJxKTJhPolIL7YKITplTj5kAbNAFrJUQcFTBg6qRbpSHAOE1fNivkZ+r2aqTjy8NZ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa8:b0:3a3:f86f:2d0f with SMTP id
 e9e14a558f8ab-3a609a2add2mr39984325ab.3.1730381882619; Thu, 31 Oct 2024
 06:38:02 -0700 (PDT)
Date: Thu, 31 Oct 2024 06:38:02 -0700
In-Reply-To: <000000000000e6432a06046c96a5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6723883a.050a0220.35b515.015f.GAE@google.com>
Subject: Re: [syzbot] [fs] INFO: task hung in __fdget_pos (4)
From: syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, david@fromorbit.com, 
	djwong@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, llvm@lists.linux.dev, 
	mjguzik@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	nogikh@google.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	tytso@mit.edu, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11fc5540580000
start commit:   3b47bc037bd4 Merge tag 'pinctrl-v6.7-2' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c2c74446ab4f0028
dashboard link: https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11026e54e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
