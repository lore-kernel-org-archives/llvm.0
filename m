Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37AA38F623
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679920; cv=none; b=phPzBFHsBXmA6DjJQglaI/63gdvGgL8qAk8CzZEYeKEOsyk+ZO1aRAoFu5BXYCyt7gVi3/nqlaupS581lHrax0UF9oHyIOz/BvqHqsTyym/FEhbNFdYiHANUDWYz1/GsJflAmZImch/RqiQRNIP8q8vssgXGA9//SuKjSwrqvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679920; c=relaxed/simple;
	bh=YK2ErFGtqJmjNXRFUKyoD+PTGXRuF4JLe0eoAfWTn3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EANSSR8xAIgJ8+94Qe/zam+yRWcufw8cAVtdVgTRZTgO+C0TJjWm24Jf62t+Uyejkk1PwHLL+Njw4lW9YWm28oneQXeIOzFF0ybPOjVUYxIld8GLgy/hwQdGpMcFRpQ0u1Ck1o5PACrrVT3xN7oqV8Itnlx8tOWIG08PN7CBOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OX3/iLmZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OX3/iLmZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so121979b3a.3
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775679918; x=1776284718; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtez7uO2X5FjsGHqGis7qBChcDlylFjTSAlBvJbABwk=;
        b=OX3/iLmZ08gv2g/povqk9zvmWCjntIcpaPJ1TyXrIOPuYNMcMo83BPRA7BOyCgTa8J
         XiYK6yLtf4w5XZI0knCcAMmUZ5Dh4PIbGAw+100fl2TNdFX2Ckw4x5XvZSw6Q4y2/FgR
         EKMhpHnnKr/Uu1UjWJD70s9mD6qcEmIutAxzGH1hy7Ziq8ci5ys3BSxoX3YY/e0YsEA6
         MMaSFMvPOQuE/q8w7PkQaB/zv9w8OWcSKAH7Ad/rRTKlk8YZwLkTd0biDiDY7VE6GPYu
         nOqzzP0P1jvsM4Uv5QX+Wx7mlh5W9BDeixptYngrfkRp2rpMI1CVm3y8259XIE/8Cwjr
         Gyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679918; x=1776284718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtez7uO2X5FjsGHqGis7qBChcDlylFjTSAlBvJbABwk=;
        b=p9ZQ610IEUxaa/KkChbDzxXtNZFy9R1iqk+uMGhoH1imtbifg1xUGx7p0ZmpR8ypqW
         IYERAwoZY/Ej6rbCrkKQ+j3nkSbbs+UoVwGmio05G2G7/gUPN1S0/oVV16WmawuEFaKd
         YEI+W47afN4f+r547om5VLyy1xGvk9Jbmz4rKKlxlZujTsikA0OBSPxMYLBu+xn18MTi
         rXQXO3pGt+xezUKlSQJNN3DaKL66zhQogjhX5KAy0qICUUJ0uaOKiNpNlMhmJIpkvwJd
         9rMBYjbNSOhMJHOoSxuDDQSFT5fMhfFgjga3ddPoEcYJwSbwQtHMZ444k/bMxHdnWBIr
         eMfA==
X-Forwarded-Encrypted: i=1; AJvYcCXPNhnWVJUm77KBtlZYOyJ1iynIht5HRf0DLK+Sqybh85vbQlaLeY4dW3aXGxiJ7PvX7wgt@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr2A4saYvU7X4jS1sMU+oGiA1UuPOZHrwOr+5hLVX3bkyAImoZ
	lWe3eQYgtBLabmff+FIc9GlXlmvL5EiWfwSZrQzmeIe7EsJ3WykOHe9Web2oXNyNeA==
X-Gm-Gg: AeBDievbPCd4B2zpCoR1nMVZNESMMFE/cvFOh/Sc2C2o8Y0GP2ytrXdlvTFzmOA3gD6
	ysbM35g9OjXcDevUUaAjbVhILeVQ0fvAvY3pyETnGk08Y0rJto/MGZ0/25a2d/FlaoVvg6jFLzP
	c2de5jcbhL+kcnw9df0BmSnBs11myTaanLD4AOeu9rTmXPj7h6CKqgCT7k64S72y1WgZV/mtC9+
	ixWog788Y5/6Mr8oIIBFNv/WOByBE/cCUVQmup8LOlDh8ql2TzVBPaSLoA+aD6rWHzDBvOBuvGe
	O07V4KC6E7IuG24ps3KMMeGLiljmNE5BwCSsQ0YZBe50PNDq5ZQLgfhcBM88r+RyQT2/+Vuh9sn
	hbRwS315YcwW1Lt0fskbz8U0XkNWgzY5Jkvs3nxmCh/NSgivJ95v3HoEO6rGQ2eL2l+eBR9bCWh
	CsTCV0do1YmKtF+z7yxfz/MQInLqkBsoaJ9KlmQ9x8zEoVKHFjFIe1Y7EU9AyYMg7G
X-Received: by 2002:a05:7022:40b:b0:12a:8ea4:252 with SMTP id a92af1059eb24-12c28b7f511mr541759c88.4.1775679917525;
        Wed, 08 Apr 2026 13:25:17 -0700 (PDT)
Received: from google.com (78.93.125.34.bc.googleusercontent.com. [34.125.93.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm21165384c88.2.2026.04.08.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:25:16 -0700 (PDT)
Date: Wed, 8 Apr 2026 20:25:12 +0000
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] extract-cert: Wrap key_pass with '#ifdef
 USE_PKCS11_ENGINE'
Message-ID: <ada5jlwkMYrtfRHv@google.com>
References: <20260325-certs-extract-cert-key_pass-unused-but-set-global-v1-1-ecf94326d532@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-certs-extract-cert-key_pass-unused-but-set-global-v1-1-ecf94326d532@kernel.org>

On Wed, Mar 25, 2026 at 06:19:15PM -0700, Nathan Chancellor wrote:
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in certs/extract-cert.c:
> 
>   certs/extract-cert.c:46:20: error: variable 'key_pass' set but not used [-Werror,-Wunused-but-set-global]
>      46 | static const char *key_pass;
>         |                    ^
> 
> After commit 558bdc45dfb2 ("sign-file,extract-cert: use pkcs11 provider
> for OPENSSL MAJOR >= 3"), key_pass is only used with the OpenSSL engine
> API, not the new provider API. Wrap key_pass's declaration and
> assignment with '#ifdef USE_PKCS11_ENGINE' so that it is only included
> with its use to clear up the warning. While this is a little uglier than
> just marking key_pass with the unused attribute, this will make it
> easier to clean up all code associated with the use of the engine API if
> it were ever removed in the future. While in the area, use a tab for
> the key_pass assignment line to match the rest of the file.
> 
> Cc: stable@vger.kernel.org
> Fixes: 558bdc45dfb2 ("sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> I am taking a fix for a similar warning in modpost through the kbuild
> tree so I don't mind picking this up with an appropriate Ack or it can
> just go through the keyring tree, does not matter to me.
> ---
>  certs/extract-cert.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/certs/extract-cert.c b/certs/extract-cert.c
> index 7d6d468ed612..54ecd1024274 100644
> --- a/certs/extract-cert.c
> +++ b/certs/extract-cert.c
> @@ -43,7 +43,9 @@ void format(void)
>  	exit(2);
>  }
>  
> +#ifdef USE_PKCS11_ENGINE
>  static const char *key_pass;
> +#endif
>  static BIO *wb;
>  static char *cert_dst;
>  static bool verbose;
> @@ -135,7 +137,9 @@ int main(int argc, char **argv)
>  	if (verbose_env && strchr(verbose_env, '1'))
>  		verbose = true;
>  
> -        key_pass = getenv("KBUILD_SIGN_PIN");
> +#ifdef USE_PKCS11_ENGINE
> +	key_pass = getenv("KBUILD_SIGN_PIN");
> +#endif
>  
>  	if (argc != 3)
>  		format();
> 
> ---
> base-commit: d2a43e7f89da55d6f0f96aaadaa243f35557291e
> change-id: 20260325-certs-extract-cert-key_pass-unused-but-set-global-23007ecfadf9
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
