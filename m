Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409119C56F
	for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382758; cv=none; b=H07imGqLHwfsZ9ir4DwgyasNi65dadxKNiYIHoTbiofR32DOetmJC2OUEL94kPGLA+JckTGfqJml+DqTu3Otm0qpRE+DH8XUfSo9IrOfKJTaC/PuUeqLN8KufRD+s56TB4Dq6zFDjOtSv0nWbC5V6lFiiTrfUc79N+HRb17lZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382758; c=relaxed/simple;
	bh=XqAYvEbg0ScEuxlOsbIADwPF2P2ep2WjvKN4N6o86Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpVKV+9PPfVOYTYsSlkZWOS18/PD50JxFdnYKdMg/55aMjd3jsIIFCx6pPPGPSaLEyG+0K0KD+8CtA2XTrGPSEwmgmt5tuJv6KaOW+XHU50N7SWMZIEFLZpBzrodfy+t/VGolvtt1Q4794eHGM050KpnirsKIJRov8EFgvyuhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWm22y8/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWm22y8/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so114829a91.0
        for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382756; x=1730987556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqAYvEbg0ScEuxlOsbIADwPF2P2ep2WjvKN4N6o86Qk=;
        b=WWm22y8/rbLtsDQJvw22iQ1ZWKU675fwNC38odrkTLM7q5i7rQ/VfQhDhJWSCrb1C1
         hZWM1rxXWIAvHv/SIbkRz0hJ45Inx+tiZ859aNaIwHsB040P3zzZAf4fN9Ksjgo9OZWq
         BYDnszvRoD64e5AvfL/y++f05KWFpKpr0MlmxQAtsPV4lsx2Y7KwuFlTPH2WO/FnmmPW
         f2w6hv0T5x9UZWKM1amLxcjyArgCYuV06l0gcotK6DA6yFW4XwB/e9CWuH8hQNwB5CsT
         bb4pXJLyxuqlhr8dQr8rfSix5eR2nlX5IfWKQ17ApMyvan44WM7xT6wIPFp5Cs1FOYiu
         Psbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382756; x=1730987556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqAYvEbg0ScEuxlOsbIADwPF2P2ep2WjvKN4N6o86Qk=;
        b=pNVZpn4usgEDgt5xte4M3DhbhOVBaZt+hJW7t8/gHEH0dYgSmtGxO3+iWp+RxbJvYW
         dmg1BkdYuYWFC5V+m3SDZtO6M0TFREh11BrF4WsBIiHk4sVKE2KtxJ91olPMqMeJJW/Y
         b8DQHlRVCWLAz0XgvkSM3MTVs5AXFpf//mnPd1SDh72WG9CZwZsvGbrVjkDOGEwI+C4I
         QasdaoPLqW+pk5kzGLmrDJksgzNb8YyJh93VTHgIU1yaLnmsZmhK7vB2jT9Y+mjYhsjH
         MCyHj4BqcMet0xe79SKc9Vj2/hVltt3Yh/x5wBNvr3gvfLBDcAf4dGBn/9aSfJL+BTAn
         2rAw==
X-Gm-Message-State: AOJu0Yxbx0rthAv5bfrKEbkdrsWEN4OM7gQhJLRm065UBIUwg3gsxYSa
	5L6bncrDrlrgE3p9tmKTzPi8ylwH+S+TuHYLRo4cx5XDwznTTligPpnSUHlSz2dSs88irs5BZ1o
	MwT1b43Rxxqb7sc3DPa6/BH0LWMk=
X-Google-Smtp-Source: AGHT+IH3lP7KAoykN0To282xGvVNtEHqvg8PeudVm1toAFmsf9360PIFXj0/anZ8PL8vlMuYpo2rcIIlD2Dz/rt01Dk=
X-Received: by 2002:a17:90a:780b:b0:2e2:b20b:59de with SMTP id
 98e67ed59e1d1-2e8f1068be8mr9423408a91.3.1730382755534; Thu, 31 Oct 2024
 06:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030180500.GA2334578@thelio-3990X>
In-Reply-To: <20241030180500.GA2334578@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 31 Oct 2024 14:52:23 +0100
Message-ID: <CANiq72mOVRNmCNTLv9yBegAVvx5mSLqayoEa=FU+0NdWtyiDfA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 19.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 7:05=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 19.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 19.x
> series is no longer supported.

Works for Rust -- boot-tested under QEMU x86_64 a kernel with it:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
