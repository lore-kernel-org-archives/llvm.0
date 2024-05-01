Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B9014A8B
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714593283; cv=none; b=nIH/s3pxWN14HNibWhfZfR9u92tmmsru33Ezj4ODw24Jz3rZBfe5++qxb3sJgCuWYgZeY/hFe3yQZjp7EvJ7OG3/ms+T7KCR+qKz7ybJsIm+WEiXPMcpMxoIzk2zEut+b5JFD5doXy/YrVLiz/RwPM/151I/CXz5o+4G7aXpc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714593283; c=relaxed/simple;
	bh=3AFePkdooPErfFu/qbXBokEPm+8+qcbQdefFXCyvhhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qebbmVHPcfGORYTNxY3TjXUTV6sWgeL9QhbQEa4dzNIRXWoh5njG5zjUZ/yAkWSS2fr1H2G7ZLHIqvfRbjRXywKfzY4+weZNHKx/7NZv8bBB4McgNwsZhMNOjhK7i8ZEoHitdPuzN0OH6IWayFOiaz/RK+wGmcStE1cyScy2xkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YPKUTxUG; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YPKUTxUG"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7dea2de1301so308973239f.3
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 12:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714593281; x=1715198081; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3qjMSjjDTWfiqOEbDNPmH92wnyK6R57JD3befS8Eeg=;
        b=YPKUTxUGifBFvJie/9X/YVFYmVRNfVUur8L2RR7UNuBv8cDZftn21fDFq024Z3HXmz
         TQkQHzSrRfesOgnxcrFCyYZIew/aZJdRsHHfB33LLC5CetJNfVeoAZD/QACg8muiv8rQ
         wC5zPH6wfd5DLMbMdPx8CcEV6lr0bEseJa6wOUgIeA75eQ+N8nJ6kBA4GOqv+bNYiEm6
         Yb1DfT2Rb08OuLpKxUaWBH3lKyn5gWum/cnAa+fltbUMtU0zBOlQNs+Es0lOworuD4qo
         I3qpa9855iluRuY8lbKTAd96LYnYD4opSfASG9WlGX4w/gP1kToNXOGfpsuCWdBNix2x
         752g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714593281; x=1715198081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3qjMSjjDTWfiqOEbDNPmH92wnyK6R57JD3befS8Eeg=;
        b=XPtoT8YJPvh4djk6m8UE1F7P90DlOR4mBpEdMhNKhU7wUXCmGHMtT/ezMzEK9DTkxU
         8pI4DcF3rFRrhNrBVwqAbj0XTtQF24QaaD+cLzzfib2gIbuC5zIEG9p0BfCm19G3qkVZ
         juFO4crCzh0Q8tCyDhPPttS4LksnGFnt364kUUEQE72tA6qo0tvVaNvPf2hNwmVa2UGX
         8L6WLyqK9X+iOfJoMcmpMzRxOv7Nl5U/NqSqvNbKoKB/xF5dpJm2+GdALlmnJN0Wm4HV
         UEZe4QzegJMd4LBYlEsA6HYeU1Qa2ta7TBRMsx/ZINGi/3WBhgTPdEPYXudJmtilCeJa
         DdIw==
X-Forwarded-Encrypted: i=1; AJvYcCXLzkGqpi9M2C4PQvDmSZxgXwkTfguBQCJfP3GomXl/GxK9zNHl1sCbXYEh5HavfrGwEiy+t3w0sUOZHrzzq+diXLWCdQ==
X-Gm-Message-State: AOJu0YxTEa/DcpPMhDS6EoAgvfIJjb4oNazXWLHJdE6co1huajCYlJIm
	kgmVT8+yuXhteJkJQ5fI2RqrT1ubQTPojB4s7I6v2s29YMsIYKk/jRqvgzVkoQ==
X-Google-Smtp-Source: AGHT+IFV0Ej1qR/QMLUPSTTY0DQ7vd7qiVQm5fV9ISZXRkhorw2Wgn4KuGk7bnpcpR08pavfAqxO4Q==
X-Received: by 2002:a5e:c80c:0:b0:7de:ca48:4fab with SMTP id y12-20020a5ec80c000000b007deca484fabmr4093192iol.2.1714593281030;
        Wed, 01 May 2024 12:54:41 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id ci10-20020a0566383d8a00b004874d717cffsm3529346jab.29.2024.05.01.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:54:40 -0700 (PDT)
Date: Wed, 1 May 2024 19:54:35 +0000
From: Justin Stitt <justinstitt@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, 
	Andy Lutomirski <luto@mit.edu>, linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for
 elf_hash
Message-ID: <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
References: <20240501180622.1676340-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501180622.1676340-1-edliaw@google.com>

Hi,

On Wed, May 01, 2024 at 06:06:18PM +0000, Edward Liaw wrote:
> Fixes clang compilation warnings by adding explicit unsigned conversion:
> 
> parse_vdso.c:206:22: warning: passing 'const char *' to parameter of
>  type 'const unsigned char *' converts between pointers to integer types
>  where one is of the unique plain 'char' type and the other is not
>  [-Wpointer-sign]
>         ver_hash = elf_hash(version);
>                             ^~~~~~~
> parse_vdso.c:59:52: note: passing argument to parameter 'name' here
> static unsigned long elf_hash(const unsigned char *name)
>                                                    ^
> parse_vdso.c:207:46: warning: passing 'const char *' to parameter of
>  type 'const unsigned char *' converts between pointers to integer types
>  where one is of the unique plain 'char' type and the other is not
>  [-Wpointer-sign]
>         ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
>                                                     ^~~~
> parse_vdso.c:59:52: note: passing argument to parameter 'name' here
> static unsigned long elf_hash(const unsigned char *name)
> 
> Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
> Signed-off-by: Edward Liaw <edliaw@google.com>

> ---
> v2: update commit message with correct compiler warning
> v3: fix checkpatch errors and indentation
> ---
>  tools/testing/selftests/vDSO/parse_vdso.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index 413f75620a35..9e29ff0657ea 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -203,8 +203,9 @@ void *vdso_sym(const char *version, const char *name)

Is it possible to just change the types of the parameters of vdso_sym()
or does that trigger even more warnings on the callsites of vdso_sym()?

Either way, this looks ok to me.

Acked-by: Justin Stitt <justinstitt@google.com>

>  	if (!vdso_info.valid)
>  		return 0;
> 
> -	ver_hash = elf_hash(version);
> -	ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
> +	ver_hash = elf_hash((const unsigned char *)version);
> +	ELF(Word) chain = vdso_info.bucket[
> +		elf_hash((const unsigned char *)name) % vdso_info.nbucket];
> 
>  	for (; chain != STN_UNDEF; chain = vdso_info.chain[chain]) {
>  		ELF(Sym) *sym = &vdso_info.symtab[chain];
> --
> 2.45.0.rc0.197.gbae5840b3b-goog
> 

Thanks
Justin
