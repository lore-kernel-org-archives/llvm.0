Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A59C2564
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 08:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3633C433EF
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681891663;
	bh=AXquwKy5LjLh7tSnRzd0VsL8D1TiNE1DyoFpIoSW6NA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oxMBS2EN9qZRCjsTeLRXPJUZlwlWXOEdR3Av9ztu1/YBhvrkDfqgGIxjl1dCAvORh
	 BURw4isKEl6NgsYBY7gUONzJqdjKH2ps8cKTdgm3DSmE1KM6ALWraK/WVTnq95X6PW
	 h3eST1bt0cnjFS1bntqGf4bDuWH1cw/Zcsod9qlUDrNG30hHlALE9s61m0Zsr1Iwfs
	 dJe2G5fQ+s5E8CxQXIgJwYFpZ65FTBnkILC06uHbimZUJKlDcDdKYL3kvDGNbM3M1o
	 P33crnvgNoA/9ljgEgHpkFee0AIanbMBOriBlscqIgj7GXmJhCP8ayuOtkN1jQlnC3
	 4JpmeDGcz7c4g==
Received: by mail-qv1-f45.google.com with SMTP id a15so9373674qvn.2
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 01:07:43 -0700 (PDT)
X-Gm-Message-State: AAQBX9fmtpyGDX35alhdU/V1b9QTa0bnl+T9ct80taM5S2h2ut05EyPr
	7uvZcovZv7a5yrx/MgEviqvpITiQHb1ToCDEQZw=
X-Google-Smtp-Source: AKy350bdQVlRWqsqeS6TRYbu0RmPCz51xkA13vrz1KtzyFZ8SBsJ/CulCVdIHrwUKbMaG/ei0H3CuUjCZH3hhJeLmF8=
X-Received: by 2002:a05:6214:d0d:b0:5b4:89b4:1af8 with SMTP id
 13-20020a0562140d0d00b005b489b41af8mr26907505qvh.16.1681891663014; Wed, 19
 Apr 2023 01:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org> <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop> <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
 <ZCvJpnNZYzrIcfPe@sunil-laptop> <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
In-Reply-To: <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
From: Ley Foon Tan <lftan@kernel.org>
Date: Wed, 19 Apr 2023 16:07:30 +0800
X-Gmail-Original-Message-ID: <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
Message-ID: <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-acpi@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 10:45=E2=80=AFAM Atish Kumar Patra <atishp@rivosinc.=
com> wrote:
>

> > >
> > > Hi Sunil
> > >
> > > One question regarding PMU in ACPI flow.
> > >
> > > We use DT to decode the supported HPM counters/events for the
> > > different platforms now.
> > > How do we enable PMU (drivers/perf/riscv_pmu_sbi.c) when using ACPI m=
ethod?
> > > Note, this might be in separate patch series.
> > >
> > Hi Lay Foon,
> >
> > This driver uses SBI calls and hence should work in case of ACPI also.
> >
> > There is one minor change required in this driver for overflow
> > interrupt. I have a patch for that in future series.
>
> Just to add further clarification: OpenSBI will continue to use the
> device tree so that
> the firmware will have access to all the PMU details.
>
Sorry for the late reply, missed out on this email in my kernel.org mailbox=
.

Do you mean OpenSBI still using the device tree, but EDK II and Linux
using the ACPI table? Normally Linux shouldn't mix between ACPI and
device tree.

Regards
Ley Foon
