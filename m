Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA662401A04
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070848; cv=pass; b=U3Xr09lxqhrN4yzOy5FK9hkWsM58iC0kPp6zPIymq9/JTuG2vUsME/7KO+btUWjSenvyD+CiRVLij1SOceT8RvGgdbGNXyD9ORqY9Qnt5ebkwf0jjn72JNgXxiSe1EIg9vdOMUu2DiSbxE/H5tiWM2Hi7iuaGkddXLJDfMwxsak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070848; c=relaxed/simple;
	bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXJq4YDUdi21dpWhnaWBaw/8D5NNzHFMjeDIMVWHMAklaD02F+TxPG7Az5FaxkPFF9Q/Ykf57gkcK4e2bjOGULU2asoHVxpQIogrmfRin3v716NxJr2HQbT7SsDWIwqIhP90Ag7n0QQgfycShBvtS9e1drv3WHaCKEGsX4/j/N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN31GR6R; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN31GR6R"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6948d7ccfbbso2673479eaf.1
        for <llvm@lists.linux.dev>; Wed, 06 May 2026 05:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778070846; cv=none;
        d=google.com; s=arc-20240605;
        b=e1mMSH5h/dL9Xo/bAWNOJuu+0hq3Rau/3pUK+cdaUzFgO+SQL1S9nQ+SKm8nrywMEu
         tucHo9wMR/e4Nuc2S2rMl0LjaP81RxQimpA356IdM3P8x+JvMVHBGZFvikr9hm1rn6hr
         p6KsHkEJJkhWHMTQ/RHrC+3wCfKUEJdP5p5BmHnRLX+RO4oGOQc5dtXDmvZ8Va6OfHNt
         TNUJBCTgY3EM+18WtfqtLqC1s7AJDM1tltgLDwvah/o44U1+A5AXAU6qKTen0fpWiIG6
         AGJZRJKNwB11l8xKBHtDA5zArTuXNNbfozx7LjxMIGIA+x1wNl5hLrnyXB/36UjUa/76
         fb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        fh=E8BFhyDQs42NtuN4Y2AlCxmGD4QzK2sRDcnXqHDmP7A=;
        b=inCU3u239CSKNo+Hh1Ht5Xb2HbutuUvOP8y7qDybwwNVzN0yNe3g469L74TwV1JG1u
         1at9wLeOTjHXsdirXHBShWRh3Y7ZraEhGiGxs5GIvyQ9Ib5YJ5BJo2lQ/3Rt3ni3ZPcO
         ztInWVirw1Usd7DHlYnrNSD6p0k54LJNze77wEMqLPMGOvxp9ImV5XetR2yrBBgPWmKd
         cxB8RYlvArqc+zsa3xlVQLr6nVefClaJGR4zCJ+Zy4dxlgVSxNXfKqSaT3p+FL8oq6s4
         ZDrm8l8GcyrczxJWW//RLOLVD4ZofFlBHYHfEUCFLgq/kJBoVodQ1jOBR4Q9zslGCuuX
         X6VQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778070846; x=1778675646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=kN31GR6Rv0VehR31OHN+mUJOChiFpYmRItWIJiftmM9WmuqD/1qh+Pw75zbLFSFV+G
         LJPL2CjBeifXGc1Az+OBwlSTC+AKEwRwB033QVTyzML39kq7P91YL5GRJjY72dw/b8bi
         7OHcvIVSrIlaY7iMClcQUfEZArajc1eBwxOgNLrLF922TfkYZjimlrLMxlibOaotcLlw
         uoSIcQ9vkz90Pttd//PRWjK9TeVOfVVER4G7vJMwa7yTwFHrLxHFHFmLL01nhm/jaEj8
         82j598aXkh7mPDYBWinHgCUaXVu0SR6mkGazh0tGvLy6IQ7cA1dAsAAj2BNjrJSq8kia
         6mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070846; x=1778675646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=jfUdfqLvpR8HncZMGQhLHWWvOW0Ukxp7mI7UqtLTkSBnP4Un+8PkZAJDadhSTynbxT
         UPhCrfD8AMEYFjm95cp+MAnsjPlhMxJArPf9YppqM0SuIAF9N/VjoqVivnAjN7LP0MZN
         dg/YkC2sTeocN6/sFxiNmI9P7O2OfkOV3bCi2VE/wBhdBFEbe6HLauM6i+ja2RO5Vinx
         zrXi+2n+PDEqTuUbdl4oDn8hFu19QgnW6YQHp/+5aH5oGIKR+CYn6rzCs09BW1P4qWV2
         3oOR3cWSp6tAOFDVXUDszHR2irTT3LBVtuI0EiCGwUktSP91aUzz88qE80EC+7fH+C3b
         wX0w==
X-Forwarded-Encrypted: i=1; AFNElJ8KUqaR6GVCy2+MRWO5gb79kJ0hgFeZ9ncSZwh/qXoNWskJZREJcdMVOBNCqIBT7vCP/XgR@lists.linux.dev
X-Gm-Message-State: AOJu0YxWAn1VAU3kZXBieo8gR7OO0w5zquXysTIRLxMkwuOxsgI8W7s6
	ynYHWPO4BIr4CD8wfL1pxvuNZzzTVfxfT/GB+1J0RMwo+B8/Byq9DU6j+j4xd7xqbfJ1m6ygUYp
	Y2I3YU1d9HuoCT4v7d9TsAP+5DroTHn8=
X-Gm-Gg: AeBDieuHz7bPHBs/9hZeB6t9+XhInR5RSE8WdFkw3KOCX6YcqGbIWqhgBLIc2TkLA5p
	NIP0yJABeRV+cmOdsWPBZPOt2MfdqCeHstPi/3ACBI2avQGyYxphtCx46dEamu40VLKeusAMIAF
	avMJUKX35lm7fLuvwLC2gmeSecj2gaRAITMLFarZbnIg4VSP0Ayb3cJmYuSv5vcvBAQmaN2Cs0g
	u5O9/DrKtQpaah8Ct4mxn9TnI+9NrdGBaSsGQpGuQTYRI8cDm68LYP6mlbp6SRYvSLaOzyVUeYv
	2ZeoMJD/MmE78/RHw2uvl2bk8icfnLSUqoVmWZ5pHHGBqvyO2ggd6Oh9GhvqdNNHc5pAuTHcq+3
	Z2k5cVGZBam3pLOqXCCc=
X-Received: by 2002:a05:6820:198e:b0:684:743e:86a6 with SMTP id
 006d021491bc7-69998cc6383mr1554293eaf.20.1778070845636; Wed, 06 May 2026
 05:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger> <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
 <20260506062128.GA322298@ax162>
In-Reply-To: <20260506062128.GA322298@ax162>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 6 May 2026 09:33:54 -0300
X-Gm-Features: AVHnY4Kqm0TmRbtoSmYSXiI54AO8i3XE18imVYZf5RenKY8Zy6KgZxL5067apnU
Message-ID: <CAMAsx6fDE8WFfhiRRe5CM=oxUhBPAnWD_DiGsY6mC76TPTgXMg@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 3:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:

>
>> Thanks but I think I can just update the version number in this patch
>> when I send v2, as the update should happen atomically. If you patch it
>> separately, it might not be true depending on when my change is merged.
>
>> --
>> Cheers,
>> Nathan

Hi Nathan,

Thanks for your reply. I still needed to adjust the changes.rst file
for the Portuguese translation (pt_BR), as I found it was quite
outdated compared to the current English document.

Thanks,

Daniel Pereira
