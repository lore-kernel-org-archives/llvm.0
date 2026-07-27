Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772034D4DE
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116276; cv=none; b=raOtG6CV1nyrOg4LaKHezePwg5j3fPqzW++Cx3dBrP0v6UayIZv2Sju/wJ+nKKIZU7LrqWpAmXBv6qZAXkNB5P25ajB8bFAJIv6Qdm6zHYPjWcj38OpFZYOfhShvgOWLDjKX/R2cgQSFgTVif+yqAtb0OYvjRBduDUs4B+i3TP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116276; c=relaxed/simple;
	bh=4Du12IrYdFkkEnXL/yNSCK5B4x+jmIWWPczOqwUqqTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy+xANusLewBWaYrHesfpzgf10REzzA+d/NBeZiFKrXM8kWxeiIe51iV9OYJhYald4Cz2rB65MKTTqNpzZoUQyLFmuDybVJjzy2G8Z29d+QBLuEQNOwZ4bZLAhjGCu6AO1AfX/yvUbh8bQu+JfaMHfZqiWiuUXOPZL6FHoXoTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoS6DCwH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoS6DCwH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1843986f8f.3
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116269; x=1785721069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5WxXKv3tM/juHDs7F+fi+T5krsvThiBbf/3eNS3EFY=;
        b=SoS6DCwHIMFHIqUNY/rtC2KGYrY0UDwuYOGt4ytpKaD5CAeOAu8rC0FprsPNB0Mm6n
         6B5WrzspQvdpSvtn4+W97XHLSPhmMBZYjMi+ntlogmHCllv8PDx7Hs6/700ah4fl7hAU
         ZHTDvq1q0K8BBpnoMLNKv46poZ6MNlC76xolSOOeFCOYZPTYG1eD8JqeneN0u3yPw36n
         zQV0DP3aN1aWOmNZROLJhwAZz8/bNur21ov/9Cpjol47dEmwGd/fT4UmmqOrEPlJtLnq
         7iEi8f+ZJi2DWhxT8dt0mVv2okCst7vQgnYyG5TJA/fL+6pZK2btgeQ2ElZmfgoIO1Rd
         vhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116269; x=1785721069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5WxXKv3tM/juHDs7F+fi+T5krsvThiBbf/3eNS3EFY=;
        b=KxTmN5ott36S9xjvHxo6ofMQ2Wpf0kXIuENowMQi7xsNjTQv+A4Wwmx3k3U/gEJZT1
         VYB2VEquKU3ZoiYUeyTa2BtGQDN8Af9qJ8XDFSXMZGvNabf0phjumz//GrKK3wIEAfDj
         uflg7Iyi998vU6OJcU7aQTPb6etVNRQoNppAO7v2whrUR0eI6+O4uF2ImfAvRjPE7oQI
         4XekjWqGfrIPujwliCcApqveteYeCv3Xv2wpFjxS5Yh0sJdEifgoy4OyC8GWO3+t/SCP
         /Cgm4uTSKZeKWSnuUQJ8uoJEHd0rodOYV0PPoWuHr2Uk27WaFzM9tq7QLymW8Fh2MjF2
         rGnA==
X-Forwarded-Encrypted: i=1; AHgh+RqdMTGB4Mc2DVpLsCli5PFKC8oQX+ERQjDqL1eT5J0gGYaBfg9dZ+rUnOPwvLGGhfzPH/Pi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3OeUbxuAFd7t5PRqG0bOB+4EwRCKmuwnfJMkaQwkuyHsxzvk1
	Kbqfi+HNhdRzi/JtmK6Uh7cSM5X7G73MZBf7lJ29tuVvZOu7CaK9Ehq5WL7QSHxw
X-Gm-Gg: AR+sD12yqJCgR+BBgBOHNmlt3qp2lbooPCZYhDj7BzYWu0UgLda9W/WRn/SjcKx/1ms
	pWyi55pW4QNa8Nwry4dIPLgkegieAUj6757evDiLFqBO+QH/Ayw6eY4D63l55y37Ta34XucCvow
	CN1VEWUQVyEJaKveo0gAJq2omZykoyCk8H0pK3Zq8dMzOcirVw+B0FFhvjvF2N6CkHz0ZAjw/Wp
	iwGHOWGOpm0YcWts2XMKB1Rq7W82dKHHKznYRky8GKtuwEZFVsw3UtQ5E2w0gZCHIEMco2Gadbh
	w6kIaWjaTTNaIPMlpbDZGF3XfkH9hRcZ+ybV0DIxCECmGbhhiVBehJXtF416QCTEdSF0UZdn2uV
	Di6R3sA/WneR5FzyHwUW78hoTKcomD0/rXjIXyC8DtSbsdxEwUwabLdd9AUNu99TqP7VorJa/0L
	BegVxjJe9BR9IYDu9z3Vb4CPDjWDFz7FtKtgc9M6Z/qysZFeDUxtTJzQJv7wJb6TVSTkXLo8fjW
	jhvfKFgEi9sva+SyDstAeZOXLNHw6g61Ij5tygRJl8=
X-Received: by 2002:a05:6000:2512:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-47f9fc8c4dbmr8796069f8f.11.1785116268631;
        Sun, 26 Jul 2026 18:37:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm45492653f8f.11.2026.07.26.18.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:37:48 -0700 (PDT)
Date: Mon, 27 Jul 2026 03:37:16 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
Message-ID: <ama1UiT1Jxy-PvVN@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>

On Wed, Jul 15, 2026 at 10:52:27AM +0100, Kees Cook wrote:
> +			/* Check for EOR/EORS immediate: cccc 0010 0x1n Rn Rd immediate */
> +			if ((instr_prev & 0x0fe00000) == 0x02200000) {
> +				/* Extract EOR immediate value and XOR to reconstruct type */
> +				u32 rotate = (instr_prev >> 8) & 0xf;
> +				u32 imm8 = instr_prev & 0xff;
> +				u32 imm32 = (imm8 >> (rotate * 2)) | (imm8 << (32 - rotate * 2));

With CONFIG_UBSAN_SHIFT=y, I reproduced the following in QEMU with GCC
v14 KCFI and LKDTM CFI_FORWARD_PROTO:

  UBSAN: shift-out-of-bounds in arch/arm/kernel/traps.c:555:48
  shift exponent 32 is too large for 32-bit type 'unsigned int'

Could this use ror32() from <linux/bitops.h> instead?

Thanks,
Karl
