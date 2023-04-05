Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5B7EB
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 10:56:04 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so36833222pjl.4
        for <llvm@lists.linux.dev>; Wed, 05 Apr 2023 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680692164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHjNmNubtW1m6x/ZHSROLzC6UE26oZx7ZrLiozJA6N0=;
        b=cDCnQAlVg9wphWyj020XoXu348UrwEHznmRRm3HENM8CHxPrsB4ftiLhtCukY5QAS1
         CwBBjAHsCSYAMx2GgBoncQw7+9YyR71AMr2GaaRR1lRn7sqbWtNwZfzyNbyrEJTIWSeP
         lpvajki5RiSaNzESIU3JMJZqDQcCUfxS4Nw351KgGTvAex3xD9lBOO/ZlgPSdCLXZQWE
         yt4H/DUHQl8arz3OuSIFiy9Y9v0m5Ve3DxDtYTut/wSWZ0NOL44uMcCpCzSgL/p5n0Ao
         d+rZSPbZuqfD52fpeaM2haOafL/rVPiGAqsWfMj9b+EVyRJk7i0D2c2bvyVZAlW2jOEM
         hjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHjNmNubtW1m6x/ZHSROLzC6UE26oZx7ZrLiozJA6N0=;
        b=t41SOrvULpdT3c4GrIGZAekG6UWZeAqJkfReMR8Z7CImLLZr3SQ+wHPIckSFX6+ScE
         HYS5GOnugtml/hEMoHK140c20fo7jvS++D9Mdb2UGbcvsHo8foHFSGrzxE2ZjyiM+QeN
         j5RqPMEMtinz6k7as05UNJDo5kwJD/pCm7nXAz3WIhU6Ao/QoOoMGQrd6A3fhk4l8SgR
         6I9/P44Zf1uoPBY4HIcr2pEW9VJB+VSUQ4YCzYOfvMytfXKe10Oh2YqGX7qWqFtbW+2Y
         ofV445VECiuFuIwmRBjeSwwQIU7MEfjFRRBOCHOrCSupklebk2K/3yCcO3NvmLxjm9PE
         Uddw==
X-Gm-Message-State: AAQBX9f70hBLBDlklrUIJ1+r7ju474Ti4i9Rq4tIhEcWHcfpP5aX8L5Z
	XnxF82pQfX8s6fbvmRiruiRqng==
X-Google-Smtp-Source: AKy350brsIvQ17YKEK+9sMHxvtlGFWTIhRtaYlWAqmfzPxrLO54umhrjiJOK/GO6T6r+7/92elotug==
X-Received: by 2002:a17:90b:4b46:b0:23b:4614:6f84 with SMTP id mi6-20020a17090b4b4600b0023b46146f84mr6472024pjb.28.1680692164415;
        Wed, 05 Apr 2023 03:56:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a498e00b00234afca2498sm1077701pjh.28.2023.04.05.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:56:04 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:25:49 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 16/23] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <ZC1TtYAELzHtTJTu@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-17-sunilvl@ventanamicro.com>
 <20230404-flatware-ditto-e5c71d5a36c2@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-flatware-ditto-e5c71d5a36c2@spud>

On Tue, Apr 04, 2023 at 10:25:38PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:30PM +0530, Sunil V L wrote:
> > Refactor the timer init function such that few things can be
> > shared by both DT and ACPI based platforms.
> > 
> > Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Forget an R-b or drop it intentionally from v3?
> https://lore.kernel.org/linux-riscv/c2c1bdb5-aee6-4f4c-9f7d-073917e75b88@spud/
> Please say why if you drop or ignore tags between versions.
> 
Sorry, missed those tags. Not intentional. Will update in next revision.

Thanks!
Sunil
