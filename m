Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8402113AD03
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731141064; cv=none; b=CwWYWpaVgdQ4+2YCGkjoF2PcGq/0XshhpIbeT+zMl0ozL3g1Llpte3TUbW6sfFP4YWQ3gjCzZ8KzXfRW8P6jjRgyVJssDVS51DyFmwZVbTKyCZGkwCTnpX+QDXWbxzHW/JAFeXwkqsWhdWCpFpkepdo9d1AbqCyrQ1+pCrhzINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731141064; c=relaxed/simple;
	bh=1D1xovnM0EMAFcuSF0pmt+0U7XeGSOPxADpUIgdsIQg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HAQe85jFWUhbWRNHPfwGIMRqrwzCDZsb7Opehh6uGIjQumfF6Qk+bznMdQfC03mgx066wiC5NVd3KMGDwXkK2ScCWQ999oUh71WaDR2VBnN4QINXYI4ykfhtJZrwf54A5R5QyE+P6jZTZ7kmNrN05wwG3Fb+Ced0CBH8HCDqQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83aac7e7fd7so325620439f.0
        for <llvm@lists.linux.dev>; Sat, 09 Nov 2024 00:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731141062; x=1731745862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYVFRLpr35Jnu0CNYH9eEEbObvwHw3Y0l7EYQ4KbDpQ=;
        b=vr4ZI8omh/qJmHHQlKw3RkPOVqQv84T6j7DAnZC5yEv+dV/l6414SVuGqEc4PpwF4i
         xnu462BQC6N8yNy2Iw1Cj0AUvLT2LIHDfhY7i9XiNKYghYgErFZ4UrLw+FkPovsm+Ohk
         pW57ugogLzhtd4LK7HYgQIoSqsDLffQA9bIoqsYep9sAV+6eXd42pCt4HD4cq2/DI7PV
         Obe+UL1ZCz5iiULgjE9G+vwPFqh7X8YVBbwtpjCF7TNRP/TB5vLBeeWGhzfP44FcNaG6
         yAo6bwN/Hf36jt52iqfnC9XSu4h1ogXUudBSe4DQDguDBm8vMvXSBim8nlNxsRQoYd9j
         PZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg1Og8sU0YqGV+3fNbh/jAoDvgimYe2uw/Y2CZIZKBxxTI/cnrbT/L7f8URMKmM6ysTanm@lists.linux.dev
X-Gm-Message-State: AOJu0YwuheO+HVBQaMvsdYB6X0c3z9v4YCg4qusBsClYfOpvzptaQM8f
	BM3CDZ+0ws3fEjKOyYXL7ZG/lskdhbC4im/p972pLbAwyyWUYTrWZMgwqvM0OghrfWz8MBivMnO
	gKc/745FmLB131s7liP0PvjV80/x0hTHQBMKlA/XOS5QTHqsjfZKLRgY=
X-Google-Smtp-Source: AGHT+IGumaAxr12HSrk3WMZeIvTdg85QNwAfY38l9VuHuXPLH3cBOYaCgbCt/TfwXfpZvNPy4DGVNbYZjn1IQ9TcG/OTI+wS0IlM
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1706:b0:3a3:b4ec:b400 with SMTP id
 e9e14a558f8ab-3a6f1a48d05mr63137605ab.17.1731141062618; Sat, 09 Nov 2024
 00:31:02 -0800 (PST)
Date: Sat, 09 Nov 2024 00:31:02 -0800
In-Reply-To: <0000000000001a94c3061747fabd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672f1dc6.050a0220.138bd5.003b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_mark_rec_free (2)
From: syzbot <syzbot+016b09736213e65d106e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 5b2db723455a89dc96743d34d8bdaa23a402db2f
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Aug 19 13:26:22 2024 +0000

    fs/ntfs3: Fix warning possible deadlock in ntfs_set_state

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a67d87980000
start commit:   ea5f6ad9ad96 Merge tag 'platform-drivers-x86-v6.10-1' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f59c50304274d557
dashboard link: https://syzkaller.appspot.com/bug?extid=016b09736213e65d106e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133fa268980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142cb182980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Fix warning possible deadlock in ntfs_set_state

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
