Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE948EC73
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993822; cv=none; b=JzvcaPIXwQeCSmC4EY6ym47gIk8v0JTiS+mtX6wlS75kdb7kYkWVRet/EI0RHlEKNsj66XIFngC/qu0dASOYvOQMH48vg+f7HxTPlKvokggzNU/S/9j+0pHIIwCd3I6ksFHuVhqUzBwzZLR5un2fU5+WmLoGhBamp7QM92NfBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993822; c=relaxed/simple;
	bh=qPuG5p0RFzxZ5A/zFAdZehA6Nlq32FKjBYxY1oi1wb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptMMS+DFcSZiqSHtv7++HFasckMC2KiTEWclftFfLEkeKRe8KCRGiwEXm1HpgX2VafnYil7uYLnZ99pTuBMwMY/EOwXRXrSRZlqyGBgMGoIUjQp70I1i0bbI4M8tPg/LK3+N06NQ1l4iRQFxwb8CN3R5ZpjG7zZ0m8qRR9h+gyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWTytNPa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWTytNPa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso656148f8f.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993809; x=1789598609; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02KomAtCOkWbCrlEbmnlwwKlgNzCkBBNmKfqlS9ULZs=;
        b=aWTytNPaflY0e2s1Jj6oCEJ39ycawKJdthFlEnQVqoS9GWnCL24XO3fRw+huNmXWIJ
         wpOYDOmCzodCVWelGAEjhrDNLBJkC0CaQUUZfinKnzM+XXE5Dn5AXq5ROUCKdgoQS6m8
         yQROknDx5wGUhc8p2vbFELnUoEbyY3q4kSDSxmrF6cpXL4qUlU8kT9T0VMK6JdWtKzLG
         uqf+5a8y0THBBUXG7C97Bj6ejb6y21NIFl7kG0SSWdgOYxq0GTv0GIzxr1p+ReQvyNK9
         EoaTVpUeQ23zkhWQehB3LZRj6yZUvlPXCzsZDYZVNva0waI4wl4/F/Jwn+xkCx9MqMoc
         1H3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993809; x=1789598609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=02KomAtCOkWbCrlEbmnlwwKlgNzCkBBNmKfqlS9ULZs=;
        b=JKK41kRx0RJiNct6lWtlo6Yy2ELqQFPAR+qmJ3PnFt2is/gnl/IqExiShe5vnrKVfi
         A5lgl38v1aNF+9g+BLN5mSQOe3cmgD5gSEhypsBtze6bFlPCPh3dGoVmceiMzGtPKk4a
         X5u/uBTBncLbFSfPPJ5F5mQDMCxrRVjs+Whf8LT1CaIOLHXswW44R6VFNRDnHJ1y1BxV
         TYI9X14CBP/riHhJHdHrIzcS9MlEViP8QWHFMjxLBTpxOOxRcK6DpPAVH7UGG+He483O
         3jHp8wCpT5upVu15qqTHvGufmidSUDLF8zkX23XJJJAN/y6aJMJRe8LfdkucAy+QRq8f
         hSfg==
X-Forwarded-Encrypted: i=1; AKwUvBzxvighS0dsSN1l7XPBEljywJwgj1exNbG+2OD2Rad+o9GbBzljsSRVJFA+EzeDezr+iQXb@lists.linux.dev
X-Gm-Message-State: AFuF++loyOWmcJlEzfFf6onMy0VodLm3xSFSA5hUR7/VNXys76jSZe8b
	l3Smrbwk2aobFIMWrwVNGgbFTj7fW+h0vgBQR4pyFBKcVP8Mrz5BMLuV
X-Gm-Gg: AYBFou1JYABotgNDrNJ6qtNlyXJPWfPTcfCOkXGbDdMtI/PvLXjM/rrAoiTPIcuCZdl
	89KiT/WG0Yy/QAfA3rFEu+mjjhKe8HJoAaaWhwRvy8YShWPb/KS25+BaTU2tLDpYv4+G/s4aOgj
	+SKXqdMVkAx4hcNx68Pzdv8s+nPbieB0bd/TUA6jgLaqchWDcK0qHNTZ7HRk+uhEGK5X2t29SDp
	IJX92MrFKUgiE2IuNcCEqcBep0+eipqWNTsNK+hejqlGWSvHjaWJtL1ybAQU8eJEfPflrAeLYVk
	/a7QZgHi50U7DAxtpk8onqP1IzccvmiMBDXxyFuRv8D5SN6bMLjFi1cq5fRY1e8oSaXZdMmk+Se
	HivAZSaTflJhcfYLDKwxWFxcbrD2UH+VZ/ckTq6h2hilT1FC7O8H6DV2Do3ngICSrHJQFkw7TbQ
	G1Qgp1JeSov6RPvK1E3JuX0XDT57+kpYArg2/ovMLYufmS62cgIUwpX4FyE3SVOmUWSdVYqvCm+
	LDDOf0LMoIVFfyBXkowkBiQwjj2OM2HsfnbNolag8P92SEirOE6XnZ1+xIk3ME28RU=
X-Received: by 2002:a05:6000:2313:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-485c23ef4e3mr7849785f8f.23.1788993808575;
        Wed, 09 Sep 2026 15:43:28 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm46358486f8f.14.2026.09.09.15.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 15:43:28 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d3addcc8-070d-40e9-abea-ca23956d5cc8@gmail.com>
Date: Wed, 9 Sep 2026 23:43:27 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: preserve the final answer when input has no
 newline
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev
References: <20260907103739.23212-2-hexvalid@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260907103739.23212-2-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

On 9/7/26 11:37, Erkan Erdem wrote:
> conf_string() unconditionally removes the last character returned by
> fgets(), assuming that it is a newline. When redirected input ends
> without a newline, the last character is part of the answer instead.
> For example, feeding 42 to an integer prompt stores 4, and feeding
> 0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
> silently changing the supplied value.
> 
> Strip the newline with strcspn() so that a complete answer at EOF is
> preserved. Keep the existing handling of newline-terminated and empty
> answers unchanged.
> 
> Add regression tests for string, int and hex answers, with and without
> a final newline, in oldaskconfig and oldconfig.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> Changes in v2, addressing Julian Braha's review:
> - Add an in-tree regression test under scripts/kconfig/tests for string,
>   int and hex answers, with and without a final newline, in oldconfig
>   and oldaskconfig. The shared test harness is unchanged.
> - Submit this fix independently of the checkkconfigsymbols.py change.
> - Refresh Cc from scripts/get_maintainer.pl, including the LLVM contacts.
> 
> v1: https://lore.kernel.org/all/20260905123237.40670-1-hexvalid@gmail.com/
> 
> An AI coding assistant found the issue, prepared the fix and changelog,
> and ran the original verification. The assistant also prepared the new
> regression test and this v2 revision.
> 
> Validation:
> - Built original and fixed conf with Clang on macOS and GCC in an
>   x86_64 Linux container, using -Wall -Wmissing-prototypes
>   -Wstrict-prototypes -Werror.
> - On both platforms, the original conf fails all six unterminated-input
>   cases and passes all six newline-terminated controls.
> - The fixed conf passes the complete 33-test Kconfig suite on both
>   platforms, including all 12 new cases.
> - This tests the host configuration tool; a complete kernel was not built.
> 
>  scripts/kconfig/conf.c                        |  2 +-
>  .../kconfig/tests/conf_no_newline/__init__.py | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/conf_no_newline/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..46c9ca646 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
>  			}
>  			/* fall through */
>  		default:
> -			line[strlen(line)-1] = 0;
> +			line[strcspn(line, "\n")] = 0;
>  			def = line;
>  		}
>  		if (def && sym_set_string_value(sym, def))
> diff --git a/scripts/kconfig/tests/conf_no_newline/__init__.py b/scripts/kconfig/tests/conf_no_newline/__init__.py
> new file mode 100644
> index 000000000..0fca696d2
> --- /dev/null
> +++ b/scripts/kconfig/tests/conf_no_newline/__init__.py
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0
> +"""
> +Preserve complete string, int and hex answers at end of input.
> +"""
> +
> +import subprocess
> +
> +import pytest
> +
> +from conftest import CONF_PATH
> +
> +
> +@pytest.mark.parametrize('mode', ['--oldaskconfig', '--oldconfig'])
> +@pytest.mark.parametrize('newline', ['', '\n'], ids=['eof', 'newline'])
> +@pytest.mark.parametrize('symbol_type, value, expected', [
> +    ('string', 'abcdef', '"abcdef"'),
> +    ('int', '42', '42'),
> +    ('hex', '0xff', '0xff'),
> +])
> +def test(mode, newline, symbol_type, value, expected, tmp_path, monkeypatch):

Please follow the style of the existing Kconfig tests.

For example, the function signature should look like 'def test(conf):'

> +    (tmp_path / 'Kconfig').write_text(
> +        'config TEST\n\t{} "Test value"\n'.format(symbol_type))

And you should keep a minimal Kconfig file in the directory, instead of
having the test create a temporary file each time it runs.

> +    monkeypatch.setenv('srctree', str(tmp_path))
> +    monkeypatch.setenv('KCONFIG_DEFCONFIG_LIST', '')
> +
> +    result = subprocess.run([CONF_PATH, mode, 'Kconfig'],
> +                            input=value + newline, text=True,
> +                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
> +                            cwd=tmp_path, timeout=10)
> +
> +    assert result.returncode == 0, result.stderr
> +    assert 'CONFIG_TEST={}\n'.format(expected) in (tmp_path / '.config').read_text()
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

- Julian Braha
