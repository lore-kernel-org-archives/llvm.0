Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44017363C4E
	for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771975860; cv=none; b=oQiobl4bi55EYg6mM2VjiksV+jFJOP6hY+H+v8j3VVzex5C25k5+hSr/9d9jyDwkpGrnWJR7w1vclKlwlsB5qCZhSBoUeB5MkM8whDYNncVlWimmWv1fcYZp/xfb/BOvSIC3Z9y8MMSdFVTB16QPltkVeRm2QQBM7RhSCHs2Qns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771975860; c=relaxed/simple;
	bh=Qfi4Pe9f7qxCuWMzRHpRR9JM7QUrSzwSdiQds9DHv7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NF637X7EEFBfKmJKTKsSxXhudwrrJmeGCryzZ1bciHg0YNZkqXFAJxiiH4U5U6HD9dBtTeCKY+Dll/xdVAVlGmnlVmElRInig/sFJtH91jG7SV8SjP+tZrhePAX2Kf5p0JRCH7xvnB0tQqHR5Ql6kv0C9AuhPd90j3jzUsG7aQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Uukjzxhz; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G8QpVoG+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Uukjzxhz";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G8QpVoG+"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1771975841; bh=KwQalYMWTwMP4M+FQW5xwdF
	4J5kMnovp49C0rT2vdQ4=; b=Uukjzxhz3Dr+cXdlOV+aSFORFmnTUjXYjGwrVS20vC9V65UcL2
	6zIJXYirK0rR121RJOnzJ8r3FJgnPDOqDYCByUo9GWr4QctA470jTXacjULZ8/bNk202VwC4Kof
	bgx55G+1yENEvyNcAzvEPHMUNfM0+6OouO/vmJsgQealIzSgJHp+WhTKH1N92KrTFCdDtedcExM
	N0Iqe4R7VCY1DbIfXnAf1iWysnpadQ1lWCOcAd5Nfnn5kC8xvO33Be3Zvo8DNTOqKO2TUH4NpyF
	SYHlDR8B4kx6ulcAMOCZCRPA3wsCHLCL1ZVVytH6aGLpAVSAC1UmzMGZZTODtTvE7SQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1771975841; bh=KwQalYMWTwMP4M+FQW5xwdF
	4J5kMnovp49C0rT2vdQ4=; b=G8QpVoG+pfT01hkDnrLnViIoQqYohWptZmGJSHA+Swzqv+Zn91
	iJfFVFalGGzjTaaigF3XMrwKHWfoUpKVBuDA==;
Message-ID: <77cd40dd-bc40-4223-a5db-7eb514c13b78@mainlining.org>
Date: Wed, 25 Feb 2026 00:30:30 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Failure to build with LLVM for the Wii
To: Nathan Chancellor <nathan@kernel.org>, Link Mauve <linkmauve@linkmauve.fr>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
References: <aXs8sgAcci9FKKpx@luna> <20260129223136.GA1614447@ax162>
Content-Language: en-US
From: Aelin <aelin@mainlining.org>
In-Reply-To: <20260129223136.GA1614447@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/26 11:31 PM, Nathan Chancellor wrote:
> Hi Link,
> 
> On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
>> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
>> of gcc, in order to bring Rust support to this architecture (and also
>> because my distribution doesn’t ship a cross-compiling gcc), but I get
>> this build issue near the end:
>> ```
>> % make O=wii LLVM=1 ARCH=powerpc -j1
>> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>>    GEN     Makefile
>>    CALL    ../scripts/checksyscalls.sh
>>    DESCEND objtool
>>    INSTALL libsubcmd_headers
>>    WRAP    arch/powerpc/boot/dtbImage.wii
>> objcopy: Unable to recognise the format of the input file `vmlinux'
>> make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
>> make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
>> make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
>> make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
>> make: *** [Makefile:248: __sub-make] Error 2
>> ```
>>
>> I believe it should use $(OBJCOPY) instead of objcopy, which is set to
>> llvm-objcopy, but couldn’t figure out where it is misconfigured.
>>
>> Thanks for your help!
> 
> It is the arch/powerpc/boot/wrapper script:
> 
>    https://github.com/ClangBuiltLinux/linux/issues/1601
> 
> I have a WIP series from long ago that may be a good starting point for
> getting something working but there were some errors I never got around
> to solving before having to shelve it for other issues:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=wip/llvm-1-powerpc-boot-wrapper
> 
> Maybe something I (or someone else) can get back to soon.
> 
> Cheers,
> Nathan
> 

Hi Nathan,

your last 3 patches on this branch do indeed fix the wrapper script for 
the cross-compilation with LLVM=1 ARCH=powerpc without CROSS_COMPILE set 
or GNU binutils in PATH. They look good to me! Would you be willing to 
submit them now without touching the VDSO? That part does not seem to be 
necessary to fix the wrapper script for this usecase, so it should 
strictly be an improvement. I'd also be happy to pick up your patches, 
send them and follow-up on feedback if you don't want to do it yourself.

Best regards,
Aelin
