Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC644487
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiwtbWbm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-692c70bc440so2280243b3a.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696633649; x=1697238449; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKyvM6ylbhTdR67AI9jZVPgkogDuDD04vi10dphci88=;
        b=FiwtbWbmPZ6+Mkh9n41myEbuQD0GZTWHjf/tlMCAlnGeaw2Xh4zR6lHgwIG+VV5HR+
         9qNKA9U83gPfymjnOmzo7D9XxipUZAv8lpI9+aRW4E0It49Ekb0aEuXt1eB4XJk1PQPT
         TkhYO9XJ6IFNTJBcYU9ANyIE2C2KLT5qVITiiAkHXb5iQ5HThomL8zWul3PJPp4jBnST
         RA78hWA5VhccG/fJXx01ymVZGAkbehQjSJoBzS+EFWVROfrJs1SQTKxEJQFwQFKmcCoU
         9kST3lLooHpXIgWxOwTDff3VJwuLeAXpTAaL5Ct2xb0qOocNyd8tKZzFZjDQupUj61vo
         c8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696633649; x=1697238449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKyvM6ylbhTdR67AI9jZVPgkogDuDD04vi10dphci88=;
        b=e6baOdf5EkiMxOu40oiWxVT4wCIzCMWMrQRQguNowYAzLOJd4S5ceNOtDHbFMml9yD
         j/18Rh1dO2QT98tIFIqSm3hqebfiZoSEYS4WPFS4JercV5cya3kIwH+x1PYZ0zKk5aHn
         1pJi8LA+MpEYdl3cpcE42g3vcXdhUM8vDJzkA59KUjWoWWeAjblDR2pMjC7lH1+9UtGf
         jVWv52JGg1fb+b7CgTLwh7viIfKYYlB9RH5pPU5V7Fxp0aYZVZeNEmQMG7jSAyFoBtPL
         JTe2bm71Fql8zyDVcVL7udWpH1uVm6ElM9cjTYSFKHEBKiHM0maA91fgeov55otKABXH
         uDag==
X-Gm-Message-State: AOJu0Yzb/cmmjOSpTROY5OYl1oH8QzMO15x5es8yNOso4QvYFiXatMzD
	4xdTvyhaSTaoMMVaY1NZs1I=
X-Google-Smtp-Source: AGHT+IHODLwNnd6ydPyKfu0PfI5BXRnfHFd+3Nc0BcuTy0VSSA+2tTY1JaCstzJ379/39+3oCP6YaQ==
X-Received: by 2002:a05:6a20:a11f:b0:163:4288:1c3d with SMTP id q31-20020a056a20a11f00b0016342881c3dmr10646062pzk.43.1696633649083;
        Fri, 06 Oct 2023 16:07:29 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c24600b001b89a6164desm4498195plg.118.2023.10.06.16.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 16:07:28 -0700 (PDT)
Message-ID: <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
Date: Fri, 6 Oct 2023 20:07:23 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20231006155739.246381-1-yakoyoku@gmail.com>
 <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/23 18:13, Miguel Ojeda wrote:
> On Fri, Oct 6, 2023 at 5:57 PM Martin Rodriguez Reboredo
> <yakoyoku@gmail.com> wrote:
>>
>> For now I don't have a completely working example but I have an MWE as
>> following...
> 
> Thanks Martin, I appreciate it, but I don't think this would work in
> the general case we want to solve.

Well, there's the network PHY driver series that is stuck on this
topic, I (and probably others) have local work that have the same issue
and said general case might not arrive that soon. So it'd better to
start on a feature that will benefit API users right away and can be
updated to fit needs. That's what I think.

> I have been intending to work on this for a long time now, and I still
> mean to. Hopefully I will have some news at LPC.
> 
> Cheers,
> Miguel
