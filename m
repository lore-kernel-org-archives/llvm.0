Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29332CA6
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 17:16:47 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so916606b3a.1
        for <llvm@lists.linux.dev>; Fri, 26 May 2023 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685121407; x=1687713407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt/68vR6SyeC2sLBcDQmwXBv1ANp28ndmxJPUsWE9hM=;
        b=LnkvrIlQ8Tok1eY3MzXaVX3kUwG4iQ/TiKFyN8pB9xmQgyIk1TWe7Rhr0DTtyZlcDs
         eVfyKux69riINbAJ3ut36H1rVoRrwRJT4yCWqFMFjVVbBMYEs2dxvwSjolS7rd4aewK5
         xwaoXlV1TqZNJcLRm1EvoAdemOvEOa/ETWhKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685121407; x=1687713407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt/68vR6SyeC2sLBcDQmwXBv1ANp28ndmxJPUsWE9hM=;
        b=Z6QaEu2f4txLbpdag1DTv4xn9fWqCmXFnPv4A7LN244hB5zZG0IFDk/V+ueQf36+nK
         SyjUARBmSzxgLmrgr3TXBL9nh9/zazj8TtM6uz+F4Wex/hLWI7icDNofAPL6M7Awssbk
         IKHKCccP+8DSsabwAdkMjZZmM+b7o5kClzUWVRX7cW7+47quh+sLWpw3Jz8piCvsEb4L
         IHJyVsQTtYPxachQfrtOeewrFGngHC5Kqce81wMLGO4r/tc2V2Evwjo2pv2mDS6PC+Tr
         nUog0kENI01+ZMTYewtBFQURDptFNVyu4SaQFFDzjQ14oPaGZTl6zRNbQHqpp+X5Cyi2
         3N1A==
X-Gm-Message-State: AC+VfDy+qDtgcjHNba8IrIUP5YnZr7p+inrJOQSh7kDjVSFzF2rZiul3
	yVVnphPF/NNqIZjC9fPwP+7SDQ==
X-Google-Smtp-Source: ACHHUZ5x1UtHJq0vBgeGLgQxf+Iim5Mb2xwowdl86d42mrNau8iDDUGU9hQVFxLDmRhXDrvIjkEZwQ==
X-Received: by 2002:a17:903:10c:b0:1ac:8062:4f0b with SMTP id y12-20020a170903010c00b001ac80624f0bmr2720843plc.59.1685121407089;
        Fri, 26 May 2023 10:16:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p23-20020a170902a41700b001aaecc0b6ffsm3490147plq.160.2023.05.26.10.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:16:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: ojeda@kernel.org,
	keescook@chromium.org
Cc: qing.zhao@oracle.com,
	morbo@google.com,
	llvm@lists.linux.dev,
	trix@redhat.com,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	ndesaulniers@google.com
Subject: Re: [PATCH v2] Compiler Attributes: Add __counted_by macro
Date: Fri, 26 May 2023 10:16:29 -0700
Message-Id: <168512138720.187005.8346289423859319616.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517190841.gonna.796-kees@kernel.org>
References: <20230517190841.gonna.796-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 17 May 2023 12:08:44 -0700, Kees Cook wrote:
> In an effort to annotate all flexible array members with their run-time
> size information, the "element_count" attribute is being introduced by
> Clang[1] and GCC[2] in future releases. This annotation will provide
> the CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE features the ability
> to perform run-time bounds checking on otherwise unknown-size flexible
> arrays.
> 
> [...]

FYI, applied to for-next/hardening:

[1/1] Compiler Attributes: Add __counted_by macro
      https://git.kernel.org/kees/c/86a76e91cbab

-- 
Kees Cook

