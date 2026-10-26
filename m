Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006906;
	b=36ldLiXD/bidvGTY4HDzbrF8SMaB6qnc6MHQV0lz2fB6/5xAkQbL6XXcK4qoI4kQp/65
	 fMXdvcS3qftKvTHxBWPgdU6QirI7HhsdjHR6giEzLlA5A1b60kylWCLOOcI74MQLS5fcJ
	 EWm4jjABcMiU744y+SfucbhJc36ihckxsuU6Ao1xUoNS+zlImzwVOp5PZYAnYtHPMPF/P
	 eE7IpsorntVjV19EXd3h8pKujZr5UdgH6UVd7A6pbLI9ngYDAmKxYr2jBzh5BZn4gRhYJ
	 wF+STKuMd20UFejlLUslHnpN9xeBlMMq5GsPZEA/nbCNjrWu4bfwVgZaAUUnE7aIX6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
	b=e1HIacCSMoOLHJRWbViVVU06rQES34n26wU1o4N+d+abE0wC+Ixivn0luU0VXm9kaxb8
	 ipI8Tl+ECiZhCosByzWE/VN2L9iE+zTRvKuaxKDqMKdwwv/Xt+gyyvidT5BLg0nZtJTXN
	 +pVftHBp7oiXSUL2XLdlRBHVlgJ3aJiN/2PdfjyHJM8ngdAuWz7YLhk63kyD/oUImFBc3
	 UjHPgB2w1827saX+9xM8ycdDs1kBciXHwXrsLLT+9OMnoRUeXOaNePNL+36xcRDaYaRLl
	 BWS+k88UYqc83fo3U1N6FqJMQDsFMTsDb9+jWjLK/7du/dWt22B9M7HruKdMJRnsV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTWyYNZ5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20375606A327
	for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 09:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20375606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTWyYNZ5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4529915e9.0
        for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006903; x=1793611703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=HTWyYNZ5ugarr6Js6kFahl0p2/ohRp7MBOOCQlKqerq7h79YAl2yvOGbwFIOmiO+Hy
         CYS5HcTxI4k/Wynuq45BbJK6EBBFHr+JP1OVOua05LnMCrsFx2vMrZ89SZ1PqReyFQL2
         W4nSzuKwDq7rEtzobYVNwL/g3bu7w6KNaP6FUKNBUN06qs9okTFp4n+5QMlqx4qqSN5V
         vQEfcqZaqobeu3WSM26dIDCfNZ9DaJh7C0yg6Kr9AXHM5BAzHxAGKItKFSixty6RWUbu
         8UwDef+M5mt2GMwq3BiMh2yZGd1aBp8ptTxV/SXvWFf59uz2sFT4Lly0Gqg3O56rmSDB
         vakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006903; x=1793611703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=C7TxUCrxJnvjnHkpOBz6jS4fmXS8iRdbF4lb8NynrNQzgQAL7CBPvgovrAObgD8rEH
         ilsPGEFemvmsSclwl79QVydML4rm+92jv1mvnIogEo3yYWjmFZF73sPolkoatwbjSLLc
         J9p6jUn3RMpJAxMPPA7E0KzAdQTKmor3OBRxh+YY/eJ2oX0KBAbBVnEbjHrHamIYmarx
         Qbg8IV9TLLtRxmWd6WsXs/Cu9wS/G3jC456+3tmGckV8419fBm6rtj+ZEU3l8hLSY7bo
         cIdKrQ5LgFkd+sxdUDKHhUHSqSglas1nUnVTf3dPgG4hOJrfW8GHFLgCrCDZS57Ssc/h
         5I7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw18LDzpclJ/I7+W6rFXlS7LrTat7+5qPslKzlSP+in/AaU59Lz5CGN854I+KOlGxTVOgrO@lists.linux.dev
X-Gm-Message-State: AFq9FYJKBLmRTZoOsFZNNECucKcnBpxUP1hqxN/mCqhN4YNAJ0+hPxo7
	7Zrt4liNRzmCFVbsXdTRA+BTwaPzUcUVZpZ+afS5TfuZZH6b2om/QSPL
X-Gm-Gg: AYBFou1IQzWiOAkjRiwRfW2aJaRZ0lyfToBoxzBL738+eOkoYWaIuocCPgJfKLNxuoQ
	XF4dNUejPv+l0TYlNp8ioOiAD+3ZzKJJ45ghFaiIM2KZjsow8twmXPOiqzg4zJK3eGkocwVozuq
	spg7VwJy1ciB3vGPUtu0ujWxOXh6NoyWQbQZchR4+U7xUnNLBTYA/hLaBbQh4F6osIzlQt5HcaV
	T++YpuvN5lImUdvoJv+j7ZD65dg8v0kMoTi+UCgxwYfNg7P+6HYq4wslBV94ROzpXg3s+YM4VNb
	ImuwFHoaAddVqX4hj/aIfyxAMLMl/TSJrvuC8M5zMGYqAzwZsKmlLmoKXM5Jt/0EEbkSROjozwD
	a6eWtzc4hsTa3Xuy02VvuY+00Oe2Sbo/mIoF/3IlMG8z0ZLgfBF3cFQfV+QR13J+hZk4sNqvjLc
	TFTD7leBikhaipuSMtJONS5dsqyeP/UNVe8nMvF8JcnnaRJloQjIL6Vw1tvv5KJ136E3gpq5uVc
	PqVPiLm5XAdLLFQCppso6jM8+67
X-Received: by 2002:a05:600c:3553:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a35aead203mr116295105e9.16.1793006903112;
        Mon, 26 Oct 2026 02:28:23 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm215058535e9.1.2026.10.26.02.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:22 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 26 Oct 2026 10:28:20 +0100
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <at8dNNb4vwovNZcZ@krava>
References: <20261023001603.560210-8-wusamuel@google.com>
 <20261023001603.560210-12-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023001603.560210-12-wusamuel@google.com>

On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:

SNIP

> +static int bpf_object__query_ksyms(struct bpf_object *obj)
> +{
> +	struct kallsyms_query q;
> +	struct extern_desc *ext;
> +	int err = 0;
> +	int fd;
> +	int i;
> +
> +	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	for (i = 0; i < obj->nr_extern; i++) {
> +		ext = &obj->externs[i];
> +		if (ext->type != EXT_KSYM || ext->ksym.type_id)
> +			continue;
> +
> +		q = (struct kallsyms_query){
> +			.size = sizeof(q),
> +			.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
> +			.sym_name_addr = ptr_to_u64(ext->name),
> +		};
> +
> +			err = -errno;
> +			if (err == -ENOENT) {
> +				err = 0;
> +				continue;
> +			}
> +			if (err == -EADDRNOTAVAIL)
> +				pr_warn("extern (ksym) '%s': resolution is ambiguous\n",
> +					ext->name);
> +			break;
> +		}
> +		ext->is_set = true;
> +		ext->ksym.addr = q.sym_addr;
> +		pr_debug("extern (ksym) '%s': resolved in kernel to 0x%llx\n",
> +			 ext->name, ext->ksym.addr);
> +	}
> +	close(fd);
> +	return err;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +	int err;
> +
> +	err = bpf_object__query_ksyms(obj);

hi,
we could also add similar support for libbpf_available_kallsyms_parse and
probably in some other places like bpf_get_ksyms.. which makes me think it
could be useful to have KALLSYMS_QUERY support for multiple symbols

thanks,
jirka


> +	/*
> +	 * Fall back to parsing /proc/kallsyms only if the ioctl is not
> +	 * accessible: not present (-ENOTTY on older kernels) or kallsyms
> +	 * addresses hidden from this opener (-EPERM, e.g. kptr_restrict).
> +	 */
> +	if (err != -ENOTTY && err != -EPERM)
> +		return err;
> +
> +	pr_debug("KALLSYMS_QUERY unavailable (%s), falling back to /proc/kallsyms\n",
> +		 errstr(err));
>  	return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>  
> @@ -9922,7 +9996,7 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
>  			return -EINVAL;
>  	}
>  	if (need_kallsyms) {
> -		err = bpf_object__read_kallsyms_file(obj);
> +		err = bpf_object__resolve_typeless_ksyms(obj);
>  		if (err)
>  			return -EINVAL;
>  	}
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 
