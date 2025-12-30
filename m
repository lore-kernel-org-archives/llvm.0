Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4B2DAFD7
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061486; cv=none; b=dFgD59GO3mBU88B5br7ToM3uLrB13grJpMQmg9jDuPNwqusIny1vRWMqunJ+nj6JLdkDF+i1hViSkTg+z4Z0bDej6X7Am9GUefEbLY+LGxTxethp9zXIurRHEDMW4tSm+Lu1Y6u4r8OQRs+hP/MLhOm5HYGJ53UNNOwka6hXEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061486; c=relaxed/simple;
	bh=Y2d/CkXgDCUfq+HeES3Gz0BuPuu6qm4OAyv3mnAt3M4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fPZSbbVeuEzv8GiiO0szxyxXIY/xVdpZdRFb6qTKLguqkOG7awOtK6T4qoRPHJp9ezF7zZOkY50n9UQ3+IrpU9W9csg3LFBdteODhxXo+pgUfpuNXRh6k34+6NkeSUVadQchw4fCPB9U+f4MAKZpWwGrjEHBPGiWCszdbSvh0yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3sRjxM0i; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3sRjxM0i"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b0588c6719so9129827eec.0
        for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767061484; x=1767666284; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBG9qGfwdN2gzPyM4vrD083y3HoBOEnU7+ZJVK/meSs=;
        b=3sRjxM0idAG4siRbPIqK+4LYyJAmDMbXtR/msZQ7FISZj2fnLDvQPrUH8O50PPPUB6
         CI/WC/sZeDT2t08bEd31LmmQSxJjwoJY5qY2UiQnPIXnlCXb7r6kgqtcOMu6kaAVPjb8
         B1S/cfjjRLYDP4CyKZMgrOuI/O6ZmqfU2WkwWP1TKRpuutJjEf9UNQwc4B1S7ODH8G0Z
         5ZdR/WI2l4UawETRlEf1wbyQ7ziJ/dsWPa3tOXpH37IC7Pg8P02mbXQt4YjnQPRGHq87
         J6NHT/CKbovrWtqu37b3xhyQFEXiD0ObJwkYdiY6YYLWrE3bBIlBqyoOV452xVG9aovb
         Ur+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061484; x=1767666284;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBG9qGfwdN2gzPyM4vrD083y3HoBOEnU7+ZJVK/meSs=;
        b=VicoHClrvDh4tXF51u3tKhePZOsV2TcyPXDunqO41P1XJTe6uS1YSiNMqFW5xXPF87
         TjI2rukEKdjVJl/IEJ8XEoLkA+QygjwhTHo49pufE10BMoIJkgQVA4xLPRq2vwueuZT3
         Fin7KPWqhbw1PXfW+aP62KBdl5Ei2wv6MDEyBpQl6rjtpiGUo27UcsGZbTor3xuqbD90
         b0bza9C2HFor6zCyxGpM94Kg7EAErEQkqC5pBQskZMQD5BrkYkejKPJvDyFlzidCv/D4
         bHBXHPeuu8q3LMqK2fxp0WTxf79lKfksgpQNPhQFFvo29aFFg4rzF4Rk9Q7owDJW5Uf1
         zMmw==
X-Forwarded-Encrypted: i=1; AJvYcCX1I+W4ezmtHDFIxGjrDdwpaOT5H0BwVvMQhbHOakUsaGO5aCW+3XrRqsSaBfcXcmDs0rmQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzSVyprpnAmtcvSFDzShwki5plUoUENfvkzKWnE2P8vooTMKzZt
	0Lem0oNvR8WT1LEBBDJjeoHF97fFSSxdo8SumTm6+fN1D8Tt7rvA3R1s6r9a0AQB/2YBY5n/jIN
	uo2H+OYiXUw==
X-Google-Smtp-Source: AGHT+IGuKbBb2lRfg0zkm1s3qWA/FlYtdLZvNL3qHYsniInakt/sV+rfHnyjB/VJVAG4XIo5VyzVxdsJDy6k
X-Received: from dybgp28.prod.google.com ([2002:a05:7301:211c:b0:2b0:5541:d643])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:80cc:b0:2ab:ca55:b75b
 with SMTP id 5a478bee46e88-2b05e6beb4emr39241858eec.20.1767061483570; Mon, 29
 Dec 2025 18:24:43 -0800 (PST)
Date: Mon, 29 Dec 2025 18:24:41 -0800
In-Reply-To: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
 (Justin Stitt's message of "Thu, 04 Dec 2025 12:44:48 -0800")
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Message-ID: <dbx8cy3wso46.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [PATCH 5.15.y RESEND] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Tiffany Yang <ynaffit@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Justin Stitt <justinstitt@google.com> writes:

> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.

> |  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is  
> uninitialized when passed as a const pointer argument here  
> [-Wuninitialized-const-pointer]
> |   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
> |        |                              ^~~~~

> This patch isn't needed for anything past 6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration"). Since there is no upstream equivalent, this patch just
> needs to be applied to 5.15.


This error has also been showing up in 5.10 since KernelCI started using
clang-21.

> Disable this warning for sys_regs.o with an iron fist as it doesn't make
> sense to waste maintainer's time or potentially break builds by
> backporting large changelists from 6.2+.

> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link:  
> https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e  
> [1]
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
<snip>

Reviewed-by: Tiffany Yang <ynaffit@google.com>

-- 
Tiffany Y. Yang
