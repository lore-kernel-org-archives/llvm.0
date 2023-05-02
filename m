Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D8622
	for <llvm@lists.linux.dev>; Tue,  2 May 2023 01:28:25 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1924a23ddb7so11644401fac.0
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 18:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682990905; x=1685582905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mVH6+bWUcuKUF/qKwIgPR0gD6lIVpcYINT4JISpC94=;
        b=P9fppIss2OxfjULIXvdy+dUX9w7PEVRop13j86caNUW0bBs6C3/wQSOOYO3cSMJtjc
         ihPHtbEIVh4by3RpqOVqh6TeH5TRE4WC6Co4o4k3dMbyB0lgaMEEGof1fwKOkTEK1glf
         AuFI2se8mKywLPekgTqxP320UZ0MMV0U29UiLdWUptUQubbBRYA1uinapXGRIR2IvQiD
         7lNS1CY5aalCpYBAShhxplpZZSpD2DKbUWgbHpZEn8cVN9e8x5T4y2vxao2EkDWbh7pS
         G4QZTcE6knoEB0E870EGK119fD4LHTea7plc+p6aDdf+8XHQSeTfxb3VXfJShGGoXlmp
         iT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682990905; x=1685582905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mVH6+bWUcuKUF/qKwIgPR0gD6lIVpcYINT4JISpC94=;
        b=bbSeB2O9rAkixy8L6xu5kVgYliFAtl+NavjrHSxTWmCHTZr7xafuOf627d9ITqJgyM
         5VnI8XAAGpFew7m/OqJBchCcTRlgupXnntnegMDkzx77mVkPeBVB/mtx072Hh2dPphy7
         d985FugDQAOsBrfWiQqSvJwLS++riIfakjGduFEOjywElo7Bq/2fsHEVTKf6y48B+/qc
         pB3uBC9yYoODtcEzCvCiP3BWbcUWbi4a9vIDj8V0X5cInHC5qXZh+9GiX6Mfa0Vt5V/u
         a1OSc10s+rQdZEaesh6+03OA+tt/qB3cEOomIL+oaOWKY4vGb6U0B10H+jp/4u8a4e0l
         CP8A==
X-Gm-Message-State: AC+VfDy34SzDSMchIVI+gURa9Zj62AQKZlsWUXK3BtB5O/YMRMTJkNL5
	fyU8kQQgLhTZxhQstCmsaO/eWA==
X-Google-Smtp-Source: ACHHUZ6GSw2x3VDmZQX5TJwpmEs67OpnyMp9mprjr4us96mcsrPP3CnY/k1sZeNeHVZjlquWpmBpGQ==
X-Received: by 2002:a05:6808:8f1:b0:38e:467f:fee3 with SMTP id d17-20020a05680808f100b0038e467ffee3mr6754306oic.29.1682990904854;
        Mon, 01 May 2023 18:28:24 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e87:a073:45c:9455:55ad:4703])
        by smtp.gmail.com with ESMTPSA id p203-20020acaf1d4000000b0038cabfcb3ccsm12099517oih.15.2023.05.01.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:28:24 -0700 (PDT)
Date: Tue, 2 May 2023 06:58:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZFBnJ/7TWTBpPZm0@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
 <20230429-voucher-tutor-715fd4f6c24e@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429-voucher-tutor-715fd4f6c24e@spud>

On Sat, Apr 29, 2023 at 11:31:20AM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> 
> > @@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > -			continue;
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (node) {
> > +				rc = of_property_read_string(node, "riscv,isa", &isa);
> > +				of_node_put(node);
> > +				if (rc) {
> > +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > +					continue;
> > +				}
> > +			} else {
> > +				pr_warn("Unable to find cpu node\n");
> > +				continue;
> 
> I was poking at this the last few days and went back to look at the ACPI
> code again. Is there a reason we don't do early-return here? IOW:
> 
> 	node = of_cpu_device_node_get(cpu);
> 	if (!node) {
> 		pr_warn()
> 		continue;
> 	}
> 
> 	rc = of_property_read_string(node, "riscv,isa", &isa);
> 	of_node_put(node);
> 	if (rc) {
> 		pr_warn();
> 		continue;
> 	}
> 
This looks better. Will update when I send the next revision of the
series. Thank you!, Conor.
