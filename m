Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6E15B102
	for <llvm@lists.linux.dev>; Thu,  8 May 2025 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684897; cv=none; b=MSU60S9+e8FBh3l0NW5b0yl0wSURGprvy0WaEJoVjS0g60KcQELgBEfXPD3SR/fzV0Fra7lJUF9TicJEnIPq9aSa/sOjBkX/IK5DERTTKUQSG/3HdjxtZpDbx4uulo9i9aQQyTay24kotrv9QqT+Jir78vn2x/jct4y/Uf5Cuk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684897; c=relaxed/simple;
	bh=wXgy+XuLnjFIqewOwsE4Lm/BrXyMhV6/acAcCIAyJYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RHtm1fLDx6cjdwBomqfZnnoUfSZUIG/vKV0HUDoH4mtt72FsFkQcIJgg5O1WyuCOIGXt39QDRhvfirva9PdmauqiHK2zcsRZ3OQBC2gj8VNQr+s9794T4lx9+GYi/D6WOIdg6MCjZfKnJJPByE6+FNR28neiTPVFCqWAES/caHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMnBO1rF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMnBO1rF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29fd22163so100470566b.3
        for <llvm@lists.linux.dev>; Wed, 07 May 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746684894; x=1747289694; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkZltZOQqnYsCEsxFuK/qAjYLT5r6t+NrYMqhOg1WBw=;
        b=QMnBO1rF2ZaKtcbceHVZ6rYvSNxPmKvtVtSfB0mxKzas+CzcfoxcyFxbDl+oBoCclE
         dSczqiuyZhvrnc8RQCMHFKFJuLYXhfrDjY/QUKbb///WHI1cdeuAOwO4rn3JBZMnIq7Q
         h9KMovpQhdvPqTAv6s6i1LrGQ8BwX15EudDXKaQEBtxUZgg74tzJKxqLp8Lzre8fouDO
         CxujoRPO1ZpLhoYs2r36L30MbdS9QpKMqfIEFU9FkPtp9TWg8fiRBu0QFSyh2sL/cPtp
         WpgzbMddv2U85VeBuxgoLlfXWAnDahqKdiISGrzGh5rPACWwNF6WDWfm1QD36nasD8/O
         X72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746684894; x=1747289694;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkZltZOQqnYsCEsxFuK/qAjYLT5r6t+NrYMqhOg1WBw=;
        b=dGhYS4mFvSu3C90Wl34XEqX5NVk24FqiTYDdOEQSvoNdBNALqnZuaP/Xl2gWrzDy8d
         DaUAl4hQ4cw01OXvazPgQa0m4XZv8mFSreQS+gogxWas1igSOnJViBPwiblcmzyLiYLY
         Z70ltUNN6D1P+MoiTofwSEnvSATY8x+jhDcBPaSg5YatJL3zbC9I/+4l8XYubdL1tj6r
         bm4LSWEQHedXZCemK+RpOHQ/sRMU6VKfXB/c7GBlSgUBYkeT0otAE/JLhBkutCtR4xGx
         hkwGrHZxXswjtif5a3KoBe6TZ7KHBwxlg7h0o5INNztIAF4/Cpl0MaTpIWpPbRJAz1FU
         s2kA==
X-Forwarded-Encrypted: i=1; AJvYcCXKQClWBWbMuQ0FJ226Jcu+yk+EvmpTcw4kAaFaNh2d6E5NOEVonfNd113aQDa2Vqw0Rj5O@lists.linux.dev
X-Gm-Message-State: AOJu0YyzAWnLxi1VhLJR2LHAzPos9WQqN2qLtCGnN9mK3N3OS9G746c0
	iuogZzpqMlZXvryokiGhWFVfKE9BK3DFEuFLaIUW4AA/He+J32ajTAWRU3mHEtukGXYljlCh4in
	sAa1f9GuOXmQOzkvMx3NNZxNMJi8=
X-Gm-Gg: ASbGncuxRIEJ3m1GV4EE1PehzAUyRHB4iAzKkcDMEzfC2TV21EnoInSPjYPRzTsdRMG
	kUVKtptlmKGi7WgWjNu4xbDfeD57rD7NnmNey6jXHYOqeDW+Fx8w7e1QShiVed7Pgo/aWLMhwqW
	53V+qaxUmvWvD3py1yxLQR
X-Google-Smtp-Source: AGHT+IHwxIKpfiu4tWWg3RXYDruBytSXJ3/SIIjPMara76cnzmnUoPQULY0baE/CdfVeC/fMbdZDia8dnddDyX35xNY=
X-Received: by 2002:a17:907:803:b0:ac7:e815:6e12 with SMTP id
 a640c23a62f3a-ad1fe83286cmr181604566b.33.1746684893426; Wed, 07 May 2025
 23:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com>
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 May 2025 11:44:35 +0530
X-Gm-Features: ATxdqUFnCUlYgpyjo3kkzKj_fP_Vo0jZohWv6em6rAowUWUDTJ21AX7A3N5yL0k
Message-ID: <CANAwSgSXNuNFQ6RiqiLEBY3eCmxz2hQYfWTFij=Vi8S7rS-_TA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Wed, 30 Apr 2025 at 18:03, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi All,
>
> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
>
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
>
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
>
> Tested on Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
>

Genital Ping!!!

Thanks
-Anand
