Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696C2D322D
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758758; cv=none; b=piYDI8O0sDLeTk/jiuE6Xl/Pc/f4+cAp8Pw/GYmYORhuAb0nGqstDUZHe5/uqLM2GZk4grTdnzyh6BW2qU0/QIrUu4taQPw7GR5NYwMjEl96bOK8OhGzN05HqkorO/kBFc399/imaiSo9PuY0mMNDLLPc3WPWc04yi5gpxZwsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758758; c=relaxed/simple;
	bh=Re2CW7co8R/M5Q8rcFGXf3tlF1UXLdad4cNsqa8bUlE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Yauv+BrFYGkBXE89iwDyEeaG0w4ukI8kRy2qBhCjCOUAjhsyL89qcf6wKGn+B+MJysP8c6CgtTSkfvGYZ8QhmAYEiTAzZnYpUaVYEY00LBgA52eklILryaYIgkijzAMUbP2wkwuvdw5prnFSVbFTlf1hX0SRFCZZrdIKPZoqEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=iW5GxtgX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="iW5GxtgX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so1210510b3a.3
        for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749758756; x=1750363556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=iW5GxtgXSA0QfMoQSBVU40w2X92KhI1GsjBz+fx8uM79PnugxXexvuAXj6MqGeOfgx
         t24pGa/KY7swx8oc6qv+XY/zAXTACNB/Ap2OMJMYV+HUH4eoKQClNovDxfoqD+t/n8fS
         lAWoxhzBUj0yFyFOVzExLbL3l/5aoX3rWs2ZUgBFGv/lciWz9wJiIrO+B/6OpV4xkDFF
         17ELc0w+2PZLH/LRGpDZheLJHqeUbll7KT6qF3iB6KjPX7jTaO4xPRNYDxr/z/tldqCq
         1chlkb3nT9aFFvZPsgGDwjuzL/GY2EC44RjcHVvFFlsDGup1FetSvuZXGwB05SEX7PxM
         UHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749758756; x=1750363556;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af51BBEYY6aGbebFxLHnn8CgVDycQQJsTeT80Jnf6RE=;
        b=HhivTAqvVTAjz3FbzOkfRGpVH3cM1eQIz8G8onobh/LgQvR7P/bDYZCfTATNL4qa2j
         GXsECw4VbI5QJPHgtPK/R0bQUzCv25+YiiY29ne1px4ME/aIO9sQgR8zN02UZr2xCIQ6
         BPE72NbD3Y+ZY/5U4X9psTIzAWhzJ/i8PiNVrDb2y2Q5hfY+kzzD83f3EbEpREs7PSSV
         3EM6gaGu9QsEfd7Fp8Y2WuTUpNPdMLZpJNdvFDDeMs0Mhw+woUoyxu7YF1jDYFMbW4f1
         N9xa1AuaPmYZAxk8YbxQeivTwKYhxPT7/jPMNc7QMuIoaosQOFl12f4qzguzOFLHcaW2
         F6kg==
X-Forwarded-Encrypted: i=1; AJvYcCWQJiELw5NkWQ6q6DtabCalhlC91NnKBwDi5eMAuwOBki1Bdalb1FMf5AbhP6LWKYMg77ul@lists.linux.dev
X-Gm-Message-State: AOJu0YydbpVATbfwVmyyOZKNyScHYuvXxgz/hsdzNTOSRohaeDNjwJt7
	Spgd/Y0iAYMB3AXWB94+DntV6/t9LiioOeOMYYUAmpBlPV2SQHkG/kMhH3DK/aimj6Y=
X-Gm-Gg: ASbGncst6mtfutI1sFyCWH9E/4PoYQNRzfA7zzFz36nA8BrP24ITEpaZPepvbxeUoq+
	M7X3e6z/QrlGQXSGB7Dr5tK/Vr99U2wRi9bQDFwarMRDzN2OQtGLT09qgtYKgE2/N1StIIwP0c3
	+bk26fA07Lt0ahORVvvfzeEnjSiKTpm5/kUP7COs87xmI2cJGRPSi0ZGg1NTmYIW1+AYv+FCNuq
	WSaRjbddPEx7L2hEoytS+N4WNdPNc4Sie1z5hTMCPQZposwuQeGg/DxCpfi9D1A9NfVj7Z4UVgC
	YIWEwe8kkbhFyATycP9d9/D84ViakppKylfwafA2rQ0vNy1tR1Xu9SrjrLHCHc8m7Gsf5l4=
X-Google-Smtp-Source: AGHT+IH2RoHWF8PmxJBIXY2wg5rdTqPBQh+vVExjeVE43egm/MogvtvtIhJaxeSLVjk+Z689LqbYIQ==
X-Received: by 2002:a05:6300:8a05:b0:21f:5adb:52c4 with SMTP id adf61e73a8af0-21fad02d0c2mr253713637.30.1749758755672;
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900063f6sm140856b3a.64.2025.06.12.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:05:55 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 13:05:52 PDT (-0700)
Subject:     Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
In-Reply-To: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
CC: thomas.weissschuh@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 01:31:20 PDT (-0700), Alexandre Ghiti wrote:
> Hi Thomas,
>
> On 6/11/25 11:22, Thomas Weißschuh wrote:
>> All vDSO code needs to be completely position independent.
>> Symbol references are marked as hidden so the compiler emits
>> PC-relative relocations. However there are cases where the compiler may
>> still emit absolute relocations, as they are valid in regular PIC DSO code.
>> These would be resolved by the linker and will break at runtime.
>> This has been observed on arm64 under some circumstances, see
>> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")
>>
>> Introduce a build-time check for absolute relocations.
>> The check is done on the object files as the relocations will not exist
>> anymore in the final DSO. As there is no extension point for the
>> compilation of each object file, perform the validation in vdso_check.
>>
>> Debug information can contain legal absolute relocations and readelf can
>> not print relocations from the .text section only. Make use of the fact
>> that all global vDSO symbols follow the naming pattern "vdso_u_".
>>
>> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> ---
>>   lib/vdso/Makefile.include | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
>> index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
>> --- a/lib/vdso/Makefile.include
>> +++ b/lib/vdso/Makefile.include
>> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
>>   #
>>   # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>>   # dynamic relocations, ignore R_*_NONE.
>> +#
>> +# Also validate that no absolute relocations against global symbols are present
>> +# in the object files.
>>   quiet_cmd_vdso_check = VDSOCHK $@
>>         cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
>>   		       then (echo >&2 "$@: dynamic relocations are not supported"; \
>> +			     rm -f $@; /bin/false); fi && \
>> +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
>
>
> This only works for arm64 relocations right? I can't find any *ABS*
> relocations in riscv elf abi
> (https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).

That's because the psABI people do not believe in absolute symbols.  
They exist in the actual toolchains, though, as they are part of the 
generic ELF ABI.  In theory they'd work fine in the VDSO as long as 
we're using absolute addressing instructions for them, which is 
possible to do (and I think should happen for some global symbols).

That said, it doesn't really seem worth the effort to get the checking 
more fine-grained here.  I don't see any reason we'd need an absolute 
symbol in the VDSO, so unil someone has one we might as well just forbid 
them entirely.

Some old toolchains had an absolute "__gloabl_pointer$" floating around 
some of the CRT files, so we might trip over bugs here.  I think we're 
safe as those shouldn't show up in the VDSO, but not 100% sure.  
Probably best to get this on next to bake for a bit, just to make sure 
we're not trippig anyone up.

> Thanks,
>
> Alex
>
>
>> +		       then (echo >&2 "$@: absolute relocations are not supported"; \
>>   			     rm -f $@; /bin/false); fi
>>
