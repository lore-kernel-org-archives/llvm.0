Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4A3890E2
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457468; cv=none; b=mXdPJWn6wBbcWgKEknZ367ZZibz6dRN3fZiW2PphZDzs9fjSNTwcpnLEaWHne5wsYJvwIGr6LrR+iyqkgNvFWU1Un1lBEEOYBQQ+5XwfFD7dwYzRbAJuknpH74WIBHPTSbxx/yxs4c2taXcZM35lldRDV2duivCh58iwihU/Ztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457468; c=relaxed/simple;
	bh=KLwWf95QYlXqjTRiTI/nyMeghq1jIrTTG2Jrgoqqb/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbzkCQcjq+W7RTNhJ1j2DxmhUcxRL95gsAco3OXd1uvuKG/brpD+NoqLgMiRpKQfOmb5sa2Q6YbkPjRipemrH1oUAqyPMObtg/+BTE8Oirv8+EaIrRqNQfdkr4sfKjQugZZepgck3eiDS1hPcXwjtapqOmN7Y5NO8oksOvKo28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com; spf=pass smtp.mailfrom=ingeniumdigital.com; dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b=YsXPeJ/3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b="YsXPeJ/3"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b23fcf90b2so118422825ad.3
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingeniumdigital.com; s=google; t=1777457466; x=1778062266; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=YsXPeJ/30Ohh8XgAEL6vqRozYrnKtF9cz/nxfWdFtT12aGOnGfA3E3TCORK50sQsql
         HRmX+Sf9CMkP3f9YtI5IfdBLv918SpGyUXsdteKhcSLtOgG6s7evYybrnBhct+LATKCJ
         Ub533LEuF6/piJ9rHPabQPIJhQVuHKi3LSb6hH1jSzf9G77qrl92v43SARy5BP9hDnRd
         ZN54FBkSXELeiJZFcaO8+r1gOER1L/6HXToR25fscaCAxX3MW0JA8QVbLZhoAIabCH//
         uQSyiMkvJB2ict7E9PAV7kg6T7y7tldGqikmhSyqnUv+OtfUBAJXB9eGNPNfhiKbvHMd
         CqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457466; x=1778062266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=G4L3sxhWkCUibRZGnsL1ziBVBHD7+l6bQV64Bz8675Mv0ZaTZuDPnTu148cEYjQUUq
         nA3Gb8duAqqhLup1nZmwJLYBb3P0cLWcTHdX8/y7QdHI6oifvHHHPYxCZvshHiIdc8TX
         FUwKUsgtAreldtwK7Y9einU+ru3aXJ+WhQYZS1j4ZxyIXjN45TviQFjdh5hawRbimD+O
         KBQU6NUkJhful6H2Y6kU1CfQLLoO2T5nTBE18vvTXb1P5v0/jnJz9U2bnxJQ9yaU51GZ
         Mkub+2SixRAryKQZCGfeRnb++8L6yH3LL/60Pv2NnrUWwCmJUIFSf1JKolvA01UWX0/E
         KSZw==
X-Forwarded-Encrypted: i=1; AFNElJ9Sod/Io15Y02lpmQDO48WiQNE/ZdjWYJPMrHcyHSjUOC8xjsGdTnXOFb2iHwTGsngl5beW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3KyEeMT1urBlRTm0tSVCYWuRA8sF55ZXedn97XPZGTUTlTn8r
	DdOR1uptfoidi3R3iU/tNQ/owxgcqBxLAxHaJY4J7gkHKobYmLC7mEeWL7KukTIjQA==
X-Gm-Gg: AeBDiesrALsVshDHeOHMQUjlG6HTsv6Xsc+gE5nkg6Rx/VoS03XCb+RqBeWtYwKA/xs
	5cYeAmXNc/e0o14ZXmGvhW84dsMWWglFa5DsYuEqlCvXFFuox2vUaC/RTcU5E+t5E00yEF1uRsP
	1PZj47dhd8w59vmCQEoHayrBd1oPB/SU/wf31ZdHnsnEm97AYUc7CwIm4uX2qVNJ4LE+cGglpjZ
	/xxEVluTVfuy0FfYylA+6ya/wvwa9YuINWvmkVfHNWoXO8WX2d+YdIxipKaFi93Iu2gTxShtlqm
	zR51s+Ya1033ACyqiBdeVshLseapHOvwt0gmdr/BTPNwolMMPuJoL3dd8vLuNTW5dO+ssxZyEDo
	YAzvNkPnsCcqyd1B+FWAPVaRdQNsgD0ajh2vwMLXyjgYdkTJ7BzXvdn9tM/H3u6yzeOebJQY3W4
	CfTE2sQgj8yBQXeRXrvXEq9frJR5qltmE2pJkwdXaW89pLrxWnYKHfijj8pMxdpL/uTimMqur8g
	wDUTKMJ6pW/+lyVjwCY
X-Received: by 2002:a17:903:3503:b0:2b2:ec00:7966 with SMTP id d9443c01a7336-2b97c462381mr77953125ad.21.1777457466448;
        Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
Received: from ?IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d? ([2001:8003:8810:ea00:ed87:ca88:5326:e11d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988972dfasm17817855ad.72.2026.04.29.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:11:05 -0700 (PDT)
Message-ID: <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
Date: Wed, 29 Apr 2026 18:10:58 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Language: fr
From: David Gow <david@ingeniumdigital.com>
X-Clacks-Overhead: GNU Terry Pratchett
In-Reply-To: <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/04/2026 à 12:04 AM, 'Thomas Weißschuh' via KUnit Development a écrit :
> Add a basic configuration to run kunit tests on or1k / openrisc.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

Thanks very much. This works well here (assuming 
CONFIG_KUNIT_FAULT_TESTS=n, and either a long timeout, or slow tests 
skipped, as qemu-or1k is not fast on my machine).

Reviewed-by: David Gow <david@davidgow.net>

Do we want to split the series and take this patch via kselftest/kunit, 
and the generate_compile_commands one separately, or just pick both up 
in the same tree?

Cheers,
-- David

>   tools/testing/kunit/qemu_configs/or1k.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/or1k.py b/tools/testing/kunit/qemu_configs/or1k.py
> new file mode 100644
> index 000000000000..dfbbad0f9076
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/or1k.py
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='openrisc',
> +			   kconfig='''
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +''',
> +			   qemu_arch='or1k',
> +			   kernel_path='vmlinux',
> +			   kernel_command_line='console=ttyS0',
> +			   extra_qemu_params=[
> +					    '-machine', 'virt',
> +                        '-m', '512',
> +			  ])
> 

