Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B3457E69
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789127860; cv=none; b=cGhKvzeheAc2vch+JjGwmA/ijdNa7u4aLUxPBp17bJlY6I4qJVnGiwKLYYHdCJto8gPzdFDMIk/T2WLOybBM6QQ3g8qqQaKqRKKwpFKRjA+CRMSzKYMgBChWj6svopqK6OJHIB6vCcFYl9cRgufSL2A1boLibVvD/YQK6mvWrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789127860; c=relaxed/simple;
	bh=1lRC8ZGjaJk1CFMMkFB+zwt0ch81ggJd9O2XFlK/4VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3T6JyUhl1123WWWhhVSYVIwWzUYvDjbEoVoeRqzPjFQLHcnRRePqixi9nqaIH3SW73NNH6+MlBbd/hpcUPlh/suTX8jUTWGJVdLgBg0zeN/jAsMyIZ0wwCzD7gjvtSG9A2fzX0TF64TanTymD+kQbmvxmSWry00YYQd2S3GObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dUAqQKqO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dUAqQKqO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso7558765e9.0
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789127856; x=1789732656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr7n2cO3L1gr9+vq7aPZsfQwfFiNJgEahYqoxuJotBY=;
        b=dUAqQKqOVyGgapLoqXc6fHZzo0B8s38bInmc9XE7Sx1R84VkhdaJ4HJtHd0aHcrQwJ
         YG0muJeqxZvluQctpkQX9VVTM8yFlNmFk9/njKKdjNrEy+Pi8w1bWtj0+YKWinEyXPmv
         Ti8VIp6Ha017NYWeW80A1x9QRiQV6Fi4NoJm9xSmz7+ilQkjD7XCwjAo0JL1LLibKYwP
         TJlT4287SRxKGIs6ds6tozadfjweiY+M3S5xS4eZS5T+mDShZ1Vvm6DqOuiPeXxV/C9V
         kfN7Ujhj1FpvOwOARtQX0JfmWaz3u/Ui7zTYr9754kxfSMofYTQIv5jmXSJMohRw1JZw
         Zfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789127856; x=1789732656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr7n2cO3L1gr9+vq7aPZsfQwfFiNJgEahYqoxuJotBY=;
        b=IYU6J0cJ8ORHgvnox8wRAmah6dVUnE6v/J1LeCne0Qg8yOtIMpXiyVNzgnS5s7K4cD
         Ij7BiI5MivsOWyX3+0YN2fF2VPX/rzPP/yZXGZo6U4FH+7nA3XH+8aL6EELi3F+3jasq
         20AxN6jXMpOSoS8+eQuLvBKFnZLTr6glO3nLOGz/crL7CxKGF2FTM6z+NmbH0XQAEMuN
         v3yMZ9XF24EMab9uhIgEg5h5yQNgtFHqrL+WAgVz79LN3X6Ft+giFKX5p/CsiZhJ2kv1
         0Gy43GT/EpvZjPA7Mr7dBGH59WSkhVDUs16Jpg3ed2fyasiGlsbUYdGub4AYYuX4r7zf
         +Glw==
X-Forwarded-Encrypted: i=1; AKwUvBzcy+A+hUJIVfn8+uJND20F96yHXYXmRJ0XviOUpi5IxIExR+sF6RJT+kCAgyiBA9aDtuBC@lists.linux.dev
X-Gm-Message-State: AFuF++nODXofbdD283f5IVjkDYq/8NMwGF0/XSBRZUhBk8QPbXAh/8FE
	KyZWecKx7rB6aV2lrrm5WH9rzGEWp8o6Grj6RYGpAoLatnkZFNYOcNil6W2p7mDdf3w=
X-Gm-Gg: AYBFou2P3SJ3W2Z4Vdv7ZlH3iq48jetx7Qb3kxuX0d9vLHhkVe9ajNL0Q8BiKIo26q8
	AMApH2B1SszyZIqr7JG0rczarUY0rErvEqUU9l9MF9OvAet9e7HCv3uIZ5fqnzcHN96DMJ+CTCs
	SKStROoYw/Y0KOHdotcmBCT82DSqYhXJ8XSpZETf+RbkBgLJ1RrmBSMviGzcMesJ99NwsTYwdPQ
	A/Pl7e4j25aAeAhd+/QQ9s7BgKo9T5yXHsV08hwZxWQPP7yDx3BW72EDoVe8rwOwtr1Qz6RMkVx
	nahTSWxCnKWmR64j/XuzBxfZ/L5P7gIBh+fLflWM9ZtutpC6MiTSHJUXag3J/eKXjVDIvnC2DNh
	wfRzPUqijNJaYoFR1Cu29yPyP2UdaYm4UKFQgx1Unf4k5nxkUcrDq6/IUQyy0VK3bHE6XLfdosj
	HR/M4ZtcFgPK5GtS3mWhbHKQT+vLUR3KBBMUde/Y3ird6IR2RrmbvxRPd8xW8T47lVkGoAtyfA3
	pQD34pYf9Trx2Y/SkOb1VGwk2gQ2CSzaV3+
X-Received: by 2002:a05:600d:8496:20b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49e6199234amr30006585e9.14.1789127856324;
        Fri, 11 Sep 2026 04:57:36 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c300e2sm164777985e9.8.2026.09.11.04.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:57:35 -0700 (PDT)
Message-ID: <f24ddba6-b7fa-434a-8a2c-9f04af6969e6@suse.com>
Date: Fri, 11 Sep 2026 13:57:34 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] modpost: hash module source per-file, not per-byte
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
 <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com> <aqPYvKR_eRsFlEd-@gremlin>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <aqPYvKR_eRsFlEd-@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 12:41 PM, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 10, 2026 at 02:52:50PM +0200, Petr Pavlu wrote:
>> On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
>>> modpost spends a long time md4 hashing module source at a per-byte
>>> granularity.
>>>
>>> Fix this by doing this hashing per-file instead by accumulating a per-file
>>> buffer in parse_file().
>>>
>>> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
>>> with this change applied.
>>>
>>> This is especially impactful for allmodconfig incremental builds (where
>>> CONFIG_MODULE_SRCVERSION_ALL is set).
>>>
>>> Whole build, 128-thread Threadripper 9980X, best of N runs:
>>>
>>>                                          before   after     delta
>>>                                          -------------------------------
>>>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
>>>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>> ---
>>>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 44 insertions(+), 12 deletions(-)
>>
>> Support for the module srcversion is being removed in "module: remove
>> MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
>> be gone completely.
> 
> Hmm, that series doesn't remove the script though, is that planned as a follow up?

My reply to that series [1] notes that it should also remove
scripts/mod/sumversion.c. It should be done in the next version.

> 
> I guess I can drop this patch from the series then :) Also patch 17 I think?

I agree. The module srcversion is no longer needed since build IDs are
nowadays the standard mechanism for providing effectively the same
functionality. While I'm not sure when the mentioned removal will land,
reviewing and polishing this patch and patch 17 would IMO be wasteful at
this point.

[1] https://lore.kernel.org/linux-modules/4e321525-708c-4964-9937-d94ea27e8d85@suse.com/

-- 
Thanks,
Petr
