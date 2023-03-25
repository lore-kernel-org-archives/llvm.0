Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987728EB
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 13:51:13 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-544f7c176easo85828677b3.9
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679752272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeMx+51y0jX6AmFg23qU+UO5+vL72ohSvQttXU02rrk=;
        b=GviucWSxUP3oWPKJhEiiMYP8IaOK8nlm2qtLoDolhL3OpW4AIzP/4dxZGsIuEmHHVx
         z2FXK3fKxYbnqdQWxH/p2xRx1Q+dSLwlb1fSn95EYARanmUaKLSZaHEuZE90fYhY7Vjy
         HmNwpxuy/8ghlc+dnGJMgclY8/8mPmxeEGv3xgVJaKUqef/ymuhW5aK0cb4p8yRd5U6S
         G605C9mz7ccAn3cmBZJIUvEfQm861kA2DKJyjhhV20FV78HJnji1G63Vcaa6mcVa/BMW
         8fHweFa1zftL4UhXoV+zMvEt0vs1qro64W7ATePHkrIW24wNVozZaxysgzjLlaCk3kFJ
         9tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679752272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeMx+51y0jX6AmFg23qU+UO5+vL72ohSvQttXU02rrk=;
        b=vkOxdRJsafC00np1fK1tgVIdYs5WEFh/Nd2CErIMBcw31gwfbvLNMtqgHOYPnH2RPF
         lFw44Yl8oKJ1OkGFg5XsOE9tarmDBmqTsBO5rE1xW4PSE1j2A4NCNXFwuFANz6LvaSdk
         vbV6+02Kw7VsKKBzAiw8vkuveV+8/uj/B3EuDnm9aFEunfv1oROlGefwevq+Uz4S0QVk
         82cwEXZI3gI2pE6IBha+s2idTp68hAIzg9wUmImguRyeXCw8bQ0Wv/dBRKYgTvKPl7e/
         dq76S5xK0cAELKt9FFSc7kZ7mChc/HlcC+PdgZlYKvB2AVORtFRUJWCzy/HM3tF9GLtV
         EoWg==
X-Gm-Message-State: AAQBX9fDTnMHGWEc7vFgxxu+C+JoIJwtS6uXwgvX+iNL2NU+Ww7B6JDT
	PUsAPDUA+JmmkFKS1qsLoB8=
X-Google-Smtp-Source: AKy350Z3DzrKwWrvSOrG8gFzdH+L4ldXznlz/pjPvEuMZ/8n3xxXhgWbBFL9MvXeZkvF/DzlD/kvAw==
X-Received: by 2002:a81:4e16:0:b0:541:a029:1591 with SMTP id c22-20020a814e16000000b00541a0291591mr6104211ywb.2.1679752272104;
        Sat, 25 Mar 2023 06:51:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id be15-20020a05690c008f00b00545a0818488sm967405ywb.24.2023.03.25.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:51:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 25 Mar 2023 06:51:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Rix <trix@redhat.com>
Cc: juergh@proton.me, jdelvare@suse.com, nathan@kernel.org,
	ndesaulniers@google.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] hwmon: remove unused superio_outb function
Message-ID: <0db043dd-a94b-4f39-a5c0-a0132733c054@roeck-us.net>
References: <20230323211535.2637939-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323211535.2637939-1-trix@redhat.com>

On Thu, Mar 23, 2023 at 05:15:35PM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/hwmon/vt1211.c:198:20: error: unused function
>   'superio_outb' [-Werror,-Wunused-function]
> static inline void superio_outb(int sio_cip, int reg, int val)
>                    ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Acked-by: Juerg Haefliger <juergh@proton.me>

Applied.

Thanks,
Guenter
