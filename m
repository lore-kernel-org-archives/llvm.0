Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540355;
	b=k6kZb9qwPruFN7CEHzfxjl7RglIy+dGYAIM3aGmrvxwjPIm+po7Iu+7BuIPVlnswDl6A
	 hdo6tWsrsa9d9rKKE8iF6rplK35aIZsVB3Qgg8hzAVi4BhLmUXKZ9nUJnY/qDnRV7tJs/
	 cn6Ca0m7zHeep+ihcaJ5t5tsHNGTrR+DCuAYzDNcAoPM/t/ZVniR5vKrJXbra5yUl3lpB
	 gBNxojazf8+xRRWrqoMmJd/Vy1Gs8xB3b1+2KYAVl3ue/k3FVJUPccoeOdOu97s9UuOMb
	 uxZiTmAb9hr44YJlKLT0R7HKFHL7JGlq3dOFsVdE7wAow2r3XY9WgN8Jhv+B40aShNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
	b=ccQVK4OQCFdagyRf1Ax0jjukDtzuF3OwB4BRmS20KrZuLzqo7tAOnpXxLSXU2a+kh99C
	 H6M6aMf6Yg0BINdCWJa2ijsGGCi1A/Pyh27w1/IosuXqEnlEr96Ae93m30vp50qAEfEBZ
	 QoJ7dUmsaGMbZMgI4+eZ92lI1DM0PRD/d9xqvfNRfGRUENTPyZkyRb3eBvMo31o8pYcIT
	 Ia7zN+P2ODNaY0ySWNh3RzF34sNUf7Fq0NPYP0OtVPGItnGbzNGw6ToeGhEfz1FoullFo
	 GHcYj81jWFI/YWn0hwKo6bL71Lx+O5eplJdsqKEidBbc01iV6Bu59OBfIWpyFRXPpog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIBQAmHO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01552606A31C
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 03:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01552606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIBQAmHO
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67bef25eb92so651869d50.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 19:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540354; cv=none;
        d=google.com; s=arc-20260327;
        b=s5PC/j1zmnF4GHizqmZW1d07ccJLNNlx6Tip/BxM2IwUpu02QBmlIbhxcQ1yz54T0q
         7zTwgXLgjUZJRQOGD+R7J9jll/MzvKXCZY9woMOGuHd6x51a20daJIeAEi15ntNPXwpB
         rxtNDFnIkMBxex3Ip22Qa1Zn9gC4MsWFDROj10zZfBxubcDNFdb2S7BMxSWNwdS1jvP2
         F8qPhcB9gh4zYDLvhW6e6y+JzWyA0ScOFA9oqRzhMZiL/BPVFR3G98geVD8ftyKy9guE
         /OE+lbNT6mrjZ/SAUAkEEBpQ8aS9szi7zXjhdGMRpiHpNW9ri6wqRUYb/zm0fJjQbDeR
         qP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        fh=wPyQ9d0Gkyg1En9MY5JDcmfR58fxGJHjAGWNgWQ54Ck=;
        b=lIvTgTm4XJhBcZzVrBW+BbsCcJifPbGDgT0KZ6M1tMymd/e3YYMbBvXK71/5dIewjP
         yBji7QRdxBkHcrBvF2PCXK32uA/gNXjgsJ/cDymNQAk0WqVGR5Ib8C0X8EkQlJh9otzK
         6qbRsyEqdwsBfUkkKPyjMeD/WQCVT0jFmYJgnSXSQRp8md/yjEc00vde0xf9Il7aSF14
         o87ER1Hd8bEFE35Wl30q9tTFbxgdRzaZYG2qPxwYOH0HU7bZaLeT3VTXf4JlnmtzI5/K
         9G/TRXmNwW7sqBM39VR2uTjmPBYBD1gN1/n+qqsVyGRdYu7wvWuU74PL8gesv4IVR2dQ
         TMxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540354; x=1795145154; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        b=DIBQAmHOyDKpdSl4m7RX1MgzhHRFPJMYhZy6c2ftUv3ObuMOvoWnFuVmUMWU3On2xr
         tYoXQMHrQWVx1ZdjIa04iLI//cnjhDTIC99ikHSIoGjxDgPbrLgjEwsWWbCCae6/FVzP
         xpXtgl3/Wo5cfFEo9Y0t4QxhF35fjsleL8NvrxGUlV5PgwBg+bKYeI7/EnVbUKEDLfPP
         2syRiEwR4NFvFoMSWC/AzXmS0bt3NuburjAcAU7Cr2/LKWAt58PT4cNsbnDlonlFzzar
         WDKdbO764pEWVnFY4FXCvfyEB7cpnuwfMjnhi02jP0/fCM6hiVInYfeq5ObQVBmuZLVw
         e8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540354; x=1795145154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        b=2bAlPCqkyJE/rClylYxBJ+un1lSwOBxIgd2wogCykHHnPzyMfa7fwsSV5hAaN4cw7w
         zQqYoFfWsUE2ZJTo5MdMkccSn3ToxeWJaoyxm+2cxx4FZX5trxRiamZOx5lI4D6Kmeez
         X4wyWWlTGCRLL1IhCSdXZsBY9G40Kpxtt8o5XVQC04kl07VzyALziPtBnvVnREnOhG7c
         JS2ZGQrBXeyjg7DrbMvgaCDpou++SqrykS5HV9EH3lzzK7bwRvLTYGSx9pGU5uMXzUj7
         uTjpRJAeyZ1TvxTOh7C3ti96XRjBtXwrgc1vGfEc8K5M4AzKuph5JLf7vboiQl2cQhEp
         4vLA==
X-Forwarded-Encrypted: i=1; AL+hErEYefU9yjpsxIGxEYpjzvgvj4tGFbL2XS/v8TprS5R4wZEzEVJf7a8HIhO8StAMlZjXsHGO@lists.linux.dev
X-Gm-Message-State: APuU4Z+mlvqkbRqTlSJSI0ghfotXPOsiqsylhGm8Z/8IROisNkTtX7Y4
	OlL0BBkIM459gvF4e5t4S8eoRDNSYtr2SoiWkUE8pVuD9zo9vM6IFypmTxpNQXHs6PmND4zPahj
	bfhg6gFrOPGCGHNFTeK9j99zeDTvqUf4=
X-Gm-Gg: AYBFou1acwAKJyBl/OW1Q/HvpB/3J69wYr4+dpbhaV84sc7U4Ql2EEn5JeT9jCgg1Ia
	zbg8Xu4ziTe9dd7fpavTUwZqg7ND54aqulqFyo5Z6Xm+gSP9/HEKJd6T4cbUsN2TPktE6p4J17l
	dFikR8SrXNGRxJfibO61gfFTo5QArlMfqwV+ZnUmA9OyQWcPUGCOrVkDT6JIPGXRf04+k3AGg5z
	J4YygXaZTo8J+gcAvl/ITm4f+Jr2cF428rKuAA6vI3NC/l4UvEYbg9WYXEzKRBJ3Xw3XkMVUVRD
	KkcxRjnGJzBHYEkBzAp294faAhh4/BeKyrb0nGSbDR979H4+HRFNw4/jeRQqiKwIPJiIuSs9fkH
	4DmtbUoi//gGbaAfKz9qA2Pb0YAgUyBA0e4k1izM0iNAOvgezgoRnLYDHjdU=
X-Received: by 2002:a05:690e:1697:b0:67a:6b2b:b851 with SMTP id
 956f58d0204a3-67c7907e144mr2968859d50.40.1794540354022; Thu, 12 Nov 2026
 19:25:54 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com> <avZ20mdxRnzTPY4c@jpoimboe>
In-Reply-To: <avZ20mdxRnzTPY4c@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 11:25:42 +0800
X-Gm-Features: AclHuK__CJ53_9mRKoHEMyp5nR9AtpphyE9a9Wbd0i2YCf9S8k8HQ6zn3MAuAnQ
Message-ID: <CAKL4jwXwgsjrA2d64bh1iUD6nZAwy5NoCyL2i+EEmBB=dKu2jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Understood, I'll follow up inline on those threads directly.

I sent v2 out as a new series mainly because it covers the next layer of
the design: v1 introduced the (source, scope, name) identity, and v2
builds on that to do the actual symbol matching using checksums and
reference context.

Longjun
