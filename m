Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9047710C
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714489445; cv=none; b=myf/5n8XPOSKmqADKDxXRMSSdHtpJ1xlec7/4i7J/DwlEceJ01bAi+RmOOaubS2LGBBb9fIqVegP2JEasfGB7dDp+D6iAHYpoD7pJ4QJsQXycvpaWs5DhmO6TuaPAcWDD2FXKi0vl6Zdbgka1G5MQiwiCyqvykmuC6UQi2nYPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714489445; c=relaxed/simple;
	bh=g+eaDs/HNr91gYab7fvFMZUmUzQXEdyjAn6OH6gxOuM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=okzuJTD4+CnzbkDHz7e1/U6MvHCJ8nXPChmQQHu8D98z5cqE3uFpB50pG+hS5wlXa/kymS/C44H45+XXKQaWlLFZuQnhrsMlQ9UNdj2HEUB7z4dl+R2p5bvD/fjxQPfjyYWsKFNA7tteA4ZaIQZ1nMVdQpePfjMLVGhgbPKp3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7ded69927d4so162263639f.2
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 08:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489443; x=1715094243;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXCBsJ9VpJqP069pIpVcCX4AQCkHuzifZjAsyl3v/7A=;
        b=IL9gL41tDVYkhymC3QxpNEQ2bOPa0cPRrj8rUEdnmR8HNW5h63rY5IGpAXF/ZasxfL
         U4TpoX83LToMiwaIIzP9Umq4O1s+4eR1+KAOyXGufDYPzDPQMI31iAOhegXjOW/qKsNt
         4Q4vBuaAaVKRVNofjhpWxt9FNS3mekBu+ZkSy0knBzJSK5kpX1oqIM5UD5nLR7Qh7T0s
         maefeu8RdXsj5jlletmXVggIxV/IZE+TwCcuWPXYXxn4qR6Xl/tiD0hXvD1kCzKnkROc
         46FQYXkyXx4oiO2j8OmnhW4EI2D+5QuIk33PkpEiqMtgJHziJM2Yj0GAof3rtZZYOrvD
         583A==
X-Forwarded-Encrypted: i=1; AJvYcCXR3IMIvTVGaYdwBIt67G4cl+fZseUKK1T+6tLoWQ623Nf3GekrY1pvi8WgiOPnwLcoStEGBavj+hCFGpfx+J9xh9hK3A==
X-Gm-Message-State: AOJu0YwSD2MhGFSMdP80yZsa/6GCfrNH/mO2YAuf1yHFjTaAGGH1maTD
	ix7zebMSKvycRMYAGOjlKZmxo3ZLzeGRuTSy308j8wOSGjs7gDNplJ47ozu7UUcabTg2qig/WhO
	8CKRB3IkdLQanQyVT/XuhTUTSPvctavUBc2axofGJMOqU3odK+PKMxPE=
X-Google-Smtp-Source: AGHT+IGkd8oAm76xqllvXiuSWamFxZZiYiLXM1NPguwb9PwGX3UzuHCPrjUn7xv8FxEBtfkwICP8m65fHvN8Z8HUb/km2DGAfMWu
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:37a9:b0:487:ea0:dc07 with SMTP id
 w41-20020a05663837a900b004870ea0dc07mr1194901jal.0.1714489443214; Tue, 30 Apr
 2024 08:04:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 08:04:03 -0700
In-Reply-To: <00000000000072c6ba06174b30b7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003bf5be061751ae70@google.com>
Subject: Re: [syzbot] [ext4?] WARNING in mb_cache_destroy
From: syzbot <syzbot+dd43bd0f7474512edc47@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, libaokun1@huawei.com, 
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ritesh.list@gmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 67d7d8ad99beccd9fe92d585b87f1760dc9018e3
Author: Baokun Li <libaokun1@huawei.com>
Date:   Thu Jun 16 02:13:56 2022 +0000

    ext4: fix use-after-free in ext4_xattr_set_entry

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1011bcf8980000
start commit:   b947cc5bf6d7 Merge tag 'erofs-for-6.9-rc7-fixes' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1211bcf8980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1411bcf8980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2f00edef461175
dashboard link: https://syzkaller.appspot.com/bug?extid=dd43bd0f7474512edc47
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d2957f180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1620ca40980000

Reported-by: syzbot+dd43bd0f7474512edc47@syzkaller.appspotmail.com
Fixes: 67d7d8ad99be ("ext4: fix use-after-free in ext4_xattr_set_entry")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
