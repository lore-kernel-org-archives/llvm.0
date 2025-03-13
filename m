Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD51F1521
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741894879; cv=none; b=VeQZ1vyhVktWzZk7/yCc9J0z1zEPN1UYgoL3ErbZ7U56qjq8wTUkRwUHyv9KSyhOVzDjpi7AuczYTMNkLdG6o3NgvXuhb7btR27x/BHNG38okDTGC4Zp2pRNd8rr0VZg4Xcw1DB8ZSNq62RFan2xoDb/DBr3wmnFM0n6UNJWNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741894879; c=relaxed/simple;
	bh=WUH2ocflO1cNKNmhbkDZJYgN2wbCaTQAVsBuQZ+M57g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5d5vgYtZGcNhXAbk4IZ+DblXpopktAwql7iEH80AME/Q+J5bETqMDdQ6ie7w7z1o4F/8LKM1/T+7kfEBLwJ0j7iFAIvNCOrDNt4ZIScFMKhm3McOCPLPz9BM2Fa9LZ1X8FXJ67D5ZOm/cn4O+FF5WNO1OAK+mtQA2Sk9aWt+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6hO4BlV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6hO4BlV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2231841a12.1
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741894876; x=1742499676; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXEzxEd8+oNnzMOAtWoRdYumhlynnfDozmjfwkSl2KA=;
        b=I6hO4BlVHDyaXvfV81nR8Olt9rYpAcvd0c5/MKjjilh6VoiV6S1JAbIopq5zzTCd04
         q43gjyz8OZFocq6LZwjf6f8gGjuCSA/me0XlhAdyuHmu4jiyDCGVR83Ie/4BWLb94bB9
         FZhKJFoGm7FeqXj2zt5KXW9kDKkWH0pneyr8Q6pWsEnN+emYK7tFvb3OaM8bpLXE7Q3P
         ZK0oobSw8InPxDFYSoTURq8cYO5yGZzFkNuncivXWXN6j7KlTDKmDWOIZ1ltWa9EtYln
         GT5xZUpqEvor+ijXp02/NMeJ8/M/5sotD1IiXKwv42TCC3Ir6V8LO5WATxNSdz6RQwyS
         bBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741894876; x=1742499676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXEzxEd8+oNnzMOAtWoRdYumhlynnfDozmjfwkSl2KA=;
        b=UJ9/CPmyz8DuccU9Xl5mQISiWbrU/oYPE/0eBbA5UR7gq3ktFgbjMRaDzseJt3cxa6
         7/C3i1PlG47jzRgW5E4z86g45j4kx5DwrzlGplLPfZfpPcNg4/xgop+TTvvV0MKkMVb/
         MJDbbIR24fnkvSZDo+Gu80HkdRYnh6jMBaMC1K1ONOogYuVSdVGl8+rAF1Z4xb2ryySq
         LeyNJ/PGNxkdz861/G0fXu4yO+Jh04IdXTIGYFLmsImKYzNrJsi8vcEmUEEX2DN9Q/iT
         s+/yC2q6ArcLpFk2mxryluOZf3JI1qBsP4gmSK4QCWXmVEybEMnt4U/7OTlIrBm6PJ7+
         d90g==
X-Forwarded-Encrypted: i=1; AJvYcCU2iZc8dDBuFJOSm22rWlLDy6Z02nb7WVujO5HPkS1F3ZTSxbEzngVxnaZAzzFGxXS0l+FJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzLf409oXbvBUW5KF1sHWupCunLAHRS/Uk/aLnKcQOeglkgnDSD
	O4dIwFI0pBK0pVKpXZQMBggF2gUhyT97yADYnQLBCpVSxXSipZ8K8dx8TIDo
X-Gm-Gg: ASbGnctHDK9Y3VnkLhX7q0NGnrveqYwlxGMEfgqzwZHS4Q5vs0lkhib9RZi0Gg/Dle+
	mgXlwUPbiAR0VoklKvOQ0+rvk4M0kXNM6Cua59DUm1ABEdgKCKP/0/AQ+FaPGCh8Wqkzd5pHULb
	4GffvZqa5UefJ4bmQ9AXvs8EM2kIUID3C1UyZKQLHgwIqCwkH8aiHzXFT6eWMD9Zm+Pj40a062p
	Khfrv+YluENcJszIqq0xtNgqKPQLcNun3LhlJFSLjclVch97o322xkCVW/wIVaBzboJhhqg+Vsq
	RJhvCTMqmqkk3Hps3ieeT9a1x7wZo/sMjoy18vsOyM1SHJpczlFmq5XA4g==
X-Google-Smtp-Source: AGHT+IGVbzc4ZfepwBe4lwL/vFzF6ib86XY2NgsOo+OqcPI5LcBFDNIpsOtJiAgTucImNxYYSmd+dg==
X-Received: by 2002:a05:6402:348d:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e87c45f948mr637025a12.25.1741894875982;
        Thu, 13 Mar 2025 12:41:15 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afdfd0sm1072154a12.75.2025.03.13.12.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 12:41:15 -0700 (PDT)
Message-ID: <9a516b5f-8509-4643-9c54-26caadc42348@gmail.com>
Date: Thu, 13 Mar 2025 20:41:13 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: task: mark Task methods inline
To: Panagiotis Foliadis <pfoliadis@posteo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250311-inline-c-wrappers-v2-1-72c99d35ff33@posteo.net>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250311-inline-c-wrappers-v2-1-72c99d35ff33@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.25 4:05 PM, Panagiotis Foliadis wrote:
> When you build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> toolchain provided by kernel.org, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*Task | rustfilt
> ffffffff817b2d30 T <kernel::task::Task>::get_pid_ns
> ffffffff817b2d50 T <kernel::task::Task>::tgid_nr_ns
> ffffffff817b2c90 T <kernel::task::Task>::current_pid_ns
> ffffffff817b2d00 T <kernel::task::Task>::signal_pending
> ffffffff817b2cc0 T <kernel::task::Task>::uid
> ffffffff817b2ce0 T <kernel::task::Task>::euid
> ffffffff817b2c70 T <kernel::task::Task>::current
> ffffffff817b2d70 T <kernel::task::Task>::wake_up
> ffffffff817b2db0 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::dec_ref
> ffffffff817b2d90 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::inc_ref
> 
> These Rust symbols are trivial wrappers around the C functions
> get_pid_ns, task_tgid_nr_ns, task_active_pid_ns, signal_pending, uid,
> euid, get_current, wake_up, get_task_struct and put_task_struct.It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> After applying this patch, the above command will produce no output.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Cheers
Christian
