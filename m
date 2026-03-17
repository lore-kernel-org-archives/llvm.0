Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0F93E7143
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757940; cv=none; b=sncjAIKWkAwYT+jLrsBhhI6658/cF6jwNbB1YV/RSlhJyXPx8DlUCtWtt6B0xTUBlknTHkZjBymYBpIuwXjsVSra12EbsKzOTPL8723T6Kx8BfjiZjTtj1J/z4XZ60noLcOv2xiqghwLR+KvRhL5pkBEO2OmQmbr2/4U3km7MKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757940; c=relaxed/simple;
	bh=DuD9q+AuFP/A8HuHHh8YgUVUC4kFXGdO8WWY0lvBz/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhPnq528ikPRNLMPNZA1w7cLrYpgbIatjmFwYwe43bQzMMXFGW7aR+Nz/Y0B6+tm3rKsIL5V7gFjwy55ub7FfCzmV6fTgxujZmNVntXQDofG3GZz2GLfYBsMQ0+qEjh/C/zDGcr5HY8rvka4YRtGnl2obb+EtLixvmntnwGh1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b96d784828bso876647366b.3
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 07:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757938; x=1774362738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI0BuDEcVOCkgV2jfBlT8mTKf+2bIaYwMnS+rErU+CI=;
        b=A7CaoBL9s/gbC5BUHBpm1QWqiU9MmaupxshTulFB34g1G2ghw1yh6/LcB6Lk4gbO4b
         DmPitXy8KSuRMGUMxXirNSN+1xOiZl9ZAOUZVm2FstyjcnSwreJWngiiMhucjn02yFgj
         pX9KCZ9j7orJu3psGseZsSWposu6A/61TcrVvkLzJ+yivb0dsDmUXbSZiDOg6K6juMA7
         7H/ZO5fyyKLfwJ7qVjclQNPXT9SkjQZyUQCH38un6WHesOIAvyor+fM5CEpuRaBSKL2h
         CfjcJ58o4XjiKneTGRXr26ThBsBFKayvguqACwGayu/gAa25FPYmWIp+J99jfKlcKG+3
         6jQA==
X-Forwarded-Encrypted: i=1; AJvYcCWKLxd1Vf3T6CV9cBidm0unq0xMQps6TZ/f9n5q4G/Qiina7lOR0TiiZgJ7gLcIlvx9g2DR@lists.linux.dev
X-Gm-Message-State: AOJu0YxV4ZkyTeJRKPg+rYLriFuSMcSOklF6mjvA4ktzOBkARShZ/k4b
	1HbUZ3tB9b+fT5h0Ru8XVPtv2YkznHQbv+vxhOKx3BjvhINMDkM2V+wau3KsnOQuRvc=
X-Gm-Gg: ATEYQzx8a/1bmr8ttKSU1RRsXpTR1sSd7U/VngxCRoF2kQx5c1eAqMf16mJjj+SxHae
	sn9jHQ/ryyIR24PpHX8aotqlfCf9D+7nXCU9Uo8pZFi3BIZAd46pSR24f1y0GpSYhOfTnfXsy+1
	akpgmXL4jbeZzHVGDoEuQG1kurkXjIF4sjFCxUGuyPydGSkfVLRqzsmbBOZDwFFXLsGV6Z7AvNb
	uZZDjKnaQTsfY2yHs5g00jn/C/7IWw5pt8v97LwvY1Et0enDjeFJdbxGDpFUhfRajmkaEZIu0Gl
	Kbs9KuMojDtobJLqz/Z0Gth+kPN11OdiUiYrfBzZUJWe6owFNeX6fbCwSYlQuUY7Aiic7AFXD5Y
	PenA57Tjqo/UZ/ad1lndyYFUTJxJakLCnmiKQJ2AXnh2dIzaCB6wbl5tpu/+mSbQReH/nWqUUV5
	QPu39ASsJxOUAQxixO+pK0WTMNgYlxzbfP4Fi41PgLHnr3fqtflCtM9XzRk/uCA4d9rWY7DUA=
X-Received: by 2002:a17:906:794e:b0:b97:ba66:167f with SMTP id a640c23a62f3a-b97ba661f5emr549275066b.42.1773757937261;
        Tue, 17 Mar 2026 07:32:17 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9795d9fc85sm591991566b.61.2026.03.17.07.32.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:32:15 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b96d784828bso876624966b.3
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 07:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7oMNw+nm9REDrIv7WNQ777PQRbcnTuV4Rokr6ksPezgSvdDe8kuye/zSRhxgyWkNwD1Vj@lists.linux.dev
X-Received: by 2002:a17:906:d7df:b0:b96:d6cd:29e6 with SMTP id
 a640c23a62f3a-b97650145aemr992999966b.2.1773757933018; Tue, 17 Mar 2026
 07:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 15:32:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXHeCN8PkC1qBai794JEapLkhFtPLe+=jqOwi-m3WFGA@mail.gmail.com>
X-Gm-Features: AaiRm50sR-ZrpQ_NXFXjoxfq1AzUMdtH807Z92qPl3UkRr2Nn3UdH_SFQUevIwo
Message-ID: <CAMuHMdXXHeCN8PkC1qBai794JEapLkhFtPLe+=jqOwi-m3WFGA@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Geoff Levand <geoff@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 14:15, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Return value of ps3_start_probe_thread() is not used, so code can be
> simplified to fix W=1 clang warnings:
>
>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
