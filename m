Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793136731;
	b=VWa+YDv7pLh6T1N5t+gZXBjUtvKlmjY0OY86DQMerLKSQrG+kRo/lg4fWU65QgSmsjk2
	 zAppRUiAVmoixeKmfwgOC53meyaH7cNn7v8XYCDEgVGBobTu9FKhH9ghILlohVxfwocQZ
	 8kHoOeab9oUrNjXULMAO9DSxGyP0zPvpDHqeSlY6C0dsv5pfVFOcgu5B0m6suFJMUH0yH
	 UYS5YdAurAQESbrGQTkZnVEs/vXnFpCN7MP3/65KyVOdebEQQRgnPDjCdis9WKhyMXoaK
	 oCbvOeixXEjspNZqN5Ecgo+7wcRU6PoDYpTt+ABrRKhD6EwX17cEc/raRjta/adMkbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
	b=hu9nAefphFki4m0xb+82QDZl+Y9j4FBN4V93bHvNRPNaOj/1sqIOeuUW3pEl//OMJHhn
	 H9llhDbdqIfJthNOc4EPdu12BwUBjpqBJiXQLfGoNx30AKuKC08nf35+UI9+xDyjvxQTq
	 ij9WISEbIWH2csi5W9rAvvF7cYuvPXdfQNUfFTtOI8Kh5oDyw70IhghVv7kav7sQXHR06
	 WdbJ1PPaNZVBy0RA8gOIHBWOt9zBhFnDbf/xYv8wTKmP+KacZ9F5v0PLOUgHazp+DSjU3
	 DVOYkaGlJ8RgwXEzU91EdT/6mFwdE621QOWWrHL6wFdZAq5GQ5Yzd2E8g4h7zSg2X1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZxeVQAgJ;
	arc=fail smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFB606A325
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EFB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZxeVQAgJ
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4682977f9aso34442766b.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136730; cv=none;
        d=google.com; s=arc-20260327;
        b=glpBYipZv3VfOX7rbnLhj35v2Lc1Kxy9Alp3+WqksvRhZ0WVXzmIKiewgdb0qSyLnn
         Uo1VsfWiKPKeGYIn5Av30YRkY3Rv3vEPb5I5fsS+PR9SIiC5Bz1BmcpQfHySblSek0pD
         Pl9H8Itri2CBVq/tECSObRGgq5l9JIZ51iSYYUsvnoEZ/1NrR8r62XVZBCftsdhubYg7
         BX6TKphQNMh8VqnWaOerIK/5WTon8pRfiof5ssk9eBA65jTDcfKonT/w7grkB+vys372
         YpIYKvTp9N6YzAxn5Grv+G16dMzSawsUC15lej6178cfMNl/UhJEPYJUGhfjElXzTILJ
         Sz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        fh=1vLr+JnTaCwAp86cRrNQq0T83xDKM5N6oNDfq1WPh9E=;
        b=qBLQEOEPpqOJKVVHcTqUFS4foGC43raZgtnfKPNpy/+Lk3tEPv6QYqd2yVKbMWcLLw
         g+UM9msrwDV6s/E5FEioqYAiKkYIJXw+HsdJueV7sS4eoLlMk+CrbLo5kjvEVHcmJNB/
         rdVpzbICe7u99T1IY93xLBQMyQ6fsURRLD4WgD4USnGID+WI4yTFj5BqoOt+2a0dnbiN
         /PpDX65tral6RN0eWbnBrK9fm/k3X40IpMf5XoIuyvSy+xMDDu07uT2iqfI0eWwuZaVx
         4hceFXZilrjhF18/+OhSvIh8nF6131lWi0S1Ntnec4rux42TnCNIUFYAU5noinEVNUo3
         1/eQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136730; x=1793741530; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=ZxeVQAgJ66HrM3ReOJItvqqzDEvlnK3O3O56VlGX4EgAemnK/VYPkvDZckN0+3BQpE
         yqaeKQU6E/+p+4ieXMmyhPGAcb2FKeloM9V4XJKQrdN3QtbzY/ejquMUwaUpPDenuNbq
         9RowG/Q6gMXImkJtC+lUqya3Kw86FmU27SIHPlnAdtrXMjlpfJCvSlemoCoe1F+44y2x
         8wxZXoHAz7xB9MaUWTJyqdfx5PPTjPhoYnBXE60qwnSH8HzDPEO7SSlJgNLQwl0IVpxH
         NEYHlsZvNm1oc0v3a0sonriPHC3yPsq8WKKC+ijcWfn+4Hgu8DpO6lr8C1tKzw9eeTM6
         1PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136730; x=1793741530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=draqW0RrHtIR+vmcftTeOz7k4p+/dwZryR8O3cgVxg+46W1LGgkbJEGihBvPW6Dmxu
         sAw2OazkfCoE/M1HfBwrnTwY2/ysmHEpEcQRl2FOvhIMQGJMjd0XfJ1M17+RXK4TCrBi
         J3OuYy6g31P128o6a+wVHkD1UBo8H1s/I4MKWnuqrgEFCSGTFPb4Di3rOVzohI9TFdoQ
         EQ4zGEQXOKKCeUwV5CIxkbPfwDRuPVEIvYGZVS+b+TLTfQniMeFcR82pGt47ZytKWrwB
         JMVNdXkILg1bJwqgRwC1Aolo0H69htjppBeh8XCKs0FqppnbuSAkxaxFdBT90CGMckBE
         vchg==
X-Forwarded-Encrypted: i=1; AKwUvBwMmM/rzWDRyJ6LqiS21uW0YmYIf9nUjTqmF6rp/1bxbHo0SdlTJwo/hhrtHHokby8zJKYv@lists.linux.dev
X-Gm-Message-State: AFq9FYKff8iP5236fFBRvOAi4fAi311PjIisIwaagif+GCGMcq5L9D8W
	p7n70SZkohSS9FcvbTdOMBZpuG/tmgBybvdMOHnlJPxmims3lxxylkYIT4LC7qP/LT4wP4/7ZWl
	botaZZhj30cFo0iBmwba1jLHNZI0eqvvtRaChJUn8
X-Gm-Gg: AYBFou0qzLil3k6jqmQ5oXGFpFny9dPtL5Wm29E5Rn56Ulo7oNffp4gHQaJe/P/x9+G
	sW8zWxojybV4yEQ2YQd+IIBm5r+kvDX++xZ09bJucw044lyiY6LyMZ5FogwT1C/E7DeAgTfP9J0
	gppX/n/Ir8gd8oB+HtLRkMmQuduw5AS71mpZ78SyZBkePBSUg2tQb/k5bW82AbbS3ao5WJidaIQ
	VYSsilAj4ihPKLAttvoygzIjkyI4ALLf7mOKARkewRTj6uv04Q3OcD2fumj6ACli5uAgniXeP9m
	8jzphf4nc+zA3BbrAmFvqa6oLMP/chZyn/+eRGN03nYhmpwBlPTUBqleSw563hbLmRhetw2e058
	vEkl/zaENNHCZOAymfcmvjbNvacNXRaOhWjwJAAXbyDSyA/H9J9jyLqH9mJleEEFSzDnFxixgwz
	ZhVsAEURdoE1xo
X-Received: by 2002:a17:907:868c:b0:c46:bbde:734b with SMTP id
 a640c23a62f3a-c49bdf39dc0mr39237466b.32.1793136729307; Tue, 27 Oct 2026
 14:32:09 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-9-wusamuel@google.com> <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
In-Reply-To: <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:31:57 -0700
X-Gm-Features: AclHuK_3f2GFNzZ4NDx25anrHi3Bvdsj3Ks-ELoCN4hDAJz29yzPop2fh0fcApc
Message-ID: <CAG2Kctryf8+44WKQzUOzyMmtL4biW3Pbg3Pntzkn3Ot49RhFow@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> [ ... ]
>
> Should the BY_ADDR path return -ENOENT when kallsyms_lookup() resolves to=
 a
> BPF address (for example, is_bpf_text_address(addr) is true and the addre=
ss
> is not in vmlinux or a module) unless bpf_jit_kallsyms_enabled() is true?
>

Thanks for the catch. In v3, I'll update BY_ADDR to gate on
bpf_jit_kallsyms_enabled() so hidden BPF JIT symbols return -ENOENT.
