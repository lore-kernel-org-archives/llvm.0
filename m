Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484974;
	b=lhRJQLOh4+2pJ2wveCUaTx5BdKXSld10FT5rq2ZiW8Tx9Cp8vDb7MDQK326aucdxUE/B
	 iWToHyALmdY7ups44Yy0zbNZalYTh9D4Rp0Tk7aHeRH8XSGaI1XDz5ccGmUvdWD+0sGGg
	 wwVQV4iU2Dn72AweZQqu06ytztHqTNE8S8b6mgVk7cEYiL2a2aX8vv0UsiT3c7MLfhJcM
	 9iFySzNBGa2xHKy+jmn1xZSkq+UDqo486xQR19mDH1vHDcBadYqhnUFkffSvPMb1qEiDQ
	 veQRyudkdadHz3mu3i+04JspQzVFPYzq2HzSQ2xHJ7QWXLnSsPFvxkpt5c3Al2GE5aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
	b=OPTRCTkr05sD0X8J74jbz3p0rnYyKeTNcT1xhoIHhQJMLCwR9B2zMhs0SR4vWapTnU/E
	 Gx9upWjW9dYP+1kNEjswoxgPezvZvdsS18C/HKU9w8ar7lt8D2FfEkYlXK26IDH0IGVvL
	 eSyFC689z9RK2W2KlurVAHZlkDyHu0abbVpesNzKHhuiuKLEE0ux4srKLo9NR7up4BXWd
	 I+63XQob9gN0oyXGzOByBUsWKwvyIzEcbz3HXlHVBQ1XZ3qTk4WWyQAfhJpuj48Kts2Qc
	 udrFt/GK3fIQoIF88mTtyodzRKp7RkCKuBp91+7YuqSl5TEXGM5j/jyvFKQA//wi8iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTz3u11O;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C04606A321
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C04606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTz3u11O
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2401832f8f.2
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484972; x=1795089772; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=qTz3u11ODUad9ARAfkRj3ypssVNidu1gNYY1vlrlk9vRGtHbVAniLCHI8+DJukb+i9
         VkPcpFU4p6Wea6KB9GP/FmS9B9zb+0cs8M8MbvDvAXIHdrYQbsPA7H+NgeWA8EaGJDwS
         JXwOE/1teqhNKzCNdLWTAJCFmq7ZfDPTCcqHW8gg55mVIflWNcDWYSctAaKS+TOQGyKs
         AA7ZglVT6y9fJkBB3odVrSmyFHTLETJFjoewrBBQzAxbkX/lr2/H641p32fsgJmdHSEt
         vPt9jx6vRXtswqwCqHQkACAZiJy/9pKQTjEuJ6qE+jkKFYhLnVvgtZe/6t6hrLDsCx3b
         3X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484972; x=1795089772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=WGufS/1lGsdmABjFFXma/kdoQtuwySpbNwBlOhVkcz8xIimg8KLaxmgpyYKrTjnR25
         ISFmG0Uz9AmUNbaF/SUwLWHNY5LI41Tdhuw6xYz2vHTm6NbbKABE2gl/6xbcE4145tRX
         7+cnAMUdnGxrTxBHGV8PXEpFvw87fJIp1W6GXNyDk21zKpEIF1VFZw8KssB+sCJAKKsZ
         kB026IWbd3f0OuR1wnbmmciWWDNS38dfP7yFGYh7ot5bt7dLowpPQ5vymTT6msd0ddsW
         32TFIB0PjaZXhttv2x9uG7L/V07fU0WraBJ1jp+6Bw/0M6Zz+Vjq6vQXJY/pTMPbxDGT
         h77Q==
X-Forwarded-Encrypted: i=1; AL+hErF7aiDt+o8KqeC6tNJK3DavuEjpPMMOXyJdCaI6zPQMD3o+yjHoewTrnXyHoyuKf1Pb3BVu@lists.linux.dev
X-Gm-Message-State: APuU4Z8lLTzRM0O11tRCHih38h4NoQXyhr9yYlA8AhWz4CrY9fSV6zSr
	WqzcJBEeS3rXsd5zYchQKn/5eUn4x50ypMn9Xk+YfudEhuGAsCX1fOB5
X-Gm-Gg: AYBFou0T3OY3NdGuTG5JbuB8Op6HzVm3kVndFq6BDmf0Sqjoc+YHoc2PboUhE0xhO5e
	QMbpkIZ2jjeZ4u1c4zCVFQOG1c6NZN/irIRnSAWD+rsbcOT0LbDKqRGiY+VrzqcDvCdjI2CnNqx
	P6j46KXppwlHV+yS7Bgo0150O0mnUmWRU/vLt3rZGY2iPc82/j1ie6I5lYZ+lDvDDredcNMx7yj
	J/IA+RdBITgESa8ka6vt+UJ//E/EAw4PFZIYj386/cIu4JimhB9zTfpfz13hbcoCWnJ9/M5caoq
	EYcZO5n6hN3SPzrI/HoCbYhZLjSTYMbMzvfP9PoXkIWpRBw60+TUNiswzewsLCzNYBy1CTHYy/y
	X72x+nkb01DJ1FXvrXwoUVOoS5JLftSfE5E8phrjDX8P6hZBjyz4mcwinpoWDx2r+C6ENKWxG/r
	3laesGjHd5GxOZTOOlyjWdV8cqoCArgaCB56XPDI7aGNuDH8auim7iX09PJOHO3XKxZZ5q5WQHH
	FQLjzcMVcxePz+2OW2uQS6tjX+wqtO6FB8VYlY6S+UM+U5rO7IXp5lQ7YE5vQ3GzqeH7beMWV2M
	Q7DwBDmDZ+N0n7a3XXiUDWXYmhlHXrJXHsVV+yJtbI6AD68de7FCu4qFBpk+RNJa+w==
X-Received: by 2002:a05:6000:460b:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-499c898168fmr8711941f8f.42.1794484971757;
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm16541261f8f.50.2026.11.12.04.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Date: Thu, 12 Nov 2026 12:02:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 oleg@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, broonie@kernel.org, dave@stgolabs.net,
 jszhang@kernel.org, tglx@kernel.org, conor.dooley@microchip.com,
 thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/9] riscv: add infrastructure for preemptible
 this_cpu operations
Message-ID: <20261112120248.5c8265e2@pumpkin>
In-Reply-To: <20261112104149.38589-3-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-3-cuiyunhui@bytedance.com>
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

On Thu, 12 Nov 2026 18:41:42 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> +/*
> + * Mark a region where the per-CPU offset and address registers may need to
> + * be rewritten by exception return after migration.  The three registers
> + * must remain distinct for the whole region.
> + */
> +#define __PCPU_GPRS_BEGIN						\
> +	__DEFINE_ASM_GPR_NUMS						\
> +	__PCPU_GPRS_ASSERT_DISTINCT					\
> +	"li %[off], " __PCPU_GPRS_VALUE "\n"				\
> +	"sh %[off], %[gprs]\n"						\
> +	REG_L " %[off], %[pcpu_offset]\n"				\
> +	"add %[addr], %[pcp], %[off]\n"
> +
> +#define __PCPU_GPRS_END							\
> +	"sh zero, %[gprs]\n"

Those are quite nasty with all the hidden variable names.
It wouldn't do any harm to pass the names though.

David
