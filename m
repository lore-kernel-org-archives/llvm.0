Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7B82EBDD7
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 23:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027253; cv=none; b=fDvq4bL73bRRqDnwiYFcUlqxw46I4Mbd1XFGgXbvjPUKch0RRL+p7AjoT9foCWrJoFLLDM056jRBQVtf/X9ur91d/KWOPCCTr7Qh6jYb9U2hYbLz6VdZgNoTlpvjWaAxRCVGoW/FxbhnZ66Tu5xkfYtGU3tKnq+0UhZuVixktoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027253; c=relaxed/simple;
	bh=gFo0FzsLEhTLdi2d/DGYSFpua5RWG+8GUEb4r/4TtCw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eIlz+viJwbmDuAp4MLRKLaRoasj6MAR48arri5DRxkwT2wHqDTx+y9Knp+I0ZEBMtJ9jfSnhvSBVhm7eo4elM7g7wd/sLR+yXJGCrT8t93z4VZQGoVrRQafYH1ZczturfDaoojkWNUd+Plkf0qH7bgEzuTcqQmt3gFp+6ksqQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw6SARwZ; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw6SARwZ"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e96ff16fea1so1881918276.0
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027251; x=1757632051; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=Rw6SARwZnxxOGHiy/tYj3FLld9jbeNQ0EMXLAEMiaBjQFeLu9MHwZ4ShLrUzKQxOcQ
         p8/ZlV0XTEf+rTX6WaQ3NUWhHiak2kszVEJR4vUJmahQiUA1nfq8vN1a19mmPi1CV+Uv
         i/G3iu1n6tQTLdz31O91bhWQOqx0oyOwIIoMsLcIqHYitQi96PylL1K2Kl/cglYt2cjH
         eS+74VkcxjRUm37kWZzXooPL2zQB7lnDFKEPli2BasMnAG/63tlwFBXaEPZNINGm+6aw
         /bUQ7luSn/BHAGF+fT1pFumTHq9UtkbB16qA0BmPoBUpES8ZsX5rRzYk1lVK9wuqDWru
         mu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027251; x=1757632051;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=eZY1Zj1LjLe+pAWf6NjnV0sxr9Ea671YJiJsug/067l/cNjbC5A7ViKKIhx1bI31Bm
         apEaSe8lrRFG1Mkx6R7hdwClYpxBwVRksCTCPmLAQijaEsrBrz5+1SWshtXCM+Yt0vBU
         YxeOOGWO2khU50o2GoV0gBWWyoAkjxchQVbRc6TKKtZ6cWaCIYhCGblYwd+yK9hQlCsG
         OWF6ki5hI++YX6bYYRNWCQX/gzIT3iL2bye3Bt97DkmpQkYPpo2ReIzNQS1bxGEz/1OS
         5xdiWcwKvLggQewwCqcxYIA+2HRCP/dnt0tBwC1vcn7sy4Gve6sV+clGxiwiqNwl1nV/
         7jaA==
X-Forwarded-Encrypted: i=1; AJvYcCWy3eoM6h4iOeSndFuT25k89epOv4Sddiz3YRgUOul+0r47ScbMOSVfu6Pp0QR7OjNntRQ4@lists.linux.dev
X-Gm-Message-State: AOJu0YwweEjjIlqVBGesbrB9YLiiptONUlM64wkBKGaUBbljaruK269K
	cp/CQoJ8iaElW2+XfBINmxXKeKyZySZ9ofMkpaO3uuo0Y76bw/f9L2NT
X-Gm-Gg: ASbGncvoFnkDePvf5i1KQ3m6KAOGavvpbXsnCEQroD/QlaxWJrDEScGdqm5bqTNEMRD
	gde+ube1vnJJIGsHp+IJFbOAqURXjteIqUfA0yBPrQ+0DmDprCRfEdul2MOmes7JQ/MpX0suzBd
	EuhXDVGMn6tpc+y0iR4f65NSaEtVgjxSpOQ3J5tzYJeojar7t9eKlWOZr3fmsYt9izMtumcRDh9
	7IDSIqbRXEMiHvGsFH5f+bW6M77UKlj5xAVqfeLxDcP/GSd6qQPOhwjacoF8GnlDbHd+2nBqI5W
	XCkvK7xlYD7+VcItgf3f5BCWtMXTTEb9x2SH1Hr4sd3EB37jW3U8dwuefi5qzj4CGqL0QbX8N+2
	MRfHhd4u6B3zl05LL4SyLdFg6f8wGoxfHlpNxwLgXZOzA11SKjtKb
X-Google-Smtp-Source: AGHT+IGO63MDek7I3AGn3ywdxwapbr9b/z6cKhhBv8np4smj4FEq4Y1WEYTgKI9LUqLR9fGRnNNxPw==
X-Received: by 2002:a05:690e:4282:20b0:5f3:317c:cb99 with SMTP id 956f58d0204a3-601780cd7e9mr4605585d50.26.1757027250697;
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8510229sm24951187b3.37.2025.09.04.16.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
Date: Fri, 5 Sep 2025 07:07:20 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux@vger.kernel.org
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Content-Language: en-US
In-Reply-To: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CC rust-for-linux list, I missed it in copying from get_maintainer.pl, 
the thread is a bit of a mess now :(
