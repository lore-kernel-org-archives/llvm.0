Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4913E1E04AD
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090104; cv=none; b=Ah9yVZSKnyY0ldoDhO9XwOCymlr2GmrQIBoQdY5RzoaJWzU8tIsTEtonXCPCSiKb+1dXb61boxUhLzTKYWUFfuIIE4Fy3TDUrbEzihx23TWcYvkEget1TCYuyhp/VxehSOACPsJ/PG54lw+T+Wwry6tI5gbV9VKGqCu4DDjP9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090104; c=relaxed/simple;
	bh=s7SrPYl52WuWozmbo5gIbiNPa5h8Fo7Zn10BfZuwANY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE7FrFtEM0OnoQUTLP38NOGD37OvW2yXNTVOS8SumDNEqBgbY5N5EX0rBD1y4AUXPv/Lw+AW1oOdpNrl1pt4P6Cm3zf88gtegU3BKHBKWUbZIQFudPYYfm3wOMcM0hq6kC44E3omRk+XwtpvttB2Rwtnc0ot4dVALvDtz1BzxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGfrpvgJ; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGfrpvgJ"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3f664c47adbso25610705ab.2
        for <llvm@lists.linux.dev>; Fri, 05 Sep 2025 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757090101; x=1757694901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNJVMZejeJ0dWtaoJq/BzsUu7eg4eLar9GAHcQR+XNw=;
        b=AGfrpvgJNs+ZSQuF7OzmmU4CngZx9Mbrp0jb4WD3h2j9DxOXzZDcj6eH+FgwhqIoub
         BTU2JY5mYBGlRd9ZRFHj3fweq+6/fnviKdYAxYlMxwGCw491ARs0ghXEvWtMWKKsalFl
         dDowD3ILJ8K9jUvb9t3WmyJhgJDXPuXndVhwX8JXPd77ER3T7vycwZjUCpMJr0aSkRfe
         zujRZhpcRInz8Sp1JBhpNoOV/tNudyKOJilyy/eF+tbZHhJmrsEeWCIFu+VT2mD+LN85
         0MU7sjVh5PbyCDRH3j9Iv1Vzz6pOqthPnHeyX6h5/9Jsv4jqsgN5s3Wpe4eArTofK5gt
         Uh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090101; x=1757694901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNJVMZejeJ0dWtaoJq/BzsUu7eg4eLar9GAHcQR+XNw=;
        b=hmlJBwiAvuLhlpDA57Adp0h+DorYSm2Wn9lMOI6EvGK8v2acTuJHJ/kbTzVlSpfExt
         aQXQfhUM9WDN26gRb0kwyMC2YxGy1C3ByRx133E8dLz+dHRh5bLRZy6fchxLGVQxCG4m
         G0UY0pQTZVxnbxR4452/FKwGM9z5eCyPvXSAduF9w+5IdwGmD/92RR+9jOe6zlEamRK0
         SOBSziZfOoCT1B7RhFXJ5cPSWS0AOxxb5TI2+h6YxfiQQS4ri8y9XZvETN/NuTcoNpXj
         w8khlIivVoGuVxMrWZuvGmB2bt2TcZSVgdgGYV073hnHFwRBeomWg4rveQwNC4tdXc/x
         tK+A==
X-Forwarded-Encrypted: i=1; AJvYcCU8Rmvux5sVwRgZE2jzr+/r3IJNtR85cD6/I9WwWJGGbkkL4noGfiP6ETUjeaJJRiO0STZx@lists.linux.dev
X-Gm-Message-State: AOJu0YwskPJNepAiNwl+1eMfqI/Wa3mNXi4nqhpJWWNpyKPx0Gp2vgkJ
	DfMwGMiNK42r9+zXsf/r6tJXpIFn4aQx7yHOsXKa2q/giIMGs29l6sPdRKjCqCf0qw==
X-Gm-Gg: ASbGnctUXPtj+was+O1IsYluKyfg6KhCTPSGRfwB2/D25l0VWBYF0whuLLDOq92hF71
	Aj7uyZtbh0+2lZMwbV0h0DG6dvjqMSpwrTQuE8EeoqShSrx02IkTtL81+lYAJ3E/6a3X8giyDzy
	qmhvK8alXbxzONRQHc9Df85Arz3w9HLZ98JC7CIfk/oZD++Sq/G1MGdlhJKCEYod74T8OmpPRGf
	RsmGh+CmSP5E0Q6G3zlcNpvnBgL04tzTD5HoKK6wC705MzxOdW0nASWVbrsMBb4Xp6N78XTPIL0
	dOizFg8wwq4P9d7UQal6XgAq3fzXkWTrbSu2H8HWOMbmzcl3Jqov7gN2oTt9qPumHfJayD5OeA4
	uDiuGbeIgjD/u1y7rtvBuwO6GmzkN9EUDAgb5W7Bf+1n5q7ozu8s2FaO3vnGHpWYqEdrG3B385g
	==
X-Google-Smtp-Source: AGHT+IFFNvKFGEmjvy9xgKPnnOq+Go0iiWzE8ixq+1GtVP43Q8XMv1fd8zP0NU6M6xvxRKA9GPLB4g==
X-Received: by 2002:a05:6e02:3e06:b0:3f8:b464:6d1c with SMTP id e9e14a558f8ab-3f8b4646df5mr45284865ab.14.1757090101071;
        Fri, 05 Sep 2025 09:35:01 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ec9c752a1sm5721324173.26.2025.09.05.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:35:00 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:34:56 -0700
From: Justin Stitt <justinstitt@google.com>
To: Paul Barker <paul@pbarker.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: Look in KBUILD_OUTPUT if set
Message-ID: <3fya5rij6amcwt36jthyezkzov44m6rdvlacymqfpbkcmzrnw4@fymsxhcqq6tj>
References: <20250905-gen_compile_commands-v1-1-9f5194542d4d@pbarker.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-gen_compile_commands-v1-1-9f5194542d4d@pbarker.dev>

Hi,

On Fri, Sep 05, 2025 at 11:17:43AM +0100, Paul Barker wrote:
> If someone is already using the KBUILD_OUTPUT environment variable to
> specify the directory where object files are placed, they shouldn't need
> to repeat the same information to gen_compile_commands.py.
> 
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 96e6e46ad1a702cb0fad5d524a9a02d222b236ec..7b94a2ffba0b4d5f1290b51bd602fb3f33acce6a 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -39,8 +39,9 @@ def parse_arguments():
>      parser = argparse.ArgumentParser(description=usage)
>  
>      directory_help = ('specify the output directory used for the kernel build '
> -                      '(defaults to the working directory)')
> -    parser.add_argument('-d', '--directory', type=str, default='.',
> +                      '(defaults to $KBUILD_OUTPUT (if set) or the working directory)')
> +    parser.add_argument('-d', '--directory', type=str,
> +                        default=os.environ.get('KBUILD_OUTPUT', '.'),
>                          help=directory_help)
>  
>      output_help = ('path to the output command database (defaults to ' +
> 

Thinking out loud: It might make sense to also change the default output
path in some cases but not in all cases. For my clangd setup in vim, it
does some discovery for a compile_commands.json and I have some
different ones in various build-* directories -- I guess it'd be cool if
they were automatically placed in their appropriate spot. With all that
being said probably YAGNI.

Tested-by: Justin Stitt <justinstitt@google.com>

> ---
> base-commit: d69eb204c255c35abd9e8cb621484e8074c75eaa
> change-id: 20250905-gen_compile_commands-b03d9c923fe5
> 
> Best regards,
> -- 
> Paul Barker
> 
>

Thanks
Justin
