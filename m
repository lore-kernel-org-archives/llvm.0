Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA131714A0
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805594; cv=none; b=Z58IF7VQz+van/8v7YHe4S0+b1SMqnUzYB6Lcq7hAknW1mUapAkyh2MjEQeHZEEaa9BRhYGUvRsi/AF+EJHomG2jFSVi6k7SJ+6Y6TukWZIIDze3QKOHELIN8NeBTpKdX70SNoV4SuIKtu5Q4yGuod4zFrGz/d3odFSCFxCmSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805594; c=relaxed/simple;
	bh=jxlc4tI/4f+Cod2pnpANcbpDdC1Syipwex2tavQxrfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bR/ti+RrZD7vfMDXaFtu/HpknB1G/6r0ezGukkeiEpaeiwbebvOBZGlb/xQ6NKLn/WTfkycXcMV2d069WgnPsACEPYZTEejI5vwk+x2lYOa6t2o3jHPry8GlUU0q0Fa0NfIEg6TCYK97HcFX/TdDzoricxmQk2d4kvM3mXZyoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLEr2w1O; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLEr2w1O"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401e6efffcso3559835e87.3
        for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734805591; x=1735410391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ug+2S38akg/OGmu5JFa1fwvkZP6FmAvIFxWtE1sypCI=;
        b=ZLEr2w1OSVNqj23G0o4mrEMr8Zl8WlQS3Pt+RPxZeujzYkLK3jSwlIK5G/cEim4Ini
         Qs92deo7X8q3N2nwBWbIeUe0+YYgpLEBCs+9afoZ88mnC5G4HphZGWdzli2q/vEJw/lm
         4XGC4/fG9c1W8yV8CbMiYW3j9p/NvE8eoNfRsZ6cihUbo9hf0UcHaN0/jaUBY++Z4MO4
         VoNNQzbdsxy9FFwaNGv+L3uUw4Q8x1RXQEoHrfO3johNw0RbuYAhhhzkz/6uQaVtlJUu
         pbfRRgq1PtuVhpHIxwP1yniRDTn9VfEefqksZhjtx11SA4UivTvAhqaMvVbfPR+o+DSd
         Qz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734805591; x=1735410391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ug+2S38akg/OGmu5JFa1fwvkZP6FmAvIFxWtE1sypCI=;
        b=k3hkfTawyQ3mKxApys5mnY4jA2IdedsVZxP5cJM3al23XAO4sI3r86CjB+FqPipxhl
         2aKePqzvspnvbMD9QbqiRUgWk567kchvw4pGBUs/PZ0sL1pW2NOVI5Vjkq8tto3AcoSA
         34lXc63mVx8ZyArfZ8SQ2+CTVuPs6SX15C22s7iWjEdoOuQjJy5Cp0zZK8ZzhTu3koKZ
         BWAI57HRxNfz8iEaJbrLgn0HjZ2FOyEWQTeVG77XIUHGx5WykyrOVcPxc4Jdn3zCKJsB
         B9p6mY5DrBkis9DfmTPCYHOL46/Wo9tz6e1zwN7qndNbNh8AJM8flEy/ExDCqh2omlJ5
         OGcA==
X-Forwarded-Encrypted: i=1; AJvYcCUHip7Fet1x/GI/oL6PxeNwxCRsA7m50wohG+8n+88s5x4gVi9b4PIcY1IPkfKNl/i7IyEl@lists.linux.dev
X-Gm-Message-State: AOJu0YyXJGax7gSxMRJTuZbFjbJnJ3+RtnjDIARrJ5tr6G6XwuVPQlSD
	smG75yozNmXzH6Aua3UoBW3Raown5W+KhoBuIwtCzrS6CEcdugPrjGFCqCeKzQL2rYXtQuoh7Ie
	Xh3NgqbpPUo+VTppheR+BggCPEZxuEhknCFEIOw==
X-Gm-Gg: ASbGncurbGUsdWerc697hjglA+vdrztlZFZ0rffjBCTCbO4pncksJ69GVCF02UE+6ih
	nk8G/lWj8t0Iw57rFybAjwvoQ1V7JYd8aqMtuqurx+5UykN3+EaTbVOACShj8AkJJiqUB
X-Google-Smtp-Source: AGHT+IG/uxf+62mSAJV0vjaX5OOSPPXiQApbIfNWpW/j/U/azuxZEVr6AdlTIyiVOEKxrku3T2iYp/pg0hA3s2YrLws=
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id
 2adb3069b0e04-54229538b24mr2653607e87.17.1734805590494; Sat, 21 Dec 2024
 10:26:30 -0800 (PST)
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
In-Reply-To: <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 19:25:54 +0100
Message-ID: <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
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

On Sat, Dec 21, 2024 at 7:17=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Fri, Dec 20, 2024 at 2:39=E2=80=AFAM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > On 20/12/2024 12:27 am, Sedat Dilek wrote:
> > > On Fri, Dec 20, 2024 at 12:26=E2=80=AFAM Andrew Cooper
> > > <andrew.cooper3@citrix.com> wrote:
> > >> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
> > >>> On Thu, Dec 19, 2024 at 6:07=E2=80=AFPM Sedat Dilek <sedat.dilek@gm=
ail.com> wrote:
> > >>>> On Thu, Dec 19, 2024 at 5:44=E2=80=AFPM Andrew Cooper <andrew.coop=
er3@citrix.com> wrote:
> > >>>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> > >>>>>> Hi,
> > >>>>>>
> > >>>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
> > >>>>>>
> > >>>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19=
.1.x
> > >>>>>> from kernel.org.
> > >>>>>>
> > >>>>>> What does it mean in ISSUE DESCRIPTION...
> > >>>>>>
> > >>>>>> Furthermore, the hypercall page has no provision for Control-flo=
w
> > >>>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> > >>>>>> malfunction in such configurations.
> > >>>>>>
> > >>>>>> ...when someone uses Clang-kCFI?
> > >>>>> The hypercall page has functions of the form:
> > >>>>>
> > >>>>>     MOV $x, %eax
> > >>>>>     VMCALL / VMMCALL / SYSCALL
> > >>>>>     RET
> > >>>>>
> > >>>>> There are no ENDBR instructions, and no prologue/epilogue for has=
h-based
> > >>>>> CFI schemes.
> > >>>>>
> > >>>>> This is because it's code provided by Xen, not code provided by L=
inux.
> > >>>>>
> > >>>>> The absence of ENDBR instructions will yield #CP when CET-IBT is =
active,
> > >>>>> and the absence of hash prologue/epilogue lets the function be us=
ed in a
> > >>>>> type-confused manor that CFI should have caught.
> > >>>>>
> > >>>>> ~Andrew
> > >>>> Thanks for the technical explanation, Andrew.
> > >>>>
> > >>>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT=
".
> > >>>>
> > >>>> I am not an active user of XEN in the Linux-kernel but I am willin=
g to
> > >>>> test when Linux v6.12.6 is officially released and give feedback.
> > >>>>
> > >>> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
> > >>> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_=
testing
> > >>>
> > >>> # apt install -t unstable xen-utils-4.17 -y
> > >>>
> > >>> # xl list
> > >>> Name                                        ID   Mem VCPUs      Sta=
te   Time(s)
> > >>> Domain-0                                     0  7872     4     r---=
--     398.2
> > >>>
> > >>> Some basic tests LGTM - see also attached stuff.
> > >>>
> > >>> If you have any tests to recommend, let me know.
> > >> That itself is good enough as a smoke test.  Thankyou for trying it =
out.
> > >>
> > >> If you want something a bit more thorough, try
> > >> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
> > >>
> > >> Grab and build it, and `./xtf-runner -aqq --host` will run a variety=
 of
> > >> extra codepaths in dom0, without the effort of making/running full g=
uests.
> > >>
> > >> ~Andrew
> > > Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
> > > All tests lead to a reboot in case of Debian or in my kernels to a sh=
utdown.
> > >
> > > Can you recommend a specific test?
> >
> > Oh, that's distinctly less good.
> >
> > Start with just "example".  It's literally a hello world microkernel,
> > but the symptoms you're seeing is a dom0 crash, so it will likely
> > provoke it.
> >
> > Do you have serial to the machine?  If so, boot Xen with `console=3Dcom=
1
> > com1=3D115200,8n1` (or com2, as appropriate).
> >
> > If not and you've only got a regular screen, boot Xen with `vga=3D,keep
> > noreboot` (comma is important) which might leave enough information on
> > screen to get an idea of what's going on.
> >
>
> YES
>
> # xl info | grep xen_commandline
> xen_commandline        : placeholder vga=3D,keep noreboot
>
> > Full command line docs at
> > https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> >
> > > dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa |=
 grep xsa-4
> > > test-pv64-xsa-444
> > > test-hvm64-xsa-451
> > > test-hvm64-xsa-454
> > >
> > > Is there no xsa-466 test?
> >
> > No.  XSA-466 is really "well don't do that then if it matters".
> >
> > More generally, not all XSAs are amenable to testing in this way.
> >
> > ~Andrew
>
> On Debian 6.12.6 kernel the TESTS stop with test-hvm64-xsa-454 -
> machine freezes - hard reboot.
>
> dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner -a --host
>
> root@iniza:/var/log/xen# LC_ALL=3DC ls -alth | head -20
> total 1.7M
> -rw-r--r--  1 root adm  1008K Dec 21 19:10 xenstored-access.log
> drwxr-xr-x 16 root root  4.0K Dec 21 18:59 ..
> -rw-r--r--  1 root adm     32 Dec 21 18:58 xenstored.log
> drwxr-s---  2 root adm    36K Dec 21 18:58 .
> -rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm64-xsa-317.log
> -rw-r--r--  1 root adm     67 Dec 21 18:53 xl-test-hvm64-xsa-454.log
> -rw-r--r--  1 root adm    145 Dec 21 18:53 qemu-dm-test-hvm64-xsa-454.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-451.log
> -rw-r--r--  1 root adm    211 Dec 21 18:53 xl-test-hvm64-xsa-451.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pse-xsa-317.log
> -rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-444.log
> -rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-339.log
> -rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-333.log
> -rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-317.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-317.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pae-xsa-317.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pse-xsa-317.=
log
> -rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm32-xsa-317.log
> -rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pae-xsa-317.=
log
>
> root@iniza:/var/log/xen# cat qemu-dm-test-hvm64-xsa-454.log
> VNC server running on 127.0.0.1:5900
> xen-qemu-system-i386: failed to create 'console' device '0': declining to=
 handle
> console type 'xenconsoled'
>
> root@iniza:/var/log/xen# cat xl-test-hvm64-xsa-454.log
> Waiting for domain test-hvm64-xsa-454 (domid 94) to die [pid 4686]
>
> -Sedat-

With...

dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../

Combined test results:
test-hvm32-cpuid-faulting                SKIP
test-hvm32pae-cpuid-faulting             SKIP
test-hvm32pse-cpuid-faulting             SKIP
test-hvm64-cpuid-faulting                SKIP
test-pv64-cpuid-faulting                 SKIP
test-hvm64-fpu-exception-emulation       SKIP
test-hvm32-invlpg~hap                    SUCCESS
test-hvm32-invlpg~shadow                 SUCCESS
test-hvm32pae-invlpg~hap                 SUCCESS
test-hvm32pae-invlpg~shadow              SUCCESS
test-hvm64-invlpg~hap                    SUCCESS
test-hvm64-invlpg~shadow                 SUCCESS
test-hvm64-lbr-tsx-vmentry               SUCCESS
test-hvm32-livepatch-priv-check          SUCCESS
test-hvm64-livepatch-priv-check          SUCCESS
test-pv64-livepatch-priv-check           SUCCESS
test-hvm32-lm-ts                         SUCCESS
test-hvm64-lm-ts                         SUCCESS
test-hvm32pae-memop-seg                  SUCCESS
test-hvm64-memop-seg                     SUCCESS
test-pv64-memop-seg                      SUCCESS
test-hvm32pae-nmi-taskswitch-priv        SUCCESS
test-pv64-pv-fsgsbase                    SKIP
test-pv64-pv-iopl~hypercall              SUCCESS
test-pv64-pv-iopl~vmassist               SUCCESS
test-hvm32-swint-emulation               SKIP
test-hvm32pae-swint-emulation            SKIP
test-hvm32pse-swint-emulation            SKIP
test-hvm64-swint-emulation               SKIP
test-hvm32-umip                          SKIP
test-hvm64-umip                          SKIP
test-hvm32-xsa-122                       SUCCESS
test-hvm32pae-xsa-122                    SUCCESS
test-hvm32pse-xsa-122                    SUCCESS
test-hvm64-xsa-122                       SUCCESS
test-pv64-xsa-122                        SUCCESS
test-hvm32-xsa-123                       SKIP
test-pv64-xsa-167                        SKIP
test-hvm64-xsa-168~shadow                SUCCESS
test-hvm64-xsa-170                       SKIP
test-hvm64-xsa-173~shadow                SUCCESS
test-pv64-xsa-182                        SUCCESS
test-hvm32-xsa-186                       SKIP
test-hvm64-xsa-186                       SKIP
test-hvm32-xsa-188                       SUCCESS
test-hvm32pae-xsa-188                    SUCCESS
test-hvm32pse-xsa-188                    SUCCESS
test-hvm64-xsa-188                       SUCCESS
test-pv64-xsa-188                        SUCCESS
test-hvm32-xsa-191                       SKIP
test-hvm32-xsa-192                       SUCCESS
test-pv64-xsa-193                        SUCCESS
test-hvm64-xsa-195                       SUCCESS
test-hvm64-xsa-196                       SKIP
test-hvm32-xsa-200                       SKIP
test-hvm32-xsa-203                       SKIP
test-hvm64-xsa-204                       SKIP
test-pv64-xsa-212                        SUCCESS
test-pv64-xsa-213                        SUCCESS
test-hvm64-xsa-221                       SUCCESS
test-pv64-xsa-221                        SUCCESS
test-pv64-xsa-224                        SUCCESS
test-pv64-xsa-227                        SUCCESS
test-hvm64-xsa-231                       SUCCESS
test-pv64-xsa-231                        SUCCESS
test-hvm64-xsa-232                       SUCCESS
test-pv64-xsa-232                        SUCCESS
test-pv64-xsa-234                        SUCCESS
test-hvm32-xsa-239                       SUCCESS
test-pv64-xsa-255                        SUCCESS
test-pv64-xsa-259                        SUCCESS
test-pv64-xsa-260                        SUCCESS
test-hvm64-xsa-261                       SUCCESS
test-pv64-xsa-265                        SUCCESS
test-hvm64-xsa-269                       SUCCESS
test-hvm64-xsa-277                       SUCCESS
test-hvm64-xsa-278                       SUCCESS
test-pv64-xsa-279                        SUCCESS
test-pv64-xsa-286                        SUCCESS
test-pv64-xsa-296                        SUCCESS
test-pv64-xsa-298                        SUCCESS
test-hvm64-xsa-304                       SUCCESS
test-hvm64-xsa-308                       SUCCESS
test-pv64-xsa-316                        SUCCESS
test-hvm32-xsa-317                       SUCCESS
test-hvm32pae-xsa-317                    SUCCESS
test-hvm32pse-xsa-317                    SUCCESS
test-hvm64-xsa-317                       SUCCESS
test-pv64-xsa-317                        SUCCESS
test-pv64-xsa-333                        SUCCESS
test-pv64-xsa-339                        SUCCESS
test-pv64-xsa-444                        SKIP
test-hvm64-xsa-451                       SKIP

-Sedat-
