Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84EE188736
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734863868; cv=none; b=Zy4Uq/CnsoKUWCKEh8VieW8+WvLDr6QnhEMi+ggfKNT2Ok5bozlfKqKu7Hf20dEPbt92jEZE64m3eSAsVrJhIT3oP6Ia/44s5TZfOkbctcdBeHrfrY/iwfJk4pI8cw0Rsb83Gmnk8bnLGFlexxM7oKNSfgasvk7fbd+a2nVtotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734863868; c=relaxed/simple;
	bh=Dih0UevojjK6aYi/hraFiM0YbAA8nuuUB3ySstbKIVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5vEWinr0jaQHeWJUEkLwBaaVO56rNR+yFqnnDfYnQq06vALdGicbLwtymr7/e7shq0XKidGJgRQdAZrCUob7q6C6GtEsE6zuLZpeXw/4YWhcItbQOCiXtslWYdTo8hNsxrkRf1UeYKf892BAHTbi5LH+QCZ4cIeesJHdEnTbp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xhu+I8tk; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xhu+I8tk"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so3277029e87.1
        for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734863865; x=1735468665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAf4XYF+BN/cynPMUouPVnj1TJkDYFatX5sPirx1ssQ=;
        b=Xhu+I8tkVHEULKKgG7QcdHtelKZ3OIFtDakAI6jvIOHhoMKQ58He7EHKG1KYhUonwK
         S1SQvMOiVicqXQeu/YksZqKVAGGryHYeEsyRKvNp3Qg1Al5UEFfFKnoaAKHotcrvNYDM
         aB0YKDzBVQiPYYlc6aVwRgihIDhmePpDyW8WW2UqmjMv5nIEoWqs+ERf6iw+8rzWYBvX
         ohqKygJkPlXEGuQLapM0CKd3kViwo7UJW0Yshze02qp8ZaF+f5pqJ7gf0Om72tOXo/W6
         3W6KrLY8y4bEwa6RwSGA2DR7NXN2tkuPFiYcyWpRbgADQQQxq9m7YMazn3xL1ehHY2og
         aDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734863865; x=1735468665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAf4XYF+BN/cynPMUouPVnj1TJkDYFatX5sPirx1ssQ=;
        b=LHpSeKKHvrHpapUQoZ3qDlbtNZivmDqRGwLsdH9uL+/2ML/l5yZ1HqJ6vV0lmEznNt
         UpK78alGmt7EASFZppwz8XuBTdAMO6FRWIjeMB6HSGHWXZF8s0SV85Hv8tMhuyVyJDj3
         cPEXFV2dMlrsgGQyEZEIcj3Al2JAXZtyvqRtHsUh0pEpEXO5uNrv97EMONkMlVBHkcWr
         XTTg2Sq4zCgWh0F2WjqhUHhDgW38SwG2lrC4G8nZzZu3li0hIEf7BYqi3h4RrOuSwhlN
         lTA1+DEzZVWNudEl1lKZpkGdrCY135h9OAc0DZgJIFF3scMaqRl1g3UMFMpmfaBA5vna
         +mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMxFCyLNOQ4MG1cmtPxaQxYcKILFRGTai6Nmqp1wS9d25vUi1NPEZq68R7KTHcfwoceMZS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Ac6gtwPsyHVDPDR16PXHpUA4LdWFczQ0vhc2LczLrSmp4H2l
	3bC2BgAzxG5ptBUVdPsXbgMPLychonQ+IJb5p7xwhwW1JMPC7v5kCCCbtfG1RCYUYJyDKHkwL09
	Ak4xLhFma8UnkAXS+hQeyMOROFbA=
X-Gm-Gg: ASbGncu1IflFoUedyQowDsmJ1Wb0L0XMMwQXlwUlm3N1xldkiB47Dg4KLN3URmv3tyT
	GGT+0UMPUgaIkxqg2/w4qJNK5onJ+rG6Jpdoj5F5HT5/QiGKWiq75xXJ8DiP6LiwvhR+J
X-Google-Smtp-Source: AGHT+IGJ4XnG6hPJJ83WUCPU4UF5z2bmt9KoMQ+xXAQfdQtvpcUiv3Qt3tZqeiwj1hLIlyJ3fx6mjYGevzp0orcU4bE=
X-Received: by 2002:a05:6512:3510:b0:542:2952:8848 with SMTP id
 2adb3069b0e04-54229529bb5mr1819462e87.3.1734863864768; Sun, 22 Dec 2024
 02:37:44 -0800 (PST)
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
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com> <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
In-Reply-To: <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 22 Dec 2024 11:37:08 +0100
Message-ID: <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
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

On Sat, Dec 21, 2024 at 10:31=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> > With...
> >
> > dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> > dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../
>
> That's completely bizzare.   There's nothing interestingly different
> with those two tests vs the others.
>
> I take it the crash is repeatable when using either of these?
>
> ~Andrew

This time I stopped SDDM and thus KDE-6/Wayland session.

Tested with Debian's officially 6.12.6-amd64 kernel in VT-3.

test-hvm32pae-xsa-consoleio-write SUCCESS <--- 1st time I tried, never
said this is not OK

test-hvm64-xsa-454 leads to FROZEN system and DATA LOSS (here: ext4).
Reproducibly as told many times.- in Debian and selfmade kernels version 6.=
12.6.

Stolen from the picture I took with my smartphone:

sudo ./xft-runner test-hvm64-xsa-454

Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
Executing 'xl console test-hvm64-xsa-454'
Executing 'xl unpause test-hvm64-xsa-454'

^^ System does NOT react!

I can send you the picture on request.

-Sedat-
