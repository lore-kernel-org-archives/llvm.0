Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173578;
	b=Vwt1uKonKQVjZOq7qn1xNYJwvZ3qHFLRAAO7KhMxtt6ktLm6/15JM+hiaORAekJnxCzZ
	 FUvIv4BRLDFXGQm342xV9qMmBJJR1A7wGOFSMlVYyibC7gI63nvEZTg5gZKkCAEsv8Osd
	 7uvIec50f9ykrmbGxhm9atEMEqAlRazq/X6JVw0Q43Vlyp9eaC16Fx4XwinWq+XLMlapo
	 9e2yFIJk7sHNCC6po7t8hYxuBINtWdbYkkgqabRM2p1GUB8QVGtomyWPKgNT+kY8ImBse
	 IHoEDmmFtqPLZBmRWLpOQisQW3d07rt+VmrEKv9/HK4IO3oIRw02DmLHccFPJ5FblSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
	b=NV22kJcw1KQWjnnUU2ce+0AmcLMfTKp3mbg8vqagOu5CnuggL0T22nCbXoqasD/ZnFFj
	 QddvvcE0RRasvHH3qrb1aGb28h0XA/0ZUMOXmQYa+mv2e41nKzfJBuoe9ClByBmIrTADg
	 JFlUfjrNinhIk07PWJyjigZ/Baf84ZwhnLDQBuvrsPZBGqCSR1Ktt3zaD53vCmBt2BscB
	 WBK5A+z/9xQrexLQc2Bw67pU4ksRp/xSNVORw6GzymM0jxgH1+7usULfWu8cAtXgYCK/6
	 +RjWNkA7JUde1GnkQUyrwFKwoly7mbTh+GOpv8/tnSpSXK9XIP6fY6A5KlKXq1ofMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep1nHT11;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CCD606A322
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 21:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CCD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep1nHT11
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so196974f8f.0
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173576; x=1794778376; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=Ep1nHT11YAAkqWwqDvJFP51niyMToaYs66vHYsYCwafN/duQlURb13cDDzzg4Q88T7
         wu3409sanxi7s8Z+PmVt+oWJQG1RJMHxuzpEMdo7+dQqE7IUGvPj9ikEiSagxsxcHNUh
         3pLrO7Z+3qbn1YaY4b3oV0T37d3MhsguVJlerm1yLv87ay6FhHUPZomdg2cyQzXqUZzx
         MswIgaDtlQSAM5oTTnWzq9I+wqLEsjJNFdw8MFwR8nNEImjF7wmFRtoAjJ35tLvUIsMY
         X4TX3u3w+mYTDuKnXdoKRP6eLIt5K1FAxceHvxUO91JG0Yr1H3ulgh9Q9rytjN+CVrLb
         56Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173576; x=1794778376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=0COCZ6vCc2CAjkJWgw1ryCGpvCPw/8O8cU/ZvtUu4oeGcEAN9Be0F8g7qP5SapLK6G
         bSEwAxuc13pEeRtW+9HSv2RVxJWdzRKR1bN/udRiP9nLohlT98E/aGVOgxMHGGMUvIx4
         nv75fkIQN3gFIFf0NQegByRTpb0ipLcVBJYjLtUF58QaM4CGzF+Uhbt/ufdni7N+fkb2
         LZG5iwodOQU+LIbM7hMcilNbJdtfSu/BBTIeDjp5pNRGlM+TwlALuCWlFtlAZq/YiD3O
         iBZdF5rI98XvSE2h4sUt0JT+WVYljjFl/720IrQ14PFITUY3PLInPFIq1m9rCDgBdboe
         0G2Q==
X-Forwarded-Encrypted: i=1; AL+hErHWIVQfLLoORUpSOJaeVQiFr3NRHZN5AosOnN0245DCnM44tym06Nw4x0x2nsZm0xt9hwfJ@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q2ZhCMIP0eKpgXuHBUWN+ctgWHx/7rTWixsiSVRxjgS1ObPoE
	BBii8qaIhb+RFQr/GXYxFNkaSVHbEHRhJDfipVc0KWaVfG7bj52pFToa
X-Gm-Gg: AYBFou21nSIWfprALR33ihi3OxSkdp7wxl5SApUWWee7Zct7vVu69veZYHYUDUVLYu0
	q3TFS/QNfFdTozxFBfXYzBIjDkxlj18/NjPyViAHRYLdZ19tEZJ+euLSHf+8zVO91597f3EHzq7
	RdhXxQpQNLwrykK3iJb1rsGBKSAuELw/6DIJhJoygZZxTbpfZpAGOhQb62BP2xXw7/+4w+Boa1C
	isKGs7ps0k7yQvLI19a6KCC2hlDuumKgPEiTkbU+uZ0DMV+DmG7dTlmvy7XQIwTg1Mbz8ZXQxY7
	YfclyjkKyWPKVUK7oKggf6lgh9EK1K5BF4JXSoE5czqaq6xmDoKhQGFx1Pqqq5lFHYeZMxzm5aK
	Sfn/yIqcATkr/Xo/hQuaHAyhqLnrGa/Spchsdl14XRTrTXI+YvD9r0E0MqIQq+RZPcMDbVsdqjw
	ihgnvbI4/UtO87qv72A/fmX0dUaDEn0BMmNZpJtkHVWyxfEBHpwWL3x5oouKqaU/rmLgpvTqxcA
	tuczRqwxFGkt0tJFHo+uAgHam733I4+ymlS7UReISjn+Lqnp3LKF7uVQnb886mg77MTSKskzabf
	kyRUUeFL9q4TwRoLJvS5D95/VLekuqJQtW7OIO2w9yyjDsbmpJW/NK8YLYuljRHr
X-Received: by 2002:a05:6000:26c8:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-4958852d3b8mr5479500f8f.4.1794173576292;
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm5861840f8f.36.2026.11.08.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Date: Sun, 8 Nov 2026 21:32:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
 ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com,
 seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com,
 cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com,
 apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Subject: Re: [PATCH v9 1/3] riscv: implement this_cpu operations
Message-ID: <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108110406.97495-2-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
	<20261108110406.97495-2-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  8 Nov 2026 19:04:04 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> operations use generic implementations that disable local interrupts.
> 
> Implement RISC-V-specific this_cpu operations with preemption disabled
> to keep accesses on the current CPU. 

Have you looked at some of the schemes (I think arm64 has the latest,
but also s390) that do most per-cpu ops without disabling preemption.
In particular they save the pre-emption check when pre-emption
is enabled.

Basically the code tells the scheduler which register contains the
per-cpu data so that it can be 'magically' flipped during a context
switch.

David
