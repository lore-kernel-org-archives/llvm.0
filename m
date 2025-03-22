Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA57235355
	for <llvm@lists.linux.dev>; Sat, 22 Mar 2025 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742676266; cv=none; b=sjhjpC5iXx+8P0C/zd8V1PuIyOYY3kxFAH3kQ8xEJ55Tr2vhmCxAvysGNXFbAj76Dcr/VgyzJMqhEyPQk8vrZFKf1f53c8Lk43M+dBQzYJoPapYvEBcvmIXGa2Kt3r86d1r8SIS+Vyv4HwqOskAxZKRkx+u8FCrnsw8KrmLnhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742676266; c=relaxed/simple;
	bh=UKlciIrjeezvhboHb0wpfeljhOCf1ywpYrDH4+tDbI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmMFolZ3F114Vredsx6GfnKU06sU18uUq53gGXlyZMPIMs2uULezkMDucwRmGQGm/sPvFO8bsedHIGeeds66kRLntjx+2M89UGPFnHVHL85qUnQfEZYcePY8+JBY7VaBNUc5simANYDjr9R6SNBqC0uJyG3a5YlMLq+QFIohFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=NcfumHHJ; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="NcfumHHJ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f768e9be1aso39793047b3.0
        for <llvm@lists.linux.dev>; Sat, 22 Mar 2025 13:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742676264; x=1743281064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+vTxWBkSi57+4WfhJ24nlBMfZiKcsmbPvtMMRe99nY=;
        b=NcfumHHJDhA2qlEA1SSJorgzLbzw+Zdg7zWypEg7VNIv9u+ePFKKoMSEZ0e/Wz5CoM
         MGtGQrH7YECw3QkMMnGsyTAFrvqAx/DY2jiQaV2QluXx7n0qyk5jnPGu6m7S78pScsVq
         A/5670B+YxbMPV7O8eej0hIbiDA9iv5sPWpMUAjECfKCZX7bYzUJrOkN0QqiO1Ed16ad
         Npmt4sn2ncLzm22NSyRYZsipRKVic6WwwdJpiQdkmcNeP0cAxqXH4AJHdjTR6pY/SW+m
         iekXJNLpgbmmhxNQb/AB5SwfcckukAjFLEYT26lhuEzB9nfCRQnaJIcR2aKokyVfjIki
         gkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742676264; x=1743281064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+vTxWBkSi57+4WfhJ24nlBMfZiKcsmbPvtMMRe99nY=;
        b=WBRAkiZNpeUy/hrO5HgAZA7ABCadKTGrkEdwkDZfFQBhc2/UJ6zZydcqf7RYiBpfEg
         LPRBH/TtDlbq8TmnAZfqVPNOohEE7hsuS/lDLBYLrsfhliJP218HPhxPMFkaUOqxuEn4
         VtxYMfLpJ6LhpZ+MQQButhT3WqFsWBxiWSP4g5dda7WSmJCZE8YfvWTwb8iAnMG3/DiN
         2NwyfcRhkmEpQLJW6uHq2pPAGipu2EWiVlCuLtYp/7urrhm+MYgJAibq4FjCgXoizo6w
         xOpdJRWvHwB45AaQOvyhRRjbuaHaXPtx6Inq1WK0qT8eGvr3fEGlVYFpBfWNlxkzHT8L
         mkPg==
X-Forwarded-Encrypted: i=1; AJvYcCW5beaU45ezqvF4t7qqVPBYH+pjev1cyROJRqugVi6lTmRaZIJ3TciFL3dvVswOUDEMj0JR@lists.linux.dev
X-Gm-Message-State: AOJu0YwpgoplKwTfecQOOcPSOIBGl0966YCC8mSrTdtU2GGupiph4tEM
	iSuNdzKRFq0v3XDsSeKVt6a+MIIjHSslIx29TWwrwzzMOQrX2tJLCe/jEU5FHMTHCKZ78yk3MM5
	WKCmYt8+YoZpGl365a7v1wdbHYjCGidNCtftM
X-Gm-Gg: ASbGncsvlbQVy7U21gurfBUBWm7MgTD2BbIMyqGHY9vU/PwGo+C8uqh0aeMmBI09DuI
	z8PuoEV2zuGJSB2lAzmARfNQPU/bzNSM8Rl/MzgYvZ3j849dXEzwm9to+KqmpT69/PXf4GFRjPK
	xeRFs5BdMfHqtaRw0C/v8/5UsJgg==
X-Google-Smtp-Source: AGHT+IFcKv9scbpPRaXEmfEq8UTNsrOWBSBmEAVu84IGUkNbStpZPTP0X6nSe1KdmVF1IIRaxjZIWblNbdfkJkrFAUw=
X-Received: by 2002:a05:690c:290f:b0:6fe:5dba:b190 with SMTP id
 00721157ae682-700ab33324cmr140033307b3.11.1742676263726; Sat, 22 Mar 2025
 13:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321164537.16719-1-bboscaccy@linux.microsoft.com> <Z97xvUul1ObkmulE@kernel.org>
In-Reply-To: <Z97xvUul1ObkmulE@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 22 Mar 2025 16:44:13 -0400
X-Gm-Features: AQ5f1JqeAnjTq6zKFyRLTvg80Cofo3Oa1gVwBdukxtEf_asDyE42Nwb-Nf9BM5s
Message-ID: <CAHC9VhQ4a4Dinq+WLxM88KqJF8ruQ_rOdQx7UNrKcJqTpGGG+w@mail.gmail.com>
Subject: Re: [RFC PATCH security-next 0/4] Introducing Hornet LSM
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jan Stancek <jstancek@redhat.com>, 
	Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	nkapron@google.com, teknoraver@meta.com, roberto.sassu@huawei.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 1:22=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> On Fri, Mar 21, 2025 at 09:45:02AM -0700, Blaise Boscaccy wrote:
> > This patch series introduces the Hornet LSM.
> >
> > Hornet takes a simple approach to light-skeleton-based eBPF signature
>
> Can you define "light-skeleton-based" before using the term.
>
> This is the first time in my life when I hear about it.

I was in the same situation a few months ago when I first heard about it :)

Blaise can surely provide a much better answer that what I'm about to
write, but since Blaise is going to be at LSFMMBPF this coming week I
suspect he might not have a lot of time to respond to email in the
next few days so I thought I would do my best to try and answer :)

An eBPF "light skeleton" is basically a BPF loader program and while
I'm sure there are several uses for a light skeleton, or lskel for
brevity, the single use case that we are interested in here, and the
one that Hornet deals with, is the idea of using a lskel to enable
signature verification of BPF programs as it seems to be the one way
that has been deemed acceptable by the BPF maintainers.

Once again, skipping over a lot of details, the basic idea is that you
take your original BPF program (A), feed it into a BPF userspace tool
to encapsulate the original program A into a BPF map and generate a
corresponding light skeleton BPF program (B), and then finally sign
the resulting binary containing the lskel program (B) and map
corresponding to the original program A.  At runtime, the lskel binary
is loaded into the kernel, and if Hornet is enabled, the signature of
both the lskel program A and original program B is verified.  If the
signature verification passes, lskel program A performs the necessary
BPF CO-RE transforms on BPF program A stored in the BPF map and then
attempts to load the original BPF program B, all from within the
kernel, and with the map frozen to prevent tampering from userspace.

Hopefully that helps fill in some gaps until someone more
knowledgeable can provide a better answer and/or correct any mistakes
in my explanation above ;)

--=20
paul-moore.com
