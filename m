Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5F4A08
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734816701; cv=none; b=rlcUVnLMMwCMbKRsrL7lzkILaDdWvrzMGfO1jVJMlOjP+tBWXzxQm8wYz92BqbLXyAov+XTSa2oDL+OJr98syueJhECP1dLZkAljwW84IHVpXThA7Q3E4D5XKGbRZ4FnXrcj3GUO++rRYF/IjMjP2RywBcBtX8XpdHEaJr6Bvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734816701; c=relaxed/simple;
	bh=g80Xv9sdG8bld1hI5N8TIg0l0usJaOYYz4GMokDzByQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjRd/lhy2dc/00H6FFAdlj0CD4z51VdnQ80EONQ+Iwcw8Kre/6S4nHIVlz4q7kpqngnosr0KJNU3J0bdv8kL76WRY1DdgVGIv4JUqNWbBjnwdQAzqLkNCU2J6/sVhGH+++C8vvHBJ9KrNaq4e0g0MZsGIoKkAL9gGzAq03Wf/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=We5CBMRM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="We5CBMRM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1759969f8f.3
        for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 13:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734816698; x=1735421498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g80Xv9sdG8bld1hI5N8TIg0l0usJaOYYz4GMokDzByQ=;
        b=We5CBMRMYJhUN6he0Fu3iANULoNObjJ22DFFchUM/uiiZHTnLJOyU80BPtjm04Jj5j
         sQMe+Jd8o1rsngFx+ohfDLy6wj3/B1OkrbGEMV0+0De1JlB5aHORkoOLn/SGQvXp4v46
         jU/d9b6PeKQeKomeRby5HUqfVdeiBiFzMnTyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734816698; x=1735421498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g80Xv9sdG8bld1hI5N8TIg0l0usJaOYYz4GMokDzByQ=;
        b=vlffxg1J9yjhJh8JLCvsAGqD/P1gijNLQA1tstkF3tWihwlFLGRniFhL13wKUFDMcG
         ktQsvPkf+LEGGjjq7iadLE0AwX/2CcTZysyrjyIK00pt9Qd4M8Pr/vJIWEfvXN42AtKm
         dXiGJNb05t/K2sy0Q3WlOJfSxnwYThLVExybMF/1c2in9k+RRTMXFwPEFB37vZFu8Z1U
         ppxPk924L5GNBbvF7SoNoAWmw75SI566D6eB5q/zaVPt/mziexrPlkCrChIf4hPG2KSg
         V9xkKWlRMfZOnDOzHKzZ6zZkPvTBvyxNpBOSXyhOTNnfryH2gA1BhJZdFBysC9aBa1ru
         uSdA==
X-Forwarded-Encrypted: i=1; AJvYcCUf7B0EmezsSk3nfAg+IbGoqlBfxmE7ygEbs4++1sW8OSc4YEhzIa62UD9zk4XKaXeb9H5A@lists.linux.dev
X-Gm-Message-State: AOJu0YzR3BHFuLt8cvG1NWtnTw0uG8FThtbwE7hNAJ4AUZdy+uoAyzX+
	F4sOOI/biYOkhRfBQ17wtZHEop8huDjLAeUSW6q0etr96zfgga6LGgy7zp7qq1E=
X-Gm-Gg: ASbGncts2yeecDUg9wdudYpRmhITYVBXtOz0Zm6+gGKCytP/TUgkR2FsDl9tC+LDqbN
	hWQ6q9z2pNb6WI/9zcyL1COK1E9hXE7VZClDYXSzUnEw1T18+W5gISQcoeMqtwjl4zP9KPbQ7uR
	2+lNG8nOkEGeNzdOIRHz+iHo6CJPou0pf+Y+ITFz8LTVLcu63/MWJJ8dHJ28d7DDUgbX/9U7m07
	lu7I5zG9SS7wok+CvgXDvufHuyf6PgbrBd/V9IC+v/DwCEj7XxRppwkuxK60fikq7hU4Q1g3bHO
	V2oPu/halx13OeBZ97KQ
X-Google-Smtp-Source: AGHT+IFrVlLP9YH10ZAu9oKbTiFL/KTq/9QViPYsupLF2ej43cn2G5wKtY+3Gp7pjqL4avgqCHPezA==
X-Received: by 2002:a05:6000:156f:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-38a224071e3mr5767422f8f.49.1734816698193;
        Sat, 21 Dec 2024 13:31:38 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828cc8sm7363868f8f.17.2024.12.21.13.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 13:31:37 -0800 (PST)
Message-ID: <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
Date: Sat, 21 Dec 2024 21:31:36 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
 <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
 <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
 <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> With...
>
> dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../

That's completely bizzare.   There's nothing interestingly different
with those two tests vs the others.

I take it the crash is repeatable when using either of these?

~Andrew
