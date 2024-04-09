Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34FE6EB5D
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643120; cv=none; b=B9d6fsLavxsvPT6sd7rCaJQyssIzrH0yYZAQBgTIu6AExDPZngINTWhb7r/q+Yh8gSXtgJpYkkMut6B5AfvpoMNgmvU80owcxTptp2GxNSPrBuoyVbHP5N9oZlRork7LSVLMnDlJD6AS1RG4FcKzVwMJFhDw92/eRfUEOa90s3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643120; c=relaxed/simple;
	bh=I9xVI12IPjLWrDdUcoDuZ65TsSjC6yYu8PIgdN/YZ0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XuRWWGC/subgZ3K34/9GMFufV0Zy2VzhzfB2KpIK8TsWf7wdN/Lsq1SLIh/9T3vKQnEa2ngUxdgez0CP2FgDy3mioyeXrd340EpUCrYhmdwKstRgpF4HXIMpJrLebqf4l/zNHedEEe/TdbJ5Ah+bOfZiu9pA6F7J10ECrw1b3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wA6R0s3B; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wA6R0s3B"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce2aada130so3653785a12.1
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643117; x=1713247917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNu+GMI0LnpE6OoNqPaNP2xIRA7y3ywXaMFD3+hEy+U=;
        b=wA6R0s3BYSMXQHpu09Mb+mRih7yK9G4LO7ihnPzl4BiZzihL3SdaZovAZuCJC5NvDS
         EyNAWUzq3inEz+yGzx8QIeg8TNnNdiOdjVlwQrOL2OqvgsEHzoSgtmBfxe8efsLK9Ky6
         APKY6esu2rTyFWysWoIk5undx2Cm5r6W6OdYCVjNJGzNoUrf/TatniYx7k3Jv0DHp3H6
         A7p/ty0n+MOvhiNL7r37idRFSpMGPtbOWNHvKDh6vonEB5SmVddLk2Km7G+0Em1WbFIt
         libKG/if3C4nD8NS5OeAN+pU1cYpDOdMj41XClnjw5X4/5JQrpC/gVlwo2n/dKYaq0Dq
         2jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643117; x=1713247917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNu+GMI0LnpE6OoNqPaNP2xIRA7y3ywXaMFD3+hEy+U=;
        b=WwDvmzEk+kuiaHsp6mE76FzVkaMLyA0g4yAMRJVIkHztBJp1eBhTps0PeXEHsmDHE8
         vCI3Lhengx61cs9Op99srbeBrx/OKJ1XdzpKLYmoLIgRqXRuYr3cjAcZh1v+PnxprP9O
         5FUKXSjKiGIKQZeeD9FVHOK2Y77xHJvKU5f1FDBLrk9vAr6YPUbVnZGyBdcnBuBYk2ls
         j7btmKhV5m7Ia8fgs3vHmKRVbCBUOm5acCG2S7sOmwxkWbXor+WVvFX7YJj8lRzlSMG6
         aJde+Blt5cDT1v7NmHQIrWjWj9h9LaZcnJ3IIGIkKhXVGMahw5d7DjrZriZGxh/VwXYm
         i/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWh+vvH/YRUCEedAZwP1Pvo/Kj6nw4U/cJXZgWzlUljAtcY/emJU8Ra064Ywj0V9TL76VXHO9Ew2mKlLvvXOvy9A2uaBA==
X-Gm-Message-State: AOJu0YxLD7dHu4LsadsweXEXO1ABEI4D3iKLFWEi6OTlhJxOZh+qJcZZ
	FqurbRsz5eFRYkg7PnXnWphCsUY0rHNAaBxTADo0TKaKsuQrkf9mpV1lQJz9xtQ=
X-Google-Smtp-Source: AGHT+IFAEx2oWQm/CjdpGB2Fg/5zWgfQFm9z3OMamljMoc1Ud/BPFjN+0/Vy6Ix6zi2EHTDC9jxG0Q==
X-Received: by 2002:a17:902:cecc:b0:1e2:ac38:2657 with SMTP id d12-20020a170902cecc00b001e2ac382657mr10867433plg.24.1712643117037;
        Mon, 08 Apr 2024 23:11:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:11:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH v1] riscv kernel control flow integrity
Date: Mon,  8 Apr 2024 23:10:31 -0700
Message-Id: <20240409061043.3269676-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Basic overview
---------------
This is a RFC patch series for enabling kernel control flow integrity on
riscv architecture. This patch series enables kernel control flow
integrity using proposed riscv cpu extensions `zicfilp` and `zicfiss` [1].

`zicfilp` enforces that all indirect calls and jumps must land on a landing
pad instruction (`lpad`). Additionally `lpad` has 20bit encoded value as
part of instruction and cpu will check this 20bit value with t2/x7 register
, if they mismatch then cpu will raise an exception `software check
exception` (a new exception with cause=18). In this patch series, a
constant label value of 0x1 is used. As series will mature, it will switch
to a 20 bit truncated hash over function signature. Label based on function
signature allows stricter control flow and fewer call/jmp locations from a
callsite.

`zicfiss` protects the return path from functions where return relies on
obtaining return address from stack which is corruptible. `zicfiss`
provides a shadow stack which can be used by software to place return
addresses on shadow stack and while returning from function it can be used
to compare against return address from regular stack. If they dont match,
cpu will raise software check exception. `zicfiss` based shadow stack are
protected against tampering using special page table encodings (please
refer to [1])

To obtain more details about `zicfiss` and `zicfilp` ISA extension, please
refer to [1]. There is an ongoing patchsets for enabling this feature for
user mode software here [2]

Enabling on kernel
===================
This patch series introduces new riscv config `CONFIG_RISCV_KERNEL_CFI`.
If this config is selected, it turns on 
	- forward control flow for kernel using `zicfilp`
	- selects `CONFIG_SHADOW_CALL_STACK` /w `CONFIG_DYNAMIC_SCS` to enable
	  backward control flow.

forward control flow for kernel
================================
This patch series simply compiles kernel with `march=_zicfilp` compiler
option. Currently toolchain uses constant label scheme of label = 0x1.
This patch series manually fixes some of the assembly callsites and
sequences to make sure they are not breaking rules setup by `zicfilp`.

backward control flow for kernel
=================================
There is an existing support for riscv kernel for shadow call stack [3],
which is a software based shadow stack and uses clang /w instrumentation
to push/pop return address in prolog and epilog of functions. Although
software based shadow stack lacks memory protections and thus suffers from
same issue of return address susceptible to hijacking. shadow call stack
uses `CONFIG_SHADOW_CALL_STACK` /w option of `CONFIG_DYNAMIC_SCS` so that
hardware vendors hook into the flow to provide stronger guarantees. This
patch uses `CONFIG_SHADOW_CALL_STACK` flow along with `CONFIG_DYNAMIC_SCS`
to enable return control flow integrity on riscv kernel.

[1] - https://github.com/riscv/riscv-cfi
[2] - https://lore.kernel.org/all/20240403234054.2020347-1-debug@rivosinc.com/ 
[3] - https://lore.kernel.org/all/20230927224757.1154247-8-samitolvanen@google.com/


