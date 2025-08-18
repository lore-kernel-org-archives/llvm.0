Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C668D2D2480
	for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539685; cv=none; b=MCk6dfxXmYqKxNioVzFDzlXM6GCJh8k0Ds9xiXvD6koS/REI/oYwfi/sBvlhkL6mgZlXLWVukeISHGBD4OpT/4Q9TSHWB6kOhIChbKewbbneInLVeFvIPpB5NSfq9+Yja57Y/ayLu13NRjhHODNQ0NSBVHJBq5jpxb+CjSfnEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539685; c=relaxed/simple;
	bh=4UfdMxEyxlruQZf/vdJYpocF1XFBaF82GRXtjF6ld5c=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=fDh2cR5Zu7/XFF+ysB+3manqwk+PP/7nXLIRYe2pKUfoVU0e1ZcMtOf4RV8/tUNqqKNCoeZ/cH2qPEKfX9RALsYk8ubm9Jdl4Gy5asjvvVl1KjKuqXFbWj4KukJoFRSCVHDMvTRXmALNzNXj/XiYIJ6Ki71O63xzqeSHshTA9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=iLq3Zfs/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="iLq3Zfs/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-244581c3b43so37525015ad.2
        for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755539683; x=1756144483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSRATe9INt3QQOiQQe+F807dmA0P+MskJFDfwXpHBjo=;
        b=iLq3Zfs/QDYrZO1kPdCl9xaI0JDFxtx0N0Zza79staHaH3iKvc+Gqflm1Zm3aWhSKZ
         QR/dV+QglZt3PB6H0iEw7CYA4+J2h3Pxcl3UuqsQ8xm9xRP0cc7YfEmADzH+2Yzw9bii
         bqky3EmEoVKkJM0XuOe1o3rEPUNFbR1h6sjsqdkvvifIYEU+HRcsIXYuc7HZZaIZTAjE
         G1wKU23bF/poGI6Hgk4yq3ccemkvyamBzjAQBsuXFBZghGwyJpQJ/O0SHiSv7P421e63
         VmFKBq8cSX/TlnygT+LE3U5jwPyKlKQjklv6XLxPBh1Fi3/IcYHtmFdCXXBH/Aig+PC3
         Ebow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755539683; x=1756144483;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSRATe9INt3QQOiQQe+F807dmA0P+MskJFDfwXpHBjo=;
        b=fSgABLyWPrpeAGfhUreDFcnZOUpv+OezDulw4mzGXFT8SBRQtCXNYOKc+mfbRJ2P1L
         i9mC1AxMXBDyGycKpZoZGZ6p7WQNTBTbFHgx2c8MsjB5+I93kBmA/lOTz3zxN13t7IDL
         ym5XGO/K0xmgK3MffezN129SB49HL+LTyIfB93GGuZ9kOOao47snymHD/5PVdUp8XSOG
         T6Iv/0NxIRZnQUjlrSfrlejk1+Er3NEDwwG+dJRZJ4xxebSwdO/OpvEx6qsk+iHE6jFJ
         cDDzgrKXnPvWOn8BXOowG+KSXt49738jhOOIcMA2gy5uui4BaDSoacEt4JV+Nya4FJsS
         8qZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1M7PGqB8h4cnkr8FE2dHROWaKC19v7UoLSTu9wX7nsxPZf3pjFMNgw0LFvasXsyhGH6EZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyMcGe0SOmWNYowrDisKi8JzrGxzEEZGsc35O0g3FWQIDsaEd+w
	nXZcPRACMaO/fz28JRXqptO11Gq0Pf8jA3Wz9ZvnKuPcnEHrK79k5XrNVInz6B+bxfytkYXUc+3
	FprOkPwo=
X-Gm-Gg: ASbGnctK3G6/kqDwFH0a/9JF1wHsoYRWFqD/B35KrsV+e1cPsshd6TCHyedLpWtVzhI
	+ya1ecrBYu+TNdjYVFtxXAT8RR3favYapqRIssJXBJoM8wjJ4DXB28lxOPjQHsrdUsfHH1Os1aM
	NRn15pCO62F0ZgR/+BXQlC/xvPkoK2va7r5QHDhQRjKNkSWETqv40xWs2y0c30KGKyJZc1crw7p
	3d+ooWUHXzaDkOPcW2rcWLbaoGk+J4LxRVBezFRfb8l/mek3zp7HwZ2xIWvbCPp/hHfZRo7eKbc
	cktNB4gc6e1t/Eu6G4r7HODZ8bvHHZK71ns3YbHxE1vl9XZ1z7jLzF9ONo8rbc9No5W5cLaEpd1
	QfgFX4amYYt1gr4cvTA0qXWONnECEk3IdppY=
X-Google-Smtp-Source: AGHT+IGkERqTLGM15EoPueauLracKSRTVqIwvP49Jxytu0k7eJU/J0BvVRZqy4jwBQB37C9KxjRCjg==
X-Received: by 2002:a17:903:1107:b0:23f:c945:6081 with SMTP id d9443c01a7336-2446d8b1f8emr185499735ad.31.1755539682980;
        Mon, 18 Aug 2025 10:54:42 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446d50f88asm85574975ad.87.2025.08.18.10.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 10:54:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:54:42 -0700 (PDT)
X-Google-Original-Date: Mon, 18 Aug 2025 10:54:27 PDT (-0700)
Subject:     Re: kernel/trace/rv/monitors/sleep/sleep.c:130:7: error: use of undeclared identifier '__NR_clock_nanosleep'
In-Reply-To: <9ee2ad87e78a87d0d4ff0aee6fc7cf01c21f7cf7.camel@redhat.com>
CC: lkp@intel.com, namcao@linutronix.de, llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, rostedt@goodmis.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: gmonaco@redhat.com
Message-ID: <mhng-BE7B7DA7-1D39-49CF-9A6D-7AEBFE5CD2FC@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 18 Aug 2025 00:42:20 PDT (-0700), gmonaco@redhat.com wrote:
> On Sat, 2025-08-16 at 02:37 +0800, kernel test robot wrote:
>> tree:  
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma
>> ster
>> head:   ee94b00c1a648530333d9734200be7a45e6e00cd
>> commit: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep
>> monitor
>> date:   5 weeks ago
>> config: riscv-randconfig-001-20250816
>> (https://download.01.org/0day-ci/archive/20250816/202508160204.SsFyNf
>> o6-lkp@intel.com/config)
>> compiler: clang version 22.0.0git
>> (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef3152
>> 4fa1d9f3f)
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20250816/202508160204.SsFyNf
>> o6-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>> the same patch/commit), kindly add following tags
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Closes:
>> > https://lore.kernel.org/oe-kbuild-all/202508160204.SsFyNfo6-lkp@intel.com/
>> 
>
> Palmer, this issue is what you fix in
> https://lore.kernel.org/lkml/20250804194518.97620-2-palmer@dabbelt.com/
> , right?

Yes.

>> All errors (new ones prefixed by >>):
>> 
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:804:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      804 |         insb(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:104:53: note: expanded from macro
>> 'insb'
>>      104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                          ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:812:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      812 |         insw(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:105:53: note: expanded from macro
>> 'insw'
>>      105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                          ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:820:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      820 |         insl(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:106:53: note: expanded from macro
>> 'insl'
>>      106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                          ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:829:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      829 |         outsb(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:118:55: note: expanded from macro
>> 'outsb'
>>      118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                            ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:838:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      838 |         outsw(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:119:55: note: expanded from macro
>> 'outsw'
>>      119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                            ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:847:2: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>      847 |         outsl(addr, buffer, count);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/riscv/include/asm/io.h:120:55: note: expanded from macro
>> 'outsl'
>>      120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE +
>> (addr), buffer, count)
>>          |                                            ~~~~~~~~~~ ^
>>    In file included from kernel/trace/rv/monitors/sleep/sleep.c:2:
>>    In file included from include/linux/ftrace.h:10:
>>    In file included from include/linux/trace_recursion.h:5:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:11:
>>    In file included from
>> ./arch/riscv/include/generated/asm/hardirq.h:1:
>>    In file included from include/asm-generic/hardirq.h:17:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:12:
>>    In file included from arch/riscv/include/asm/io.h:136:
>>    include/asm-generic/io.h:1175:55: warning: performing pointer
>> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
>> arithmetic]
>>     1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL :
>> PCI_IOBASE + port;
>>          |                                                  
>> ~~~~~~~~~~ ^
>> > > kernel/trace/rv/monitors/sleep/sleep.c:130:7: error: use of
>> > > undeclared identifier '__NR_clock_nanosleep'
>>      130 |         case __NR_clock_nanosleep:
>>          |              ^~~~~~~~~~~~~~~~~~~~
>> > > kernel/trace/rv/monitors/sleep/sleep.c:141:7: error: use of
>> > > undeclared identifier '__NR_futex'
>>      141 |         case __NR_futex:
>>          |              ^~~~~~~~~~
>>    7 warnings and 2 errors generated.
>> 
>> 
>> vim +/__NR_clock_nanosleep +130
>> kernel/trace/rv/monitors/sleep/sleep.c
>> 
>>    120	
>>    121	static void handle_sys_enter(void *data, struct pt_regs
>> *regs, long id)
>>    122	{
>>    123		struct ltl_monitor *mon;
>>    124		unsigned long args[6];
>>    125		int op, cmd;
>>    126	
>>    127		mon = ltl_get_monitor(current);
>>    128	
>>    129		switch (id) {
>>  > 130		case __NR_clock_nanosleep:
>>    131	#ifdef __NR_clock_nanosleep_time64
>>    132		case __NR_clock_nanosleep_time64:
>>    133	#endif
>>    134			syscall_get_arguments(current, regs, args);
>>    135			ltl_atom_set(mon,
>> LTL_NANOSLEEP_CLOCK_MONOTONIC, args[0] == CLOCK_MONOTONIC);
>>    136			ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI,
>> args[0] == CLOCK_TAI);
>>    137			ltl_atom_set(mon,
>> LTL_NANOSLEEP_TIMER_ABSTIME, args[1] == TIMER_ABSTIME);
>>    138			ltl_atom_update(current,
>> LTL_CLOCK_NANOSLEEP, true);
>>    139			break;
>>    140	
>>  > 141		case __NR_futex:
>>    142	#ifdef __NR_futex_time64
>>    143		case __NR_futex_time64:
>>    144	#endif
>>    145			syscall_get_arguments(current, regs, args);
>>    146			op = args[1];
>>    147			cmd = op & FUTEX_CMD_MASK;
>>    148	
>>    149			switch (cmd) {
>>    150			case FUTEX_LOCK_PI:
>>    151			case FUTEX_LOCK_PI2:
>>    152				ltl_atom_update(current,
>> LTL_FUTEX_LOCK_PI, true);
>>    153				break;
>>    154			case FUTEX_WAIT:
>>    155			case FUTEX_WAIT_BITSET:
>>    156			case FUTEX_WAIT_REQUEUE_PI:
>>    157				ltl_atom_update(current,
>> LTL_FUTEX_WAIT, true);
>>    158				break;
>>    159			}
>>    160			break;
>>    161		}
>>    162	}
>>    163	
