Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6640C0D
	for <llvm@lists.linux.dev>; Thu,  7 Dec 2023 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R2VdwzK/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so1007807f8f.2
        for <llvm@lists.linux.dev>; Thu, 07 Dec 2023 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701959327; x=1702564127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siQf2yGcuKbINax/017dn/aIzi9vyOaDmow1c81WvIo=;
        b=R2VdwzK/nu6/d3zvBqLFicbAgjTrqmpzyMPs8ZckpEG+pVDyL4GhPnqROBi+V86qjX
         lXOxmbORi8IkvlhuZwz5zxgWlX1Y2z3hnaob2OXubNzjLVcPYdDec2TpKd7cOlvbDYab
         3m6YE9gQ8MV6Q1CAV9ZIxEr/2pCiY0EUbc1nVVsSuTfXfwomPwqoGqngp0RW/RDRTmi7
         /vKeb+M09Usn7XfqLqG6yIfYy9ooRLqjqlRwyiQVsO8xQV4yU/j23O8s18u1vWWsGxm8
         qgk5XM4JXjx81fJRd3+wSbH48b3SS/N3VXNr/EFC9Kt3eKBs3FDLSr0vMAZv9HlxEXNb
         aCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959327; x=1702564127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siQf2yGcuKbINax/017dn/aIzi9vyOaDmow1c81WvIo=;
        b=eMq+81PsaI6fTR0ZilPEaEIBE98/PIZ/7KR0aXUsVYvhOGf75PuwfXBDRzedLq7/n8
         InV87aiH2Qk5gc5wP9TAy7Kjz+zuhhNFyaUrxkBfQHRPIE+gZaNnX55IUbTztrcgcHK+
         SuqtbQOWMY6bZpAYb/XHM5DydMC0HggbuZkqcp/YOjS3JCt881Vcgpb9oEeaqOJzoysg
         AKIxgQfuMfD9h10f5S09pyGqz925pgQDGLcd5VDZhgagZabXAkT63cj/Zg3i3hWfR3fa
         cghGn9/iavKbmjThopGx6kpA+wvjEAhYGY30qbuGFip4jqlKDvSLVksENWLq/FmGrNnY
         Ogtg==
X-Gm-Message-State: AOJu0YyAdmUQs1ceC8QYmDLW0Y8p53AbkpPUqLeNuVp5BTDHK5RI9ymm
	PcEAWlGhyz08xLEXC36jkupfEQ==
X-Google-Smtp-Source: AGHT+IG3fjLcVnbgN/JM62HKhQ/CpsfIghOkkqs4Bf6SrVZBPi1Z/DUH73yzVRZSk42YeYyrPH8xFg==
X-Received: by 2002:a05:600c:a43:b0:40b:5e59:c58c with SMTP id c3-20020a05600c0a4300b0040b5e59c58cmr1686676wmq.182.1701959327359;
        Thu, 07 Dec 2023 06:28:47 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm216659wmq.43.2023.12.07.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:28:46 -0800 (PST)
Date: Thu, 7 Dec 2023 14:28:44 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: ili922x: add an error code check in
 ili922x_write
Message-ID: <20231207142844.GA151182@aspen.lan>
References: <20231130051155.1235972-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130051155.1235972-1-suhui@nfschina.com>

On Thu, Nov 30, 2023 at 01:11:56PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Return the error code when spi_sync() failed.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
