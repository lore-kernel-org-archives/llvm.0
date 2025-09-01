Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE530F813
	for <llvm@lists.linux.dev>; Mon,  1 Sep 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756726188; cv=none; b=ZAO+oFu0fwAWlcnemOioGa8G79cr+3hgp/4e7RwFjuNblbNfW2zsn9xv4n5fnqMciyd9PawRcdlAFdX2jxIoDrBBLfO+QvnGtXOCMQbW2kz3ec61ogEmn2qvJMWmWC5xa2e3mg275WzH6Nn5b2jDu/qTvtOaojSmPTiQB93VN6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756726188; c=relaxed/simple;
	bh=hwu2Kbbf5ntjzdSbAs6MMa0FLXiSeyDsJHXXkCApxlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nK/yiD/HTaGf2K22RvvZSxFk9tYDTqB/qWJXg2h02ALlvg5JH18gCFTrV8akOTU2qZqnzPECdF5dZ0RQkLtYfDLoYaUsVhCQ8DVKSJB8/UUWHX+4z4ykaH/V/1jirTh5a1Gyg9c1DSfGSPLv5f6/tdik6p1qbYSh6zSzXlaG87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJZOYblN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJZOYblN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b8a2b9fcaso9014645e9.0
        for <llvm@lists.linux.dev>; Mon, 01 Sep 2025 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756726185; x=1757330985; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lek17aB1MdxVzJYdNsx3fQ/dyCaMBNbVMi2QTvU5Diw=;
        b=AJZOYblN+tRj26zBhG30UKEvP6mX1NNoFTkOJBkRE6t48H5QAlSSju25j4pzPHZHEZ
         IgLV6eB6dyvBLUhnYGdPyIIqmJYwzTvux1PBrqmcIQK2uVBrH7cZXO8crv1J4HH9kyrk
         7DkJ1IiVI16IPXI7gzZ4/UeqtLckxGw599H9mK/X4o+/hmFj12NkCaFxMygcPW/9yGtT
         tXz5a1xsbKt1bIiZEbUb4cHYX0i3BG2shrDBtxasd5cuhz8cNIZYQWrRgzAbf+EcBxze
         IgCsu3V4XKo/xEKNfRL/qcU9GA/o2Gk5AKrD5SYynXoSrhopdypj122fOhknWj5KUmqw
         nH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726185; x=1757330985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lek17aB1MdxVzJYdNsx3fQ/dyCaMBNbVMi2QTvU5Diw=;
        b=PbbIjRlasz/FSS1GEZYGAvnWMm40B3QaEHip4ddQajGeQnl+TALqoNR4AxvihlWXc3
         rdHtWq8cKc8OdWjNL1gcMTnEfX/zD7O5vtCqJ/HZAy3u4ylW1zoH3y93e49brIXar8KX
         bSVORM/2FYAyX+nzipU4xgVeWgg+ZlyPw0YDi83Xr5FVA4j1UgESbQTqTHcdOZf2UJF2
         bFuAOSFnc/onItw91/mm43NVGAzTX8Q6h0qrWnJ/yaWYNVvIS/EHcnX7At919A+2jAKG
         ycXzHuJTG/JWlQnfW3JCN0EyNEjVg4dDYVs3Ci53n+Z9jQJTq8aN60s4fNgfWJmfS8zF
         Nv0g==
X-Forwarded-Encrypted: i=1; AJvYcCWDJKfdJzgIyDkWX/PqV+k0dujSbrOK8ahmgz8MEUho7g3buW0zVUxxgY9p4oLA+JdzcrtI@lists.linux.dev
X-Gm-Message-State: AOJu0YzIGPSqajo+B34Pq15peozdSoacIMQufzEiSU9fq90VVwr+X5ZR
	z10zXnR/82HWmZ7EAhu5AVdkHpAvl/iMNT8ZpdE3g0gliNhHMkBoGJvXRHPCJ5fZU/dkY3tM5Tg
	iq/Dv/+9LzfsDMA==
X-Google-Smtp-Source: AGHT+IF4u4k+AvvaTYncGek0o5I+2pA6zNg1judsWL0THNmQ7yIx18EN0m9On1TLUujNdBUHvq3Ytm4oIUWuoA==
X-Received: from wmbes21.prod.google.com ([2002:a05:600c:8115:b0:458:bb2b:d73e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b85533712mr68266195e9.10.1756726184881;
 Mon, 01 Sep 2025 04:29:44 -0700 (PDT)
Date: Mon, 01 Sep 2025 11:29:44 +0000
In-Reply-To: <aLNQFmgS2IcDbPmd@levanger>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827-master-v1-1-19f9f367219c@google.com> <20250829233824.GB1983886@ax162>
 <aLNQFmgS2IcDbPmd@levanger>
X-Mailer: aerc 0.20.1
Message-ID: <DCHFGJXCAPAZ.3JG065Y5DZVLZ@google.com>
Subject: Re: [PATCH] .gitignore: ignore temporary files from 'bear'
From: Brendan Jackman <jackmanb@google.com>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	<linux-kernel@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, 
	<llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat Aug 30, 2025 at 7:25 PM UTC, Nicolas Schier wrote:
> On Fri, Aug 29, 2025 at 04:38:24PM -0700, Nathan Chancellor wrote:
>> Hi Brendan,
>> 
>> On Wed, Aug 27, 2025 at 08:59:43AM +0000, Brendan Jackman wrote:
>> > Bear [0] is a tool for generating compile_commands.json. For Kbuild,
>> > Bear is not useful, since Kbuild already generates the necessary info
>> > and that can be converted to compile_commands.json by
>> > gen_compile_commads.py.
>> > 
>> > However, for code in tools/, it's handy. For example, this command
>> > updates compile_commands.json so that clangd code navigation will also
>> > work for the VMA unit tests:
>> > 
>> > 	bear --append -- make -C tools/testing/vma -j
>> > 
>> > Bear generates some temporary files. These are usually deleted again
>> > but having them show up ephemerally confuses tools that trigger
>> > recompilation on source code changes. Ignore them in Git so that these
>> > tools can tell they aren't source code.
>> > 
>> > [0]: https://github.com/rizsotto/Bear
>> > 
>> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
>> 
>> We can likely take this via the Kbuild tree. I do wonder if this would
>> be better in a tools/.gitignore file since bear is really only of use
>> there but I am not sure it matters much.
>
> yeah, please consider using tools/.gitignore.  

I don't believe that works here, because AFAIK clangd assumes a single
compile_commands.json, so while we could git-ignore
tools/compile_commands.json that wouldn't really serve the usecase I
have here with 'bear --append'.

> Please have a look at
> this thread about ignoring files from "external" tools:
>
> https://lore.kernel.org/lkml/CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com/

Hm, I would read the spirit of that thread as not being about things
from 'external tools', rather Linus' objection seems to be that the
_lifetime_ of the mbox files is unrelated to the kernel build. Well, to
be honest the only coherent principle I can get from it is "don't break
Linus' workflow". Which... yeah, is still a pretty valid concern.

> If using tools/.gitignore is not possible, I think the best way for
> ignoring files that are not natively related to kernel build tools is to 
> update the local ~/.config/git/ignore, as suggested in
>
> https://lore.kernel.org/lkml/CAK7LNAQas0cK7pgi72tYC3yU=ZkQxnr41YYW1mXd-sWiHtG+UA@mail.gmail.com/

Given this alternative, and given the fact that I'm ignoring a very
generic suffix in *.tmp (if it was just *.events.json I'd say the
practical risk has gotta be close to nil), I think we could just drop
this unless anyone else pops up with evidence that 'bear' is important
to lots of people or something.

Cheers,
Brendan
