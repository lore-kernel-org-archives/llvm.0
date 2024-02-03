Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D56AB9
	for <llvm@lists.linux.dev>; Sat,  3 Feb 2024 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706926026; cv=none; b=Co0Z/QdHX/bq3iBe3TiFYz+q7eJssZxKnvtcJex+7neC/oMce68SHVXcBiT3ARTgZmfoGKEF8kOhVK7xu95QiUgxTWlIfulKxXtbxSb4rUGnNyICtNj60UR8y0b5vkYNyiFj9fUeXKr3RbIMw3uYoa0OWQQwHS5DzWvsaAJ6FbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706926026; c=relaxed/simple;
	bh=i+JDF/U16A0h2ReCuKESPregCblwWsIb8m6CUL60Wpc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tqYy2e87dDmm2uVt3tZyGDvLOlTmfcGhyfQo+few0+H8oTmU9WSfevmL1lzzLQGqlO59mkQGc3i1FlZJij+A2D9u/JLhsuDkgbVV4hiRerMsyk6NwhBw4KXieoILuKGcq+wzXYZCo1HwPodj/XCF5yMu0MhfkISlrx+L74zQvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-363827f3e55so15517565ab.3
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 18:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706926024; x=1707530824;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbrmRoGKWhe6TCC1sGE2MFNaSiHwcC3ZaDKpsmrHR/s=;
        b=HhnIqgkbpQltwYlVrwi1o6uZhL9b1jvy+NizaQOHDpMAGTkQN85vhE+x7tDre14U6m
         H3bjAPuD7zQHD9xdwnaFGoXnrQXv1B8XyWRJoS1kkjzATsGi44PGPRg8r0zcl2MBptfJ
         dFVZppa7Wj2/bpwPzzxDyxfSu05v/GnMpEWgmshV610AtynOUosPgte3uiK0LGe3sRyd
         93vWlFRFqIwmuNG9H4cA7BEP+vHX/677yN9bQyOY7bTCeQHpHT3fAS54TaDVzAUNikua
         DwzpwY1bPlytsc8DRb9PFtjSfN1DeSPw1rzixhi7HUXq0AwCbqAC/VXSDy7NCNF12fhY
         nAQg==
X-Gm-Message-State: AOJu0YwMK3UdKVm22IjNAmItN8FwyW8pjLbf9snC+cY8R/zoEc/+jv7L
	GFFkmZWjEFJVhC0dO3aTqQuCKJz+0xHjTiXGPIF9+lUDmI92jH7jc4pcc32av1SAAr29QydxtEz
	VIG6L7WF4Pj/L8ZVFBoN5/PECMaRaSGaYt29gfzbOcbN+Bh5Ym/44a1c=
X-Google-Smtp-Source: AGHT+IHwGrrxGICgqXvjF1ce4ToGFnpyWKkdzcU/b4TT1Lnl5bhAvElMzunisL/xzV0/F+QhMt/En7jAWF2jmQunOuCuK0a1HyCw
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170d:b0:363:85de:452c with SMTP id
 u13-20020a056e02170d00b0036385de452cmr341535ill.0.1706926024094; Fri, 02 Feb
 2024 18:07:04 -0800 (PST)
Date: Fri, 02 Feb 2024 18:07:04 -0800
In-Reply-To: <0000000000002a909705eb841dda@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000052fe42061070afc4@google.com>
Subject: Re: [syzbot] [btrfs?] WARNING in btrfs_block_rsv_release
From: syzbot <syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com>
To: 18801353760@163.com, anand.jain@oracle.com, brauner@kernel.org, clm@fb.com, 
	dsterba@suse.com, johannes.thumshirn@wdc.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	yin31149@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit a1912f712188291f9d7d434fba155461f1ebef66
Author: Josef Bacik <josef@toxicpanda.com>
Date:   Wed Nov 22 17:17:55 2023 +0000

    btrfs: remove code for inode_cache and recovery mount options

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149a0a38180000
start commit:   7287904c8771 Merge tag 'for-linus-2023011801' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d24faf5fc10540ae
dashboard link: https://syzkaller.appspot.com/bug?extid=dde7e853812ed57835ea
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f7a805480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10df5afe480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: btrfs: remove code for inode_cache and recovery mount options

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
