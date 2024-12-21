Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251CD1632C5
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805067; cv=none; b=mYim1Phy4K9HbNomsqgtm0+/z34sKPEuyitGS5thChaGpxAaSrgStPP8/R54Tl4pWnlLucCAS+6ZXF92uxK8jhCoP17NhRc8aJn7uaXEl9xWNwwQhxNFa7WWyYhKC4nIj5FEetqa6Gn+FFfS96Vnpa9bbFvNSgCPaNWvLkTr2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805067; c=relaxed/simple;
	bh=FBPLV2lfQuZX08Qv9/rLfjfbmCMPz0VugzKJv3aLfUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxHlCRkUkRGWkOfEJHaETn2s+EyISzW+tNPRMHd9DltSbUgFRwPR5YyIDL25trEJxPRYUDAu8qU0s9pIIs1GmPcchFtVpxAlrG3m7759224jULCZk/tnHphWEWo+8Y5GruQQycaqqtfeTvRCjoWGPYISXXnt3czm5fXy4i0hsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJWiaFdR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJWiaFdR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54025432becso3109504e87.1
        for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 10:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734805063; x=1735409863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gww25uCrGB4X+QcRFH3IhcXrxha4JrH7h8gAWHNHg+E=;
        b=YJWiaFdRZR9tR9lsSbn1pNJw5qr2Lr1u4ON0gKFlgw3sSvyaEIApgapJHGm7Tje+h+
         LoYhP9z8tKYFvMw4D4vbsm2JvVvBkmJskCoqtpeyNnnwNhejBsIe5y1ZCzGqjRmm/J7g
         +K0T12pt89AxxC3vpInRlGaXninKqXSts4snrlw+HLd+6TwEAJbIhW4Hd0SsMmxnVAPK
         k/Ai5rNqfVPCLepy54hkHVqAnPnIWmxmdjSpslcQ2Qp5FTi/jTtFFS4Ih0VS6Bbb/bLL
         IGMbZKD7m4PXQ+mCxHy5ctmHtl6vjRoMMP355UkR7xsg9IZdlyKDHBzYdzWOOcsN0QBq
         eIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734805063; x=1735409863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gww25uCrGB4X+QcRFH3IhcXrxha4JrH7h8gAWHNHg+E=;
        b=kBLJBoY08+1trPRnvnuz97G8FRztyaiDsw4d0U+T+DbEBWiRflsrP6Tt0yiX55RI5i
         XFT6WAnUemrrSXV6c5q/JmOoirV+Em1/h6ukF902oD3UWl67mJruA8lxXdK/ZKnKQrW3
         F3WE0y/5Pgno1kO2VhVvsX7TYM0FiEsvekw1CtN0gFPIM5VxnxKe5c5NO/+vN5czg2ai
         OL+Do9AMpSuAdeD6b/w3HB6DXGI7ef8uvXfgelvQyiE+Q2T+Z/38GDJN02VRkpEquwt0
         4CfWKCet1wF8ug2OypotrUEa/FFstzQI8mr9z65Nd5pXZd7vm614HHCSMAnxbqXrYeEw
         Hs8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpT+Za3xSIl4HVuNoD0o1mcTcrar53NI2RiITa4uY81mJsk02bqAtWsHhHr+LajThinam7@lists.linux.dev
X-Gm-Message-State: AOJu0YzvATszVUdDi9V4K0yJEkxKHcK2akiq/k2/ObSTZFF5D4xH90qK
	qqUD+q8dRjMOwZBDARvW/uidK3MMrbJ7/Eb5pU+IJlvTUUo7PYaiMSWz38cV5S+wac3Lt+tLJDJ
	NYEMiRh4HTEkRKu1CSbSem00pmJk=
X-Gm-Gg: ASbGncss4xsvMfyZ9HP92PxyZtVrCqlAODqn10UTRs6p+uvKNPZbJX0ntHwN13Y4Wsd
	0PbyrcLS05JIkzmTGFtgLvIXAlMlEAjZ/lr6CPPRQIhUkM0VCBTaiJ3wgoYM7UGnF+Td6
X-Google-Smtp-Source: AGHT+IFbWOqrEDILJB7D/dZAXmHjad5/5gydpfde4ub7xLCzRPKhGigQWT8r2WIqnERkBGgVj5RjNd5ekYb5iXu0I/M=
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id
 2adb3069b0e04-5422f0f69d8mr919287e87.16.1734805062927; Sat, 21 Dec 2024
 10:17:42 -0800 (PST)
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
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
In-Reply-To: <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 19:17:05 +0100
Message-ID: <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 2:39=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 20/12/2024 12:27 am, Sedat Dilek wrote:
> > On Fri, Dec 20, 2024 at 12:26=E2=80=AFAM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> >> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
> >>> On Thu, Dec 19, 2024 at 6:07=E2=80=AFPM Sedat Dilek <sedat.dilek@gmai=
l.com> wrote:
> >>>> On Thu, Dec 19, 2024 at 5:44=E2=80=AFPM Andrew Cooper <andrew.cooper=
3@citrix.com> wrote:
> >>>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
> >>>>>>
> >>>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1=
.x
> >>>>>> from kernel.org.
> >>>>>>
> >>>>>> What does it mean in ISSUE DESCRIPTION...
> >>>>>>
> >>>>>> Furthermore, the hypercall page has no provision for Control-flow
> >>>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> >>>>>> malfunction in such configurations.
> >>>>>>
> >>>>>> ...when someone uses Clang-kCFI?
> >>>>> The hypercall page has functions of the form:
> >>>>>
> >>>>>     MOV $x, %eax
> >>>>>     VMCALL / VMMCALL / SYSCALL
> >>>>>     RET
> >>>>>
> >>>>> There are no ENDBR instructions, and no prologue/epilogue for hash-=
based
> >>>>> CFI schemes.
> >>>>>
> >>>>> This is because it's code provided by Xen, not code provided by Lin=
ux.
> >>>>>
> >>>>> The absence of ENDBR instructions will yield #CP when CET-IBT is ac=
tive,
> >>>>> and the absence of hash prologue/epilogue lets the function be used=
 in a
> >>>>> type-confused manor that CFI should have caught.
> >>>>>
> >>>>> ~Andrew
> >>>> Thanks for the technical explanation, Andrew.
> >>>>
> >>>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
> >>>>
> >>>> I am not an active user of XEN in the Linux-kernel but I am willing =
to
> >>>> test when Linux v6.12.6 is officially released and give feedback.
> >>>>
> >>> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
> >>> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_te=
sting
> >>>
> >>> # apt install -t unstable xen-utils-4.17 -y
> >>>
> >>> # xl list
> >>> Name                                        ID   Mem VCPUs      State=
   Time(s)
> >>> Domain-0                                     0  7872     4     r-----=
     398.2
> >>>
> >>> Some basic tests LGTM - see also attached stuff.
> >>>
> >>> If you have any tests to recommend, let me know.
> >> That itself is good enough as a smoke test.  Thankyou for trying it ou=
t.
> >>
> >> If you want something a bit more thorough, try
> >> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
> >>
> >> Grab and build it, and `./xtf-runner -aqq --host` will run a variety o=
f
> >> extra codepaths in dom0, without the effort of making/running full gue=
sts.
> >>
> >> ~Andrew
> > Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
> > All tests lead to a reboot in case of Debian or in my kernels to a shut=
down.
> >
> > Can you recommend a specific test?
>
> Oh, that's distinctly less good.
>
> Start with just "example".  It's literally a hello world microkernel,
> but the symptoms you're seeing is a dom0 crash, so it will likely
> provoke it.
>
> Do you have serial to the machine?  If so, boot Xen with `console=3Dcom1
> com1=3D115200,8n1` (or com2, as appropriate).
>
> If not and you've only got a regular screen, boot Xen with `vga=3D,keep
> noreboot` (comma is important) which might leave enough information on
> screen to get an idea of what's going on.
>

YES

# xl info | grep xen_commandline
xen_commandline        : placeholder vga=3D,keep noreboot

> Full command line docs at
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
> > dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa | g=
rep xsa-4
> > test-pv64-xsa-444
> > test-hvm64-xsa-451
> > test-hvm64-xsa-454
> >
> > Is there no xsa-466 test?
>
> No.  XSA-466 is really "well don't do that then if it matters".
>
> More generally, not all XSAs are amenable to testing in this way.
>
> ~Andrew

On Debian 6.12.6 kernel the TESTS stop with test-hvm64-xsa-454 -
machine freezes - hard reboot.

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner -a --host

root@iniza:/var/log/xen# LC_ALL=3DC ls -alth | head -20
total 1.7M
-rw-r--r--  1 root adm  1008K Dec 21 19:10 xenstored-access.log
drwxr-xr-x 16 root root  4.0K Dec 21 18:59 ..
-rw-r--r--  1 root adm     32 Dec 21 18:58 xenstored.log
drwxr-s---  2 root adm    36K Dec 21 18:58 .
-rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm64-xsa-317.log
-rw-r--r--  1 root adm     67 Dec 21 18:53 xl-test-hvm64-xsa-454.log
-rw-r--r--  1 root adm    145 Dec 21 18:53 qemu-dm-test-hvm64-xsa-454.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-451.log
-rw-r--r--  1 root adm    211 Dec 21 18:53 xl-test-hvm64-xsa-451.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pse-xsa-317.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-444.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-339.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-333.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pae-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pse-xsa-317.lo=
g
-rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm32-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pae-xsa-317.lo=
g

root@iniza:/var/log/xen# cat qemu-dm-test-hvm64-xsa-454.log
VNC server running on 127.0.0.1:5900
xen-qemu-system-i386: failed to create 'console' device '0': declining to h=
andle
console type 'xenconsoled'

root@iniza:/var/log/xen# cat xl-test-hvm64-xsa-454.log
Waiting for domain test-hvm64-xsa-454 (domid 94) to die [pid 4686]

-Sedat-
