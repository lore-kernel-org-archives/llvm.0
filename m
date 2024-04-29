Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6E83CBA
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714410694; cv=none; b=fNaAotYzUekenmQqZlnOUV1Jb8EG8NRzyXXOJunqBJlVm/3hnvgEPSm37Pi6qvqsZs852gfQf5ZDEzIz7wUNjSkxP4P0tjyskXMbT44MAAKgi5ZNOoQd+G8Cv/nQhNRiK0VfOYj7NxgTnI5F18CJ01c5Dqf2NT4VBH0qWakLZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714410694; c=relaxed/simple;
	bh=gHKyucjbhj8cfFBnv6FeWZ+CCqaY0W6eus79r1bDca4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiJvtxkzKjmdD1jdDhnz8AfeG6lVp3psaBezCzYwFjmoaczCwCUvfsr++cqRvyUiBjnIVXDTIFrCX3qz2ra6Ec3lYyB6MsxILQHqzXZuISeIAQrRcaZ+Z2XBAWbMnAZA+iLjIuqV556AqKAFndF8AUTTUfGpD6vt0a1Q1uSu7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6zI08rc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6zI08rc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34d13789e2fso921755f8f.3
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714410691; x=1715015491; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RYAqBXsNEvrSMnv0mKSil9XtJ+T/DO6BwhlxG7738Uw=;
        b=G6zI08rcFjPpSdWbTOH+vR3VecJxv/rnzV5NMWmz2ndXq9L7zGOvNtH2Ef8vNSti8k
         vZkmhp9FuNkSFycEgdzJYW4Rig7WIIIhVf4N4QmCOWj4f5wS4Mm9G09/BO7e5NMZHy+R
         y+PfumO6vZsMOo4NYQ9O8v8MS7sF8kutXmrYyUnL8B1mInr0e8+4dlfDRK1HLIqtkNBv
         eyZuOAJ1/xaxsonA1qBa7rUeTyLJHFRcSTTCig3h7LsbvyVgteDHk/v5Dkj/9IonHTl5
         sOTLTzX3enA27gvyahmtNyjLWt/SYsciN0XAib/StSnhVAbtvadLeFbnt3qIsY3ZLUHX
         xbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714410691; x=1715015491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYAqBXsNEvrSMnv0mKSil9XtJ+T/DO6BwhlxG7738Uw=;
        b=J8ckra1X3uUWGxPBEhLUzmw3zZNiyBv+GmTjZZoZE46uK3HPMz9kLXoLFTTDLohsW2
         Lrws/hohzYBIWlQgZHJogsdx52QLqmsQvcA/QAvwrumDdUjuljNpU5eXxeXhlqc5HpWO
         oDUbaeWE6WYbzLIZrtg/6p8zdVoALQI6pmin0y0YMMlujFBBNFCYamoeyZ/6lxroZkoa
         JPgjvlaRM68673Z/dSWZ4ikeZnOuq4iGrCqePTFekoixSAHQB4Nevn6KDp800MZ5DU75
         foAIiuvWzz/dEobjmbFOjOnVxa8+RYIfaOgn+7Bx7x76dWjiaZUs22VPfbNQVUOu8waM
         aScQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFEAZnbsjm7Alekg8HA/xM323BrL4BsysT/4tHoZhltIts7AhYtrQSL+ars7bXZY2SIp63zZap7uXsX1/Af/zRz31tvA==
X-Gm-Message-State: AOJu0YwF2k6iX3zzDgo5JrY7mVpqje/sg5iOfY/ekpd4+xMg3xKI4zGE
	wkh8pl8cwfkyiSmIG6/1z8K1vb9GrWYZtkTcLvfDD+gbV/nstmWjpz3FvUGyTWrDUCpoB5UxTR+
	D
X-Google-Smtp-Source: AGHT+IG8umBD7o5FzAImUqAN8DYBJskAD7XTKjpSpsopHoP+FSd3CORx51YP8n2Ws0Pw8hnEOok6ug==
X-Received: by 2002:a5d:45cb:0:b0:33e:7896:a9d7 with SMTP id b11-20020a5d45cb000000b0033e7896a9d7mr292530wrs.67.1714410691396;
        Mon, 29 Apr 2024 10:11:31 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm30075412wru.21.2024.04.29.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:11:31 -0700 (PDT)
Date: Mon, 29 Apr 2024 18:11:45 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, bpf@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] tools/build: Add clang cross-compilation flags to
 feature detection
Message-ID: <20240429171145.GA241057@myrica>
References: <20231102103252.247147-1-bjorn@kernel.org>
 <ZUOWcXDpCOzxbFW0@krava>
 <87o79wxvnu.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o79wxvnu.fsf@all.your.base.are.belong.to.us>

On Fri, Apr 26, 2024 at 12:31:17PM +0200, Björn Töpel wrote:
> Jiri Olsa <olsajiri@gmail.com> writes:
> 
> > On Thu, Nov 02, 2023 at 11:32:52AM +0100, Björn Töpel wrote:
> >> From: Björn Töpel <bjorn@rivosinc.com>
> >> 
> >> When a tool cross-build has LLVM=1 set, the clang cross-compilation
> >> flags are not passed to the feature detection build system. This
> >> results in the host's features are detected instead of the targets.
> >> 
> >> E.g, triggering a cross-build of bpftool:
> >> 
> >>   cd tools/bpf/bpftool
> >>   make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LLVM=1
> >> 
> >> would report the host's, and not the target's features.
> >> 
> >> Correct the issue by passing the CLANG_CROSS_FLAGS variable to the
> >> feature detection makefile.
> >> 
> >> Fixes: cebdb7374577 ("tools: Help cross-building with clang")
> >> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> >
> > Acked-by: Jiri Olsa <jolsa@kernel.org>
> 
> Waking up the dead!
> 
> Arnaldo, Jean-Philippe: I'm still stung by what this patch fixes. LMK
> what you need from me/this patch to pick it up.

I guess the problem is these files don't have a specific tree. Since you
mention BPF maybe it should go through the BPF tree, in which case you
could resend to the tools/bpf maintainers (and "PATCH bpf" subject prefix)

FWIW the change looks good to me:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>


