Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C177107
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715629508; cv=none; b=qRokhKWf3pZqpWbX1IIIQyhCGAumNaR1/hsIHfvY6nUxQN+NkZoZ1pxS9/fbULu2dZTmO+7W5ioyZWhH3Umt4YZJiqGEQn0/7D+Na/Az8pNX+1q5ghAdrZ7Pu4KQTVX6b0b3awX5bJ/+DcinkNzbTLehtZIuFP5WedsoJ+Tje7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715629508; c=relaxed/simple;
	bh=lkX/M/OVTWkcdWK8AyuLdiu5b3a3EKqBIzeiduQZzZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9Idko0ztY0ce/9mazYNK7T58jTs51FAjdXtBQKjAyNFoxrl0oX+Y08lCcJVl6viw3jOmy+J0gTreyL0fpghiDO5FpYLm2zzO4BMCow5U2GbkuadxYXVSiU8jEZLFrC9UEODue4q4w6w7yjYKjpKhgUIb9kR5b45t5gWKTLf0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mDWEF3xV; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mDWEF3xV"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8b519e438so3927466a12.1
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715629505; x=1716234305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9chi3Xc1nvI/gVi21b7gtgutjXhJ9XfFazGItJ10RrM=;
        b=mDWEF3xVRBF4AO/LOsgqqhq3y+YnS1MIwC87rlD5rGFwpjojZbKXeSDMFeiqiSV8ru
         8nYNVhNqEDrzLJqYA0RUA1Apd1LKwC9oy2jZTxLssnpaQqB5FqgUIXyKfnyGKeICxMme
         AiU+7EHqGyMSLdfTPc6NI9CTgU8HH3rZvI9WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715629505; x=1716234305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9chi3Xc1nvI/gVi21b7gtgutjXhJ9XfFazGItJ10RrM=;
        b=nKyvJqguUYM+3jDe6pB9so408OzqKPe9sfgjFxd1pRRGT6DuUXh8TY0ELIir9VEc9T
         10Nj1EjlwqRai4db2SrN9h+dhs7dPcNEe9rTrzMIDA1CRv3jO21+KOyXIVdR/2XFoPkw
         Hi0ir0zmLzIoH0rPs3Ag67bhykyTqD8GWZar79jIHM3/7mCMniaKQcs6Bgp+uU/qOQzG
         /q04nzJFN7OTbNxcyDCOYCQsFrmLmWgcuKxMu3ioVFsMcllDB/7zD+7GM1TW1fSEb2F1
         BUYmHAsRW6P2McjgHNCfWH1gATm3ZL1bjBt4+GOs+3NLvbFvUunDhfIr+fFnbGAOi42C
         QUHA==
X-Forwarded-Encrypted: i=1; AJvYcCVtMfKUbDOa/vKH6KpPyxXyj4MyX+dDIOhP3OVL5KMb9V4T3JK20n5gsoAxmZbauRh6T+lWd0wGEzPwZDr63AYkKdIC/w==
X-Gm-Message-State: AOJu0YwMZzFSIB0jRDbPdcy5QbPJzCjl6eLNqQFOpNIrOH+PaV8eCk58
	9XkGjC03ExPlL8djJ1v903h6EXgLXvxiw1/h4OzyOcU9hOTPIVvgGgsrE22Dlw==
X-Google-Smtp-Source: AGHT+IFiB350HJmAM9p6dy50xn1DH9UD4cBCncM11fBjTw9zQRi5Yi8p+prPZer6lZhPmiwwzOChIA==
X-Received: by 2002:a05:6a20:c909:b0:1ad:999b:de47 with SMTP id adf61e73a8af0-1afde1d7b38mr11221877637.51.1715629505306;
        Mon, 13 May 2024 12:45:05 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ea6ab8sm10150799a91.55.2024.05.13.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 12:45:04 -0700 (PDT)
Date: Mon, 13 May 2024 12:45:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] perf/ring_buffer: Prefer struct_size over open coded
 arithmetic
Message-ID: <202405131245.E572E4C6@keescook>
References: <AS8PR02MB72379B4807F3951A1B926BA58BE02@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB72379B4807F3951A1B926BA58BE02@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sat, May 11, 2024 at 03:24:37PM +0200, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> As the "rb" variable is a pointer to "struct perf_buffer" and this
> structure ends in a flexible array:
> 
> struct perf_buffer {
> 	[...]
> 	void	*data_pages[];
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the calculation "size + count * size" in
> the kzalloc_node() functions.
> 
> In the "rb_alloc" function defined in the else branch of the macro
> 
>  #ifndef CONFIG_PERF_USE_VMALLOC
> 
> the count in the struct_size helper is the literal "1" since only one
> pointer to void is allocated. Also, remove the "size" variable as it
> is no longer needed.
> 
> At the same time, prepare for the coming implementation by GCC and Clang
> of the __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions). In this case, it is important to note
> that the logic needs a little refactoring to ensure that the "nr_pages"
> member is initialized before the first access to the flex array.
> 
> In one case, it is only necessary to move the "nr_pages" assignment
> before the array-writing loop while in the other case the access to the
> flex array needs to be moved inside the if branch and after the
> "nr_pages" assignment.
> 
> This way, the code is more safer.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
