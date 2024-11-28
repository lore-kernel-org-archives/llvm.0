Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC81494A7
	for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732781897; cv=none; b=Atm+s/al4Kw3BBnjSTSQLhuISTHoUrrfOn07iWZcrFsgUICCIxw/pEroGCC70URXkaCUFCUt5AuASS94JHkfxC+J8wFWFMi00Z553eJcUydSkF4TQjrGoxq2VKcNIC1rsdf10Tzt2NLvk7bdFC4dbTITdMhwNsFBI5yZXurV3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732781897; c=relaxed/simple;
	bh=yiCeSBGXf1KMxfhU21keDJvktNwDMa5XEoSlV3Nu0q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt8DkTUyStWk0em4zXE2hW2COh0gPwmIJpiLhKIuvPG0OpASEeT9ReUhq7BxvIY9+NkIOzZDGG4UDprEmM83sxPGYRFNNxljHeJp2peXS9g1XcKXQyrxvKGkOLLYzBeGvYuzLhLd3bZ0c/5UzZLj4Js3GpeSHTqaGzMfsMfP87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Re6N1lCB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Re6N1lCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732781893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk4a1vtkFew5DHjLcy2S4AhcY8OdDJOXsxrrwd1OkwQ=;
	b=Re6N1lCBzOrKgbXPSoaZFiWNSdXTeo2UBM3dDe7hovW9U2ufSmMOH7ii9NsOa+Tq8H5ZiX
	HSagb8+1eM/32LHQ6Ezmk9gWP5lU6Cz/aNUkkPqROEUK4qySSYwtDmlRUr2D1lvTluwm7n
	qUdAP9bVhE4bjKB9GFhyAnBqjX92XuQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-4SdbNQfMNaSdCEATtr0RKQ-1; Thu, 28 Nov 2024 03:18:11 -0500
X-MC-Unique: 4SdbNQfMNaSdCEATtr0RKQ-1
X-Mimecast-MFC-AGG-ID: 4SdbNQfMNaSdCEATtr0RKQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-382440c1f83so862473f8f.1
        for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 00:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732781890; x=1733386690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk4a1vtkFew5DHjLcy2S4AhcY8OdDJOXsxrrwd1OkwQ=;
        b=fF2Lnb9TxFmbvKOV5HqQlmQEZD8RnJdRCUKxoo67G4cDyBILpTlIzFqB8rD2KtUd8d
         FulGLtP3peDoeuvDshtVMhJQr5QSgsmiotoL7rno/4aVQ18XawailG8NSzd7xeJvTDjr
         e8qCe1Yw5nGhydd6pb1MHZJl70532l9b83nZCc2ni4TqhBpTGSh7NQmo80Abe1uCS0SB
         h4lxNV+Zx1xSP2qslHGAKYbV2HLJ6mCKHzqWn5Cy3kzmr1ry8tJDsStZrhXO3Npo0ZhK
         uO95yALeXk/7hS9tPSbmz2e+q1G6HF0P5lxkK2eiRRT+A8hK9grLwHsT6umEI3D5HpzU
         ubpw==
X-Forwarded-Encrypted: i=1; AJvYcCUOXRQj4EAAubLxMQyxlEqVb9w/4WEYtg55IhY2TX1ktWbvQazxmmIcAbzohlL+dB6qj2QS@lists.linux.dev
X-Gm-Message-State: AOJu0YytsHS/f6QXgxagqxTwaXOkKJkjpcoO0YhecXUuP9uLnfb8NLoE
	mnTxmbF0b67avt7sbM6EyjNsSILgcK/LgonJyeUtJpPnXxoUihQMCgjiVBNoHR11Tmr+h6MXcAm
	1+TvJxzkl7i/ww6NUdEGO/SsHRg80BgABI3MGRbB6bWb199NFgmk=
X-Gm-Gg: ASbGncuskmeRs6om6v6d1ltPbETHC9Ny9rOwIcjeVawQL0g/P9b+VuHMat8pvD68TTS
	F6lt4Ww/EA4+jGIgpjQ/wIuCEAlNq3MtaccgVTZ/nZJI5vo+MvgMfkvY64bB69D0hR/7+PwQ0Du
	Oiu18aHBh/vZBcPMevB/fs6R590zz1gkVVEsJQGIkGCCmNK0jDO/qsc22aMpnkQ1WdjliXy68b4
	F+2M9d2cyqJG612mMtK6yE2KNIUNtyzv7cVOHxc+s/SQ7P4rkKpcVTNQ/0xNaKhqm1Iy7d5ZJve
X-Received: by 2002:a5d:5988:0:b0:37d:46ad:127f with SMTP id ffacd0b85a97d-385cbda2969mr1891970f8f.26.1732781890486;
        Thu, 28 Nov 2024 00:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiB+KlnNgeGF4jukNPYnw3UquzlV4c1ZjkZ443v33BuNe7GO30hwqhse5NtZ7b/vbBCoAnKw==
X-Received: by 2002:a5d:5988:0:b0:37d:46ad:127f with SMTP id ffacd0b85a97d-385cbda2969mr1891928f8f.26.1732781890115;
        Thu, 28 Nov 2024 00:18:10 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36557sm980405f8f.24.2024.11.28.00.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:18:09 -0800 (PST)
Message-ID: <70cd1035-07d8-4356-a53e-020d93c2515e@redhat.com>
Date: Thu, 28 Nov 2024 09:18:07 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net] ipvs: fix UB due to uninitialized stack access in
 ip_vs_protocol_init()
To: Simon Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netdev@vger.kernel.org, lvs-devel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, kernel test robot <lkp@intel.com>,
 Ruowen Qin <ruqin@redhat.com>, Jinghao Jia <jinghao7@illinois.edu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20241123094256.28887-1-jinghao7@illinois.edu>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241123094256.28887-1-jinghao7@illinois.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2TBRcg7UHo2M1GVzqVl2n8zR6VAcqNVM43hQY1BjOko_1732781890
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/24 10:42, Jinghao Jia wrote:
> Under certain kernel configurations when building with Clang/LLVM, the
> compiler does not generate a return or jump as the terminator
> instruction for ip_vs_protocol_init(), triggering the following objtool
> warning during build time:
> 
>   vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to next function __initstub__kmod_ip_vs_rr__935_123_ip_vs_rr_init6()
> 
> At runtime, this either causes an oops when trying to load the ipvs
> module or a boot-time panic if ipvs is built-in. This same issue has
> been reported by the Intel kernel test robot previously.
> 
> Digging deeper into both LLVM and the kernel code reveals this to be a
> undefined behavior problem. ip_vs_protocol_init() uses a on-stack buffer
> of 64 chars to store the registered protocol names and leaves it
> uninitialized after definition. The function calls strnlen() when
> concatenating protocol names into the buffer. With CONFIG_FORTIFY_SOURCE
> strnlen() performs an extra step to check whether the last byte of the
> input char buffer is a null character (commit 3009f891bb9f ("fortify:
> Allow strlen() and strnlen() to pass compile-time known lengths")).
> This, together with possibly other configurations, cause the following
> IR to be generated:
> 
>   define hidden i32 @ip_vs_protocol_init() local_unnamed_addr #5 section ".init.text" align 16 !kcfi_type !29 {
>     %1 = alloca [64 x i8], align 16
>     ...
> 
>   14:                                               ; preds = %11
>     %15 = getelementptr inbounds i8, ptr %1, i64 63
>     %16 = load i8, ptr %15, align 1
>     %17 = tail call i1 @llvm.is.constant.i8(i8 %16)
>     %18 = icmp eq i8 %16, 0
>     %19 = select i1 %17, i1 %18, i1 false
>     br i1 %19, label %20, label %23
> 
>   20:                                               ; preds = %14
>     %21 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %1) #23
>     ...
> 
>   23:                                               ; preds = %14, %11, %20
>     %24 = call i64 @strnlen(ptr noundef nonnull dereferenceable(1) %1, i64 noundef 64) #24
>     ...
>   }
> 
> The above code calculates the address of the last char in the buffer
> (value %15) and then loads from it (value %16). Because the buffer is
> never initialized, the LLVM GVN pass marks value %16 as undefined:
> 
>   %13 = getelementptr inbounds i8, ptr %1, i64 63
>   br i1 undef, label %14, label %17
> 
> This gives later passes (SCCP, in particular) more DCE opportunities by
> propagating the undef value further, and eventually removes everything
> after the load on the uninitialized stack location:
> 
>   define hidden i32 @ip_vs_protocol_init() local_unnamed_addr #0 section ".init.text" align 16 !kcfi_type !11 {
>     %1 = alloca [64 x i8], align 16
>     ...
> 
>   12:                                               ; preds = %11
>     %13 = getelementptr inbounds i8, ptr %1, i64 63
>     unreachable
>   }
> 
> In this way, the generated native code will just fall through to the
> next function, as LLVM does not generate any code for the unreachable IR
> instruction and leaves the function without a terminator.
> 
> Zero the on-stack buffer to avoid this possible UB.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402100205.PWXIz1ZK-lkp@intel.com/
> Co-developed-by: Ruowen Qin <ruqin@redhat.com>
> Signed-off-by: Ruowen Qin <ruqin@redhat.com>
> Signed-off-by: Jinghao Jia <jinghao7@illinois.edu>

@Pablo, @Simon, @Julian: recent ipvs patches landed either on the
net(-next) trees or the netfiler trees according to a random (?) pattern.

What is your preference here? Should such patches go via netfilter or
net? Or something else. FTR, I *think* netfilter should be the
preferable target, but I'm open to other options.

Thanks,

Paolo

