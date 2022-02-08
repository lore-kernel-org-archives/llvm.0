Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE72D2F23
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 13:58:02 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id p43so1421097pfw.1
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=TWs/pi13W9s3W1BKYFNV7ZvPA+qtn2fXWAaFncVNBc4=;
        b=h1dFK7T+x6tKeDpUl4n3poDM9S+jOvviadfLmhPCX+gbYVpqjzsWT1XlEUG4QMsJtl
         9lA76BKvnt2aj9GqEN2H8rOyxkUUNdU+/dUUKTevvoKT8+jfWnaBF2/N9lOfmBB49IRu
         INHnA2at1qEqhnlZvfA9Tgham9FSWtGzPFQXe8UlN2PxT7J27j9+ZQpcSrm21h3+S23L
         iu7lum6Dkjc0ixmjWSDonMksCILvz+WeAgkkstdkw0tSD9qMtcY5J4Y+JeGOGxdkYiC7
         WCcNcgFAeRN3T20wd3uz706ZzsK+nx8xS4rUXHmxFv/TW+gVHgVu5vod4pGhs91HJB+b
         ZZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=TWs/pi13W9s3W1BKYFNV7ZvPA+qtn2fXWAaFncVNBc4=;
        b=PnSPCl4B+pGcd+FFbLvIRHBIIsp+aSf4K/vDbroWBFx6XKnTMlXLvES3N6EdQmQOHH
         u4/8gdyqw0I5foPEp5KrnbP0Cpoymhya4ud4Ec8JU5XYSnMBXlupspHlBcAILrz8KyXy
         SXuht8qs701neCZv9PUJcZx5axycYMY4NTOnpwkG13T11+BVZZG9XPWrVtzhDXVKPKGV
         7d+xG9SE3pbiMPKGtD8kJVjee+sDIcwQ/OsMhlz3GtDEftd9eqCZfy1/CL+z4VRlBuo0
         F07UJnxO9Gvzx+Pvv75Mjf5T5+mDFRbOi91Myjtfk1F/21vgSYbGMqZxaK48mFYXoWhA
         OYYA==
X-Gm-Message-State: AOAM531zR6lEAJNRMk/LBYM92x+ac7DiK+ViNWOe1jIeZbfBi3CkUfRW
	bnpOX6alqimbuayGahhKrg0hEF38jKlRSw==
X-Google-Smtp-Source: ABdhPJy7q/1xZcvfVJMi6L+HZwmnOXPzp77GcmF1iJM72OVwmKxFxaYTjzQtUQFdpbLTmrwsi3bseQ==
X-Received: by 2002:a62:15c3:: with SMTP id 186mr4589768pfv.59.1644328682188;
        Tue, 08 Feb 2022 05:58:02 -0800 (PST)
Received: from [192.168.1.116] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id x33sm17673119pfh.178.2022.02.08.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 05:58:01 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: io-uring@vger.kernel.org, llvm@lists.linux.dev, Usama Arif <usama.arif@bytedance.com>, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <20220207162410.1013466-1-nathan@kernel.org>
References: <20220207162410.1013466-1-nathan@kernel.org>
Subject: Re: [PATCH] io_uring: Fix use of uninitialized ret in io_eventfd_register()
Message-Id: <164432868079.113641.15442485560114247466.b4-ty@kernel.dk>
Date: Tue, 08 Feb 2022 06:58:00 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 7 Feb 2022 09:24:11 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>           return ret;
>                  ^~~
>   fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence this warning
>           int fd, ret;
>                      ^
>                       = 0
>   1 warning generated.
> 
> [...]

Applied, thanks!

[1/1] io_uring: Fix use of uninitialized ret in io_eventfd_register()
      commit: 4c65723081332607ca331072b0f8a90189e2e447

Best regards,
-- 
Jens Axboe


