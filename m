Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689925;
	b=Mb2qM1uGLin43yYm4nX57qUxh8qjFgFEHURpGSt7lUUrsgivQM1GHMj6fXGmPCGIf0s1
	 NOB9AxPNSTSn9U1E09yCMjk8khPyR2QhstinECuYO8emb/8fJvmRVgggNdYGmqrUrYc/V
	 TjzPYmg98g1Qyycgd3k2cUAioBCJ4Mc8g20BxS9QqRIzvVP+tfhXvmKde+tw2EE7TrJ+2
	 Sirsi/UywtSlc9xefLA6rd/XrqbKAr/FSCQ/phuhpAX7jv4HMJPJh/3Tg8Fo0rQdz8hcU
	 9obv0Zs7fKTUyGsmYSwaDK47Z6mTFiqnThuC+GWU2O5jnec4Iw1m1o79Kiu5wwxorTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
	b=pIc6g0Dscrbs3SbEd34zvJxUyrFA5Ukzw4S6Z4Vx9GE6EhptrJ5EDNbzXFF8XXKTy2QD
	 2sWURjycZjlyuOURjHx8mtFjyi79mGS0YxTQV0tgVzkZIDS8pDeSL7L3FYE7fa1fOR58b
	 DjQVEGVcv9RriLCSbQTGvAd3nAh66j68TRLVcbM+YSwrRaTQtFdiaRbcNeL2zwX1ylKe6
	 P+46ZGWPnFgy4/JiJp0sdbkC/woHSO9mwDKWd0RQvVjBn0KCNHxRAbo00aa0FVmWST4NU
	 W709hl1+2uUwgyHW+2XX9XK73cpN7EeKxgTeFc0d1uo5Uy5iWwDr4l5iurTbtoG0FNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aYJk+PbJ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFE606A326
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 10:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aYJk+PbJ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so3890652f8f.1
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 02:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795689923; x=1796294723; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
        b=aYJk+PbJ1OKKnWxXDxjhgdg7u9eXR6Ksfz9lYWCeGEl2kgRRphuR0V/F5Z37ARUmcZ
         +N0ckXSdfVw26wdiVEoLEsVyzap3MiROvlxXV6d/T1j4nodLfPI3nwAX9DrqE0IA53ZZ
         tdu5Nry/tY4JMtzxbh2KIwxXt4jer5pG55NkAhX4T6zwZAbQPINF5bF6UZGMs6FnAHXX
         oWT1LGCXeq2NW39kywXrSc5wIhET9gPeD4YfJwXBGemdtkfw3uYlWsxgvDnar3eVxAsy
         S7DkoBg5onsLpV8538Uc9fzvYy4+Vxsn0wZ/VWQxAfQN5Vv04auKIkqRch67jILdJSdk
         ue1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689923; x=1796294723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un6gMhy72C5GdMKpxarLNGYbqAQ9rBfW8csPHV3xsTs=;
        b=J50v5ZAB2j3tih0c7Wne4m7HlESHDnLcB3hp+tybcrmkeW5FicP87kTcy2uwVJt4XQ
         DQAMgmAj2KqzF5Cmkbq9fW9EgBUp9z6MU+4iL5Rm6zJ0v2stSlvwnNhM8kl8wOSckCLf
         w2STBaEliCFBAVIFkw937O+NnC9Teu4DMAoebtqexzWvuEeeqFLsIaT1Dr4mdly6W9/m
         YvVNfMVra/swv06GN5SmNzmptD7FXKA0hv/rFUxjY+p5UkygvMOQvHooPfG5QG+5jLOJ
         h6syVDg0jexAjmwKahG7lOvaXIW2gd/88Fdoo32bjrAAKY9q5FNFqTWIw/Vx+vCav+Hk
         jw0A==
X-Forwarded-Encrypted: i=1; AL+hErHL9d92kgGd/o9FPujHkCeglxowYBcxljZyjD1GRUs7BkYqT0uSL6DXNVnqOguCPgQb28HI@lists.linux.dev
X-Gm-Message-State: APuU4Z9gtR67wDzdKg9KeWY+2y15LUCv6WpCZIgtC5NAxkziblG/tKVq
	yu3w6OYtCnzMxVrnPAoWQSmFOTq2Lf1i6bPWkTbvmygb11HpKiWpZhyBi++gdqMftOw=
X-Gm-Gg: AZFdTZdbz0fIAiE8ogaNnWomY30xm+kSkY5bj6On/fMBVbqn5ZdIyw3RnOFE4nvVqGR
	h7vdVh71ZfkgbIB4GQo8FGqfLWS4np6Da3KpGaUwNHo7xJ98K9aMogIKFkEauTZNe2iV9h0DZ9e
	Q5i7Y4p8jLRVKhfTRnoh6ZjZlmNcirCnIVpaWjvvKhsMW5LqOxHyzmoGtV6h4IjjDs72z57KisZ
	Bk+bnOUIGbEE2kQkkI0egPtAHa1xl5vH7poG1lr9xO4nwSwUv+KZqpf6IdqDqpJX3Fq34HZ7o8T
	2YkG+Tt6aZqMixHwoWpaEUWPsHZjKGLt0GcL63QpdBreQSg9oTPO4Dy0XYH0CMEXLzIQ4/PgA/V
	cFDXDt/S7OGp4n/nqlUPQIhFfP6xkhAdW86q/t6UH7cyK/8hBQv6kuYdtRnKOfxlxjRobFHNVxp
	qPRt2LJStguoTViMO+5tJPs9ilAolU/J+PIvoDsz1DjgvwI1lfVUcI2FvemNZuWAyfaLKNiedja
	gEK6pa/bWPruBRbwywlLdbzHpyRD6xqXLhxCifUVJVtkGMyBB7IeoQ+7i33vGqZh7hiPujavQlT
	x7jboNX6qCGZ3q49PSKnZ3XQ3139wrIU0i72ZSRuKgWpzkOIJwDXCU+15F0TJ/v1xw==
X-Received: by 2002:a05:6000:248a:b0:487:b50:101c with SMTP id ffacd0b85a97d-4abaa97702bmr38359967f8f.5.1795689923186;
        Thu, 26 Nov 2026 02:45:23 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm40416103f8f.53.2026.11.26.02.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:45:22 -0800 (PST)
Message-ID: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
Date: Thu, 26 Nov 2026 11:45:21 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-14-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
> To find a few kernel symbols, users such as libbpf parse all of
> /proc/kallsyms, which is several MB and text based.
> 
> Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
> by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> and optionally in a single module with module_filter, or all modules by
> default. Each call returns one match and its position; pos + 1 continues
> the search, until -ENOENT. The output returns the address, the size, and
> optional name and module buffers. A buffer that is too small gives
> -ENAMETOOLONG and the required size.

The kallsyms data in the kernel can change between two
KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
Should the mechanism provide a way to detect such changes, likely by
tracking and exposing some kind of generation number, or is it
unnecessary?

-- 
Thanks,
Petr
