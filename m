Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A824F894
	for <llvm@lists.linux.dev>; Sat,  9 Mar 2024 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710019146; cv=none; b=Q4Iv4ggt+10961dyGpChr2RPpzYHnAW2KlpZm/hjh3ItHjZSwWsX892LKzQiMlQ2WbKGQcodTcNeizvAqmLSKSIZUIQJbaJCW1HDN0fSaYxOXQT6NYh6jTAzpXLTj/V3SJgXauB8j+GQ0ATFxYpwNZNQ2fZ5kE8ByqKRFVF5/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710019146; c=relaxed/simple;
	bh=Pa7sx8/xOTjjXflylsOjtScryyrbysvuk/h52s9G43g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mdqpclhgu2lDm9WYAfUZE7Swwh2K83viYybm6l39b9JVQ34OWYJRtkUxY6RJASrs+aGY850Hj8cZfpr6XJ7Ht8ncu/zW5gRAETeX43YxzjTPIUMybuLFphYHP9tN2LIq6Zf4xXampkFTcV+O3NH4sU0qU4mbX7+tBBlcMQj/7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c8a8526f03so39517539f.0
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 13:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710019144; x=1710623944;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRFBXIh18wCLBO2+SM4FmreOxz5t2k1uDB7yZ8xEagg=;
        b=Xf1SV9y7fjoYJtduuBX8LD9LrDl4PmFrBIRG/E587IZY/tTzWLrrqdCXYHCSAzpDD5
         fcFkGOm/24wDGIy5ThlSlp4cK7U4SyByX9YgeOJFXxZvqn+t1VfiM/k885Q7NQJSRAYU
         6XS6b9pZ3ebhhwvAogLpd77c+JWNQpxfe67vXBt/iUc+rbyVX9AQqCdUoKkpST+kXvQS
         fBtHb+lPu+RJmU9mjCJzO0pJcsRT5RD/DPAK06XMYJkEf1dQWqRdjqi3wABz7W47ZFst
         RIUYfrKkL1MP0IL9DhbrAmTcm9F/SWdu+i/GNPQpNuUnvZc+egOiSt7g/IfsvDdEJTwu
         SEew==
X-Forwarded-Encrypted: i=1; AJvYcCUeSmcaaq/YzfgztvsnFYJA0DfwAaM2PXKUneqNXKCkGUSPmLQqNk+YpjAnRwkxzwtqv91k4xcm3q596LXLut7Pvfn8eA==
X-Gm-Message-State: AOJu0YxSJibDZBwe0kzbFofZRP7U/CQJaT3PDj1NWkqLzPpBYFb7bm9o
	tu4pmm1JN6Lh1co0ET3kdA7B0DNUhU/EiPDKswkjmpRFXNGsEQMdxkE8NYfPs4KSqO6qeIsM5HW
	SweIWPc42e9a1KMMHsot+u3PdJBB8koh/sbdS1b8X4pUo5O+fivdotzQ=
X-Google-Smtp-Source: AGHT+IFQgC/Y/uWGVhcWmNcl2ho4MafDLtAn5gwYRiBKdk1E4x8S2kf/9BZ6o500V0XRqam5OriFuXksXHwaP1QMt52X96IwDuf6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1653:b0:7c8:4198:c430 with SMTP id
 y19-20020a056602165300b007c84198c430mr36002iow.2.1710019144429; Sat, 09 Mar
 2024 13:19:04 -0800 (PST)
Date: Sat, 09 Mar 2024 13:19:04 -0800
In-Reply-To: <0000000000000149eb05dd3de8cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a9c150061340dbc9@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_iget5
From: syzbot <syzbot+b4084c18420f9fad0b4f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, jack@suse.cz, kari.argillander@gmail.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1649668e180000
start commit:   3800a713b607 Merge tag 'mm-hotfixes-stable-2022-09-26' of ..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=755695d26ad09807
dashboard link: https://syzkaller.appspot.com/bug?extid=b4084c18420f9fad0b4f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ccc59c880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10928774880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
