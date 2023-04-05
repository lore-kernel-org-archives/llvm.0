Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382363AE
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 15:12:07 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso4255394pjf.0
        for <llvm@lists.linux.dev>; Wed, 05 Apr 2023 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680707527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uc9pS7LWOx9W2W+bVOlzBxwPbz5vuE1RzHaVZSPLmto=;
        b=E1iN/rVli6IlEc+9dtSf766sTAMDsKoBOf9+0HqG/1UKxBY9CsRrocmEKMyToLlGz4
         gMn6oqiNZ2oMqeY+GCNgDGhKqzkpTMAFFbowFGbmLQ9VD3ZuzCvBevmg56kH26n23Rmb
         pbtQjZFZUMnZs1F+k9M/tQLTuSqOdPg7cHgV/Fn6G7azHT/tkIxNegBxHN0JT5DrumSE
         3F/7mc2bp3puj/e/PI/bFn4DGw984aOT8BFORB2XD4EqHbdNt6OXltvazgvL0dausRra
         E7UOXUBJs9OCJZQQVHxikMXd3WNStS19nw7frBf76aEmS5gjvAKrr4C3jKExIkVaX/r9
         JBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc9pS7LWOx9W2W+bVOlzBxwPbz5vuE1RzHaVZSPLmto=;
        b=nLwRwbuCZapmO2DYpBRjcEcZNzdR1mbnef7wB4NEBZoxVMDk673ToKHoCtYfflNrLa
         jj7WEa75owY7pfxhBy13ztOhYk1NhM01+DWnXMZQEzaOJUR78sxUhnMGHxQvJ0xrNy9K
         hrdpAJ7Ft6wT4Q90ym+yk+MpNvotf6LJ9wk1MR3shbUzGc+++TwpGTFohg3i9xeciH1E
         usPlpxxaQT8TzBolXckV6EdUz/3BS1XxqsE6vMcMOiFTbhNIeqtPQE4w9a5BXXywvmUg
         VulOUf8SAXhB9vVKuGPEjSufF4faFXF7dBmT8a5S1ai/YoamGckrq7zKQsxrq+Vp7Mjk
         nVGQ==
X-Gm-Message-State: AAQBX9fM/kjp8C6W6b8KwT4b1IedX+jgKnrj0EzjpxbbfDhyj4MPb++M
	njwXbUWdqqMMpfpXQoD10ETxhA==
X-Google-Smtp-Source: AKy350acIs5ZpayOCA2w9KEEQrlHejGlhpqGSCjTnMb7JdKR0jSYZZQPlwOcN3qK4L6jamW1VaYfVw==
X-Received: by 2002:a05:6a20:6b98:b0:df:81de:93dc with SMTP id bu24-20020a056a206b9800b000df81de93dcmr6125484pzb.34.1680707527314;
        Wed, 05 Apr 2023 08:12:07 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id x24-20020a62fb18000000b00582f222f088sm10810109pfm.47.2023.04.05.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:12:06 -0700 (PDT)
Date: Wed, 5 Apr 2023 20:41:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 19/23] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <ZC2PuiY5Xscz305H@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-20-sunilvl@ventanamicro.com>
 <20230404-escalator-fridge-daf9aaffad12@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-escalator-fridge-daf9aaffad12@spud>

On Tue, Apr 04, 2023 at 10:38:56PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:33PM +0530, Sunil V L wrote:
> > Initialize the ACPI core for RISC-V during boot.
> > 
> > ACPI tables and interpreter are initialized based on
> > the information passed from the firmware and the value of
> > the kernel parameter 'acpi'.
> > 
> > With ACPI support added for RISC-V, the kernel parameter 'acpi'
> > is also supported on RISC-V. Hence, update the documentation.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > +	/* Parse the ACPI tables for possible boot-time configuration */
> > +	acpi_boot_table_init();
> > +	if (acpi_disabled) {
> > +		if (IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> > +			unflatten_and_copy_device_tree();
> > +		} else {
> > +			if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> > +				unflatten_device_tree();
> > +			else
> > +				pr_err("No DTB found in kernel mappings\n");
> > +		}
> > +	} else {
> > +		early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa)));
> 
> I'm probably forgetting something, but this seems very non-obvious to
> me:
> Why are you running early_init_dt_verify() when ACPI is enabled?
> I think that one deserves a comment so that next time someone looks at
> this (that doesn't live in ACPI land) they've know exactly why this is
> like it is.
> 
> Doubly so since this is likely to change with some of Alex's bits moving
> the dtb back into the fixmap.
> 
Good question. The kernel creates a tiny DTB even when the FW didn't
pass the FDT (ACPI systems). Please see update_fdt(). So, parse_dtb()
would have set initial_boot_params to early VA and if we don't call
early_init_dt_verify() again with __va, it panics since
initial_boot_params can not be translated.

Thanks,
Sunil
