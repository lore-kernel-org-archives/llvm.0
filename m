Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761E333F8BF
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852083; cv=none; b=FCidh3eLAowYn8RmqMlEYOLgpO/xKvzv043im5YZQ+a9bpIb3t4BE4Ri9Uc1AZmnCUFIH6Sps87SrhOp/I7RtUTXBvg+xyVhGJgrzB1KGM3U0hjhi31JEpJgP5zbLp32WHdOVVowZpNBhpTcRn8C0/FyMskcrBdby1SIPLTABBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852083; c=relaxed/simple;
	bh=hG1vkzaTsWHXNInLHudm3ZoCCm4Kfa85G6m2/cYZB8s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ex+wrf1LYZy0H997NaFVF29LVw62VKIf3M7hTLTVqQccO59xOoWF1ays3ezYAYjHo46C5GVE/4I2vl9cd5mDyUCiAWuTvk2239St+6+Oqn+vbLnZFSQE87AD6+JBJ8HaOa07y3WsxRBtAx2VmZEqUHqnBr3hWRjkzGHWpvtWx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNrJe8T/; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNrJe8T/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6433f99eb15so690027d50.3
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764852080; x=1765456880; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=mNrJe8T/jao3vxlGGyh+tf/oit7l6N8GEAIy0MxoDtMCHPAD3HkfaYnweG473QeVMv
         kmlJRBpxlC+QgswxdyF/b/F5CkuhewZHJkTSeAw9iplzWOrwE3JFSiKGB1qnKyI9UGwL
         b/0w1Olv4xoT9SarmPRjbskXeFgoZRGr03iXFZj4+xuhtAErzz7RNkmK4lanhZwf8C+X
         jmOcSg9ja/Hc6r92MNWQYMBaA5tWngG358dkla1UWSLDWGvxbv8JjW4CmefHyY2S9ZC4
         FYtpW9LxhW8Qn8JwIEc+hU/AyFEvBzNBRgzNuGJOdysFlF/FDNvV5Bj+ah/hwNTpO8vm
         iiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852080; x=1765456880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=UGiRiuys7aWUz2VCbIpLS8QuDpMn03Tb2eQCIUyHw3s6iO2/ZqxCh0iA8yiaPYHM2M
         Bm6La+CCMEkK4npr7V2GVKfEZ74b10eSddJo3rV3NN4RAZCNWFdQSMvgoC6ukICj/tlV
         kUP1Chnwuo7fLnZNuhS0MJT3wxhK21ZpIZ/5KQeDnYH0uhwSDKvQNIB4fZkbjyVZ1HOi
         jN27hsLhON9uv9jwmLivNmsYPMjcKHV5hydatTeTxr2yQaXIp7e2JTv3UO1LUIIbHkBg
         8TkmFdbiao93zUV7DYlvlXdd7eSbUWfIbNAV3G89Xzq59e2wivlbSsnvlA7AxB5bELdF
         n7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW9+buYVNNM9Ldy9zJQiELNTWQE6cp55Fu/3vYrqZ6qVn6TMlsZNNm8t5p4zAtgkZx6W5Ci@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3OrGoLrTFK1s7dDEH6PH8XnZuDy1SsmkzngZ8BcXuAGo1Dkbo
	8yqxtGMCl8Ti/BZ1nC9CIfbxNCJjh6FHr1KcglN9trb+qHnw/Ke9Sz86
X-Gm-Gg: ASbGnctZSHP+GbSQ4s5hKaERtmuuHAFf0aVP7UYwTXbnyJswTt5+tB7kGNYt+Z9lzDK
	/EDNzgXFlk83ncfzVXRPHSPGU0pwiHBU2zx1+lb3wXL+hvAxcQClyvoXKOttOYLRjkRWmAnO52M
	Br6D4wwXr0xiLof5PEaOMYpWIEFLzEEhfRhF2hbwjYvPxH4tTU0YWg9ikOIATVm8X1Kig05CYvG
	d5cMrjR/ba8RIGTlXUYMU22QEv6NE0wh862x9a3djrIvLXqXUiZ3YjuCm8RzJ0b79d/pkRSC842
	ANPntoGqk9+pWH3c6nZANECWkIxuAe0HqF2pgkAXVg3YAnZfVbnIcVsxi9sI81MiM6uMyfOK4fE
	FTNl8uRdrHFmBNoECXEIiDl6Nz1M9Vi0kaIooOIOeIB28f9LE6HlJCStlGu1JgvdHLMjV5ouj97
	aeyY4ICFhYrJuFfeKbLnGkKEmSTUOA7FT6LsaySrFI
X-Google-Smtp-Source: AGHT+IHJA60ZYQi9bh/oeg3T2d4XWf4TlPAq2CBo9e/gVJnloBN9DiCKQRpeQyWtcS1RPasu2wKg9g==
X-Received: by 2002:a05:690e:11c4:b0:640:caa5:57bd with SMTP id 956f58d0204a3-64436fe7dc6mr4661174d50.37.1764852080011;
        Thu, 04 Dec 2025 04:41:20 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b78e892sm4782487b3.44.2025.12.04.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:41:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <0c63bb4a-6aa0-412e-aad3-7ca3ecb1361f@gmail.com>
Date: Thu, 4 Dec 2025 20:41:10 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noticed that RISC-V CI bjorn/dtb-warn-rv64 [^1] is failing somehow due 
to the error here. I'll look into it tomorrow.

[^1]: 
https://patchwork.kernel.org/project/linux-riscv/patch/20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com/
