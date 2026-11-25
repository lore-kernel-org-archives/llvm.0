Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641932;
	b=i4NinhIUjwHxNKbC2Yrv4oJA8iCweEjjqYTJuGdlZJydd5cmAP0J41H4Z5M2rKxlAc8R
	 Yt2+uvbAcK/TKYX/pifsPN+n5aH0Jk2qyzdILJaKdwQl6Gz+i0kZM3mz47NQ8xI+UvaI3
	 9fVwZJ8blsjm+4ZOEMGc+hczDg/CVCQa79L1/sXt5rg4fyrCtldgQCagQCn0dRVIb5KLM
	 Z7XcKPhPdctxzv5rohd8JeDPZgPBpBR9i8wFXSIsO9tlagHYTNp1VOzIX34DtZuXwEPWy
	 T19ja3q2HSxA3MP6AR/+3EgbMtPiYOOxy+3xDZheGItVYzNrtC9r1BICd6xsQYaUw0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
	b=b5a2oPV3AW+KWDitT4PPixQIvsNt44ys2t6I28b2I5w8GETnZfKWX1bs2yE+2j4WFBiF
	 uYUjJruUe+DNP+Uvp5RlJNubblrE8RlFbWgfl6vRYVvEoYyhcqcZNEv7RUhAZ1Eigc09y
	 +DpcPmBkzZYEQ9P6rqlBupPNdcwzjiw1b9G9xX2PBWCrmH5SSfV4vP18HGMJ/t7d1fjb8
	 RODvvrfcVsql9fkUPITfZeheKBt4ko3SRY8h64D8/h0i2fgAeVTjWV4mtl+W2cgqqGLM/
	 mRGZ+Vq1cZjCbdLRSJfM1LF6LYmp6h2YWamhTW1VkeBRTLC2QGkMKWGDFruj4cNa6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSICuufZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB54606A32A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB54606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSICuufZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so10453005e9.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795641930; x=1796246730; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
        b=iSICuufZb/ZNpTUd2iVorkIL4hxRkwoQV816NkheEr+OMqREBchwFC9IuUfb4S9bnL
         xHMZYlDRGatjJ5NOzZjv9/sB8jPhY9cIchuevvsDNXwZ4gHV7DZgiCwxRhdjIYW9Vwma
         Slx8wBl0J3vc/HJBHvVlkGuf1OYuSxKQMlXj/XXbUHWqGpng0DVWVKfEAW5r+P9KD1ZA
         9XP0LJWE9t8Vc6s5fnt+7K7uQ3oI8jic4ClffvMouhf/b5xjkK0C84pngYE2CU1qLBZU
         FLObBDBUVX8sQstJ3vBt3v+ZqwV/C8G5nblLS1KsIUO4UXILqQJLKNiEvQPa6trvApCu
         vI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641930; x=1796246730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24/tAy177JKP0owGUloJsJ9O1cxGKyGsp+3cRmkz8Hw=;
        b=mo38FJx5H2vlvw/pVQwh9rpQO4RMzshBFVgpULEIk7k1DaYUp8W0BcgpQGYyqIJ3u9
         nZLXS/NsGnNoEZ5NYo0tPaM5XHYBPQX9/8t6j8jG5VzKRD/9b46VCiZ3ZazMdLNtqBTU
         xxFBA/b9/7q1FXecwD3tgqs3KeNH9Atd5RKujN1tL4rlLQTvlts9QD74GjV7fv3ZsLbv
         laLk5xlsF8fPc0HJWO90OsubZvfqhbHCG1aAUFoG8j8dAr/Nvak2Crcd+qPT1s8ZyDoI
         KBgrjX7l3BOQOpK4aj/6Z6rOcHeQuxtZk9WaJJPKtyCj/MqYIledHP8Lb93rhypkviPF
         fnAA==
X-Forwarded-Encrypted: i=1; AL+hErHHa0NTuj7N2aZt4IhdhHalTMqq1xqNAta0xqZYyJrwK8tC7w2zpian3egIyXk/w+7qgZ+K@lists.linux.dev
X-Gm-Message-State: APuU4Z+U+hr0WRwJkIgiPBSxMd2wbk3tXxlVDQG8MFU4HhPIp1DEIVPh
	gLfE2p+v7dkRrshWBjHATTfXgf+LoDDam2XUk+9voNIuOXe2433+sCbB
X-Gm-Gg: AZFdTZdhTwEdKtl4/3AYR3egzADJ9Q8aqBqFpKvlcXrXnJxAGzf4m/4QAEhNA48N9rv
	hxPwAVtoaRlPLWj7Z2d5C/UIxXn+54U4aL6Khkypk6LEROkGJ5ae0p+z3m6CUHgyOyU06VbgDiE
	n2sXUC1EV/UVJPF+5l4D7643iPch5jpoyfBjYis5h9kn6i7/GXie3ZaRIGS+3lq3Df8hImPHgV0
	D7SQBV/USMDvHaOsX3oq1IemhJlWRCkc2BBYFOrXyI2+O6JZId0z16JHNpOWiFkaHfn6Qt9KNWY
	O6rPy5VoxdNMLVe/XZOmKNW8/p1uXAK6rg9Jx+nCpvZagzD2QPXHFa8TIY4s8MwKXoorqRj9+dO
	f7zLEmsR4idsNm7aUEq536ZCJI/gwC+sOKGqmSESEY1ImIIdrzA6ERS1DQk4SFyLAj9fC3jiE4V
	RtCBlBufq5VqzIg5pKU/fQSglIYRuZntAFKNOlqFBvOkwm/HjkgnpQ8FNbGL7Qrw2B1pkYqxQ/e
	OTK115g8DY2PHBfTxk6874jR+6qJtKgwF2koZ8eNFg6JSmpvlUugQvQlOa0Lj8+nDk924IW52Mi
	yRHN5GIJw3a3O7JGzbUkquTsXSoL8xATZzVEGtU06DEQH+w/A7CX0IDcPkhJNEPmoA==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr380720815e9.31.1795641929874;
        Wed, 25 Nov 2026 13:25:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm615777065e9.14.2026.11.25.13.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:25:29 -0800 (PST)
Date: Wed, 25 Nov 2026 21:25:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin
 <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
Message-ID: <20261125212528.239ab6bf@pumpkin>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261113221248.3535369-13-wusamuel@google.com>
	<0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
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

On Wed, 25 Nov 2026 17:45:36 +0100
Petr Pavlu <petr.pavlu@suse.com> wrote:

> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> > symbol name or prefix across module symbols in one pass.
> > module_get_kallsym() walks the module list from the head and runs an
> > export bsearch() for every symbol index.
> > 
> > Add module_kallsyms_find_name(), and put the shared query struct in
> > linux/kallsyms.h, so we have a more efficient linear walk.
> > 
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> > [...]
> > diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> > index 1ff8ce857d92..72006c9bad42 100644
> > --- a/kernel/module/kallsyms.c
> > +++ b/kernel/module/kallsyms.c
> > @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
> >  	return -ERANGE;
> >  }
> >  
> > +/**
> > + * module_kallsyms_find_name - Find a module symbol by name or prefix
> > + * @symnum: in: index to start at; out: index of the match. The index
> > + *          counts the symbols of the searched modules in list order.
> > + * @q: name query; if @q->modname is set, only that module is searched
> > + * @value: set to the symbol address
> > + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> > + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> > + *
> > + * Undefined (SHN_UNDEF) symbols are skipped.
> > + *
> > + * Return: 0 on a match, or -ENOENT.
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +			      const struct kallsyms_name_query *q,
> > +			      unsigned long *value, char *name,
> > +			      char *module_name)  
> 
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().

I've thought of splitting the file in two.
Separating the core symbol table functions from the /proc/kallsyms code.
Might help here as well.
The cut goes just above the extra structure the /proc code uses.
Three functions have to be made non-static, none are that internal.

David

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

