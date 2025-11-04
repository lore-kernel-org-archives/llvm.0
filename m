Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D452D5A0C
	for <llvm@lists.linux.dev>; Tue,  4 Nov 2025 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297984; cv=none; b=ZnbO8mRd/HM78MuEwMTw/FfbpgnyFyDZYatwB7+j+VR/EaSQhpY1QfD2kFOH5B1WsHI9sngFDdM75qDIhrrGSzR0BpcRW3HfW12ccU/lkZ4RShYFpeQyDDaQ+75svZ1F8vfufe+bso2NNpaaCBaMRkKIOs5DXUida20MUzcVvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297984; c=relaxed/simple;
	bh=B4n9H93NbsFZbSfMQFYy1O8gsxKV7xSa8PC/wQbY+yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irydU8NOFlziduEsukjkHzL7G4P9UWkutSr/lc0FBTcYN6JG8G2B5FwP5hbOwjFfXYxmht4CE41oZ2+hOj52GSGaz19opmMC2AFzDfQkpKs07SKjg1u6/zxBw8NptVCTPDY73rMsB/2qPrzOAjpU6OdT9n4ZtyqPK8JUvFzzmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CoSWOeLu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CoSWOeLu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso10224369a12.0
        for <llvm@lists.linux.dev>; Tue, 04 Nov 2025 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762297981; x=1762902781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4A6s2r85JE/O60Sma91flPa89d+O9AdRu1hAAy0Ftc=;
        b=CoSWOeLukFmQvgEuyJZyxW35E2m4TOoku8NKOjm2to8FQK8FrXDjbx1CnBcgJC7dgh
         MM0iJv8bkFn7F+gGbW/QJMIGMY5AjCcBonwDF6eLCF8WME6BmhLz9a+xrUdanpNXawth
         6/YH1rAHj4NSUGNeN0Pzlf22O4Ap/htFD7PwmIf7BRnCoqrQq9Zkx8hr77feWdTEQa8b
         c/YQGm2vrnvA+vChpcyXM40UbPR9LTvuL46TfSWXGsrE7JiPCAnUCIehXXKkb6a722XQ
         XkzvZ/WdGY6h3474QBYPs6rYTG8eY96ZRS730uoXPhQXd+EeH7aIdxtfo6koOrogk609
         xuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297981; x=1762902781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4A6s2r85JE/O60Sma91flPa89d+O9AdRu1hAAy0Ftc=;
        b=m4tugHteJP3/y0y5cvpy081n/Q4Efu5+Y8TNq1ZnzTFSB2NvtqHZEdsS/DDMS2rJYt
         KahFdHvItpFafz0CR6O69yP4+KzTDexa61CJmo4XCGqlq5c0d9kA3d50jcjbNQ+V6gWJ
         FzdJq4Et5/BTMlb53SW5EyMxhrppgRHQzpZd2pc/N2/G3GeQ8MNXiRbiXWyVwGmPLhO4
         iqeKWB4OkXTr2T8D4QrGx8Rx5vGpjYLGVsSWyOEMbI/9Em16HtxA5gXuYuFg6QtT65d1
         VZ6tKeb2zCHfoxOKt4hUB5bd3yz8vvYDLFKx/Xh07nl+Kc1V2Edu9Yy0xPY+mW/bLX0o
         ZYzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/wsDPbo2p4fmASzVixpcazP3SMSf8k6iEdTwfp8ZG+B++mQ+aBxTHwFejNzEEllAfEk7B@lists.linux.dev
X-Gm-Message-State: AOJu0YxWNaRsmTbWvm9DxQPI/+Bgd8bMNReR4aZcBRVYUPbLzTmISuu2
	sMVsmKy0z5qsUav/PjOAwI6AGGkUD6ycp0IlmoddH76msjhcGZjnHpNqFlV8QGnoFCnk1DxG/6N
	iS8uZIExhWwCUyyh2KVYT+tsva9gJcMDdex8a1v/XBQ==
X-Gm-Gg: ASbGncsorFo2n+GajPXw28H2mRVhv/mW3qw1iF7sAn6Xf/g+klzpF4EqX806pqT8d+o
	pzN/b/fIlmcYH5gUk7usuCHQwAAYT+EsRQpwgNRoanyo+vMD828YIPUrl8fanIRE/ildnZzJM5I
	pvNaQYu6ZC6rgbzjc3FpVHLFoOvzWC/HTEUVX6SflzfIjz02+D9btTgi9rz0fXqmbAc1uTUPqII
	CTTtyRd/CZA1kU7SV2kigM4ArrFDS7aORK0WkDQU/8aBB/7l2710JLifg==
X-Google-Smtp-Source: AGHT+IHkWWZErYuLad1UBr4njjLSBFdMzkNER6OzhDlN3Gq2YnhAVj0tylfyLg91Povf3vXT6QPN/toCi7bUhtkuZFk=
X-Received: by 2002:a05:6402:35d6:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-641058d0b39mr882506a12.13.1762297981094; Tue, 04 Nov 2025
 15:13:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511042251.paO6f5BZ-lkp@intel.com> <aQod7jDFBjw9T-u2@kernel.org>
 <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
 <CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com> <20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
In-Reply-To: <20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 4 Nov 2025 18:12:24 -0500
X-Gm-Features: AWmQ_bnjdc4QtlbQ63r-Q4KMUd0Myc6Dyj0vlY4QdgnbVI_lhk-7gxKFlvCmp18
Message-ID: <CA+CK2bBJRXX5u9sCkG+WKW_OK1biyBUfdcJ73yuUdeNv6QevbQ@mail.gmail.com>
Subject: Re: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:15=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 4 Nov 2025 12:50:49 -0500 Pasha Tatashin <pasha.tatashin@soleen.c=
om> wrote:
>
> > The fix looks like this:
> > diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> > index de4466b47455..2a8c20c238a8 100644
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -477,8 +477,8 @@ static void __init kho_mem_deserialize(const void *=
fdt)
> >   * area for early allocations that happen before page allocator is
> >   * initialized.
> >   */
> > -static struct kho_scratch *kho_scratch;
> > -static unsigned int kho_scratch_cnt;
> > +struct kho_scratch *kho_scratch;
> > +unsigned int kho_scratch_cnt;
>
> This patch is making changes which are already present.
>
> > --- a/kernel/kexec_handover_internal.h
> > +++ b/kernel/kexec_handover_internal.h
>
> Against files which were moved to kernel/liveupdate/!
>
> > Andrew, Mike, do you want me to resend the "[PATCH v3 0/3] KHO: kfence
> > + KHO memory corruption fix" series with the fix included?
>
> A little fix against what's presently in mm.git would be great, please.

Hi Andrew,

This is because in mm.git you have patches that move kexec_handover*
to kernel/liveupdate/ (and they fix this build problem), but
linux-next does not have these patches. The patch I sent is a fixup
for  "kho: warn and fail on metadata or preserved memory in scratch
area" patch.
