Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1954283FF5
	for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069634; cv=none; b=VfvwKiwLYuSPWIkClA4IzjhDq7B9Lu4+UEiXJIVydmYhS3JQcCbxEXhALOSXusigp4kbIRpgdHAl/tTxxIoeZtzMksFQWeHCDghioXogYBDZp6KQGjuC1S0S3mvw62A77E3VaqfMmSudgO6OJNDYZZgR0mOc7bQKVdMZhULuW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069634; c=relaxed/simple;
	bh=a4+h+unp3TP1oyr0yJ3XjFYwuxew3KdwZUR593H/1O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv6xNsaL0pRtc/FFZgV2hWD3Hb7eYZ3LJiwVwUpugoV4TKaLX3ozI/mbEfbhWsuDQLH1Fb66Jk9bQT8sjyy43axQTjzyB2qPF7ZVFhwB9hV7Zr+FQxgyKiUr9nmpQcn/hMkAgjzgbG+mvnR8Azaqg8pAOCX4NMANYW8jtBUXW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVspeCve; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVspeCve"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-794e300e20dso3320006b3a.1
        for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 03:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069632; x=1764674432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVhOQpkFhqqTf3BtOV6vobGzp0Wpfer3ElYSjbBrdyo=;
        b=mVspeCveBdrJCaoFJi2NCHM4qfcTHAaX2IkamXQtfRg7kA4DLdoSRmL4L5yvi3UgTE
         /X28JlKKGZ9SvSCyyUND3x/gW+nn4CPAS3gdwGZ9RvpEo+gSkG6e4AKziVJqi1uRsRZM
         +CWhknKeeGI0dH3eUQG1IH57yz+3VQQsUmjG3kZ5D0gH+ln6HGm/iB50yOI9dUh/zz9e
         Ju/gXkh+n/YtOn7e3GtTAeYhocDxNxPh4BqykMGy1pgybNmLGIm1hq8SXVwqUVt5nCri
         c8i1RPnRreKYR3u3RidMjH0NAOovAfb3dalzcFb2xuD34FTN6iuE3XXfY69nV/i7BnD/
         +YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069632; x=1764674432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVhOQpkFhqqTf3BtOV6vobGzp0Wpfer3ElYSjbBrdyo=;
        b=BKzzuYtL/TFNYKatdVvdCcvb8F9s1PvGN8Sxde3WceI8PFgctzoxrVd1MiYernoKU8
         ncXjNL9gNTq6aHZisEDZf/DMA3FnmgzD6YYYpPnU7zjuHzgpkQNInfryU8gmd9KDO/1k
         OfOm+5weFXY0FmC3idnfixLrg94HCgMW60tnqHZRBT0lPdtzGFcy34BVUN7+erSLO7Ku
         IeiYYl+ReDPCj7bNpcojt4JSNzYnp34mTKnGAbmJ5Xp8lHNH8DiVDgIuq+mpI13Nbr4g
         hUTnLCunG/ZOmm9miGyjjeQp+3x2EIAWqrqg8VrZF6lRDXD6+EP3E9MguJriPJrY8ngm
         WuWw==
X-Forwarded-Encrypted: i=1; AJvYcCVt4YofQQD1dqh+0FMt5S8TCkpKWKEHKBck7KfiuXrsrQLHSeVi1CdS5PC1JLsmdnG+O1j8@lists.linux.dev
X-Gm-Message-State: AOJu0YyD1I1+nFGEsQdrZIWHoraxzANDaBmAdR2C+q+nelCaJA5ZSaHO
	wBr8HOMRAYxfEnDJ4Lq0OBK5sYUt2B/kdI77i6ZM9ODbm4UZ0ok11rKc
X-Gm-Gg: ASbGnct8GRJPgjocUPS44bFt2jT0zH2+Pye2Pp78zqX4O+9WfBC1pkskhOVIiCdchdz
	seI7LkvgFtMXltVuPUIT2n0NUXObAytnsWimfrG0vImlmibSWzG+9GzLKnQv7hyqCZtlSlHgRBf
	fK6E7BVjqBoD+4pt56HoDTw+LEgKG+uMmbxNl//yk06VGWbbK3ltX1Mb3q1vng6Ik4ovkcGOlVh
	L96BeRu+9PwiQHzpi+bN079oHvrrv++JiO7sQKqUs5RGDAA960b2lUg6bxMj6lw8qi3kBWaExXm
	ebjMfnl+8t0EPtf5/6awLfwBtAJtw23qFCU4C4cT0yvfN2iNmyUqMHcxqZ55UXPyAvKcDXWiWeS
	Vh0/mo3Y6xQH017F3FUPJHcYyhGllGeuaLv14g3wQQCF7EuKJd6fnTmSNj/nBTgcsOu4VuIsIjZ
	U+7m9YBPj8Inj/O8Fw25uUr8TM35+TLfeLrg/N5aAnfDV2mHW4nWX86BYRKP0wjVog27HKFW1JS
	bj8TJUp/LDQkSV3
X-Google-Smtp-Source: AGHT+IHceA3bqsPjmyCa2TPF6zTj0bq2CPgSfhCVMko2nEB7fZ8pj+ZsS/cB9USjHK3Gmjz3R3UxLg==
X-Received: by 2002:a05:6a21:99a5:b0:35f:31bb:5a5d with SMTP id adf61e73a8af0-3614f227b8fmr16367798637.2.1764069631818;
        Tue, 25 Nov 2025 03:20:31 -0800 (PST)
Received: from [172.16.132.48] ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d70asm17822575b3a.13.2025.11.25.03.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 03:20:31 -0800 (PST)
Message-ID: <8e1ff2f1-b45e-4b1f-b545-d433e277607f@gmail.com>
Date: Tue, 25 Nov 2025 16:50:23 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
To: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev, khalid@kernel.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jiri Olsa <olsajiri@gmail.com>, sam@gentoo.org
References: <aP0-k3vlEEWNUtF8@krava>
 <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Content-Language: en-US
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/25 2:42 PM, Nirbhay Sharma wrote:
> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in the ternary expression when compiled with -fcf-protection. The
> probed_uprobe function pointer has the __attribute__((nocf_check))
> attribute, which causes the conditional operator to fail when combined
> with the regular probed_uretprobe function pointer:
> 
>    seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>    expression [-Wincompatible-pointer-types]
> 
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
> 
> This error appears with compilers that enable Control Flow Integrity
> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
> on Fedora).
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>   tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>   		ASSERT_GE(bit, 0);
>   	}
>   
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>   	ASSERT_GE(offset, 0);
>   
>   	if (variant->uretprobe)

Hi all,

I'm following up on this patch that fixes the pointer type mismatch in
UPROBE_setup when building with -fcf-protection. It resolves the
incompatible-pointer-types error seen with Clang 19.

Please let me know if there are any comments or some changes needed.

Thanks,
Nirbhay Sharma


