Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811311;
	b=PqOlkeAXuj9XaMyQXE2MCN7DTSpE8MKeF33KbFPUzPYZkbb2Q6rJKpzBW3t2a4+PxgdT
	 zQ9AzGHMvw5WupSXXFBBzPiPH9prqY6Fbie0xyQ6d5YgUseXIvbgDaxKU6537qA+H/FuX
	 Cyuzmo5lg8X2mWcKxLocM+fZLYcHeKgkADpwL3qRnVZHhaMZegUrrJG7MTcNjPq2xYCOp
	 Dn1eciTIdqnuV54hcgslC3FkAF6tVaBjX/zscyl53BcFXZXGBcmC5m/+0OlT5+p1EY+sN
	 OMIS04LHvckH8msFo0kzhxlGJpegHnG0UpoRroNRdhz9ggCd434V8slP7CF8arUwTWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
	b=0ZswCHp93J2lLO4L2BQyeQ5b64VdPI0VJivsG3PM3GK9O4uLWQwpwpdcDZgVYCL3Mr4e
	 DVY3CRzMT8iJ6nOqmcUdR3WL1Xnu0dvATXdyA1AfEQiAjBZNTtE9Mg5TqUtCwmSVcwZxI
	 unPr7J2B4+EMUdUycd8l1Yk/JWFKNax/4df8H2qDjZTovOi4b4yx8WjbEksVdPOS4PHWw
	 bMUFO1VHFyyRZTxUNL974cjApLmZ9oU3FkzjidkBNapYRL0XX3ey92YH/ruUp9cUzv8Fu
	 YF1UIGFwxiy/kk5Ee6ucSmWa7j4IpymvSHxqERqmDbR6cLBNN8kJNw+dmihUBtNO8kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QW45kJ3J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7314606A326
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 16:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7314606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QW45kJ3J
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8952665e9.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 08:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793811309; cv=none;
        d=google.com; s=arc-20260327;
        b=FTIe7aMx/F2bsVjREVG5YFtimQes3TE2S9IYNOInUsI7/z8u+QqAqCyvvsJE6k7yYv
         nAo8LmRMoGZ84JVpybZwk2wmCVobszcX1X6Qiu88PU8w8qqCqf1lb6Kcu/XAo71iHxm2
         5tZ2mtfhBgCSHcFR85cEaSsrjiyMNCHshwofiMq1lMAsoADL79Q3cgiSMAS4WGzkoLjj
         bn6/69kKziKv/jGCZ8GI6SV+8E0/fH/FMB0jKAvKA6aZXOiIWzebRnMx79REzon8SVkp
         cLlUhs5WJifQCMBAhGgCkX+0wxii1YGgdvHxpUQlWvrtBKjqKvWL+4m/IEdYMS7QWGsu
         GyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        fh=EHT0p/xIA/1bb38LpdIbI0Y7qsPKuavQGN3+40lVvuE=;
        b=Ut0/hx2mbVKkBU4IrXt7KqUEllK+N1ie1m3TmLG1LDoTM60L7+RsxYp06TZcVIj2Lh
         U6kPwVUwkt260fsTm07410UQMUiJ+J5lQ8+9udKQMHTJMMzskM0k/sv9fJMvZT3fQEpP
         OnsSNl/N5dKIOs1XUIo6e/xbISNmTJnhfPIq8OlnqXCw6qJVgC1MDHhREEWS+HNt2JBZ
         ZMmFOMYY/whi26So3Pnhjm8DcAJZSv8PZ9uq4ao5yZg7ENitXjmzZNMwHnWVMP5HOrXQ
         H++uQcR8rrOf/12UP8fXLwhhOiaw19lAsDQlyWpj5526u3UnGtvitA4WNcXcxONaShAv
         8NJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793811309; x=1794416109; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        b=QW45kJ3JjewvdIG/zGIHE53jJbGeVmOXWr8UQrHha08T9VwcOCM7cd/v2cKxXcF3uL
         XgUw7FIE8xNtwOu8mDJsKL7wEl4OnK7hQrqlDeJcateA2Uez4m5SkSmc4d/1DM4MKT94
         H19gA14p0ylUQJ1rqms7IdqMyyKwO1bbE0pmw6oM3Xwf5n0MsBnLdNOHVSKZ0vbeOxYK
         x4MrAvdedvlhVDQ72TGsrT5dkV3y+QajWkph4/ZGlQlYPz9DXPJIWV7UbATTdfNTq8vt
         IE5w4KcM9Au2hpC82wma52wrQRRUHcuGVfY71WOVCSehJnU1QELjwBpTmhoyZlP46tVH
         8ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811309; x=1794416109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJHknsWINV2q+AXBD5YPzcv7ChvXNO7Eg793ssWVnCM=;
        b=eigvBFlWcdeyJsuvJCzVEz5Z4F4ocRdHqY9d3y5KNRibJhq4JJ2BD3SliGSgT8JGw/
         MzFwvhbInTBoB9FGB68zQ26XGdCz/n399/x4GL2iMtert1sk18XR9RG7DDEX7hd54zTV
         DAwokPr27ee5WCSqPft57YsdpKEU1Pd9y6H9JVO5iR0B7t7rrUcY5xPjSyEPXPVmq2KO
         WKIjLj+O3WjZ/lYeMuvoubl3t7CjLeLMiP5UmXWpBUz/SOmPj1tCF6CxRvi+zzVX4AdQ
         CEsMaXoiGOzhPToYS8YZuaWxqox00uMj3ogH0bnEbPpl7bU9Qi54vNQN8DWt+6Tj6Abx
         tLHg==
X-Forwarded-Encrypted: i=1; AKwUvBzBk6sayQSx3sICYX6JEnlUuQDbp2vBLDa2kjpnNuprMG2/CNEJOb78esDx36/9iSxmyUsl@lists.linux.dev
X-Gm-Message-State: APuU4Z8DB4fbD6nxzgAJO0qNBqc983FzP8O9SifxPasqZWfk2t9a9J8Y
	7ntXYd6FqPquGd7Y/i9ZAGxQQWUVFJ+a0VMIbgM88+6y/Y1t7YvORW0i8w/T5yumU7eKYPo5YBr
	WxqbViB8pV9sNwVhNCSO1DZj97HmRYkeNvra6/NGK
X-Gm-Gg: AYBFou1ZErqIb6hA8ZwT2qmoKsmPxkozryLTeQQtZHSIX8fXA2suT6eDN+HnPa1nHZA
	tqGLxlHvYolEc7NXcgtTt3LzV//YCLpe6XGhp5vey3LBFJGf4QYsuXgVWgr6gJPWIm7wsxwtcv7
	8QhUu6bxVBoQG7Hg0n3VVMRCp9yZ0+w+6IMBg9JhuKllUYErDDv7THX+nRq5ihrErgauWcJMLXs
	a6Niy92LbEkZ/4boxO1Bp71Tgs1AVDPGj3VIuIp4FwOmpUZVXyb5hgk7pqVWMsbnY3mWofgfoo8
	vpmRAzzigncDvztw8d02k+ivderpyPeBVGESGLiot5cpXjtgIyDTdEh4KZ5fqoylqmSJoAHp4eq
	1bjXnXVIlzZuxPnCZ8KSLYRWOlnVe9h5Jl7/wtqybJD0wEo0lagUbJVlGFQeMr1ixEGZLwfMYLg
	1R9Ve2NCWJCmJPXDNzUeq8ZzA2cHlFIRwwV07+5SFgPAHh7aru4IM4PNGkeDDeev7Q4OlfkOUx6
	n+tuTxh6/Cewsg7iyLgdM/T7kVa3YKljecgLw==
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id
 5b1f17b1804b1-4ac1709a2d0mr359812735e9.14.1793811308661; Wed, 04 Nov 2026
 08:55:08 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
 <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com> <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
In-Reply-To: <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 4 Nov 2026 08:54:57 -0800
X-Gm-Features: AclHuK_MognXqVzsN7aCO-Tzc_dSSdkDWIg--v7GYGsPmy7ERKpNDianikR4RWc
Message-ID: <CAKwvOd=YHcfaWOn9-tPK7-ZLop+erypMQWteHj-p1x7KApbAyg@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:49=E2=80=AFPM Martin Leitner-Ankerl
<martin.ankerl@gmail.com> wrote:
>
> > Thanks for the patch!
> > Is there a reason to have the cast vs simply use "r" constraint and
> > deref in the inline asm?
> > asm("prefetcht0 (%0)" : : "r" (x));
> > https://godbolt.org/z/xezh15oMe
>
> I mostly did it to be consistent with the 32-bit prefetch() and prefetchw=
()
> in the same file, but it also has a codegen benefit. With "m" the compile=
r
> can put an offset or index in the prefetcht0 itself, while with "r" it ne=
eds
> to compute the address into a register first:
> https://godbolt.org/z/j311eYzsY

Interesting! I learn more about inline asm everyday...

>
> Thanks for the ack!
> Martin



--=20
Thanks,
~Nick Desaulniers
