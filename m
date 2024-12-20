Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B934C97
	for <llvm@lists.linux.dev>; Fri, 20 Dec 2024 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734654484; cv=none; b=XAj9BhpKgA0YJvnJr2GMxzIf7YjERxH4Lv3tAVw0EVEIWbQzlYqnjua2qy/F/OW5LFEi5RWx/XG+tZ4MF/vF2FEjfCsR5EJzdKfP5Kr6l2WfiX8v6BB2xbfFiYEIvPHSpUwHEAbb9egsI07GhGzggJ7j6K3edxbtLOu2IDXOeDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734654484; c=relaxed/simple;
	bh=eTO4qLFVLWM7uDPgkBqgHCUS/GGGhm4RqKXT6sImQfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxgFg6agS6DLC1zi8wXJMJhoM13G96GmY3OoCBvfJlZLjrG3OGNPzgnIZXwdFYYYfPjORMSjDwV1+l9Ipiz/vSCPWh6SdbrCRA4uJlU/HlRVwSW1TyoVjBh/7+eF6rEzvHpjviQhtVQ2wBDiGZOQBBD7gbrw9FbWgXlWI5rkxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IC2oey+o; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IC2oey+o"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54026562221so1260513e87.1
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 16:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734654481; x=1735259281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UhCGwjT4MNgsAsS3x60eka2ReGd19hVX6zntAyJ6Al4=;
        b=IC2oey+obnksnkLGpHCS9i7EFF5/64uNhJb2+sXFuikSZd1iM+1QvQx3Pd4z5kWPGe
         lINSAc8QC5clVN9AmqMVH2CfDJkotf4zKZ4D+JMJCHFPW71rtFo+n5Oink8jddl7AdoE
         inLCjFrDDM6va3hanzC5qqK3jUFnFjGjxLI7Jo62jkMymh7pIv4YSsKhlpA9uF2YAFjK
         CnB/zMi3rGyxr8e1kzgvJzeL2x+d0ZLDE82zTiPUlbwQDcK+biQiK7P5Zwb11VQrloXA
         JrXmphlWvwLI1MmXDjAhxpijpblV1GZYzUtrzlhoBlEyxlmp3EiMwmr53Z4kFDJlCbrV
         U2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734654481; x=1735259281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhCGwjT4MNgsAsS3x60eka2ReGd19hVX6zntAyJ6Al4=;
        b=eC4wtqxNP51dHVu7z2ow41dXJcqCmFkfW4jCFyfoYa+pNUtiMsJsLOEApjjVVgd6jj
         E9HUCCrQ/jX/hkAVyPz0aT+8hyIMhlY/F4xIA/CK3YSbBdrts0rlkHZYZGDg+aEaCwCI
         e7DqZOvzmGmW35DWxZpTbdfDZRMKQMJLkGMpBdYjzwB60MLXw38yRQ+kZouzL0Op5Aym
         mICt7zImGR6VgVZfzEQa0uTiJGJqtDmqUOrqiO+A6aVFaa3NLqkMbE/F2rf4+wGlWmF2
         mKbzRyJRBya/glrmF/eeEzBhCOHj+ihEWLOFpjDZg6H6KI2L8nrzhblK2Bo7fEIENwZ3
         OL1A==
X-Forwarded-Encrypted: i=1; AJvYcCXS21b58O8iwsLzfezJxhgX8BTllaTbUPv/BTgSnhsjRyCHxOhj7UNAO8uLVm87G7hPUmrr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6Y3VObwQMgh56uQRiXxoT/7gRE26nWJPpq7ZqpLnPMK1laJc6
	vNOiU6qN5pvFGXvv2MDlyR9xUuJx9GTRHU3K/Q9rKP7l5thl8SzQQLG0AncMhZh1jjfk+3+Bkxw
	rygWDXEnheDHbdLT/FEW1lxPIIIs=
X-Gm-Gg: ASbGncuZGQmxDytdQ8HMvDFIUu0iHNHrOTHx6A2eFe29l1BedaBPMCiAZxk9fi1sQ0M
	GK0jmP0uG1DL7gmH4e5kDk3cR2zwP1emyjlRXWCgvpL0NqmzOsv+L60PuX4QNh1fqARBA
X-Google-Smtp-Source: AGHT+IHdMSqXFO0bUVEDAZ4SCZ2fQwBZ1kEmH9L/snNjAN+YPeQgREXfx920dn0tlJ68REUVRA6KTN5FtpWwCfHyps0=
X-Received: by 2002:a05:6512:318d:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-5422956bdb6mr135555e87.52.1734654481033; Thu, 19 Dec 2024
 16:28:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com> <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
In-Reply-To: <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 20 Dec 2024 01:27:24 +0100
Message-ID: <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 12:26=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
> > On Thu, Dec 19, 2024 at 6:07=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> >> On Thu, Dec 19, 2024 at 5:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@=
citrix.com> wrote:
> >>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> >>>> Hi,
> >>>>
> >>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
> >>>>
> >>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
> >>>> from kernel.org.
> >>>>
> >>>> What does it mean in ISSUE DESCRIPTION...
> >>>>
> >>>> Furthermore, the hypercall page has no provision for Control-flow
> >>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> >>>> malfunction in such configurations.
> >>>>
> >>>> ...when someone uses Clang-kCFI?
> >>> The hypercall page has functions of the form:
> >>>
> >>>     MOV $x, %eax
> >>>     VMCALL / VMMCALL / SYSCALL
> >>>     RET
> >>>
> >>> There are no ENDBR instructions, and no prologue/epilogue for hash-ba=
sed
> >>> CFI schemes.
> >>>
> >>> This is because it's code provided by Xen, not code provided by Linux=
.
> >>>
> >>> The absence of ENDBR instructions will yield #CP when CET-IBT is acti=
ve,
> >>> and the absence of hash prologue/epilogue lets the function be used i=
n a
> >>> type-confused manor that CFI should have caught.
> >>>
> >>> ~Andrew
> >> Thanks for the technical explanation, Andrew.
> >>
> >> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
> >>
> >> I am not an active user of XEN in the Linux-kernel but I am willing to
> >> test when Linux v6.12.6 is officially released and give feedback.
> >>
> > https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
> > https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_test=
ing
> >
> > # apt install -t unstable xen-utils-4.17 -y
> >
> > # xl list
> > Name                                        ID   Mem VCPUs      State  =
 Time(s)
> > Domain-0                                     0  7872     4     r-----  =
   398.2
> >
> > Some basic tests LGTM - see also attached stuff.
> >
> > If you have any tests to recommend, let me know.
>
> That itself is good enough as a smoke test.  Thankyou for trying it out.
>
> If you want something a bit more thorough, try
> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
>
> Grab and build it, and `./xtf-runner -aqq --host` will run a variety of
> extra codepaths in dom0, without the effort of making/running full guests=
.
>
> ~Andrew

Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
All tests lead to a reboot in case of Debian or in my kernels to a shutdown=
.

Can you recommend a specific test?

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa | grep =
xsa-4
test-pv64-xsa-444
test-hvm64-xsa-451
test-hvm64-xsa-454

Is there no xsa-466 test?

Thanks.

BR,
-Sedat-
