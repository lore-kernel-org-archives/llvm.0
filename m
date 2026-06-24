Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C2D2BEC2E
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304623; cv=pass; b=snAunvbCsjR3++Pr/0bTE8XjHw6Jh/TgMFycWDCLw2Fu15CX2bL5mAJslyF1joYp9MtQNgIuMSiqEQ4HF/1261jxta1bYYsyviQVWsuzg+ZLAw0kOwSz9TOl2V6DJMnrOwlOT87KkWFuTZ/5X+VqYM1bIDhUTzrM4uoyTUa2rC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304623; c=relaxed/simple;
	bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNCik5c5unMQqeawT7aBbCT0EQuCq6cwFgnq7huuLOpJ2YonwWuDucAhTnbOXCi9Mxvwln8xWUbXKoNBb1ZLpDFUaIrfUSDcQaM0yDF/UGEjDjm55h6vXscsWINn/CZs8yjpsKIaN3sMnvmMEk4zmmVSZwcPh+dIfvG//IHSyU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTg+s0MA; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTg+s0MA"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6e21c47e6so589276a34.1
        for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 05:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782304622; cv=none;
        d=google.com; s=arc-20240605;
        b=NfNTmPf6leHZ8Cw0IAKeFzVQHn+tpn1Xhuq8PXv4Bu3+6KX3DNRvth2JQLiswTu7+j
         FJGFLQhR5dSApiCLTn/4gZqCj4y13mSxpSmskqdeqJUj60myK/n17AEM4pjfGCGale49
         jS8G4pTfm+R7V9amOzIRaJ5d8chswFcAUjKQU8JquHVHNVuONItl9NmsDorbFbbTxbJ+
         QaKs0LkO/3Ufq6G7K7J4qBCPeIIU7ahOnz91qv6fxWAm0Gq6kCkXCu6NxQ3b1l75QKrK
         ePlKlxKf8+0k6DLf3C5A9deRZO1luQMaiuOcRjm5MGNFO4IPyfMScaSNWHhNVKXfjl0I
         1Cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        fh=vAsgtvEk53jbgnzl+P0+zfBka9gUshMUT/We/+E0+Vo=;
        b=RwERlqBlClTOz5lu9auTMq1yRWU+Fftfz/m0wTCnSS+3L31lRc1Co0PrZTXCO6AyzQ
         qv1XQX5/2k0w/VDNsUi7waIUKvBQIZFm8K9FLF2hqfFZH72lrLhkne0b2yEwU1dHGFkV
         qwA5WbISIkdsqeU0ImHPI04KxhADTwN7AWErusQezRoWd3FoPSlAcXC6kq8w2rPhs8hy
         Lb3N+GeE+rX745pQ/pV4rRFabxvL6O5t1OiQWKCw7lCKdL5Qda5iv/rUB4tYSZ/llzF3
         QMgWqLrp+CIOr8U7MefXMYyFvA6/HkVb3fvc9NBfA3wdxRhwXcMLjPjLfdIrm225ohdM
         Sqdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304622; x=1782909422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        b=KTg+s0MAf9TGnpjgfrCN4iHuDMKRQ1M7Fg7Zsy9k8CEeHGNZedA/+80y4i3u9cySdR
         9w4/b635kwZ4mfuuaKsIO+wh6Aqqqf3br4vdoIZp9+eMRTndPFrbd05/3KQW5KofGCO4
         mqtCRyOe0lOrS1Mas69bFBCzhNYxQWAAGRfimeIVudM3Khw34Rwmwu/iY993kSgBfA2M
         Fsm9c9LeoCRYJ5BZH6XMmpE9oRufvLcwUHTn8KCMXrsKXgQUT53ds2v0ceYPbnveJXJF
         MbrjgJPAbLEykWqRRUp3nIDjSFgl4yfjIbyfjssx1PnZXrGSCiCA+ocj6hZ1xpaZbukn
         0J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304622; x=1782909422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        b=nN1BaYGl6oMybmZZ/CsvpprNDAo9qUwfcaVbt67d/Qh4obUwixywzypKiwoScC3LhA
         Vor2yWLEuJ+fRTpDSE0WATIqbXGHAtimSxdKRk5XUTiBDjVQ9DsvYmBOJpD/qCyv5mXH
         RP8Bmff+PXj83cX0FjJQnis+JQFN/mtnSl1I+7VhTjNDnSzMhGPqxO4nfGXtbvFGj1kR
         fC1H3Y2e0qsAQzF+cbPNdeRSKS/1txSz3PGeeE0GCLmALGiRM2G6QHkKCZLcafidX4dN
         J/KAoXsPmq+Qzl/AA0oCRUgJG1r6T9c/wi+RFwsol5Y9WlwYZTb5c5qGR3/bn4FNwBbw
         zJKQ==
X-Forwarded-Encrypted: i=1; AFNElJ90YqgP5iLiYMQtID0AxpZnoXcURZHTRctxxrOBItyIgoq1PgnwvpF7FAI5UKbYb3L2Ol+M@lists.linux.dev
X-Gm-Message-State: AOJu0YyiYsgepwsJSjOsyZPwnEfEXWGVuCZbZRUkuaciwhDiWTrfsj90
	32zinn5xN7GFs0ZH5PZKVu7kueUiVUGplbCCD0JQyUOw7jO+h/JQtEG9rb/M1C1/WslM9ZXz3sf
	50fSDMAGh1mYbT5O+REky66YXAwyHckQ=
X-Gm-Gg: AfdE7ckX/bjowMl2uC4nh8ysnmVI/AlnQNGSgpHw2byEqQKNc7Ipw+MFfvt9CrtU6lk
	R5rmIDVET5RHAw+zp0sHE8D5zh6AXw955AbW5msfb1z32XLkyNLUh7b8MihZUBf8GAlSUZOLQmW
	W4SjGW0FA+zT0Y6znlldcfW2cfijw2UYlehyrw7I8KK+0U0svOssQgp1r1D43TkE2hvO1cojv3/
	1Es1Zyqv07cW3X3dmYt/UgemeiOcAT9otj+2b8WOcLYGJONiIAnMpq5WMpN85tMSVS+6kw6gpM=
X-Received: by 2002:a05:6830:2685:b0:7e4:10:c994 with SMTP id
 46e09a7af769-7e98685fdaemr2799041a34.11.1782304621633; Wed, 24 Jun 2026
 05:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606232356.gwHMAJAW-lkp@intel.com> <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
In-Reply-To: <20260624092806.GX48970@noisy.programming.kicks-ass.net>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 24 Jun 2026 17:36:49 +0500
X-Gm-Features: AVVi8CdiPQWCvq67NV5i22vU8s3Ws8DNcesb0onvNShgbiPkzx1FB5aJsSX0Pto
Message-ID: <CABXGCsOw+hXwp3OshzuSxTBLwMzrC=4wpofChFyuOsT7nj1MTQ@mail.gmail.com>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, jpoimboe@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 2:28=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> I do think this is very much a compiler issue, clang should never emit
> an indirect call for this. Doing that is just aweful.

Filed upstream as https://github.com/llvm/llvm-project/issues/205544
with a standalone reproducer (the drm_exec computed-goto pattern reduced
to one .c file; plain -O2, no LTO and no KASAN needed). clang lowers the
single-target computed goto to jmp *%reg; gcc folds the same source to a
direct jmp. So the missed fold is tracked on the LLVM side regardless of
the drm_exec.h rework happening here.

I have the KASAN + ThinLTO + clang config that triggered the original
objtool warning, so I can give a Tested-by once the drm_exec.h change
settles.

--=20
Thanks,
Mikhail.
