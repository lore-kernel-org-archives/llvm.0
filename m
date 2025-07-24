Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D12459D0
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400236; cv=none; b=lN8+GVzBkHEtje6a0PWJ0GpUvA7ItBLVFjHr+MVbLqw54LkxDetTgO0to3NwZmTylOYjRE/bsXI1ldvEUI0MKTmq9B60DV0pYQSO/REVPA3iygNp88OBKhd3e9eGTVDsOYZP3gDHbAzWUkE1jBwL465Nym9ApGE9FCZDeI1ZfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400236; c=relaxed/simple;
	bh=Znz4HWUKeUDrvSYkQdDugVKK7rHsODYScSSfQiOAlsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpXlaKWwEXl5nFrKiY7A1C5mg6ZRbXa7C8wep1qXbduii43mOL/L0vK5QN/2u3ShKPL/nvFo947AMJ8N6MpYShC9x9ZB8K7aF8IYC1upFr9acL3imB+riSI/mLjgGWd/K4V8meUnraRmii2rdkEG827feRAsvdmQhSMmpnk9bG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=e0ry7QK7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="e0ry7QK7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2363616a1a6so12510485ad.3
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400234; x=1754005034; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=e0ry7QK7MC3+1WjDsyW6t3wMzkkEUeAVPPLXoW1Eu0E6qLw/bjdwtpv/7nRFn7W5Mw
         mne+k1lnqJVrA/72xeSaJrPhIfhD60U5aO8a3ANeDXq76jLruH4mG7rVWDjTqTlh5nNe
         lWzVL28ia0/huOzDA+NdBvq5j0F4vPRJQo1EebXFKtPhXI5QJF1etQNNN8BJYcODVoTk
         qEzlZHRpoa4rYc4NWEjM/gk74XSQjRFT0xZQhRjOF6Aw84tT9g4bm3fvcRYtHD+TAewg
         MKVzLdYfTSuP366Hw+fGXeC+KvqSVkW1IQVh2/NliTg8JrPrSsajDqKZitnNtiqOp1N0
         +dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400234; x=1754005034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=BNW54LQvoud8CeVUNGuj13GCr5v48BTjq8LRQXAVsYQSnDdWZKDKboe6wQWXak5iTt
         1QyT1KV5J9WzX7+oEVZwMXY+Qr39N+1I/DJqABE6/Xeozsf5IfEkmYN3HYp66DL4aK0a
         DrfnyMmufohsPjVBdStb3atQ0D2cKAJuehc0x6pyOz4BUXhDS1urtqEerZjc/5AO6elW
         KN8umPA3O0B+WP2UhJ5wxESJkaSGDPgZ1mfCON9Dz9EiSoi3432dwpfN8+H2GdTrLkDa
         xuJ3YlrstFi049lx98qhTokfLTGYjH9yc9LKN8FYUn5vBHYtYthcwSeH/hl5fK90gViK
         kPRw==
X-Forwarded-Encrypted: i=1; AJvYcCU9c/DxBHQ1Y/DMp/MPUKcXc49m7VYfgEdhUpIqavMhs8HUVJ2P1E0gdtzZif4sd0kzuGB9@lists.linux.dev
X-Gm-Message-State: AOJu0YzA4jN3SFDKGPDzAcAaf7CaqF7dDeOSJJ2T/oMlDEl2UxjuHFsm
	0uTGN2v8eCr775QdV701h9NihJWObedipuwTJJ+5s293OnFDMFAF8cv9D2MiNcDOu70=
X-Gm-Gg: ASbGncuQ0x/kXuZLHifTzDk1U8nfWipodqTxEwL0yshr2g7mLOOTPekJ8uFJj5wkugO
	R7aW4bYAPbuMxa8Kkiv2neauXT4nzdWK+2PRB4soALmoLLrZFmWgYEPmYrfSZWUxc7PsbP7gb9u
	e52Umz1zoRJA1lWOwBpLVtmyfOZRTtmvdPn7O0anxpHHiKg+yOhadibLTc8ChFE14qLsCS1X9Ve
	d8cyr8s0esxeLZbycG8B+GF5zge+4P5SXQfWBUODDgtMjBgNFIBqAnscjrC+xzgRmlBvV7g4hoo
	O2xFwSbN/Zy2xXujStRZIIcg3TSfwpCkI1Ai4Ied4u8af9oJUMd0PbeWAVI9aXfSVmg81an3K90
	q+y3Yqulh+1YlIIqGvNq/0OIDJzpQJnCpgSPwHW60yy0=
X-Google-Smtp-Source: AGHT+IEC6umj6Lj/bljHcGk8ktP/FZKxktXm+XIJAAVaqHXn4oZH20sfm15h9uxx49Sr7WC6JzXzDg==
X-Received: by 2002:a17:903:3c2b:b0:234:adce:3ece with SMTP id d9443c01a7336-23f9813ab07mr115991405ad.11.1753400234285;
        Thu, 24 Jul 2025 16:37:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:57 -0700
Subject: [PATCH 04/11] riscv: exception handlers can be software guarded
 transfers
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-4-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Exception handlers are static and loaded from readonly memory. Control
transfers can be software guarded and not requiring lpad on target.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 598e17e800ae..3f0890b9c0b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -224,12 +224,12 @@ SYM_CODE_START(handle_exception)
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
 	bgeu t0, t2, 3f
-	REG_L t1, 0(t0)
-2:	jalr t1
+	REG_L t2, 0(t0)
+2:	jalr t2
 	j ret_from_exception
 3:
 
-	la t1, do_trap_unknown
+	la t2, do_trap_unknown
 	j 2b
 SYM_CODE_END(handle_exception)
 ASM_NOKPROBE(handle_exception)

-- 
2.43.0

