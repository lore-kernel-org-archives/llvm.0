Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88518F43
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 17:18:03 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id ha3-20020a17090af3c300b00230222051a6so2486373pjb.2
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GzPZSiuWUI10A7nGN6F8afAigmnE11O3pPivhXt2BI4=;
        b=dpHYoO5y+OJzvw3hGh02/zVMmdMTJw2GNRwNYUmBR9S5mEwDYnnjfhWj3vcd0NzELc
         RzqS1lmRY2x7oL8uGlK9ffLCq/6dXY3SHEd0ntFF+KKrHFszfA2H+YGJCAqIAH7kW+Ca
         JXES2+8RBP6vRmTeDLzU15Dy9G/WIuqlw866Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzPZSiuWUI10A7nGN6F8afAigmnE11O3pPivhXt2BI4=;
        b=Olvmo0CdqICqVlZtI8qrXaubxlWGs0llyMJq7zg0IrIFovNA6/FZx4WCkpUW5aqG6p
         ag4d8yEj785eMtsEEHuWs1A6pBoMKV1+O2CDcXUkHG2NW4MrPjfX1Ufr81PHrTOqlBkE
         SbRQ0WrapoYYte50vV9rp/WaljGOucOwXzK2EP6Gew6UE0m3DkowQlZnLHv0HjzBeGLI
         l9InnTsFGEpChDUJ+aVXkKgX4t3xQwlOo+TN8rv9pA9uPa6ZXuA0+gFYmnveL406X+kt
         MCwU1ED7L+v3ziCr29xoogT6NXGLuEQUE8qMy2vIt027hZWwTBBrYLQxNl1iU0MNEIHe
         uscA==
X-Gm-Message-State: AO0yUKXWU2j7FgVQF4aTY71ewj1SKCGkQmECNVz3rV/wjciLdkV+9xeh
	KBcz/5f89bvQ7+vWyCTHPK05fg==
X-Google-Smtp-Source: AK7set+NnIMQt6YlrSXhpTD9hAeLNLeG9CybmFZKQfwYo9yvWLqWvFDYemIeU9FbReu1DptcIqIdIg==
X-Received: by 2002:a05:6a20:9f9b:b0:b8:ca86:d1e8 with SMTP id mm27-20020a056a209f9b00b000b8ca86d1e8mr2663317pzb.14.1675358283121;
        Thu, 02 Feb 2023 09:18:03 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o6-20020a637306000000b004d346876d37sm36860pgc.45.2023.02.02.09.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 09:18:02 -0800 (PST)
Message-ID: <63dbf04a.630a0220.2608a.0149@mx.google.com>
X-Google-Original-Message-ID: <202302021717.@keescook>
Date: Thu, 2 Feb 2023 17:18:01 +0000
From: Kees Cook <keescook@chromium.org>
To: John Stultz <jstultz@google.com>
Cc: Yongqin Liu <yongqin.liu@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nishanth Menon <nm@ti.com>,
	Michael Kelley <mikelley@microsoft.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, David Gow <davidgow@google.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 5/6] driver core: Add __alloc_size hint to devm allocators
References: <20221101222520.never.109-kees@kernel.org>
 <20221101223321.1326815-5-keescook@chromium.org>
 <CAMSo37W3gRkP02tSCxGX71ZDAt3WgPZrkTRTM6J1iQ4gvUS9vg@mail.gmail.com>
 <CANDhNCogJrvt=yEXFK-xVmGjkcRxSNGZUqUeNw2MV9bFRrwPdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCogJrvt=yEXFK-xVmGjkcRxSNGZUqUeNw2MV9bFRrwPdQ@mail.gmail.com>

On Wed, Feb 01, 2023 at 12:11:41AM -0800, John Stultz wrote:
> On Tue, Jan 31, 2023 at 11:36 PM Yongqin Liu <yongqin.liu@linaro.org> wrote:
> >
> > Hi, Kees
> >
> > This change causes "Kernel panic - not syncing: BRK handler: Fatal exception"
> > for the android-mainline based hikey960 build, with this commit reverted,
> > there is no problem for the build to boot to the homescreen.
> > Not sure if you have any idea about it and give some suggestions.
> >
> > Here is part of the kernel panic log:
> >
> >     [    9.479878][  T122] ueventd: Loading module
> > /vendor/lib/modules/spi-pl022.ko with args ''
> >     [    9.480276][  T115] apexd-bootstrap: Pre-allocated loop device 29
> >     [    9.480517][  T123] ueventd: LoadWithAliases was unable to load
> > of:Nhi3660_i2sT(null)Chisilicon,hi3660-i2s-1.0
> >     [    9.480632][  T121] Unexpected kernel BRK exception at EL1
> >     [    9.480637][  T121] Internal error: BRK handler:
> > 00000000f2000001 [#1] PREEMPT SMP
> >     [    9.480644][  T121] Modules linked in: cpufreq_dt(E+)
> > hisi_thermal(E+) phy_hi3660_usb3(E) btqca(E) hi6421_pmic_core(E)
> > btbcm(E) spi_pl022(E) hi3660_mailbox(E) i2c_designware_platform(E)
> > mali_kbase(OE) dw_mmc_k3(E) bluetooth(E) dw_mmc_pltfm(E) dw_mmc(E)
> > kirin_drm(E) rfkill(E) kirin_dsi(E) i2c_designware_core(E) k3dma(E)
> > drm_dma_helper(E) cma_heap(E) system_heap(E)
> >     [    9.480688][  T121] CPU: 4 PID: 121 Comm: ueventd Tainted: G
> >        OE      6.2.0-rc6-mainline-14196-g1d9f94ec75b9 #1
> >     [    9.480694][  T121] Hardware name: HiKey960 (DT)
> >     [    9.480697][  T121] pstate: 20400005 (nzCv daif +PAN -UAO -TCO
> > -DIT -SSBS BTYPE=--)
> >     [    9.480703][  T121] pc : hi3660_thermal_probe+0x6c/0x74 [hisi_thermal]
> >     [    9.480722][  T121] lr : hi3660_thermal_probe+0x38/0x74 [hisi_thermal]
> >     [    9.480733][  T121] sp : ffffffc00aa13700
> >     [    9.480735][  T121] x29: ffffffc00aa13700 x28: 0000007ff8ae8531
> > x27: 00000000000008c0
> >     [    9.480743][  T121] x26: ffffffc00aa2a300 x25: ffffffc00aa2ab40
> > x24: 000000000000001d
> >     [    9.480749][  T121] x23: ffffffc00a29d000 x22: 0000000000000000
> > x21: ffffff8001fa4a80
> >     [    9.480755][  T121] x20: 0000000000000001 x19: ffffff8001fa4a80
> > x18: ffffffc00a8810b0
> >     [    9.480761][  T121] x17: 000000007ab542f2 x16: 000000007ab542f2
> > x15: ffffffc00aa01000
> >     [    9.480767][  T121] x14: ffffffc00966f250 x13: ffffffc0b58f9000
> > x12: ffffffc00a055f10
> >     [    9.480771][  T123] ueventd: LoadWithAliases was unable to load
> > cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B
> >     [    9.480773][  T121]
> >     [    9.480774][  T121] x11: 0000000000000000 x10: 0000000000000001
> > x9 : 0000000100000000
> >     [    9.480780][  T123] ueventd:
> >     [    9.480780][  T121] x8 : ffffffc0044154cb x7 : 0000000000000000
> > x6 : 000000000000003f
> >     [    9.480786][  T121] x5 : 0000000000000020 x4 : ffffffc0098db323
> > x3 : ffffff801aeb62c0
> >     [    9.480792][  T121] x2 : ffffff801aeb62c0 x1 : 0000000000000000
> > x0 : ffffff8001fa4c80
> >     [    9.480798][  T121] Call trace:
> >     [    9.480801][  T121]  hi3660_thermal_probe+0x6c/0x74 [hisi_thermal]
> >     [    9.480813][  T121]  hisi_thermal_probe+0xbc/0x284 [hisi_thermal]
> 
> 
> Taking a look here, it looks pretty obvious:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thermal/hisi_thermal.c#n414
> 
> data->nr_sensors = 1;
> data->sensor = devm_kzalloc(dev, sizeof(*data->sensor) *
>    data->nr_sensors, GFP_KERNEL);
> 
> Here as nr_sensors=1, we allocate only one structure for the array.
> But then below that, we modify two entries, writing past the valid
> array, and corrupting data when writing the second sensor values.
> 
> data->sensor[0].id = HI3660_BIG_SENSOR;
> data->sensor[0].irq_name = "tsensor_a73";
> data->sensor[0].data = data;
> 
> data->sensor[1].id = HI3660_LITTLE_SENSOR;
> data->sensor[1].irq_name = "tsensor_a53";
> data->sensor[1].data = data;
> 
> I suspect nr_sensors needs to be set to 2.
> 
> Nice work, Kees!

Yay for compilers! :)

Was a patch sent to fix this driver?

-- 
Kees Cook
