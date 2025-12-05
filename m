Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C129C33F
	for <llvm@lists.linux.dev>; Fri,  5 Dec 2025 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764975235; cv=none; b=ZXJi72r7TVlgrM5fgZWxPQQRb4on9HL+9Vkd17WUwcQ8Wal0wtK8DYfYe6LSamuhBQkLDp5kJlUZtm6XWuGYN7k0jqpCNYiGhnLBCLucgkHD70ygr7ig8k3nDVQxlY9YKt76AlVnuCq1aa/br49f6tV0payo4ssR/wr9vqRXl4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764975235; c=relaxed/simple;
	bh=a83ACYj0G6I1Rz4DZzhr9hUJgI+DUEO8CweOmZiI6iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thTCAd5IOPhOE+Lz2wZSWjrMxDDNQfO4vLHpf0HAQY1Eksf8L2YUvf6WQFQnu7j31Wj9q3UyyyPFKuPRl2ErSUAC2SLya5J/IILL07FX9IEGDm6jcu7n1m9MK2Q7IhVoSBRrKrU6Qx7L80aodzVKzz3o+jGEXkN3y9/D5O3j2UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7dAJ+7e; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7dAJ+7e"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6597046fcbdso837362eaf.0
        for <llvm@lists.linux.dev>; Fri, 05 Dec 2025 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764975233; x=1765580033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxdaj8XvuPU7tC1NYzWDQ//BWgRc9lqBUZULAQw0owM=;
        b=o7dAJ+7e9qg1NFhzLrDFdYCIh5NC2/BU4xbtAcTBsy3HKy8jLYUFjcgycEgnHRwl36
         eSWDUCfJj0saMH7L65x6IGEKHifPxi2wjnlvWpJJi1xK/iEQyifTH6DYnCwbzTZIQBzG
         Ld9R1x7tCJWgP1lnwvRhBNgWs+gcrqSAilLPHGcyb5pxOPu0ou8M1m49Ocu78mPYOhxB
         vOI3Y0YxvYA2X3h7T2Ds04+tiMjOA7XYu7dfmFTw/agpmyar8ao3hoG6j5t7J1Hk5HIO
         oF9jCanfaCwQ0zCe10EIimzIFvhx/cROD1QODvU8g7ORAHaz1leV2dTmZOEi851yfSBq
         Jzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764975233; x=1765580033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxdaj8XvuPU7tC1NYzWDQ//BWgRc9lqBUZULAQw0owM=;
        b=pgfqonWGctw7yGB5SKSoAIGq0WipR1XP0ySZu/hIpZlRTcFIuWgTPYDR/tJ1HkZKos
         ojCIcogIdAatd1yaJFwzH06HEhscIkHxgGdY0Zi1dk/MS3l/NZ90JxDq3LD0mwIWi4W0
         WSuaxpii6NR4YH7QmMw2AWvDuk0Z9BQSy4NkGXYcnZBJvqIKpPxupzE5k139GihBtfOb
         oVOC8U3UxJffPjKI4Mg2Mw3JjbkYGcwhoidDkNm9bBUluNC+6pylryxTsy6EADUik0DR
         Of5ZSiqZG3NFdJ5Ly3xJxfKYDxMslXda/bYFqt71bn/scJ8WphmyFG7yWWxhYbfCAUrU
         Eoaw==
X-Forwarded-Encrypted: i=1; AJvYcCVhbF5Hyo9po3QaJqotJIbIzEbt9qnEKKnGDZqHxpSnPFmHAJwKqn37oZpAKBNxwt4eoF+W@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMgOHtlEVcjnENo9IrB051+VNLDl4s9fk8jKd2XHDTHeXtEKg
	Ivl6gFsoYmXqM/etSiHdsstLfzrUDAy97UleoLCMO3u0AtBLh29/Th39gkDy6lzQHw==
X-Gm-Gg: ASbGncuR8X1D8+VAQCuznZ+iCuNt25ni74rI4AK3km0rzEptf+58bj/E/MEPLJwrub1
	tpCEknARyFB66xUtWv79Y1dgfcqGomdbmGnL9iFsIvcWQ6Qu2Y+4CmhQ2w6IffbCOZlpBN9Nnv5
	NTWYS60PfA9naUpX+UfJCBRXJsR16ICQYPP2y3y97l71YhAN7liw28QLzThQuND//nQwD4b4tz6
	2ttGlwYVT2qsn1NJgU6N0cEm7ar7ypu/uDmLLy3LlVM+ZsoPfA3LM7WzIZOg9AjUgEGA2Cfwz6q
	U4pr3g1yFtuwdzRXsAxSDyFtwpIN8kDXVSsIIMWF/lxOWue1MAzJdIg3hhQQ9KDRoOF3dQqmE7s
	PutySs22rEY7ttg64jlYZ7EBPZVpeeTlgeIGyF/PcQo1HylF8yvus56rYS07mYUclhXMA0WHVE7
	Idp0hfLvqxewd3/uACUceUTIn0Y2y4DKqkJ/lSn3Apt13qq8OgiLRSJ4OC
X-Google-Smtp-Source: AGHT+IHFhRnliDQG56ynaPUfrvYkb15pzZZPHThQqlHTj/wS5YVOBzORn8GShCTA0dGK9AIk0FRxfQ==
X-Received: by 2002:a05:6820:81c9:b0:659:9a49:8dde with SMTP id 006d021491bc7-6599a8ea4b3mr367263eaf.32.1764975232750;
        Fri, 05 Dec 2025 14:53:52 -0800 (PST)
Received: from google.com (122.130.171.34.bc.googleusercontent.com. [34.171.130.122])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50aa9675fsm4497431fac.6.2025.12.05.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 14:53:52 -0800 (PST)
Date: Fri, 5 Dec 2025 14:53:49 -0800
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Christopher Covington <cov@codeaurora.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y RESEND] KVM: arm64: silence
 -Wuninitialized-const-pointer warning
Message-ID: <hafkvcj6frhjrzqotsdwws2buy7c6tfwjt5kkjkjc2emuxud7n@cv5vp4ftwvdv>
References: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
 <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
 <20251205002245.GA3463270@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205002245.GA3463270@ax162>

Hi,

On Thu, Dec 04, 2025 at 05:22:45PM -0700, Nathan Chancellor wrote:
> On Thu, Dec 04, 2025 at 12:53:58PM -0800, Justin Stitt wrote:
> > Quick correction:
> > 
> > On Thu, Dec 04, 2025 at 12:50:11PM -0800, Justin Stitt wrote:
> > > A new warning in Clang 22 [1] complains that @clidr passed to
> > > get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> > > doesn't really care since it casts away the const-ness anyways.
> > > 
> > > Silence the warning by initializing the struct.
> > > 
> > > This patch won't apply to anything past v6.1 as this code section was
> > > reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> > > configuration"). There is no upstream equivalent so this patch only
> > > needs to be applied (stable only) to 6.1.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> > > Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > > Resending this with Nathan's RB tag, an updated commit log and better
> > > recipients from checkpatch.pl.
> > 
> > My usage of $ b4 trailers must've not been correct because this 6.1
> > version didn't pick up Nathan's RB tag. Whoops! Hopefully whoever picks
> > this up can add that for me :)
> 
> Looks like you resent the first iteration of this change [1] instead of
> the second [2], hence why 'b4 trailers -u' did not work, since I never
> reviewed the first iteration after Marc rejected it :)
> 
> Your 5.15 resend looks correct though.
> 
> [1]: https://lore.kernel.org/20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com/
> [2]: https://lore.kernel.org/20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com/

Thanks for spotting this, I got lost in my b4 branches. I've sent the v2
resend [1]. Hopefully all is good there :)

> 
> Cheers,
> Nathan

[1]: https://lore.kernel.org/r/20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com

Justin
