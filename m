Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D362853E0
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027837; cv=none; b=IvyqZLLxCwlbKd4JHb0XqpO55+JVnTlc6vLsrw5klgOMQ2Z5i2awwgkqsZ+b1RDJh/Y6xZ8AY+dObALvfXtG8eOvphtGSRC4EiAT6GX7CwtwpP2ciq6k0+uqzE8xDzdT5VwG+BuSz+zQi1cbG0fTjqkCvaPR6+TTXjNlbpMkX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027837; c=relaxed/simple;
	bh=vKxJqxUeb0q9SyWTMnv9Doz9iKaRIBHyfoEX6YoudiU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qZAoKkrLMeyXEsn+CJkKZow2hPONY0XHdSeacUbtiaVNR0vryspNoG+KNMfHpfZWw/m+IXg0erTEJzCBEw9AXrqltvoAiSZdjkaTApKYT+guNHpY5updhvWg/m8IsJCSgQBZ8V3Qylqy3fCiOlxfX1WEdKKnoumoTF2BNU5Ry1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vabq5JAo; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vabq5JAo"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e98b7071cc9so1635188276.3
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 16:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027835; x=1757632635; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=Vabq5JAoYJNJLGFhP2Qh+QELWUA1FggKuVClwVu6pxQ4HvjEG3FeE2Qxp4FxFf7DbP
         AlLeziXae0rmOAc3HODVl056Y+K+i7JangG4uvsbnNJG0UPytTTn45nJElh4C/EkHgW9
         DkcD1T95waXZoEPmTI5s8AHQUPQBMlkx3BdD66h7RHCSbDN+ARr6vwysGDmxHthpjwXS
         ztbSqq5NH8WfD7f7H8hkzIvsmnTYHCS0m0G0K3Pq97E5JJcyoPRIJCZJbrqTb6AsH3sq
         XIjnLPm8tV3VOXvbt7k0YpISzF304cOYoHIui4sq0BRzILJU7G9Scev1Lquv+Q8tadQb
         M+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027835; x=1757632635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=ED9FalrzuzWNNqHKGuWSoq0TiX5mIe2oBq2x2j4CPq4d1nlGDNq1XJSsSq2DjqVyH/
         QoI7M0A+xXfNft/vxi3deISjngERDs9mhi4vF68tS+J3TTuuu55ZebvEqf+DFWIHM0oU
         +Y1fscBbt0nPjTYePIvJXrq+aF0TX2bC7LyOER6shZLtgk8r0ayPgqUtku7+cXyx1JK7
         /lGkGmCLRdoBUDKDUAMjOeAHNWJXZInRSrC7ROkXdHAM1zQA6axH89pFnec2PlmxaZV9
         CgNV6erK24S/bFZSQo8NZdLxLfGiX6dcFC7lMsoKfefFBs0I7SQ3SShWeY+6i+PhcMRS
         SJug==
X-Forwarded-Encrypted: i=1; AJvYcCV7sUogF6GPAOFYS+CVINjqs3QjEhqaq6SzfV6JtxRHFYIfGhQe2fliBGfZ3vK1M3m28b/A@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkei5hIh/YKxE1EdPq56UBsmAdfW4s1/p9i2jqt7hQsHAcHzbn
	+/8BoSnGzqvdQ7Rk2r2ntI72aG2nQ58z6MgfR4ONTZxxaka1ZabCw3tf
X-Gm-Gg: ASbGncv1cLMBJelFUOV+LtX/XgljI0FTZWlXTelIDVElZNJvQCSNHfmj7H1Jo4MqN0H
	7+CP667dKrRubB5upUD8ac0yz+W7VN/zcHqULmyC6Gns6rHK/AA2uF2FqauiJwP0mhRwRJVerFk
	AkUkQGmzoDkur47z0ocBzuHuntwy41MmOxprZxDvZTNgm0iYCKYsoFoRkKRcvM69Q1MkPo+yA6z
	RNJX1+OAktliHxt7abOCV99AAPF3iuJTJ21XNkBBvQQKNnLObGu3eCEGehnzU4xLwQVoCpJzWTN
	u4WHmuGTHb9gWFh0Q2vwZWPs5HOnq6Zg1BiPOGvsE1dIyqTl5bd5g1ahrkcs2uIjw4Jh0c/s1wv
	IyOQTHlfkl96QTqPYQ5bfDx2cx6IPD4fm+jKKRpqtMyFzTXPFQabUjEJV0kQPkGQVjTqMuob+Mw
	==
X-Google-Smtp-Source: AGHT+IG5rC/L+YgDnZCQ1gLq4F9L2loshi3GG0alOQkkWDK4IDT94yEI8uFHJeAzvHVBTi2SzWU91Q==
X-Received: by 2002:a05:690e:23c3:b0:5f3:317e:2eb2 with SMTP id 956f58d0204a3-601782cde5bmr3513128d50.28.1757027834471;
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8511f0asm24570997b3.34.2025.09.04.16.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b0f83328-5df9-4280-a357-7fc4d48fd0cb@gmail.com>
Date: Fri, 5 Sep 2025 07:17:04 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/25 7:27 AM, Miguel Ojeda wrote:
> I think the commit message should try to explain each the changes here
> (or to split them).
>
> e.g. it doesn't mention the other config symbols added, nor the extra
> flag skipped, nor the `error` call.
Yes, the commit message is worth being more detailed, I'll improve it in 
the v2 patch.
