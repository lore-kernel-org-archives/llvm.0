Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE849200CA6
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906526; cv=none; b=NH0ci2q5YXlisfI0t3w5DK2ycY2UIBpG+ZaHk9k+jOkp1P8QPBOit0lijQcHqh5tRY3ofUzoKfCgw7k99m4y19kan9NBGY65BOMwrBNlyoPGMi2t//gw8xqIRj8ye6YfUE0fkoRsoGzJpnLVATiAha+QaNYm2rsfElD9vUcVqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906526; c=relaxed/simple;
	bh=hwQb6Bgpzxjusi1sNjee+JRXjDmZXCInqM6lgcIFXi0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RDzeDUm3PhUVSCtdFEij5A6ovFO7DFbRS/pu52XJ7jKQwbZK384nrwz6Wuo3EcyIPXCXzxFFRp0CYAVZIaXokAoWQa42ulNDSaxu04MTb6QFu5SpkmBkIjU2OOfzDab5UqmZ4i1RVCUpSlgR3dEmfIdUSnUidjWZ2Ax9LAOsW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3b506c87cso71869215ab.1
        for <llvm@lists.linux.dev>; Wed, 06 Nov 2024 07:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906524; x=1731511324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxtIZrToYDUsmz51BXFewoWsiGAdqJraREWxLhVJXpA=;
        b=okwC77y5RgQyyiB51p04Y9cB6/U5LaoS4NPkFirL39mv8l+NsZx0lPUJuFZ83V5LBz
         eFX6EKwie/zhmhqdZmkUuQRShPDPkMzhbV334qX7G/fWEF6BJ1lWTDUeSBJ87IR3Dn9s
         SHqCV4hunbUmZ4H48IKuXkQJ7k31PkNBMCrXAuXF7vunjzdfXuMuEA5QfDgkoFi5kPjx
         UwE3MsRBPXeJqrvJKhBSxkyEWn5AHWe39pOlJU76kK3HPIUN0GTTlBA2ukiDVtnxcEU+
         X/B1gPbNnJp4sAkMiOuPg6ujAh6TDx4LB2/i2W0GHK1Gyej6FwOo+QrwqvK6vqE5C248
         Hurw==
X-Forwarded-Encrypted: i=1; AJvYcCWJG95vScFVm5O0cYLPGZYkKYkmoVK05hFkMTlQxzcf5bSFQGAJQFbBQoRrrO1Y8090VLl6@lists.linux.dev
X-Gm-Message-State: AOJu0YyjA1hcgvfgUnmTXRUCRarOCwmtdH6fRrwK4Ns/YHKZ90ExnX+A
	rM7RUjWhYRJxgZvV7Slr6PTXnH4KFYBKQZNIYbB/oLqqhQMOmtIDl/U1ve/dEqHfovlVoVA7EKy
	Ea4fvDt0M3RLFcUaCrpFo+RP+hUd7g4q9p8CtL6xAAIuKt72FqczNm4A=
X-Google-Smtp-Source: AGHT+IGB0fuX92rvZS/mWn27iW0EG8h6GUgkVshI6dXgd3sqA8coI/pcSaFgr7mzopz8lL1dOWvuvS+ns96sVHW4jkdJMv2qVU9o
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:505:b0:3a5:e1f5:156a with SMTP id
 e9e14a558f8ab-3a5e1f51a6bmr238666775ab.2.1730906524025; Wed, 06 Nov 2024
 07:22:04 -0800 (PST)
Date: Wed, 06 Nov 2024 07:22:04 -0800
In-Reply-To: <671c2223.050a0220.2fdf0c.021c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672b899c.050a0220.350062.026d.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Write in ext4_insert_dentry
From: syzbot <syzbot+0c99c3f90699936c1e77@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, adilger@dilger.ca, eadavis@qq.com, jack@suse.cz, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, oe-lkp@lists.linux.dev, 
	oliver.sang@intel.com, sandeen@redhat.com, syzkaller-bugs@googlegroups.com, 
	tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 5872331b3d91820e14716632ebb56b1399b34fe1
Author: Eric Sandeen <sandeen@redhat.com>
Date:   Wed Jun 17 19:19:04 2020 +0000

    ext4: fix potential negative array index in do_split()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b9ce30580000
start commit:   2e1b3cc9d7f7 Merge tag 'arm-fixes-6.12-2' of git://git.ker..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17b9ce30580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13b9ce30580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=921b01cbfd887a9b
dashboard link: https://syzkaller.appspot.com/bug?extid=0c99c3f90699936c1e77
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173636a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1600cf40580000

Reported-by: syzbot+0c99c3f90699936c1e77@syzkaller.appspotmail.com
Fixes: 5872331b3d91 ("ext4: fix potential negative array index in do_split()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
