Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741B24503B
	for <llvm@lists.linux.dev>; Mon,  4 Aug 2025 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754302326; cv=none; b=kM0NmYP3gs9inWrHh6HFMBkhkQvbOMiaUl5Lq4dqURMBq156CQ0+UXKPipiENDqFWfMdZktwWAjTmE3spMeEBKmhp4jNm0A38tdRX1BAJb4e1LnjyWtZsvFyNjmQ7uQB8PBJisYZIXZRde211StlpVEoTGsvm/YMfgCEhN69y4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754302326; c=relaxed/simple;
	bh=hZApIlBOWv7ok5FEqKF3cdEVfDjYEno/iYtxfVdOxuo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=A0X82DbqiuExWV73k1C32HnM+yUT01bvSvIU3Gvlj2GJmL3UvYQPtiPZvknCitfx+L8J5RdQryStB+rOLNo1J0xNd0Izl5HVXYiEmPfc94YV/LDtxKYHhn2hOqDVIyXPoZnWA8Hw4F2yQRTZbCKq5mRFvbSrlJcSak4+DsL2EzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6TpIOKV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6TpIOKV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31ef50d8d57so2018004a91.0
        for <llvm@lists.linux.dev>; Mon, 04 Aug 2025 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754302323; x=1754907123; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+m9dNDoA2LrkBnWEk52swdGfOHuXAiWRRUcjSMLrQRc=;
        b=o6TpIOKVZ3rgKIaE4vNEtj5gteERQwOgFmwdtC7U6GnmLvWi40bhUDR/oHB6OqEEF/
         CCi13F600I5oXJxJRlwsVYX39Z15GixIUTayjC1BHw2WLOWKvsBxHId5Z8g6F5ThNcA6
         pADwfwfVZNifheldLBLzxg3gCsJfNDUFskfjt4E1BG/ce7HKPwNEkOrIhzvBmi8ykbVS
         YIWVt127tF32ldk2mLfGGKUIFf6m0Me/jVzuE92F5kz65bODJqO9ziW8nsD8gH7FMRX5
         G5jHJZCNIG+2KIBwIw5wTbLzzSMotpqE6VWkB/gawr4Lc261i77RQUJX7EB9Gte7k0wu
         z+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754302323; x=1754907123;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m9dNDoA2LrkBnWEk52swdGfOHuXAiWRRUcjSMLrQRc=;
        b=A67pnAMu7ZymvRWWaYvpZfcSo8pDjdj0zKn/bUuD/rfDzwKZEmK6/PlrNh21552Rur
         s8WZv7s0oo5JfllZJBKd/5lleihNQUnxrOEjFwxQwh/6rSd/+R+NABlLisTv+98Q4w81
         H0sVeRXFxJoVKNT9qqEH6XC8ke4cHCnnHXcB/So+8k70x9QRZEaO7MGPUKiMRdRtR91U
         u0DEelMmUQV1LZXRfdiLB2hhAR6FRNOtZEwtCmGl6tKI93oJzDFFfAED2rAnH70tpDDc
         okNNEKjN0RdeFWKcaz+g9cuogDaZONMyu1wA8JBIMiySkRR8LjAgRjVF6ExDUhvhDjcD
         QkMg==
X-Gm-Message-State: AOJu0YwuDvv1BOYfUuCJTfKaBKbee+P2+QSaDx+xQv08pAGC5/x6qRFN
	6q4sbr4f/8V8JKrTsGSwLWNfvSutcfMECl0IhLnPYjoExVxuL27BuawgiR/pXhiDcGwwPdutI03
	5KgkECZ5o78hdoRdfKsfkXWsDXr2jfOgEbfELDd16IsAPdtzXTM6/jQY=
X-Gm-Gg: ASbGnctHt+awXalRb7v7nbrCV9ZUoKuxj0DcHlAtc92O7wT2L/6TyxZrt6PSr+X9CZf
	wM7dPnaIqYaofiD0FKULR+vTp5B2YjgkENQUecdwVDvuMaNpvE14o4yIqLw8nrgOqu7B2pXZEDj
	gN+y0ICbUvbMjFYLNwa3riL8zw7u9mj8asjyD1DalmeC3h81rFS1ZTJnix7eGB3jKQH+xYAMtQP
	B1BdY1xeL8wkVT007/N0g/Wq4dSgc0JKX3zcpE=
X-Google-Smtp-Source: AGHT+IGmoaWXbNeWHeHrWCnDRCt/5bpldGAOryYToFxsZb5CspShWUEkgr/A2ZYVYe7ryQGoP6JWlwkDsrdA48AD4cg=
X-Received: by 2002:a17:90b:1c86:b0:321:265a:e0d3 with SMTP id
 98e67ed59e1d1-321265ae4bamr8421691a91.25.1754302322958; Mon, 04 Aug 2025
 03:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Aug 2025 15:41:51 +0530
X-Gm-Features: Ac12FXwHubfFBQejxBFSQfy7WS98qKcbwEiY123z2BlqNH5k05Q6sO7VgOAYTX4
Message-ID: <CA+G9fYuDtzPpJOX7wdWAf2QmHyc-5v0cZ2Wood8cRwCttuyRmA@mail.gmail.com>
Subject: next-20250804: clang-nightly hardening.config boot failed on arm64 rock-pi-4b
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Cc: kees@kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions found while booting the Linux next-20250804 on the
qemu-arm64, dragonboard-410c, rock-pi-4b due to following kernel log.

Regression Analysis:
- New regression? Yes
- Reproducibility? yes

First seen on the next-20250804
Good: next-20250801
Bad: next-20250804

Test regression: next-20250804 clang-nightly hardening.config boot
failed on arm64 rock-pi-4b

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Rk3399-rock-pi-4b
[    0.006047] kfence: initialized - using 2097152 bytes for 255
objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.007767] Unable to handle kernel execute from non-executable
memory at virtual address 00000000820d0614
[    0.008666] Mem abort info:
[    0.008933]   ESR = 0x0000000086000004
[    0.009284]   EC = 0x21: IABT (current EL), IL = 32 bits
[    0.009780]   SET = 0, FnV = 0
[    0.010074]   EA = 0, S1PTW = 0
[    0.010376]   FSC = 0x04: level 0 translation fault
[    0.010834] [00000000820d0614] user address but active_mm is swapper
[    0.011424] Internal error: Oops: 0000000086000004 [#1]  SMP
[    0.011954] Modules linked in:
[    0.012255] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.16.0-next-20250804 #1 PREEMPT
[    0.013053] Hardware name: Radxa ROCK Pi 4B (DT)
[    0.013486] pstate: 80500205 (Nzcv Daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.014138] pc : 0x820d0614
[    0.014414] lr : start_kernel+0x1d8/0x388
[    0.014806] sp : ffff800082703e80
[    0.015121] x29: ffff800082703e90 x28: 0000000000000000 x27: 00000000f3ff3ad0
[    0.015802] x26: 00000000f3f2bf18 x25: 0000000000000000 x24: 0000000000000710
[    0.016481] x23: 0000000000000003 x22: 00000000f1f31468 x21: 00000000f1ef9000
[    0.017160] x20: ffff80008270a000 x19: ffff800082716ac0 x18: ffff800082715ac8
[    0.017841] x17: 0000000000000004 x16: 000000000000000c x15: 00000000000000ac
[    0.018521] x14: 0000000000000400 x13: 0000000000000000 x12: ffff0000f749b2ac
[    0.019200] x11: 0000000000000000 x10: 0000000000000002 x9 : 0000000000000006
[    0.019880] x8 : 00000000000000c0 x7 : 0000000000000000 x6 : 00000000b1f352b2
[    0.020557] x5 : ffff800082703b78 x4 : 0000000000000000 x3 : ffff800082703d30
[    0.021240] x2 : fffffffffffffb54 x1 : ffff0000f75b5180 x0 : 0000000000000000
[    0.021921] Call trace:
[    0.022159]  0x820d0614 (P)
[    0.022433]  __primary_switched+0x90/0x9c
[    0.022854] Unable to handle kernel write to read-only memory at
virtual address 0000000000000008
[    0.023677] Mem abort info:
[    0.023942]   ESR = 0x0000000096000044
[    0.024291]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.024788]   SET = 0, FnV = 0
[    0.025078]   EA = 0, S1PTW = 0
[    0.025375]   FSC = 0x04: level 0 translation fault
[    0.025831] Data abort info:
[    0.026103]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    0.026613]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    0.027088]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.027585] [0000000000000008] user address but active_mm is swapper

## Qemu-arm64 boot failed log
<6>[    0.000056] sched_clock: 61 bits at 1000MHz, resolution 1ns,
wraps every 4398046511103ns
<6>[    0.003490] kfence: initialized - using 2097152 bytes for 255
objects at 0x(____ptrval____)-0x(____ptrval____)
<2>[    0.016829] Unhandled 64-bit el1h sync exception on CPU0, ESR
0x000000003a000000 -- PSTATE.IL
<4>[    0.018731] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.16.0-next-20250804 #1 PREEMPT
<4>[    0.018869] Hardware name: linux,dummy-virt (DT)
<4>[    0.019015] pstate: 72500209 (nZCV Daif +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[    0.019099] pc : start_kernel+0x1e8/0x388
<4>[    0.019688] lr : start_kernel+0x1d8/0x388
<4>[    0.019706] sp : ffffb0d172f03e80
<4>[    0.019723] x29: ffffb0d172f03e90 x28: 0000000000000000 x27:
0000000000000000
<4>[    0.020240] x26: 0000000000000000 x25: 0000000000000000 x24:
0000000000000000
<4>[    0.020264] x23: 0000000000000000 x22: 0000000000000000 x21:
0000000048000000
<4>[    0.020288] x20: ffffb0d172f0a000 x19: ffffb0d172f16ac0 x18:
ffffb0d172f15ac0
<4>[    0.020311] x17: 0000000000000000 x16: 0000000000000008 x15:
00000000000001e8
<4>[    0.020334] x14: 0000000000000400 x13: 0000000000000000 x12:
fff00000ff395f6c
<4>[    0.020357] x11: 0000000000000000 x10: 0000000000000000 x9 :
0000000000000002
<4>[    0.020397] x8 : 00000000000000c0 x7 : 0000000000000000 x6 :
00000000c333cce7
<4>[    0.020419] x5 : 00000000f80cd09e x4 : 0000000000000000 x3 :
ffffb0d172f03d30
<4>[    0.020441] x2 : fffffffffffffb54 x1 : fff00000ff397cc0 x0 :
0000000000000000
<0>[    0.020652] Kernel panic - not syncing: Unhandled exception
<4>[    0.020740] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.16.0-next-20250804 #1 PREEMPT
<4>[    0.020757] Hardware name: linux,dummy-virt (DT)
<4>[    0.020843] Call trace:
<4>[    0.020960]  show_stack+0x18/0x28 (C)
<4>[    0.021107]  __dump_stack+0x28/0x3c
<4>[    0.021136]  dump_stack_lvl+0x24/0x6c
<4>[    0.021151]  dump_stack+0x18/0x24
<4>[    0.021166]  vpanic+0x10c/0x384
<4>[    0.021181]  panic+0x48/0x4c
<4>[    0.021195]  __panic_unhandled+0x68/0x6c
<4>[    0.021239]  el1_abort+0x0/0x5c
<4>[    0.021258]  el1h_64_sync+0x70/0x74
<4>[    0.021341]  start_kernel+0x1e8/0x388 (P)
<4>[    0.021359]  __primary_switched+0x90/0x9c
<0>[    0.028904] ---[ end Kernel panic - not syncing: Unhandled exception ]---

## Dragonboard-410c boot failed log

[    0.019420] Unable to handle kernel execute from non-executable
memory at virtual address 0000000082150614
[    0.028831] Unable to handle kernel write to read-only memory at
virtual address 0000000000000008
[    0.028839] Mem abort info:
[    0.028842]   ESR = 0x0000000096000044
[    0.028847]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.028853]   SET = 0, FnV = 0
[    0.028858]   EA = 0, S1PTW = 0
[    0.028864]   FSC = 0x04: level 0 translation fault
[    0.028869] Data abort info:
[    0.028872]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    0.028878]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    0.028884]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.028892] [0000000000000008] user address but active_mm is swapper
[    0.028899] Internal error: Oops: 0000000096000044 [#1]  SMP
[    0.028907] Modules linked in:
[    0.028919] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.16.0-next-20250804 #1 PREEMPT
[    0.028932] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    0.028939] pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.028949] pc : ret_to_kernel+0x8/0x68
[    0.028966] lr : el1h_64_irq+0x70/0x74
[    0.028975] sp : ffff8000827837e0
[    0.028981] x29: ffff800082783908 x28: ffff800082796ac0 x27: ffff800082b352c8
[    0.028998] x26: 0000000000000000 x25: ffff800082d10000 x24: ffff800082796ac0
[    0.029014] x23: 0000000020400205 x22: ffff8000801e3dfc x21: 0000000082149000
[    0.029030] x20: 0000000000000000 x19: ffff8000827839f4 x18: ffff800082795b30
[    0.029046] x17: 00000000a540670c x16: 00000000a540670c x15: 00000000000a0d34
[    0.029062] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[    0.029078] x11: 0000000000000000 x10: ffff800082796ac0 x9 : ffff800082745598
[    0.029093] x8 : 0000000000000000 x7 : 205d303234393130 x6 : 302e30202020205b
[    0.029109] x5 : ffff800082d111c8 x4 : ffff8000827837b7 x3 : ffff8000827837e0
[    0.029125] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff800082d10f7c
[    0.029141] Call trace:
[    0.029146]  ret_to_kernel+0x8/0x68 (P)
[    0.029161]  console_flush_all+0x2ac/0x3cc (P)
[    0.029175]  console_unlock+0x80/0x17c
[    0.029191]  vprintk_emit+0x208/0x2ac
[    0.029208]  vprintk_default+0x44/0x70
[    0.029225]  vprintk+0x34/0xb4
[    0.029236]  _printk+0x54/0x80
[    0.029249]  die_kernel_fault+0x40/0x74
[    0.029261]  vma_end_read+0x0/0x94
[    0.029277]  do_page_fault+0x44/0x768
[    0.029292]  do_translation_fault+0x4c/0x68
[    0.029307]  do_mem_abort+0x54/0xa8
[    0.029322]  el1_abort+0x3c/0x5c
[    0.029335]  el1h_64_sync_handler+0x50/0xfc
[    0.029346]  el1h_64_sync+0x70/0x74
[    0.029358]  0x82150614 (P)
[    0.029368]  __primary_switched+0x90/0x9c
[    0.029393] Code: 944fdb51 d5184035 d5184016 a94007e0 (a800ada6)
[    0.029401] ---[ end trace 0000000000000000 ]---
[    0.029408] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.282802] ---[ end Kernel panic - not syncing: Attempted to kill
the idle task! ]---


Rock-pi-4b
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29369027/suite/boot/test/clang-nightly-lkftconfig-hardening/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29369027/suite/boot/test/clang-nightly-lkftconfig-hardening/details/

Qemu-arm64
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29368323/suite/boot/test/clang-nightly-lkftconfig-hardening/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29368323/suite/boot/test/clang-nightly-lkftconfig-hardening/details/

Dragonboard-410c
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29368937/suite/boot/test/clang-nightly-lkftconfig-hardening/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29368937/suite/boot/test/clang-nightly-lkftconfig-hardening/log

 ## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 5c5a10f0be967a8950a2309ea965bae54251b50e
* Git describe: next-20250804
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804
* Architectures: arm64
* Toolchains: clang-nigtly Debian clang version 22.0.0
(++20250803105249+e640ca8b9adc-1~exp1~20250803225437.1615)
* Kconfigs: hardening.config

## Build
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250804/testrun/29368937/suite/boot/test/clang-nightly-lkftconfig-hardening/history/
* Test history 1:
https://regressions.linaro.org/lkft/linux-next-master/next-20250804/boot/clang-nightly-lkftconfig-hardening/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/30oCAKqSuQzYzKbypjmyC5lVNoC
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30oC7nI5ieJMRpDzpr0LBsg5Tnp/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30oC7nI5ieJMRpDzpr0LBsg5Tnp/config

--
Linaro LKFT
https://lkft.linaro.org
