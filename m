Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1833FDC
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 18:57:24 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57359e85e9bso353808eaf.2
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693767444; x=1694372244; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMMrVY62BX52PnYnRhXHZEwws09HRCPJ2xE2obQ/f5E=;
        b=sgFAFG5wIETdtOmuLCO9l9ndWYYtCvb43UfzgaO83K3e1ctMFAEHCY2K7AvUzYMobx
         7SmSv5QuzOzKoWoKDOaLSpOXjW0gRT8/obqT9lk15m8D3kvQEq3cjDI7MnEWDhTEWgoP
         uOY/QlnObueXI+ZwvTNeBJ0u0BVC8rMtzKuXOQ1ipbpICaXbP1EP1KFJMRDq3RP0+yNg
         hHcIL7POsvXpdZUH0k4tWt2eKpXpG+XDiz1LdPhyikYy4rPyqJ0CFMPeW3gK+2QKy93Q
         sjMBlKi52xwF2qGH8lhBYNcb7diTWPSC1sJ8bZYTwVsF3H8nMB8QFK5qDLSVFqp5hPJI
         ei3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693767444; x=1694372244;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMMrVY62BX52PnYnRhXHZEwws09HRCPJ2xE2obQ/f5E=;
        b=Z5ftaPNYH0sKB7w6al9ijfRLD3KZCrmhUIvd4Uo7pSp5K65Z6HOxvemlc3pi+K51Dm
         wT95Kqp4e125pJPgPaXB2kBkJrLEn0pvCQbPQwuemQOzIFC5bL7qOHS4KtZFI3//dx7J
         pW2tC6n4nvQeGvRwpSlx7J2FuKDnMoAaYSp90SnYu+weNprBPfQ2ZKgu8SjblVMP64wQ
         5SMGwB+qu4dxj9I+lkkBA+iVj1DBqBx9ksZs1XdsNDPIja78+vAjzDlrPGceS8yGbxLH
         OSeVWZ6rFjjdpGtfWnaMASBTRhV1v7DikdfhRbIRD8b71R0OolQg+ewUMlHm86w9Dl9Z
         Yp9A==
X-Gm-Message-State: AOJu0YzrmNfTvOMrhfGgObTPHH9e4D/oVPVOGsAG69fOkxZOriayib/j
	Nc3wiwH+rvMYukuaD5FQ2n6OjVlVDQA7RfRf1RE=
X-Google-Smtp-Source: AGHT+IG8+sFlKjEGDDMkjOW83R6jcwQ6CXuYvApexjZvBi7QvlhzGAt9kBlWzH1W6j8KZbe2DiWrwtBvanLpNZ3KzuI=
X-Received: by 2002:a05:6870:b687:b0:1bb:a992:223d with SMTP id
 cy7-20020a056870b68700b001bba992223dmr7997718oab.44.1693767443793; Sun, 03
 Sep 2023 11:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:60c:0:b0:4f0:1250:dd51 with HTTP; Sun, 3 Sep 2023
 11:57:23 -0700 (PDT)
In-Reply-To: <20230903180126.GL3390869@ZenIV>
References: <000000000000e6432a06046c96a5@google.com> <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f> <20230903180126.GL3390869@ZenIV>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 3 Sep 2023 20:57:23 +0200
Message-ID: <CAGudoHHjnRct1jEAjNSHmmPt9u_y+tYhrb56uRKXez8DKydNaQ@mail.gmail.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
To: Al Viro <viro@zeniv.linux.org.uk>, Aleksandr Nogikh <nogikh@google.com>
Cc: Dave Chinner <david@fromorbit.com>, 
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>, brauner@kernel.org, 
	djwong@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On 9/3/23, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Sep 03, 2023 at 10:33:57AM +0200, Mateusz Guzik wrote:
>> On Sun, Sep 03, 2023 at 03:25:28PM +1000, Dave Chinner wrote:
>> > On Sat, Sep 02, 2023 at 09:11:34PM -0700, syzbot wrote:
>> > > Hello,
>> > >
>> > > syzbot found the following issue on:
>> > >
>> > > HEAD commit:    b97d64c72259 Merge tag
>> > > '6.6-rc-smb3-client-fixes-part1' of..
>> > > git tree:       upstream
>> > > console output:
>> > > https://syzkaller.appspot.com/x/log.txt?x=14136d8fa80000
>> > > kernel config:
>> > > https://syzkaller.appspot.com/x/.config?x=958c1fdc38118172
>> > > dashboard link:
>> > > https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
>> > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for
>> > > Debian) 2.40
>> > >
>> > > Unfortunately, I don't have any reproducer for this issue yet.
>> >
>> > Been happening for months, apparently, yet for some reason it now
>> > thinks a locking hang in __fdget_pos() is an XFS issue?
>> >
>> > #syz set subsystems: fs
>> >
>>
>> The report does not have info necessary to figure this out -- no
>> backtrace for whichever thread which holds f_pos_lock. I clicked on a
>> bunch of other reports and it is the same story.
>>
>> Can the kernel be configured to dump backtraces from *all* threads?
>>
>> If there is no feature like that I can hack it up.
>
> <break>t
>
> over serial console, or echo t >/proc/sysrq-trigger would do it...
>

This does not dump backtraces, just a list of tasks + some stats.

The closest to useful here I found are 'w' ("Dumps tasks that are in
uninterruptable (blocked) state.") and 'l' ("Shows a stack backtrace
for all active CPUs."), both of which can miss the task which matters
(e.g., stuck in a very much *interruptible* state with f_pos_lock
held).

Unless someone can point at a way to get all these stacks, I'm going
to hack something up in the upcoming week, if only for immediate
syzbot usage.

-- 
Mateusz Guzik <mjguzik gmail.com>
