Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48E1BF307
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584722; cv=none; b=U4m4/Fd36JT+PNaaWjXz/HTEsdoBLzy9gxlkaoxxeiTbK1VnHn+ovnU9dfjqNLJaB3/xsc+ECD1KlryfNU5gMHucxWImB7HjY3/f1s+32zcFHWipS3crYkOVEU6u5XPsMHfh3KI0KKZabz7uFPeXDSePdJ+JjCEofDOGr1xpF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584722; c=relaxed/simple;
	bh=Zo4QNEftC90ngAD8RC20T2f2OvX59Lz7ga6iZJ6sNfw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=auVS3xpKsHxuWBu1d/VATDJR3btW6kKpiHGkcw1+UWgbRXB86h0g8IOliG1nylu82ok9oxqZExZbakyYwScnsbSl7Rs+AM3h+BaKHd9Qtx01vqGDj1mZdAgJOwWSgSo4XEGHcMd0x9qOTZvsUaAyzIknH31igfVeTWdPkk9JCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAkLPnnT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAkLPnnT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3651ee582cfso392814f8f.2
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 07:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719584718; x=1720189518; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeAwXuF7+pmymrZyPiqRkGCZGiMSVwcLFpTO8NXP0nk=;
        b=HAkLPnnTUkMaSIeDMAFPHRLJdrJsiJLPW8/xZPZBSpzLgPJcmoN9t8yt6CAqsrUHy8
         CiPIRtm0UW0nhFnIIN2GMg2Dp4caQNdLWA5m+EzDjerQ1ybuHN2ksFvgiuD8BdKfuDCd
         ipOuPr1eZXGjKiJ9x6ngpJuCE7FaXjexzzpJ8TTBnaPhdtoR+Bn6cD8JYFOKkTeyDe0Y
         k65qo4b2X2rcCufxxRzXkQt+TGYiEVeIITwTSR/BwLfMAEMl/n++5EdhRirneQiw0do0
         xOKp41EhA31o00mlTmz6dmpQoMVfskhUYVWyChG/ocjgLlzkIP+IzP5hKQGtT+oiOtSg
         nVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584718; x=1720189518;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeAwXuF7+pmymrZyPiqRkGCZGiMSVwcLFpTO8NXP0nk=;
        b=sRdozV2R1mHDqpk8datG+KTYSNhnD7hhT9owM3bfTMneWp2ANQnz7RuAVWSNF5nxAK
         xxMPKex6w1B9P7SEG39gG4ylI1D79TtKdTCdxACQPiVDLKxobzkBhiebndOZPYQVXbAr
         a8Eg2yagmgx9C54icnNjyKkPQ/Nyv4QWvrRGYVFRgh9bE+OeXSqJy4rKzXI6RAmoU/BE
         LYd8nvCZSgdpSUNQIeD23yqoVxL3LzHnIuG9EqdIy0OGoC5ddlLxhZJgGM/HUt+IRUEw
         3YRQ7Pr2yIy2d1zHX9jiD5n5JC9AnZJQSALlJN+3Z5jfqOZan009vywtlERYg/+ewszh
         X3PA==
X-Forwarded-Encrypted: i=1; AJvYcCX/gwV1S3GvVcvyw4BYLMJYD1JulBZPyJjRJcgGObm5H/6Y8P8Ixh6kljVwcCJ3XYtMhDhtZeY3C9dYY8Q8xNDXNn3GjA==
X-Gm-Message-State: AOJu0Yz6Q9zm9tXLEGdsXAarC84IATPEMTP1a2FLAE/2dvgTcXPIW0NW
	R6xrBgtATqQKDI0IKDS3N/nmWP5tKeCFGlmfJ09l65SDrwSF/vdK
X-Google-Smtp-Source: AGHT+IFTYNRmuabn1FZnyKG4Uik1w/ofEuzazYAzcKR3V8UFSfbfjagdPNoyM0oNWquKxkwJrJckjg==
X-Received: by 2002:adf:f782:0:b0:35f:2725:7ae2 with SMTP id ffacd0b85a97d-366e9628e80mr11865862f8f.57.1719584718199;
        Fri, 28 Jun 2024 07:25:18 -0700 (PDT)
Received: from [10.95.168.202] (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8d9fsm2458985f8f.26.2024.06.28.07.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 07:25:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4e25df0e-000c-4af7-a34f-ba831623aab8@xen.org>
Date: Fri, 28 Jun 2024 15:25:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2] kvm: Fix warning in__kvm_gpc_refresh
To: Pei Li <peili.dev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev,
 syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
References: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 16:03, Pei Li wrote:
> Check for invalid hva address stored in data and return -EINVAL before
> calling into __kvm_gpc_activate().
> 
> Reported-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> Tested-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
> Syzbot reports a warning message in __kvm_gpc_refresh(). This warning
> requires at least one of gpa and uhva to be valid.
> WARNING: CPU: 0 PID: 5090 at arch/x86/kvm/../../../virt/kvm/pfncache.c:259 __kvm_gpc_refresh+0xf17/0x1090 arch/x86/kvm/../../../virt/kvm/pfncache.c:259
> 
> We are calling it from kvm_gpc_activate_hva(). This function always calls
> __kvm_gpc_activate() with INVALID_GPA. Thus, uhva must be valid to
> disable this warning.
> 
> This patch checks for invalid hva address and return -EINVAL before
> calling __kvm_gpc_activate().
> 
> syzbot has tested the proposed patch and the reproducer did not trigger
> any issue.
> 
> Tested on:
> 
> commit:         afcd4813 Merge tag 'mm-hotfixes-stable-2024-06-26-17-2..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1427e301980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=13838f3e980000
> 
> Note: testing is done by a robot and is best-effort only.
> ---
> Changes in v2:
> - Adapted Sean's suggestion to check for valid address before calling
>    into __kvm_gpc_activate().
> - Link to v1: https://lore.kernel.org/r/20240625-bug5-v1-1-e072ed5fce85@gmail.com
> ---
>   arch/x86/kvm/xen.c  | 2 +-
>   virt/kvm/pfncache.c | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>
