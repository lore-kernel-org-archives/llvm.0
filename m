Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450C19CC14
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305203; cv=none; b=aSfbnpxCGY3QePsJx3EgpjNkLVKdAB18GE5ZLYRFDeNwzBhJ8mw6PBju6RnmJ5tfsKJjnaPRyGRFY8Ca62MmYDl6ll0h8S2UbGQFgGTbAAbb2mhdEWaRbz9SukXm/Pj3RSJb/RV1yrw02DWlzpN2f3chmX4hkg5KV4EQq7ZuEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305203; c=relaxed/simple;
	bh=OATGo8aQcNYDw+H5AEmX2rtqICBX8uTSu1nPaZDpsng=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Fc2ZqEA4CSabfl2WLZI+zldcacU5S63KOLRhn3lMHONhODMmQjQro1C74fYvKah19hbcDBjyl44sDczMCYWD4rUQjhtv+oMRxYPv6A7gVqKQK+ULLpJUdoUTem6mU5UQBIiTpOvGc6TkC9eL8W93y+jiwsyLHRLS6GgitrWHCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=IfhfmcyW; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="IfhfmcyW"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46785fbb949so148825881cf.3
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305200; x=1736910000; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDJSexMwGrVR6YaQuKuB48uyMoRezKWjJmWZhA1XR24=;
        b=IfhfmcyW6k85nklgh/HlJWM7nCoRvod6KO0VD8/76PfxDHzTprX5BSL+g4dax/4jTD
         hK6/PL7AHZHOf7BI3tr8P1kWik5vc2N/M40dO1ZhwjbtMcK1ZsFTcFmLstyCqJgOCuqg
         7PCvOa4IJ0KPseaaP8BH/zjZKBtqVSpP9gHCYVugpg35hSUc/v3kYQBTUAKRwNy3HEeO
         hDLAE/Ckk1ZCj8ZLiEzkfzCwFcMLnoAWpo90oyQvFEUX+jfROrGdaN+MKXqU3sPr8RPb
         rR4tMfAAdTFAHfVADVsyFXuJUEsv82GtLzbEUdp2oL0qSDJvU0JSxpl3NUBtDWHdhXPV
         +3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305200; x=1736910000;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDJSexMwGrVR6YaQuKuB48uyMoRezKWjJmWZhA1XR24=;
        b=qD+/IPwVYgH7UMAY/FZfVzz++Du6jnCUsNGnImsQr+O2NgWDp0uHDLO8z1vld/p9p7
         BT8yZHn621ex6Gt48PAEYe36+tMsgBeyx46fjN6/SV6aU7fbwL5QTQOtYy89zx3rItlx
         g4PW+SPjeW+lxUaGs4a45n3a2A77ezD2xIKvdMZZh/caA821Dr0VSQQZRck1VdWyyrVo
         PXbqgk9wz7ZRRHDO3rWOlzdHdOd5K5+v+3Q147D0zsbD5SqF6tvL/MSCnOHzpopjD0HY
         9p2F6woq3dlTDWP8qJsNFt4BRyS28lmZr5AUZL+4RWoY6HIBf2Vj0x64NGLf+WZWmtOR
         GBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLvB3vGwBDz1oQ8rZvi1cf0tpCip2E6sNqRusVDTjRO0mwOBFUPArD4FKvww2AYIZruxpu@lists.linux.dev
X-Gm-Message-State: AOJu0YwXbWX/ZaruxnBHTX3d3KCKFZJAYvouU1W9F1DbeIkM//6Dxf14
	EVdkiaaQeIzJW8AkUpRZ+tzVwX09BNm68H3gZQHK5oMKj5tKqpMzLrrOutpk/g==
X-Gm-Gg: ASbGncuON8tqjh9d5zRAqnvcrdzSOIN2RgoWMWaV3CfUXAcrlTLzV2yN9aF7hqQbnGT
	HuALTixoNafjZad+ZR/X7gY7m2jd3au4zM2Z+cPTqapbLX1/4VZjTh3ZR8QjsmdRsNnjU6H8gPV
	ady7X1w6DmnvHaH8q38Hu7x5Bp+EiYQag9C5ddlw0ipi6tuYoFbORDh5/8YC3+o9SQREd0U8tex
	tS2DOtirHM8A+sUpx0DjjX4/hKl7o2VCOcy6VphB1heCY61/Ao=
X-Google-Smtp-Source: AGHT+IEvu01NUR0GRR179mj45ii+bvHS1vbr47fBw9MkS6Z//pM+fOXYZIIfnSnV6RMGYeOm49gVMQ==
X-Received: by 2002:ac8:58cf:0:b0:460:8f80:909a with SMTP id d75a77b69052e-46c710314ccmr23177491cf.32.1736305200113;
        Tue, 07 Jan 2025 19:00:00 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e653893sm191974381cf.1.2025.01.07.18.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:59:59 -0800 (PST)
Date: Tue, 07 Jan 2025 21:59:59 -0500
Message-ID: <01df64ed8f6eb9e6f2780b5b0aa3be5c@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 5/22] selinux: avoid nontransitive comparison
References: <20241216164055.96267-5-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-5-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Avoid using nontransitive comparison to prevent unexpected sorting
> results due to (well-defined) overflows.
> See https://www.qualys.com/2024/01/30/qsort.txt for a related issue in
> glibc's qsort(3).
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/policydb.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 3ba5506a3fff..eb944582d7a6 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -37,6 +37,8 @@
>  #include "mls.h"
>  #include "services.h"
>  
> +#define spaceship_cmp(a, b) (((a) > (b)) - ((a) < (b)))

I'll admit that it took me a while to figure out why you decided to
name this macro "spaceship_cmp", and then I had a little laugh when
I realized why it was called the "spaceship" operator :)

Anyway, while the spaceship operator is likely familiar to people who
have a Perl background, the kernel is still mostly a C project so I
don't think we can expect a base understanding of Perl, especially
these days as Perl isn't as popular as in the past.  Can we rename
this to something else that makes more sense in the context of C?

--
paul-moore.com
