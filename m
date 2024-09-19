Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DDD19992E;
	Thu, 19 Sep 2024 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726765138; cv=none; b=OGFYvhLpt3j9cfUQM+e/0iCKdV2IZd/K6kZcI9AVeQePaQUINpXskwJjl764l9HSaaWkhI7Dq8svT9+DdgTdYJcaWT4LhVGn2X1xx50R8lZZRCADnNGSa5EQKSMKbpFc6OBJv228+OwMaQAuGLv5562NYGk9EL6RR2e4O38iYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726765138; c=relaxed/simple;
	bh=PfR3/HmcUIVzXWSn7odYFMbCiH4SxtzEjt0v2ntShuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ts/5F8YpwKgLRNqqsiAyNhUKnQmGQPFT6ua4CSYwzRAnYqDXPWC0u0JFfodS8SIsyXZmt+PRhRHVICvTE8TdwsfmfWEcBwkDHcnmF0EtC7AYHI94xD4h1+8hmh+b0y43EoDlqLpyitiQXnsShlG8zl9Oh1DRPuEhIVsivuJ4LOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjF75FHl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjF75FHl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so9294295e9.3;
        Thu, 19 Sep 2024 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726765135; x=1727369935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+tzXQdEW/38DDu5IJpN7fDMm3pCd35uJLpLMmrIQi8=;
        b=cjF75FHltfUTVOTI74GwIgPuuJfpDQvbr2uQQGzKtLeWAObaZa2GKrTfJYGer1kbjO
         l1CjbUJ85/doLi2N+4SJk7+RBKunxl08M/WY//b5il/wrvvnL8b+j/1gPD3MKewhe2Sw
         ceueXKWdVobKujwcQ/MDww3v0RCSGKPqQkQBr7hGyphRb3n5B3n+h1uY0WeWVuZPN+7r
         PtBuH2VjtQl7JPcZMduh2Qq9aVzdv8X9TEliuaylR92paMsq18mUkoFlmWO/8NMZiABv
         5SuOLJtDlSSqDEIOTJWbyoQZ60qcgM4SAKeRejHJRvH70QO9PiTqtO8kq560Jo93fE5H
         xLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726765135; x=1727369935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+tzXQdEW/38DDu5IJpN7fDMm3pCd35uJLpLMmrIQi8=;
        b=aSiEqvbg9j1RvDAawQORWTFkcUcn/B92tdWu9umZUMorK2/hv+U+0TnEhPmPvMmRmr
         qZgedIFgCVDN2SCmzaej/JuVFhTC0EZi9RcJBJJcvuU5UoaB8LqUd772SMpJwehsSLCr
         Ad/iEGqni7FqCQ6CR9+7yxMsUK1RzqYST105tbAS2jqriFs//rCDUBNZFQw1ZI87Gz3L
         r45Q/JmzQt7ZNukGgsoJyNV7udhTCDx4OGxEpzum1xFWfrHc5wigPizAnnX4Hg2fgLEP
         3W0lQZtgtm3V1h9CkYL3FbYSxq5xUQMFnulGIVW58Py5upNIpzDbbURd7X0VWA9Q5xjh
         mrGg==
X-Forwarded-Encrypted: i=1; AJvYcCU/VvSmRgloKDFP/Kl2th1YI5emWySnil4LUe7mlxNqAWfohdpiZkm0M69556dqoAlpJt5d@lists.linux.dev, AJvYcCWYzcEzVxyL2XdHNifj+d3jiCPwA0JOVZstm5CJvTDl7eW9ee/GI6ITWSJDSTGX8NXGGbynoBIpeN8UEEaphw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIb15a/6Wx0rlOuZ+8y6Kum1SRK0Xo4tCuEhMblb7T+Z5bqD1z
	+EuBSEoKD11Qfk5kzK6ItMk0AuXo4m+F193jYvYeinLH//w8lPJW
X-Google-Smtp-Source: AGHT+IGJFVk86mlf2W401chCJXvIoaCpIV3Fsk4yvGGJ7oiuCp4IoqAzIgS4kYMXhhLjuyU+iYnwew==
X-Received: by 2002:adf:e7d1:0:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-378c2d6165amr13847582f8f.49.1726765135285;
        Thu, 19 Sep 2024 09:58:55 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:452::1ad1? ([2001:871:22a:452::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f9b10sm15630208f8f.59.2024.09.19.09.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 09:58:54 -0700 (PDT)
Message-ID: <f994bff3-6e0a-4d57-9c86-257c304f513c@gmail.com>
Date: Thu, 19 Sep 2024 18:58:52 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: fix `ARCH_SLAB_MINALIGN` multiple definition error
To: Gary Guo <gary@garyguo.net>, lkp@intel.com,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, palmer@rivosinc.com,
 rust-for-linux@vger.kernel.org
References: <202409160804.eSg9zh1e-lkp@intel.com>
 <20240916003347.1744345-1-gary@garyguo.net>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20240916003347.1744345-1-gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.24 2:33 AM, Gary Guo wrote:
> We use const helpers in form of
> 
>     const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
> 
> to aid generation of constants by bindgen because it is otherwise a
> macro definition of an expression and bindgen doesn't expand the
> constant. The helpers are then have `RUST_CONST_HELPER` prefix stripped
> and exposed to Rust code as if `ARCH_SLAB_MISALIGN` is generated
> natively by bindgen.
> 
> This works well for most constants, but on RISC-V, `ARCH_SLAB_MINALIGN`
> is defined directly as literal constant if `!CONFIG_MMU`, and bindgen
> would generate `ARCH_SLAB_MINALIGN` directly, thus conflict with the
> one generated through the helper.
> 
> To fix this, we simply need to block bindgen from generating directly
> without going through helper.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409160804.eSg9zh1e-lkp@intel.com/
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/bindgen_parameters | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index a721d466bee4b..b7c7483123b7a 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -24,3 +24,8 @@
>  # These functions use the `__preserve_most` calling convention, which neither bindgen
>  # nor Rust currently understand, and which Clang currently declares to be unstable.
>  --blocklist-function __list_.*_report
> +
> +# These constants are sometimes not recognized by bindgen depending on config.
> +# We use const helpers to aid bindgen, to avoid conflicts when constants are
> +# recognized, block generation of the non-helper constants.
> +--blocklist-item ARCH_SLAB_MINALIGN
> 
> base-commit: d077242d68a31075ef5f5da041bf8f6fc19aa231

This is also needed for 32-bit ARM support.

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

