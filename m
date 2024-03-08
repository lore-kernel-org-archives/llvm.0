Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661433FB80
	for <llvm@lists.linux.dev>; Fri,  8 Mar 2024 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709906766; cv=none; b=sDOHohSzd67eEvP8pnCsFK2IKQVbLa9BTtYuicex9RaXDd1uaEbbjD8LVXJhrmypYizRjmwQGiKDibjXdgiOxl9cjxTE8QI6PLUkMeYFEZzQjqjH5bm179wMPMRDHbxGvbc4V9ZRXUyFf099brdwHmdepom46RXXSeGyh6i/M4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709906766; c=relaxed/simple;
	bh=zNrlmpuYJ8G3ByJX69mziNbz97dnw1BgMjXDQs2S2wI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MJ78HPXju/HvFbodRbPuX668pm0RqCu+nOH2iPIXjrWjwQ0b0WBpQ8aS9nCYhNVogB6x8J+f5rBOlR5AIAGHhy6bXcj8HxxI4lK3VdrYCpJ+VX6zZmsHXox8UZkO8yO+4VfZt9QjmVDFn6GKmg5tIvPhCQ2hxQ387y6IzcZitgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c8414a39b7so150067539f.0
        for <llvm@lists.linux.dev>; Fri, 08 Mar 2024 06:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709906764; x=1710511564;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvlBPUPaepY/McwwPG60npSspOFuJcNnGlH0w8W6gto=;
        b=dqB6Rn0o+vc25TH5rw2OwGGxEOfePQEbQvqRkSJ3VW9c0LgWq14pKsFnE3rX5ossIM
         FPAASYF5ugPYSNfkkjpE2u3F/3FIm3A4sZgXwJ9D933/x5KLFGwrNFIBVcLW82yo4g8x
         LfO0yLOfLzPeW6PGOVeVLSafDrdIb62t8oyy1VfOtmz1wlZ8Htk4mlWJCER31WJxsq0F
         FWVyfaYkwzPI+xykPiooWZVIvUvoF5V2HrBWXf+TPl2/jAaBdaeHLz+BRM13fFxPYNuj
         7MU4MZbduHvzgzoptLji7w1lnIE7pJVpjma2vF3DexoJicGlOO/aweJ7TO4rGT88oKR9
         MErQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwU1fX9Nhijgv+IXlpGR0jAiht+0a2nPLkb6Af1lP2gw4iVrndCi5iQeWtMlWw7x5FDNnKuqcOlQUGxGCYx03uT6DSQ==
X-Gm-Message-State: AOJu0YyzY2vNrqd8Wa2DkR3yw7sNz756lNSqZAImhahwMTjj0mwjsuYD
	xqiBOAg+YuY1gP25gV3nKvDIL/FEHHml0kluTHX696cwGJhzqw8DYlPQDH/WE+Lb+3wWhUuvcGR
	pvavhMWDbdxWCUvWASsyClDrCnoDaYZcYHIk9HU42w6vzsWsfIDhG3bM=
X-Google-Smtp-Source: AGHT+IF1WLhPpfhqCphP2CD7iN4hnYxZm1j+JuQK/5RtpPGczjcKUuxFnYYjuIv1GYRpdfCn64PfCc7DUclSl0eWcsRbgc5nfjvG
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:16c2:b0:476:beb4:7470 with SMTP id
 g2-20020a05663816c200b00476beb47470mr4277jat.3.1709906764014; Fri, 08 Mar
 2024 06:06:04 -0800 (PST)
Date: Fri, 08 Mar 2024 06:06:04 -0800
In-Reply-To: <0000000000005b767405ffd4e4ec@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000044b90e061326b102@google.com>
Subject: Re: [syzbot] [ext4?] possible deadlock in ext4_xattr_inode_iget (2)
From: syzbot <syzbot+352d78bd60c8e9d6ecdc@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, axboe@kernel.dk, brauner@kernel.org, 
	elic@nvidia.com, jack@suse.cz, jasowang@redhat.com, 
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mst@redhat.com, 
	nathan@kernel.org, ndesaulniers@google.com, parav@nvidia.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14f08e0a180000
start commit:   610a9b8f49fb Linux 6.7-rc8
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=56c2c781bb4ee18
dashboard link: https://syzkaller.appspot.com/bug?extid=352d78bd60c8e9d6ecdc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15a4d65ee80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1715ad7ee80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
