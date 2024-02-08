Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC86A024
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707381727; cv=none; b=Gvyqw/G+lC/u13kEKDtpkUqJHUWnZJVfa1ORF8fKwlSH0fVkkj7D1UdVOWlUOjio3I6C7bHv2fKxKU4+DAWrO7SjxWBwYy/HPp1HBifUG8igSM7Pj2T1sLCrkhObrzrx7HyFIwgnyxb2AOA/YS3PWsZsMhEIs5RgSvMu8gUVlf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707381727; c=relaxed/simple;
	bh=owM+DNpsKkXyinnw4wd0FBpjXm/GovegDPMh1yJNq3k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=c9JSGh/tVj4u5M306pQpnnG/mGw5u37DijlFedIxMrKnJjw8EhNhjf7edMl058YPOnU5YBXqGZsRiFp3FLu31xEVtMoOQ1u8C4Q6p+L3ZQHshe22izkW/macef+FkZg1Qx3yN6+uNKVEyg5S7JBMCgZAPNC/UQyCah1LSBiwpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7bfffd9b47fso125993839f.1
        for <llvm@lists.linux.dev>; Thu, 08 Feb 2024 00:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707381725; x=1707986525;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gi3Aj5CpZSqfEPpOTz0NyFdtwkFwo4vzB4CbD3V/hMU=;
        b=Gx2cYLNsvje+Snagtk6JH7xjsylTR8Rv2l+zTTQTrch4EuXI8Agf98v5kQoHu3BClA
         27XHpex5WGdKE3/i1NKd+MAXt6NOSw3ya1txUQJIiqZg1ah8tWFvxZ16iLQMHnK40twp
         Lvi1ez2+ImKd2ktTlAMGmerEctbwHQqUcyULoXeYpq0oTLhLJ8YsS/oj2egXgCDcGHRp
         ntjEFfnqrsKRXfACP34StD+gfY0/VDn6hRA8yrpRihEtN1371JFHTuOMWO+V6BxFhvIB
         jsR2XbPHMkaqSP5mlJoMRvieWUmDZJIsXeIOE9wM5Ez9Fcb+0P5nR9ImRanSHUD4aSBa
         pXrg==
X-Gm-Message-State: AOJu0YwCG0NWcn3nc9o9o3gDGuMp1ps5mjMNqxu9Wq3VyNJTjr1JLFAv
	0ebAm47PGhM1lWSaW7zN0mcazvGkLDy6r+4bc5l6rZ0y/xNgU1p78/iwkpi6kG14gWjERhUk7ai
	bovn2+vqoFIxRNsUpScRVgehyb7+tbZQeXBt75NI/TVKPBZ8tymkRd20=
X-Google-Smtp-Source: AGHT+IG7PoBe/+uQDEV3xHx1bDZIx7KmSroS4aAxMKdS6uE3XoEiKFcrp+MQPEGidl9GEYHKZ9GTPfdaZh84P8DZd8F1RvyrB1SV
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6428:b0:7c0:38b:403c with SMTP id
 gn40-20020a056602642800b007c0038b403cmr395454iob.4.1707381725627; Thu, 08 Feb
 2024 00:42:05 -0800 (PST)
Date: Thu, 08 Feb 2024 00:42:05 -0800
In-Reply-To: <0000000000006f7cb5060cc9c9ac@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000408e8f0610dac93b@google.com>
Subject: Re: [syzbot] [bpf?] UBSAN: shift-out-of-bounds in adjust_reg_min_max_vals
From: syzbot <syzbot+46700eea57ecc7f84776@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, eddyz87@gmail.com, 
	haoluo@google.com, hawk@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, netdev@vger.kernel.org, 
	sdf@google.com, shung-hsi.yu@suse.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yhs@fb.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 96381879a370425a30b810906946f64c0726450e
Author: Andrii Nakryiko <andrii@kernel.org>
Date:   Sun Nov 12 01:05:58 2023 +0000

    bpf: generalize is_scalar_branch_taken() logic

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16e65a9fe80000
start commit:   b1dfc0f76231 net: phy: skip LED triggers on PHYs on SFP mo..
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=e043d554f0a5f852
dashboard link: https://syzkaller.appspot.com/bug?extid=46700eea57ecc7f84776
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128c8ad1e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12456fb6e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: generalize is_scalar_branch_taken() logic

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
