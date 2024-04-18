Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C616C6BA
	for <llvm@lists.linux.dev>; Thu, 18 Apr 2024 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713455070; cv=none; b=abrh1blnbiyGlFWsj2dpnmP2r8t0nSUOvYgGVJ6NYeDWpZ2el8Fzdi34JtvD06WBQeOcKNTdiF9eDep4qLQG6ulmKA4adkBe17JLAZnOa1i30h6eXd93wUXN+fNL8ehMkxQDTfXdANNShMixBbjpoFUUQsMB7IzPtB7cEgjO/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713455070; c=relaxed/simple;
	bh=eW41FDAYitNVnqBwCLv7gIF9iBGx/T1PWewJl/Lc39k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9ycTdtrnU7Ku4o3zJB2KpQPhsGCV84vUSz0H9kb0ubup+vHSuyPBfhUWTPK4N9K+/AkAfxv+loFnMNSq76sOkq9YtrQ7BNli/EEsda5gjuQr5f4aX2xrnLF1SaCWcFa3f5ZHLWysqOQYjbu6q6p16quSHRooOeaSWut/Z5yc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zBLG9qh6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zBLG9qh6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-418dcaa77d5so7796055e9.2
        for <llvm@lists.linux.dev>; Thu, 18 Apr 2024 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713455067; x=1714059867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtCAalpEU3sOWMKDUifAwR/7NkFi/BBuronL/FSnyNk=;
        b=zBLG9qh6kYDHDEPMPuvwKNhp0KgWBkP88LkyOu72Gv2VTE7DQTlP2dyoEND4nokzFr
         GVgDGWj4IbxaXj0DXQkJzhivu20g+IzF2irJDlFYqmAJNL5y9IEkvts9j2h+a2YsNhDV
         6eNUpumOCE7Esn2RJz5Nn3rHyMWQ1EyTOnFoNSlOUWCS7g41FAP6EYwl2Lf0tcMPDWpf
         KuwYjUAYc0Bl4uS1os0rhr4OzWaauj3UZ0NjggwzSiiNdTNh8ThrlkUOZBFFrI0aTTBw
         upf2i3+s+EkLdWarBi43n+dnewhF05G4DvZz1Z/ZuK/xq1wli/nu+LXvXE5YGNHMs0Y4
         Ktiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455067; x=1714059867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtCAalpEU3sOWMKDUifAwR/7NkFi/BBuronL/FSnyNk=;
        b=asXu3V3wh/9b12GblUoGx381aIMuNy2KqoQWaDB8RV4WsDem2y8gJjC/CAwDn8F5EW
         0KTcJfCzsO1xTNnA4lDyHh08pge+rdQMsCYWcpKDGY2XC1Uzf8eiFWteWHBaMshYeaAl
         GwVUl2HWXWdkx31/X/dR/wjg+kpgjMR02F2cPVPZ2eFQGKE3WI2QCwkAGsBSLAfUT8G1
         Rf4jvWVCR9NUAKMqwly8t06YtAoAI5oGyEdFv7k3xv8lkymfzn6x/hvbvVP0RkKjEYCs
         +L0CiBYF4hdMxIU2ik4BzG3EmjnF1JLc27snCZqw5LvuDwbsbLwZUxVBcTBu8OOayonO
         uQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWrzkpmg2UPTF/eMFVsGKc0RnYMFVIeSw1lJMnX4eWQii+agf88sMCY+kZ75/DftrlxWzfIq1FAyFA6svuiQTpAo+EjKQ==
X-Gm-Message-State: AOJu0YzgilSwq4HIdVgsnrAUXnL57KMT7kQEcDAQo0lcgs0L8tGJiBcy
	BV525BBBSuf7byjOmSilTFw2mH59PNxJLGWs9sjt+k4QCf02VO+NDN5p9LIn43uGlsI4wA+wLTL
	81M/hXYUpfkgP7xe1kywiI4CAtjBS+jNuRXgJ
X-Google-Smtp-Source: AGHT+IH1/hV82bCx1Gv1NIXaALjYWfsTvoaiACaL0kbh8+h0DPYoNJGE2WuAkBJUelNQ/WhcocDOHrc4DjFmQeedIa4=
X-Received: by 2002:a05:6000:912:b0:346:cd6f:40d4 with SMTP id
 cw18-20020a056000091200b00346cd6f40d4mr2059470wrb.59.1713455066857; Thu, 18
 Apr 2024 08:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417-x86-fix-kexec-with-llvm-18-v1-0-5383121e8fb7@kernel.org> <46343CD5-24D6-46BF-92A7-0B0FA0E6937D@alien8.de>
In-Reply-To: <46343CD5-24D6-46BF-92A7-0B0FA0E6937D@alien8.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 Apr 2024 08:44:12 -0700
Message-ID: <CAKwvOd=3Jrzju++=Ve61=ZdeshxUM=K3-bGMNREnGOQgNw=aag@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/purgatory: Avoid kexec runtime warning with LLVM 18
To: Borislav Petkov <bp@alien8.de>, Arthur Eubanks <aeubanks@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, morbo@google.com, 
	justinstitt@google.com, song@kernel.org, ribalda@chromium.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	ns <0n-s@users.noreply.github.com>, Fangrui Song <maskray@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 4:15=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> How much of this silliness should we expect now for other parts of the ke=
rnel?

Looks like ARCH=3Dpowerpc sets -mcmodel=3Dlarge for modules and ARCH=3Dum
does for the whole kernel. So that LLVM change may have implications
for those 2 other architectures.  Not sure we've had any bug reports
or breakage in CI yet, like we have for x86+kexec.

> Can we turn this off?

Maybe we need to revisit
commit e16c2983fba0 ("x86/purgatory: Change compiler flags from
-mcmodel=3Dkernel to -mcmodel=3Dlarge to fix kexec relocation errors")

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3De16c2983fba0fa6763e43ad10916be35e3d8dc05

at least the -mcmodel=3Dkernel addition (since that patch added a few
additional compiler flags that still LGTM).

> Why does llvm enforce .ltext for large code models and why gcc doesn't do=
 that? Why does llvm need to do that, what requirement dictates that?

Google is now at the point where a few binaries running in data
centers are measured in the gigabytes, and attempting to link them may
result in relocation overflows.  From that commit message, it sounds
like they link together object files built with the default code model
and some objects from the larger code model. Putting large code model
data+code in distinct sections is helpful for then being able to place
those further away in an object.  For other architectures, the linker
may insert a veneer/trampoline.  Not sure why that's not used here.

https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html#index-mlarge-data-thres=
hold
makes it sound like GCC may place data larger than a certain threshold
in a new section. Dunno about code (.text) though.

Arthur, you probably happen to know more about code models at this
point than anyone particularly cares to.  The raison d'etre for
e16c2983fba0 was avoiding R_X86_64_32/R_X86_64_32S relocations.  Do
you know if there's another code model that can force R_X86_64_64?  Or
is the large code model the way to go here, with updates to linker
scripts for this new section?

+ Fangrui, Ard, who might know of alternative solutions to
-mcmodel=3Dlarge for e16c2983fba0.

Otherwise, I think the dedicated linker script is the way to go. We
really want tight control over what is or is not in the purgatory
image.
--=20
Thanks,
~Nick Desaulniers
