Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60233C1AA
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851617; cv=none; b=cHsl80Yh01i28ZbeycafLsP/XgTfqxEvPCpLRCcSGJtZ6Ag6uNqQGSapUGQcfoWm9q+DUHjD0dGuE8QQkd2oOKSoPEuSsv74rUc+GDITp7OhiGMyhapDfJOViLY2PoC7wHiqozw7KWvA3qBMFO5TRzfSo5c3JnxmRSntLfhjLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851617; c=relaxed/simple;
	bh=WfZZkVUD2KIfkMnmL+8RiPfvk8m+CchCTc2u15cbG9Y=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QKQ4L3pkG+R/pQrImli5wTNafTDKEIpnjgXwfKFW3RkpJ9zgdfLd1o6ZhO7X0UV5saPnYZsWtvmjZyP5oUwnnJKqWw6dlHzMsqIb2+F7PTv6HnnVL15PlQWYl+7tTQu+P/b8+Ii/MEF50WWXNRWzHwr4grDZwWNYkweEl5NctK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InCbvbAK; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InCbvbAK"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78a6c7ac38fso9535207b3.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851611; x=1765456411; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=InCbvbAKYHA0RlJlHGvD9rLVQi4NqqyNmWOGFQQZEudrvL6QttwpogRP4VYrcYqVR6
         lmpQ8sbech+8Y0ZjeQ+4BMsfKtpjYlB7xddno6vkApMBxOwSbQsgqMmzmmps3UPIeQ3Z
         zU6gfIsC3+a5d6AxyJ9bERtMEi5+BZ2ZDChnDN/CR95NBNdn2sRMprvAgiq2szx+LEN/
         wvgndOoSkulLp36FUk8mTihav9ISAyhk/XOSY3flhro+iCxlqbqdmHafbMPVjssxr2qV
         5UXhLvKkQU5IRwp1utDhQUQNdZaOF/2cE3RXWIAfOhTiFQXPbBtUqIe1ji2VcSgmwqpw
         TwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851611; x=1765456411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=jv8sbnMTsNWxEYwMbY0nRAz/n9F8lt5jQx3ULSKaQeXuS5qZG0TsiNwoFz/JFmiBq3
         yMUhvSKZhveNtjSoxhGk6KzSx7IRDfHmJpqnxMCSGUuooiv6RbvcB4hQweRxuCY5APrQ
         zbHfwNx9hdek+v4FiiDA4iI3X21DLEAxtwrXbVgqMfe9nR4RlqbdW2y2l5fODcGyfTCE
         Ey/dn7qf6TK/AAp8rS0HdOH8H1i8v2MAFj7Pc/4rx9jL2ULDlZpKAsKBpOA2O2Mmas7W
         kROxC0+G+9Dbse4ewQi9b+Q/KEDKFiJdjtfpfjbdRJ7bfmhmhoeRl5BDdMtqBY/ysPwp
         GdYw==
X-Forwarded-Encrypted: i=1; AJvYcCX1jg0ZkbXzfyLQOqyLFVS5yC4uHop+hq5BoMYaNWYw+mcf4yDlQ34sKNOgU8XvNgb47Z+C@lists.linux.dev
X-Gm-Message-State: AOJu0YyKbsZ6pSGtWW7VlCwPyHCsm2DM3GqUrCRJ59szqWJiSJ369ZM3
	AiJzQ3/BWzNARY9BjzP0v5XH7TJiUCUZpas1SNaPeu9TZN+YoSEoA6J/
X-Gm-Gg: ASbGncuq9nXPuiLsBvbvxzAPbOx1TAtyqKzyMEJwUZEYjnH6GcHRmCOrq1ccm3CQzQS
	3Gp0581pzWtdiRkDy1HZvhi7qOP2Phg8MU2MsyA7FewHoDG0Nf72gHAIj9H6oX52jNE9ePppgmS
	sSD5flJ0oWJkjniwy8Jpwy95DX+p0zrmzMhezcJGbp6rFo06OjmGHyhTNWYzBfYXllah8V8YuLY
	B32SFw0kKCTcADG7l+ZK3dxUDv9BemO0H16HlMmkb0p6Jj8TkD60cY+QMx4wjgorSShz3iGizxQ
	AFnX0d9cxzO7b0auNe5ZGyFRg9WC7rlqi8DJszK+DhEH0FFb8FMSC46o0Ol7hhIZFvKhKrvijYm
	E9/z9yLGwWq10qRVYEPLqrnOqpTuryKstqmX2KDyEsb/brDUfJF2U/l07isODsMQ4h3bmNSjyDG
	2cJdADDNcKZm8pQW+py1GrFIKdcZzp+JWvliui53wMjmX42k87mW8=
X-Google-Smtp-Source: AGHT+IHBUEbYkxJaVsA/zBTgJe8/H/sEcBnHGISwxVU3+cajLhUyQv9YXSpqaHkdOjyO4eiZ0/Xsyg==
X-Received: by 2002:a05:690c:6c0c:b0:78a:6dc9:8801 with SMTP id 00721157ae682-78c0c285f98mr45923627b3.51.1764851611217;
        Thu, 04 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4d22bbsm4914897b3.21.2025.12.04.04.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:33:30 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Date: Thu, 4 Dec 2025 20:33:22 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 5:06 PM, Vivian Wang wrote:

>> +
>> +# $(bindgen-backend-option,<flag>)
>> +# Return y if bindgen backend supports <flag>, n otherwise
>> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
>> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))
>>
> Can probably be simplified down to:
> 
> $(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)
> 

bindgen is sensitive to file extensions. If the file is not .h or .hpp, 
it complains:

panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
