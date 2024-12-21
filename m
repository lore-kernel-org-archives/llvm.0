Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC9290F
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734808228; cv=none; b=a2D3o7GWxR4px//d0ClYWc/v5uCf2ftadf/w1jxvcySEooS3kATUnGhZW1qPwXFhqSYzCX3VR3eZmlT3DWMUqdZ1nMyrWZCU8rQJGxtM8bYnx5NDioKZY5mwOg82oZmahbb6FjwoDdonIN5zu/XF9nzwBq0Y4npTDgKAxsGlDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734808228; c=relaxed/simple;
	bh=1vCSKsrwRIcipEZJIKPCqWIAmgBtuik4Cc4Zpxa9jaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU9Xx0ybphGb8Nf89ynP4MgOPGaxbHW4h5IsEs0ZQH4WEatyhzESH7hgpdLC9/Asq8+El2lLsMbY+4iw1XsoucQzlm1r//WqbByw4lNq6pdcQu/M/uUr2DPujT8NQGTe9dAWjTJhF/C3rnMCWa+5dM8efMwrtntzh4pWivhS914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR8zFd+s; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR8zFd+s"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e399e3310so3315135e87.1
        for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 11:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734808225; x=1735413025; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DICSLitDkSZdoKgSJ3JkSamUIfZXy0wB9Dy+tZ/JX4o=;
        b=JR8zFd+sTOq/xnDfkMg+aM//3liwWgMp9EtnAenD3WdKJzZ3d0g2uMeQ2sSzljDgfL
         Kr0NnCX7L0okWDLhCFDE3e+P0GKFzVt973gPgFA0O6XaoltxLOn/QE17KjV6PCX4p4Bi
         pvDQ4NsR2SK5Slbr5cAjsTmTOw4ljLrC/h5Uo/60YdKL6dJNWyoZFPo896jCbpmDWJZX
         vfCXoYsqNvIzVTAHEaAgT57+Rz8S4+vUNE6TjIklmbpz8JHT2kI7NgigyIqLhX/vT0Jc
         mErPggNT583ElIFzCxZN0YVEfA2oEa2APHGJG8SvXM9h/wlfqJSqSRQ2XBB3DYIIXQQa
         w8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734808225; x=1735413025;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DICSLitDkSZdoKgSJ3JkSamUIfZXy0wB9Dy+tZ/JX4o=;
        b=isHie4UvBMiIdpu2zWlu6bOw6Ft+D7Tjo8OqR3IjkhG1UdT96cuMNAKe571zsjniEH
         jmwmEi0y0M7Z3vO+bYMXlRppL/bSNs5J362lplT0tGC3ZgUhDLcpOvqV8ggVH4YXJfXS
         3qrATQoQ5fFH7hcNYi4Z2MnHONVqUScbXnvj+dmZsfml3drkCLMgvmrvw836opW3nDX8
         YgTPPbkeS84omN3zgtsGvZ+8xOjfnII2Twph56/dAZ/OCFgMX6z0zHXgefi3GuaBwKz6
         UO+RezY7B3+K68qiiSElm21uuFnPlJgJwhtoN4DWKDmQynNbsOrEnl8O25DCZrmQyJ5b
         BPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlN7hqYfxGxro9bZx79BJLvJrGxmWtepvY68G0LIXJWKw3jDT6AAhJ0vYMQp5fjRNt+vMP@lists.linux.dev
X-Gm-Message-State: AOJu0YzUZoKog66jVJ3RXwmQD4rnpbUGk9aeDAhIFsJ5555zOgZQajs1
	6n6twa6wLQrXR0KIXHIu/ML811l+B+SBg/9m28jQGIct8toHLbMpJqJM0Wb6uFz/aGhFnz2j6yX
	880ajCL/7s+bR53W+ERE0S5h+0mk=
X-Gm-Gg: ASbGnctx2E4LSZzsy5klNMa5fPGDGXfW5rpFPvvXXswkdRme9FCbETNYWabXquG99wh
	Vig9+JJThHE9c/kIL/fqSvX2Ixf+Co37Hbqyw79n0s7eeP8sEoaNSj8oUxsaEp9uQyAP2
X-Google-Smtp-Source: AGHT+IEe2LojPiPTBvWcFiJy0Wow6bjJvCnYTDrCzXg4UoYFG87UC6TJQDcIoRRxmiY1F2RYuqc9z090hwAo9aGKC5M=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr879572e87.42.1734808224878; Sat, 21 Dec 2024
 11:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
In-Reply-To: <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 20:09:48 +0100
Message-ID: <CA+icZUV2=20qAqUmXBSfeechf_ObF-m71H7u9zAxGq5hz7k2-g@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Run all SUCCESS tests on my selfmade kernel.

# xl info | egrep 'release|version|commandline|caps'
release                : 6.12.6-1-amd64-clang19-kcfi
version                : #1~trixie+dileks SMP PREEMPT_DYNAMIC 2024-12-19
hw_caps                :
bfebfbff:17bae3bf:28100800:00000001:00000001:00000000:00000000:00000100
virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
xen_version            : 4.17.4-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_commandline        : placeholder vga=,keep noreboot

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --host $( grep SUCCESS
../TESTS-SUCCESS | awk '{ print $1 }' )
...
Combined test results:
test-hvm32-invlpg~hap                    SUCCESS
test-hvm32-invlpg~shadow                 SUCCESS
test-hvm32pae-invlpg~hap                 SUCCESS
test-hvm32pae-invlpg~shadow              SUCCESS
test-hvm64-invlpg~hap                    SUCCESS
test-hvm64-invlpg~shadow                 SUCCESS
test-hvm64-lbr-tsx-vmentry               SUCCESS
test-hvm32-livepatch-priv-check          SUCCESS
test-hvm64-livepatch-priv-check          SUCCESS
test-pv64-livepatch-priv-check           SUCCESS
test-hvm32-lm-ts                         SUCCESS
test-hvm64-lm-ts                         SUCCESS
test-hvm32pae-memop-seg                  SUCCESS
test-hvm64-memop-seg                     SUCCESS
test-pv64-memop-seg                      SUCCESS
test-hvm32pae-nmi-taskswitch-priv        SUCCESS
test-pv64-pv-iopl~hypercall              SUCCESS
test-pv64-pv-iopl~vmassist               SUCCESS
test-hvm32-xsa-122                       SUCCESS
test-hvm32pae-xsa-122                    SUCCESS
test-hvm32pse-xsa-122                    SUCCESS
test-hvm64-xsa-122                       SUCCESS
test-pv64-xsa-122                        SUCCESS
test-hvm64-xsa-168~shadow                SUCCESS
test-hvm64-xsa-173~shadow                SUCCESS
test-pv64-xsa-182                        SUCCESS
test-hvm32-xsa-188                       SUCCESS
test-hvm32pae-xsa-188                    SUCCESS
test-hvm32pse-xsa-188                    SUCCESS
test-hvm64-xsa-188                       SUCCESS
test-pv64-xsa-188                        SUCCESS
test-hvm32-xsa-192                       SUCCESS
test-pv64-xsa-193                        SUCCESS
test-hvm64-xsa-195                       SUCCESS
test-pv64-xsa-212                        SUCCESS
test-pv64-xsa-213                        SUCCESS
test-hvm64-xsa-221                       SUCCESS
test-pv64-xsa-221                        SUCCESS
test-pv64-xsa-224                        SUCCESS
test-pv64-xsa-227                        SUCCESS
test-hvm64-xsa-231                       SUCCESS
test-pv64-xsa-231                        SUCCESS
test-hvm64-xsa-232                       SUCCESS
test-pv64-xsa-232                        SUCCESS
test-pv64-xsa-234                        SUCCESS
test-hvm32-xsa-239                       SUCCESS
test-pv64-xsa-255                        SUCCESS
test-pv64-xsa-259                        SUCCESS
test-pv64-xsa-260                        SUCCESS
test-hvm64-xsa-261                       SUCCESS
test-pv64-xsa-265                        SUCCESS
test-hvm64-xsa-269                       SUCCESS
test-hvm64-xsa-277                       SUCCESS
test-hvm64-xsa-278                       SUCCESS
test-pv64-xsa-279                        SUCCESS
test-pv64-xsa-286                        SUCCESS
test-pv64-xsa-296                        SUCCESS
test-pv64-xsa-298                        SUCCESS
test-hvm64-xsa-304                       SUCCESS
test-hvm64-xsa-308                       SUCCESS
test-pv64-xsa-316                        SUCCESS
test-hvm32-xsa-317                       SUCCESS
test-hvm32pae-xsa-317                    SUCCESS
test-hvm32pse-xsa-317                    SUCCESS
test-hvm64-xsa-317                       SUCCESS
test-pv64-xsa-317                        SUCCESS
test-pv64-xsa-333                        SUCCESS
test-pv64-xsa-339                        SUCCESS

No CFI related stuff in dmesg seen after running XFT tests.

Best regards,
-Sedat-
