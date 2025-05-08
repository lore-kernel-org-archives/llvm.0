Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC378221FA0
	for <llvm@lists.linux.dev>; Thu,  8 May 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704202; cv=none; b=AeegYSrd0FxC4sHF7Os+NQKGa6DFQHWqvs3FlJytnAKDEMo4MXeK4byfeyW84unG0tR5XhfH9Z1qzUeqr9dpMO6hx3sDUV85gNQBJnO6E14lbXEDXhE4TI2sK8y2F3nRLxeh6stJzHqyZwnOkIocusup4I7SG/brApU6aMw3flw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704202; c=relaxed/simple;
	bh=9EPr0UyMdXYUk+UXs4jteZKw6xDp0zVkVXceKKUv1Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmEPZE+UHnd9eyCtm0HWxbuqv2Lj1Khk3Xbg5Z7nJTpLyhiI5W6nPk3PisSrSHdny8XOreO1wOLbyWxqzayNJiyLbnd4NghXse04QeFJlg829xx9uG//2D7+rN72M4Tsp6qjSj3jrwjdPKAb6jtfw1L+5hNtv6q55z7NIXOKBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUtKOF4H; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUtKOF4H"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acacb8743a7so155938066b.1
        for <llvm@lists.linux.dev>; Thu, 08 May 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746704199; x=1747308999; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ltr3kPU8Ou7XLMkgW3sKce+SE31ag1MbahmNgvMMJHs=;
        b=JUtKOF4HHwT/8+hWPBElSTKssjTjKSN43CoxmgQn2jEM2Bu+WQM52lk+yEzjp24IGj
         NlBL2TwqA/WN2N85qfkE+EIIi27/hlw88Qw3+IbBeUPO8MLsNKjk2xd43JJ1Cgkaq09m
         tLdtK8QAc4UOapoCm2EhQOdnN280pJXGn4hWV8vENXxfyWHhArafCzoupJtqPGLAG/su
         FBaI6azAC1V2L7u47JFZh7n/G+E1SULSptNF2e26SIjvKa233DEYeYNK2d31+aW7NLRX
         5JmFo3/0u5qKh/WoGkdJvaeJuIMG5hQmjUbCB15GS5shAWxHCn+PFMZfHUot7VwMAamT
         lf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704199; x=1747308999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltr3kPU8Ou7XLMkgW3sKce+SE31ag1MbahmNgvMMJHs=;
        b=L93xUWeCNMliXT1GSs/2atmBam3R7Pv630RQQcxIy3Ci67UWLc5F39bI0jmqtnKGq9
         HQv36W0+ZaBeWQeS5eLYO7/wbCU+sbzPmbtWPGDguzW/NCng1hqY1+nvyN21gAxK5Cmg
         Slsuz3eK0dO4mku1lnCnKp55tucyjCy/mz/nA+mpnVL2xCIqaI/Z1sLfknyg4P+8GOqL
         RecPSmtYLYl+B+gVe5FgWtdQa66iEeiN5Dy2qSvnfix27Cu2JKNbdiQuuIQ/SQFVRisI
         tOyBWn2b8otT6ZT1LXwVUcDF54E4YOl13tPdcPRdWipvrLZP8lA1/kmO7OR0F8HLmINo
         KKTg==
X-Forwarded-Encrypted: i=1; AJvYcCUc9i6BH0wjYPTmqDAZokr6f1cqtTEXQDU/WE7qW8eMN95tOZw2bGLOaa3ITvsgBUQIJLw3@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ZmGSP9KUap+SA4nh4igBYyR8NKvwFz1UnBIeZ3+t5LMAt4+f
	N0h26q6JavscfRr2785rIu8zOPjt1k3SuipMaGaGgHZGksx5tO8eDxZrquiz9zO3fi8f8sjRwBd
	VnLMQ7VIHIE0ZqdpDJXSyP6lT1jw=
X-Gm-Gg: ASbGnctgtVOqsjY+LFmkzoZzDDWtacTICguB+shSHEJ2kVHIqhQxO8VlzCfwxrSAaD/
	Cslj7Gz/G98j1CpV2Pvce1IQaQAbvxnfxXU2fR4XkUkwqMSC+hG+/ZQ37wOwAQqqOnbxrIrHa2h
	9fHBYYTBP+kTpr80oyFRnM
X-Google-Smtp-Source: AGHT+IFRb+7ScKez83qOuG4N6t6qIMEbVcI1rTEw0gYhc/qxLVO0dIAsrm1I+vwoVva6auYEZdGL5jWG49v19xFXQlM=
X-Received: by 2002:a17:907:9715:b0:ace:bee8:ae0f with SMTP id
 a640c23a62f3a-ad1fc8da3efmr281177366b.1.1746704198687; Thu, 08 May 2025
 04:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <CANAwSgSXNuNFQ6RiqiLEBY3eCmxz2hQYfWTFij=Vi8S7rS-_TA@mail.gmail.com>
 <97cfb30a-daa5-44de-ab29-f20b35d49d72@kernel.org>
In-Reply-To: <97cfb30a-daa5-44de-ab29-f20b35d49d72@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 May 2025 17:06:22 +0530
X-Gm-Features: ATxdqUE4hoONrfJ6klWGqObf3kEkWmvGg_F19UdLU4-d5Z7kZ2HdPSVuUXBp08c
Message-ID: <CANAwSgRLAydhpsF4kASBjeSw3QEVcCBGYk_tSgLAGHGSLQJcRQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,
On Thu, 8 May 2025 at 11:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/05/2025 08:14, Anand Moon wrote:
> > Hi All,
> >
> > On Wed, 30 Apr 2025 at 18:03, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi All,
> >>
> >> This patch series is a rework of my previous patch series [1],
> >> where the code changes were not adequately justified.
> >>
> >> In this new series, I have improved the commit subject
> >> and commit message to better explain the changes.
> >>
> >> v6: Add new patch to use devm_clk_get_enabled
> >>     and Fix few typo in subject as suggested by Daniel.
> >> v5: Drop the guard mutex patch
> >> v4: Tried to address Lukasz review comments.
> >>
> >> Tested on Odroid U3 amd XU4 SoC boards.
> >> Build with clang with W=1 enable.
> >>
> >
> > Genital Ping!!!
>
>
> Huhu, nice. :)
> I make typos as well, but some typos are better to avoid. :)
>
> Anyway, !!! are exclamation marks and I think it is very difficult to
> scream at someone gently. I think this is contradictory to itself, so it
> does not feel gently at all.
>
I did not mean anything harsh with these !!! marks.

> Plus you sent it 7 days ago and you are known to send poor quality,
> untested code, so just relax and wait.
>
NAK - Do not merge these changes. The original code is in better condition,
and the proposed modifications introduce issues.

> Best regards,
> Krzysztof

Thanks
-Anand
