Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5831FF1CF
	for <llvm@lists.linux.dev>; Tue, 24 Dec 2024 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735057465; cv=none; b=R19I+FaoHBREl4SJWjzafOzKYEgC43QLAjgopiBpUsmEGV//k/xt2ypH7ig0gWhTUjdUylFtBF9IzHI4TU8lRXy1ElqyZThXwlkYEDC/Oq+D0aQYy75rs0B6xr3S/ZTraXskJ68dA9uRuyJUqA+5uJycmmRSof04LiqtbOB6NbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735057465; c=relaxed/simple;
	bh=p7KqVG8jZUozSrF3yUtKGwmf8J8zBpBVmYtQMvxyH9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJs6jaJSSB6skSbWG9YW17rSOn/PjpIrst8142GlV8hjpxQR+0vmjv9dTVRr4ImNMaWU1IOpACzoUZWgRfc89YeZkVOw2pAP6+A16YofH6BLyoQuEyAuTXBk2mkUlvFKOlliaopt0Eyoedv7pqbuUqD6PToDRBClO6gnwVlIS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou5kG+cE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou5kG+cE"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f757134cdso5764537e87.2
        for <llvm@lists.linux.dev>; Tue, 24 Dec 2024 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735057462; x=1735662262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4mkXKWmGiV5XXckoZsuAcHVdzO+pEYcGppRBWUinzmo=;
        b=Ou5kG+cEasslmYjnEeMDSZJJfAYVPpOb7UWyND0NCZ7VulwS+TVcf9MJF7syxdkKj4
         SnZ0GJIISXcnmN/ziVqeCHfUIdZijC/EkGiZJmHT7sz9OuxT2gt4/EJ0ysj2F1ujm3AW
         AdYL8rkDMkXwMKWzfptyRIeX/tDiwL0hRsmqoySBfWt+b7iDo3JIDJG7qt94CJlD3PtU
         8cQLYvvdnwwtg8RNZBjaeRhgKNcPO0VJMyVSHtLOELU3e85nojuO35+/P8tBxXdn9LAA
         1F0GIMf8fpTgU5pQn4Sn9zoLMRFSXjVNpHxwlbopxm2ZN6sp7rCGlArFXrHTDMCRYj4g
         B1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735057462; x=1735662262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mkXKWmGiV5XXckoZsuAcHVdzO+pEYcGppRBWUinzmo=;
        b=H5NU0W4cEYWwCAmp6FrEdXAsUYJjNEO0mqzH6aXOVPXqYwvGQzW3HxW9WJ5okqlXz5
         6QXZtY+TXhSNWq1W21J4zz0yqT1vEXovLShkmVgr0lVu8L0PT48groZ3XFzevNA30D4T
         29jvG+uMC554SyQn29b8+9zNAcMt3oZCGQ+WUlv6v7+GVQs3KF8A6GhzLihUYo+c251G
         74yrAH/dCn4tb3yfrlz67uU9Ds2MJ9D0+A8d2gMbpUyw1WdWfIDuSKvPJbsNujTh7rk/
         pdJ9ruBOkqPks2UZSTWhWt3JXPHDLxhhN9yGPH3xmxnL9IqotxYCIJbgrUtBeHeDwwfK
         Eh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfd/K+xq95/Z3C/zl3enqy71z5Kl6vAa9mf4Qx4ROh+1PGzwzftWYzdyxJICadmZnApF1a@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7rxWUKee2ntxrXkqGYYTlIU0O60NZAXN6niZEjpMW5Hp4xQlf
	59bQND1JdZx3fYkVG7ih58XhpQsaW+dUCMA5fi848EkowW6Lp5ReXTThNB8VQZga74J3GG/aqiW
	kXGTU6qAB4NjzRsa740MKrtPQm8M=
X-Gm-Gg: ASbGncuFfwzpMLds0XTkZxLscwUlWBO4XSYrKPTDnrtAqxI/Bjsmq1JluzNjd3RCCNW
	QxOOH+cYSsdrIUa7PX7HabMKMk4yeWkLapfUD0UzJjVFdr7Fwzle5R5vUFR6cZBqHsmK3
X-Google-Smtp-Source: AGHT+IFeDcoH6FqGav3dMmPGh5sT6bY3h7jtuxBtb3J/jlYw3D77GN96q3f6d8YvDmECDxLlD6KL4j+bq6oD5HrXqmc=
X-Received: by 2002:a05:6512:1114:b0:53e:335e:774d with SMTP id
 2adb3069b0e04-5422957afc9mr4939338e87.56.1735057462100; Tue, 24 Dec 2024
 08:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
 <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com> <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
In-Reply-To: <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 24 Dec 2024 17:23:45 +0100
Message-ID: <CA+icZUUnbY7eRZtN-pMNn0jhYKLLEWEDNmJjhGQ3auPuS9_+MQ@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>, 1091360@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 11:37=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> On Sat, Dec 21, 2024 at 10:31=E2=80=AFPM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
> >
> > On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> > > With...
> > >
> > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../
> >
> > That's completely bizzare.   There's nothing interestingly different
> > with those two tests vs the others.
> >
> > I take it the crash is repeatable when using either of these?
> >
> > ~Andrew
>
> This time I stopped SDDM and thus KDE-6/Wayland session.
>
> Tested with Debian's officially 6.12.6-amd64 kernel in VT-3.
>
> test-hvm32pae-xsa-consoleio-write SUCCESS <--- 1st time I tried, never
> said this is not OK
>
> test-hvm64-xsa-454 leads to FROZEN system and DATA LOSS (here: ext4).
> Reproducibly as told many times.- in Debian and selfmade kernels version =
6.12.6.
>
> Stolen from the picture I took with my smartphone:
>
> sudo ./xft-runner test-hvm64-xsa-454
>
> Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
> Executing 'xl console test-hvm64-xsa-454'
> Executing 'xl unpause test-hvm64-xsa-454'
>
> ^^ System does NOT react!
>
> I can send you the picture on request.
>
> -Sedat-

[ CC 1091360@bugs.debian.org ]

I upgraded to Xen version 4.19.1 in Debian/unstable AMD64.

# xl info | egrep 'release|version|commandline|caps'
release                : 6.12.6-amd64
version                : #1 SMP PREEMPT_DYNAMIC Debian 6.12.6-1 (2024-12-21=
)
hw_caps                :
bfebfbff:17bae3bf:28100800:00000001:00000001:00000000:00000000:00000100
virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
xen_version            : 4.19.1
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_commandline        : placeholder

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --host test-hvm64-xsa-454
Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
Executing 'xl console test-hvm64-xsa-454'
Executing 'xl unpause test-hvm64-xsa-454'
--- Xen Test Framework ---
Environment: HVM 64bit (Long mode 4 levels)
XSA-454 PoC
Success: Not vulnerable to XSA-454
Test result: SUCCESS

Combined test results:
test-hvm64-xsa-454                       SUCCESS

root@iniza:~# LC_ALL=3DC ll /var/log/xen/*xsa-454*.log
-rw-r--r-- 1 root adm 232 Dec 24 17:11
/var/log/xen/qemu-dm-test-hvm64-xsa-454.log
-rw-r--r-- 1 root adm 232 Dec 24 17:11 /var/log/xen/xl-test-hvm64-xsa-454.l=
og

root@iniza:~# cat /var/log/xen/qemu-dm-test-hvm64-xsa-454.log
VNC server running on 127.0.0.1:5900
xen-qemu-system-i386: failed to create 'console' device '0': declining
to handle console type 'xenconsoled'
xen-qemu-system-i386: terminating on signal 1 from pid 6302
(/usr/lib/xen-4.19/bin/xl)

root@iniza:~# cat /var/log/xen/xl-test-hvm64-xsa-454.log
Waiting for domain test-hvm64-xsa-454 (domid 144) to die [pid 6302]
Domain 144 has shut down, reason code 0 0x0
Action for shutdown reason code 0 is destroy
Domain 144 needs to be cleaned up: destroying the domain
Done. Exiting now

Due to Debian-Bug #1091360 ("qemu-system-xen: Build against libxen-dev
version 4.19.1-1") I am not able to do the full XFT tests.

-Sedat-

Link: https://bugs.debian.org/1091360
