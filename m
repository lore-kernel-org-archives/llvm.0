Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D371538D
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 16:48:23 +0000 (UTC)
Received: from [192.168.0.107] (cpc108961-cmbg20-2-0-cust263.5-4.cable.virginm.net [80.5.129.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E14D66019AA;
	Wed,  6 Jul 2022 17:48:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657126095;
	bh=LewZXQNtu7qBwCpLm6QYVDOHh2jlAEbGw9A9j9i/8N0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aCQcK9PDkZfknD7aRrT3t0NQWE+58TtykmSUz0i/MOjWzYm8KeuRcvcc4io/4h5hm
	 l9tb1aGjqDakgkuMf0Lq7TIbrUXY14TwNxh4blYAcYAA6g8YH2KqyrQN49Rr4OOVur
	 nA4pBR1d35bEjBrGqrT3XUqbT+eQrJ0NIyGI8bxlJjeA57WwWFkT8RyUJXfZ3mTItb
	 sx1PeFrOSdqJXFPNALvNOIT/A/1Qb3KKhhdnn6DcJtmWw47fgkE+6JOilJaFkdRZ3Q
	 NXm0aZIkHD7WoI0yUoneFzE+CEGS0zZOf9w9nz3hz9xBvnpM4M5U06G9/W986crCTX
	 xnz4GiiGK4a1A==
Message-ID: <2aaa6787-619a-7672-05b7-e3ae07c87cce@collabora.com>
Date: Wed, 6 Jul 2022 17:48:14 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors,
 52 warnings (next-20220706)
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: "kernelci@groups.io" <kernelci@groups.io>
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
 <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/07/2022 17:40, Nick Desaulniers wrote:
> On Wed, Jul 6, 2022 at 9:16 AM kernelci.org bot <bot@kernelci.org> wrote:
>> next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warnings (next-20220706)
>>
>> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20220706/
>>
>> Tree: next
>> Branch: master
>> Git Describe: next-20220706
>> Git Commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> Built: 7 unique architectures
>>
>> Build Failures Detected:
>>
>> arm64:
>>     allmodconfig: (clang-15) FAIL
>>     allmodconfig: (gcc-10) FAIL
>>
>> arm:
>>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FAIL
>>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-13) FAIL
>>     allmodconfig: (clang-15) FAIL
>>     allmodconfig: (gcc-10) FAIL
>>
>> i386:
>>     allmodconfig: (clang-15) FAIL
>>
>> mips:
>>     decstation_64_defconfig: (gcc-10) FAIL
>>
>> Errors and Warnings Detected:
>>
>> arc:
>>
>> arm64:
>>     allmodconfig (gcc-10): 4 errors
>>     allmodconfig (clang-15): 1 error
>>
>> arm:
>>     allmodconfig (clang-15): 1 error, 13 warnings
>>     allmodconfig (gcc-10): 8 errors
>>     aspeed_g5_defconfig (clang-15): 10 warnings
>>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 error, 5 warnings
>>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13): 1 error, 5 warnings
>>     multi_v5_defconfig (clang-15): 2 warnings
>>     multi_v7_defconfig (clang-15): 12 warnings
>>
>> i386:
>>     allmodconfig (clang-15): 1 error
>>     allnoconfig (clang-15): 2 warnings
>>
>> mips:
>>     32r2el_defconfig (gcc-10): 1 warning
>>     32r2el_defconfig+kselftest (gcc-10): 1 warning
>>     fuloong2e_defconfig (gcc-10): 1 error
>>     lemote2f_defconfig (gcc-10): 1 error
>>     loongson2k_defconfig (gcc-10): 1 error
>>     loongson3_defconfig (gcc-10): 1 error
>>     rb532_defconfig (gcc-10): 1 warning
>>
>> riscv:
>>
>> x86_64:
>>
>> Errors summary:
>>
>>     4    drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
>>     4    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
>>     2    lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
>>     1    lib/maple_tree.c:4272:20: error: stack frame size (1144) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    lib/maple_tree.c:4272:20: error: stack frame size (1072) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ^ interesting, these look new to me, must be from the new CrOS configs.

Except these were not meant to be part of this report as the CrOS
configs are built on a separate instance on
https://chromeos.kernelci.org

This is something we need to investigate, it looks like some
wires got crossed somehow.  We may however start sending email
reports for the CrOS builds (only doing LTS 5.10 and 5.15 at the
moment) and we're starting to run tests with Chromium OS
user-space too.  Please let us know if you're interested in any
of that.

Guillaume
