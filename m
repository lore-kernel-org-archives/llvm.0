Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E5A189905
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305198; cv=none; b=eosZerjETpvgJetrviqzT6Llx2KddpaoWNmKJ55YgiTycLuoNJMyhi03RpUE3TfTtQ7TnpJ03PiDyBzEe9z4dYgU5H5SjJWh50Qp4FXLEEr27Zkyk/Mgi1Jynxs5agGKxyjPZ9o69hBqVyhdQklAnWFPxcJiCDiywqXk/gUXey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305198; c=relaxed/simple;
	bh=C/ZHYIyY3SZv7cvhFXdzRTbZhaNsjCv+TbLGC3G9X7I=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=hJSyh3CKWffP9sWn9au+n2t3n3optfu7xSB/t9aGBRE8KV2LthIV1Zy89hRxD5zYwQXGmf2JUx1tfJBsJjeThSiP02W5mZVxWXaYOHWWFB/9z94F1iVPw5frugJt38g/aBhAmW9+Tr7186FYmpXiHYJgejisMEJilYkJEVzimbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HTDm/REH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HTDm/REH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467b74a1754so56579981cf.1
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305195; x=1736909995; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tz22nuryVbOFmn+oYqrauvaNZiy7Fik4w1VGFcXWlE=;
        b=HTDm/REHtUXMkbi6HQGzc5Mw4dVpcVC3ykf6yBwG7o5BfGkfOTTAVxqxNp1K9R3oj1
         M/b5ItCT76QjImFlOKAgYrgQ0APQY8ucsI1CEEwGpebBajgoCjdsKuwSlJhxiZLWnDOf
         vwVTkdVmdDoFHu5b+7f0IKLtfhI9YzUyEjQqAccGuopVnUmQNup09myXA6/Lov05df10
         4FeUS/OaCZvDYuj+ghwTM2fjRdfHuiew3SotFMJpgV8L7YQlPbumHtoYsuFb8YMLj93X
         M3od4UA0lrzSFAoXoigLH0NrF8g8x1YI49WaX63nwRQhEizvESv/PTJE7sFXAGcbh8DJ
         0mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305195; x=1736909995;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3tz22nuryVbOFmn+oYqrauvaNZiy7Fik4w1VGFcXWlE=;
        b=AdB0sY4v2Tc1/narkpKhb+QvVFNf/joEaJofaiU3SIoV5UQScx7j66LtGm+cwi4Jdn
         NvvZ44LHdPab4nRWL/3g1R068+aOWQpfl10Sr3GFcijiPVm06k+shigzf5yn8NFiTVI0
         XyXZVCbIACjFlJshkAfDHptZJO8+1SsYsyd5IkkDdT013KAst3mRcRUdMVynwMxh7YJZ
         q2ATJaGOj9ULRQXkB+D/4BljbPdpZ377qlQsVJoi+K40wxcFB/dZLbv9idcH7AFWsLD0
         mWH6rJwQvErYUCEVPXowQYaEF6AlMXOn0CWtRF+JcVytuXp705qr3TdCfWr/JTJpeoDc
         g+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWpDEHd+jmpf8oFNbv2wLaFF2DCrYYntIcdP3xOKxXpHhv1dZn6RjGqG6vNeI+9bCjieKTA@lists.linux.dev
X-Gm-Message-State: AOJu0YwwyH8y1zu3BWdgOSYP1b6YcfKYosn6quJCvWE7VhVdICqAnwKW
	vu1BcEGb7Ai563TbdjSnCZpHFlKfceUwK+VNBYuQKVSxUdpGb35TqIUCJCB7pg==
X-Gm-Gg: ASbGncuMX2brGhSz2x+dXx0DiYQAPK+179AObt7BwJ0hVdQcbF84PA8wJUteXu1LEuq
	eUJRPfiGhOqVxpEwpr6+g3rpCu4htoBGUQ9+1rwdm71CsXN/OradEA0tI695YeBydotzJ3IKqT4
	YBdLYmIJ6S4tIm4wEBMCDvMD5TekvOLUB313sdaJDwewIfchZ+0NP93rrbumkSTZdLBiCvaFqFP
	eQbw9RSH8aVwrerafQCVuyg144UKAadEGfAuO3kAlOx8HnRSvc=
X-Google-Smtp-Source: AGHT+IG/qZatNsIQPUIMGpi/gDD5LuQycIfXktP/17Ciff+gHXaJdBEJVnCXiT5bnSst3fW/DC2oRA==
X-Received: by 2002:a05:622a:144e:b0:467:6fa1:9e2a with SMTP id d75a77b69052e-46c7107e0bfmr18520211cf.40.1736305195538;
        Tue, 07 Jan 2025 18:59:55 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb5cacfsm191575531cf.89.2025.01.07.18.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:59:54 -0800 (PST)
Date: Tue, 07 Jan 2025 21:59:54 -0500
Message-ID: <0ac6d10bcba40994814d5c4d400d86cd@paul-moore.com>
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
Subject: Re: [PATCH RFC v2 1/22] selinux: supply missing field initializers
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-1-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Please clang by supplying the missing field initializes:
> 
>     security/selinux/selinuxfs.c:2004:21: warning: missing field 'ops' initializer [-Wmissing-field-initializers]
>      2004 |                 /* last one */ {""}
>           |                                   ^
>     ./security/selinux/include/classmap.h:182:9: warning: missing field 'perms' initializer [-Wmissing-field-initializers]
>       182 |         { NULL }
>           |                ^
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/include/classmap.h | 2 +-
>  security/selinux/selinuxfs.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged into selinux/dev, thanks.

In the future, please try to write the commit descriptions such that
they display without line wraps when using 'git log' on an 80-char wide
terminal.

--
paul-moore.com
