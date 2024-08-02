Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB51ABEDC
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 21:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722633592; cv=none; b=KtiVZRCQwzK3bdbImee1ynO0ubNhr1BDMVYbzwMP6Wposg2BmcbKBR8FBor0875ZZqzsjKmshVuhT3/I8TdL857WxdUNDSFhk4d9jf33Hn8hlk812nypj3cVbzo4KtoGTPesNi7TbJ/wI1zoJ9T1cTfRsPeJZuTPWSv3EEyj2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722633592; c=relaxed/simple;
	bh=BdKM1YAh6SbXNwlF9dZikTa3D/XtN/zpoQ8J0VV2zG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rd8ey6W+C6qyuzqBaS1GEph08UGaq2ZaQtDqsgS71TLwnigF/5WocjIQfhvQKwaDxqMfBCrY0leiSz4TtATxC6MZi0nIWM6CwvTG162ALIFsavp5Mte5TESpj3iaeoR6AH1o+/fk3ShQNIpq87TTwTxLjbmfweFy7qCtxoSKRNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S6dNwtK6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S6dNwtK6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb57e25387so6544336a91.3
        for <llvm@lists.linux.dev>; Fri, 02 Aug 2024 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722633590; x=1723238390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vT6rtMiXe3cVV93nXqn9P1Cf/ISdlIhsVzPvH7Eul+E=;
        b=S6dNwtK68XTys9j/cl1UwWhvnspl73u40X4Y0BlqVBtU3whidRwHENtFvn/Agw/4R/
         3VdpFeser51mBE2isa2h1l1BnI/It77I+qc/dxutONk3FTXqy1Cf2gCXE2vwBD8bNDgX
         s8WssoOunSUodA2aWI/7p4bosBzAR6ind3GO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722633590; x=1723238390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT6rtMiXe3cVV93nXqn9P1Cf/ISdlIhsVzPvH7Eul+E=;
        b=GQD1NRKWgB3aGdeVQybPB+DjvNTZrtEGFJJyBRBJS5ppp41sbE6Epi4ug8SqqWkiyZ
         ET/XwthsVkVyDa63SvA/AsXRm3p0u0S4slCQTfPtKgxOJJShvcbWhFcjhPjNUsRHPlk/
         fxEUHHvBU9exClxEZwPQ2QR4mBnD9wTJumR00LXuOCGMIKzkQX/H3rUAPtn74xoteldf
         kfbjn7EIHffzlGm69mTB2a4KZj6+r27eaiTUHdMJkanOkxZPda7iSJIRzaN6HkttZTWA
         ixgY+nCueh7ZCTd+/u+/i9zDehle2wY/WoTh46NH3MS/fAA1vRUb5dcuDm4q3b2HIndP
         wtTA==
X-Forwarded-Encrypted: i=1; AJvYcCWMA23mMTcFELqWTZuZjnLkeRwsoyJD9N1KMeR0CDz5ss2ed9Y+dzHwzn35ZHbzsGzhx5Nmg6RvMW6mgHXS0OThk9QdQQ==
X-Gm-Message-State: AOJu0YzqaBAj4OYKjRP0RqAoqfdw6EWsHhwL6BOmEi9GbRmU7QIrLFqG
	bLe3koYgc0WG29e5e6LX02X9b6vFRX9m3MHOc6oWnkJChswhGT8mrR0nPnSHUw==
X-Google-Smtp-Source: AGHT+IFTYF2Do8vdPQ58bSKEPsVr4yMiIg3mBK2cU+kX+qNSL5VkCcGfb7nKSyPN1XIST90Jc3L+cA==
X-Received: by 2002:a17:90b:489:b0:2c9:6a2d:b116 with SMTP id 98e67ed59e1d1-2cff940e469mr5948292a91.7.1722633590238;
        Fri, 02 Aug 2024 14:19:50 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:ac3b:d38d:edce:bf32])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2cffb091391sm2228821a91.18.2024.08.02.14.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 14:19:49 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:19:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 3/4] cpumask: Switch from inline to __always_inline
Message-ID: <Zq1NdFXhN3IoYm3M@google.com>
References: <20240719005127.2449328-1-briannorris@chromium.org>
 <20240719005127.2449328-3-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719005127.2449328-3-briannorris@chromium.org>

On Thu, Jul 18, 2024 at 05:50:39PM -0700, Brian Norris wrote:
> On recent (v6.6+) builds with Clang (based on Clang 18.0.0) and certain
> configurations [0], I'm finding that (lack of) inlining decisions may
> lead to section mismatch warnings like the following:
> 
>   WARNING: modpost: vmlinux.o: section mismatch in reference:
>   cpumask_andnot (section: .text) ->
>   cpuhp_bringup_cpus_parallel.tmp_mask (section: .init.data) ERROR:
>   modpost: Section mismatches detected.
...

Hi Yury,

I'm wondering if you've had a chance to look at this latest series. I
believe I refactored it the way you recommended.

Regards,
Brian
