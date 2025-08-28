Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA81F9D6
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756339454; cv=none; b=YUQoCKVUTMYWioh3tpuAvoWrV+01W8DTdppUJixlgOLld+zapB1PPGGOvYQa604cANug0UysXfeCUebQMRO7aBtn6IhwBSjnMci9CRnRsQrXvJYdOAZuQZEsmIXo4VF2k77Xxj0a2tg8MYDTqGU2eSYDAcmUKIi+gAy5B1HlL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756339454; c=relaxed/simple;
	bh=dcEBNFHS14PdSeqiLv5RQBde4ahKGZJ3ZnkzOVrFJ3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xc2lI3q/AMwoByCwxFgQpw0/0dg97w6ezRpQrjWEbmboJIlKFUbkL2wl+TuPPYOoZg0n9nixPU3rgEiAco4RfqaFUqSo3SdU8Cv7bsCsjj7Vce/NhykKXIU4AeBydK5Nd8hHBEli4N+uMd9jsvlD9wl9bVK7Ezi7RSNEk09FXVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KDv+U6jQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KDv+U6jQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24611734e50so53425ad.1
        for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 17:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339451; x=1756944251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8rvowLC2NdnxO8N/1wChHWBJD18UvdLbbo6qBnx/qY=;
        b=KDv+U6jQPnIgfEjSjQC3EZRPmnyZpb2W/9IYlbAHcpmJNbwykf9F4EhdXEdYHgczEv
         ExMPLf1T+fc8lJiWWiulxEA9Ltn/7dTzXZIJlS5nKm+bZa2TgU/GnGhe2ScrpDA2tmUu
         nW9agCHoA/Wbx6YkwUdec9lXjMDkBN7gVoC1MqXnsrVsQ0GuyRl6VRbTzbUpfcbFnmdv
         YPaYkor57c/po/ZI5ck0FPkCZZs4qQ8t8/duVhuK20ugHqfTNiinmpQ5JbROWvxvImUu
         kIsyIno4yRN/4KLPRvXfaSPSbYqeZUSdJcVSJur3NR9/4NaFYAuKSnG3iBOKqnlZHz6O
         IaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339451; x=1756944251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8rvowLC2NdnxO8N/1wChHWBJD18UvdLbbo6qBnx/qY=;
        b=u69KW2ivuiidPIur0VRJ1w9axqDCm4sUtrcpNgrw8h9LSTUptbEymHPx42C3G8bpO7
         +ipsl0fag/TYlTP5JfnPuLfS/OAWak7X1/V5haQ+2jKbVDMIXO4s1h8Qq4hUZmZmBt6I
         NuELwZ3Dxdc2Ef3TIaC+fXxqE2AbXl/FNY31IOkrSGD3OPJ9kmyGWzLUgZ9vhAR1/8My
         b6t0vxynOTpOzWrR1zXTP0mrfMwnxlVoQP2GOczJefM7rqo0sW7zkSD6FVu8tSrS2mmb
         wBYlQrca7Zv4hEFFceQ9TzIAeri6a5QrqDeT+mueOpM0wIPVXbh+ed5xdoidHuVBt19P
         Vf6g==
X-Forwarded-Encrypted: i=1; AJvYcCVVfeKhlrd/+L9Mu9X2YQRsZiGcZULyGPcBURtsfxSCt7Jctz7y5fNGGnytieM6M+0eHWmN@lists.linux.dev
X-Gm-Message-State: AOJu0YywgmDG1t0JDjEn5sU3NiwzjBib4co3g7uEWlD4byYC1SsW+bab
	3Y1fG6TnRFtHfbM/XPZq16YOtjfPA+cf7u05XkHpcUgSCYVdxaRrkf+0fuNsCeJqjftl3zT8shP
	3As9seWl/4zsUbEv8LM7P57asaeBKj6aZnHbC3mAN
X-Gm-Gg: ASbGncuzFNa0V7a7TTPJuUImxIj7M2yoh7NPmnVEJWzxjHNDyJfpp/DjbthTNnRGdoS
	EjmCrn50Oe3OSh7Neu82dE/+DpJSDoBjeio9NZK+GfyCSG5zlzWFOGdzB7zJZ5XJs6Sh0pi5GJO
	HV5x2abK/AzTXBVj8j2UAqhDQJpV65r6n1EY418dGoa4Ok35XEpDiY2rJ9ug27LajfDuxDscX7z
	KU7eRbnlraVVRZkpj6VTQ==
X-Google-Smtp-Source: AGHT+IEDmmobwWkSmCQRrX764i0x7N+NyNi2pxKbtMS5DtBtN2eqD9ubZnSkhhZ5P4pDvFK2mC59yDZNjv7rIAe5OOA=
X-Received: by 2002:a17:903:2348:b0:248:a039:b6e3 with SMTP id
 d9443c01a7336-248a039be4emr4509515ad.10.1756339450767; Wed, 27 Aug 2025
 17:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508261620.orOkZR9F-lkp@intel.com> <20250827223247.GA414199@ax162>
In-Reply-To: <20250827223247.GA414199@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 27 Aug 2025 17:03:33 -0700
X-Gm-Features: Ac12FXzPtRVLknCbAbwNYNo2CZUi1eOl-HMyl2Vu698XcFA1aeb-rlHJWZuTALg
Message-ID: <CABCJKue1wCB6jBLYUc-fAEzpyQWHXwbk8R5GBaZCkCao0EQZPA@mail.gmail.com>
Subject: Re: [linux-next:master 4166/4221] vmlinux.o: warning: objtool:
 dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Aug 27, 2025 at 3:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_exact+0x47: no-cf=
i indirect call!
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_ceil+0x75: no-cfi=
 indirect call!
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_floor+0x66: no-cf=
i indirect call!
>
> Not sure if this is a clang, objtool, or source code issue but I figured
> I would brain dump what I have so far when looking into this.
>
[..]
> Looking at the source and the diff, the removal of 'assert &&' in the if
> condition before calling assert() in _opp_table_find_key() is suspicious
> because the three flagged functions pass NULL as the assert parameter. I
> guess this might be another instance of "clang destroying codegen when
> encountering UB"... :/ this diff resolves the warnings:

Looking at the IR generated for dev_pm_opp_find_level_exact(), LLVM
seems to have simply inlined _opp_table_find_key() here, and since it
knows we're calling a null pointer, it has dropped the kcfi operand
bundle from the call instruction, which results in the objtool
warnings:

$ make -skj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 drivers/opp/core.ll
$ rg -A20 'define.*@dev_pm_opp_find_level_exact' drivers/opp/core.ll
[..]
1670-if.end.i.i:                                       ; preds =3D %entry
1671-  %call1.i.i =3D tail call zeroext i1 null(ptr noundef %call.i.i,
i32 noundef 0) #13

I'm not sure if this counts as destroying codegen, but getting a
compiler warning about this would be nice.

Sami
