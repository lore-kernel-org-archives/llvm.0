Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653751;
	b=BsgPHC3Ck34YAPcLfnEAMXCJ1zvx9mqBAPqmdesBlGlwNak5Et3LSOEef/5ytlvb3nUq
	 QX4BZc3Jxj9sC1sVgcSsMizG1Zf8yAyRMX0gy4hqylH7tLswGkZYYWGadZbCNrBPoOZvA
	 FpNMDpPXLYM8hCRiMxf4MvJQLo8FWQV4CXWB5xYe9tGy7QjSM7PJcdBJuFAiLF0dvNo9M
	 vrWwRty4JPIHin+tVAwCpVr4gLX7BCNI4eMTRgBXxtMpeizkpPiqD3A2Lta6cRTKVCwEv
	 DDaOqqu6oe1+zm7yCwzQ5yrkiKtIC432wecN+mSYTLLZhg1TKF8AN76sbzVwZtjwSSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
	b=MHFHmw8IMnM6DekyHK0FopqSWuKrRV3Ad0Gg0dL72a1HUeZW3OgeR35BoBHHxBvyQA88
	 F/daXSoMjeStX9X2bqmH7NrIH4EzXQdGpCHq7CDE0Jn4yAV8YC6yzWWmqhvQtn10eUnKk
	 US1a9FFtcmVmLqIm5lsXAVilP2Yd8jrmcpKQVZBUABITBmdkULnLvgQR16JVVSfn+K/e9
	 LyF1NPV/4Up8dN85a9Np8XrxyZMw73413UQJR0lRlt7dvtk3PmGplQzf7FeTmAmSmg8CV
	 abQ4KjR5bC41hiqXlQ5rJsklD82z6S6dTZk88c9pWe9uk0yMngyv5yPGI4s6EsNoCVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwMMdoWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BA606A329
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwMMdoWY
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5188e17487so104399066b.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653749; cv=none;
        d=google.com; s=arc-20260327;
        b=TjeLdKE3Xwm4MHQerP/GRvj0Pgdmrh0R3sG/jji6Cv+jR34C8bqds52s8PIMJbQfE3
         0ZvJyhaP4KSg8jiNhJRorbdF0uHT7FEBsjReEX7ab9Cv4SoYFkyG4azbl/HkUkHTxBq+
         A8tOfVCrNOKsfe6jr0CgKoIpvJuKEeWVKHpnDSlUmTfD4bwK7PVH84sHAcW12rHy+K1O
         Ben2GAXxezW8DyPNbJiQzBSrNTamkhX2jAjfnVLvq/YEeokIWDOONMW4efvDK0mNQA5q
         hPWjus9ayA5oLu8sEWtb/S2gTNnexQUeF7FQlmb7ME+NyKgWwxYqdrskXC8W0Dk67O6O
         LERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        fh=fjlhN6PBcZj1lSR38TvgEygU5FxgapLUYUG4Etjc+fU=;
        b=QOoDZ4SmH7OQE1EOgCM89JCRSVJZkemSKb6GeCoQb3kKpN03Nlte0mn5YIbFPLZXyN
         oKumNgN6ji11XPWef3lXE68Yt9thead8S/lOg5xfKs+tER7cSNfSpFJ1dcuCS97T8ZqH
         RTVZIkwNo7wrdeiTVbcnUx7cM8GJvzh6jMkzbbs8K85YuVZ9fwou2C7LawJ/5VWYLEuO
         wIdO0ZwBHJK2H5W0Pv05rm5/ynP3+/QRMhXW9oXvSu5I5u3xUao6cqj/0cb1hw1y9+w5
         o91ILcAF5VH5ixFE5l32TLxAKw/AFIPGSpXqR+5rs2KG9SnoQN9OaONm5zvYvOi7KJf+
         IfNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653749; x=1796258549; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=gwMMdoWYf807ypJvPTsVeRIx8825PfU9Y5C4Vf9pWZu2Lut7g3bHL7d8HFS0An8oGA
         dX7YaV3Vxw/8LICCYzoGSEpbFQ7A7kRu+r5XHEXSv6AmKb2hEt+476+j3FHLGioW8tXG
         qB5Z9kGIfTFsFTzxProCawB83gZ+PWoXTVZJYJ0hjZ9YzMCYF5w3jhGbbBxbU8+Mb2pb
         ZEmZPrT44qf6n9plCL8akaY8W0DmIfadZYWiUkbVXKEeQXB0qIwLlgNlyjU9lEBNz/sZ
         3gp7zxWMihlDxRCYAg1pYdTK2eAqYhasn5FAPKw0Re1QUTNZl8zA3fN4MPji4H/izZml
         d9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653749; x=1796258549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=r3xE+prUaMoo9QyOzOBpvmkRnokdASU4AGcr/6xknvEKh03VlD2iDVzGvY3phq8vYr
         McYKGA+T0HCgxw5CdQFv7iYhg0kc5yv9W2cgacYWcruiVnYfHW5JPVLEun6OYPTfnF5M
         czuUnQs8sZdzwilLVjQQLRtuWhSASjrdCoL7fMuigQnjWx3vvjGdOOaH1l0C57t7yBAw
         P++TAxCjz5XwtJhBahxC4PU4bi8FzSJidpxO5X/n03nxzhM579W3cJz8B64x76TSk9mS
         aMvZoXYOttaZGKwEPGeiFh8+6wP2EhNZA9EC3Gx0OdTpwFmp2mT5dWtrnx6bGBNeypDv
         YDrg==
X-Forwarded-Encrypted: i=1; AL+hErFtQYiSV1qNTiyR87IjduBM724Vz5iKq7B7RW12tMwv5qp7Mv+F/vUO4SmepHuo3ZtNTPES@lists.linux.dev
X-Gm-Message-State: APuU4Z832vUzAFQoKgrnKXQyfWomg/y2CMJSP2V6RcRR46Q5hzLbaoCE
	0rdAIwJLvxebe7Udjgvbg75KJKJycf2MnKdNXHelaWxgzh2pwA4wTpNKiRbJrXdxjm86NVUf4mS
	qrITK8l6Q525pEAeArJb/rrd6eqKxa4eaj/eJzYZ1
X-Gm-Gg: AZFdTZflQQAMbR+/eFEJt7hvQ1IT8gYZy77yG76czm+Ef8mkm9ZY3vCqjp3EIFIqIn/
	kxmEIo14dt9timmt9FlYr51ztCY9ZphUofXR/XvJQZ/D1UX82h5CGtOeQRALdmYDDKXmJvWzvfB
	oL4Qm7cNSuuGmJxLj84s2X/UjyXi+2bVnrhlXlnzsXJK9Hulk2yruUOewPMXhM9U8qvHFR7vSEB
	3ERe1nXtbbeRS7FfRGsCtwAJ81wEc2id+W787KRRL0hgVlJXTh8ZDZlN+ZQW/sI5Qu3KwBXqX42
	JPpcxP8OnyEKDKLPSNwzrTQ3seXKftNxvCFksJc6U1r+2M3N5XtZ03qSHDznZTS0GF3Dcm1WBRy
	7szxGWk5JobtliDzJ0NlNqurrXY91OIk0v8rTt3y55D2Vyh7fVwBi/v6LLQLLXekfVgzutnAys/
	xhcTVFhz7+UYKf
X-Received: by 2002:a17:907:da1:b0:c50:5275:fb97 with SMTP id
 a640c23a62f3a-c513acb5e2emr1626085466b.47.1795653748662; Wed, 25 Nov 2026
 16:42:28 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com> <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:42:17 -0800
X-Gm-Features: Aa3M54rYVczs2SqMo55_UQYl-QiaJqAFTx0CS_STMdfssfUbqw_TSopd5IfB7RE
Message-ID: <CAG2KctrMMo0j9Mnbg8fdNsSc-eQaaaW51dO4mqwVNn3hfSdx_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +                           const struct kallsyms_name_query *q,
> > +                           unsigned long *value, char *name,
> > +                           char *module_name)
>
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().
>
> I suggest calling it module_kallsyms_query_name() to match the
> kallsyms_name_query parameter and to express that this is a structured
> query, as opposed to a simple by-name lookup. It might be a good idea to
> similarly stick to "query" instead of "find" in kernel/kallsyms.c.
>
> Otherwise, this looks ok to me from the modules perspective. Feel free
> to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> --
> Thanks,
> Petr

Sounds good, will apply s/find/query/ in v4. Thanks for the review Petr!
