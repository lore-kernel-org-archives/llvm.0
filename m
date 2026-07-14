Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3C381B16
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010207; cv=pass; b=DGW2DsADW/tIVUuiKUeGYkn/dhMEGO5P8XZUVxhbOrHhy9wCdTxVMQOaEvLpgkiSgh/DzsQORgRYQQtdSGqkOYNIyzhvOOySNEXiWZzh+reGKaq3A50o1nkcushqPie9kvNUS4hj7T6tI8tC9aSuscfW0errgpjA58SB/aLOEa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010207; c=relaxed/simple;
	bh=Wnrg0Gu0f2+9+eCpNmhH2Vvi2/B647p4odZ67Sj98Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKCxzx8O2AmpxfRxjhX51cBkCU3xiKa5fGqK7lU+BPSTd+x3xFkfQqKdynGRflgeqhLhw8gcnW9ShhvSL9yR+NnWeR8QVNzk9VTwNv1qdhO1UV9texjm/SHtZ6o41t3RHL01l75lbTTTKRxzE+eUqRqq00sB3p6bW7OYDHGPX6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NIKYa8xX; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NIKYa8xX"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4513435cdd2so1461724fac.2
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784010203; cv=none;
        d=google.com; s=arc-20260327;
        b=mV08WbnsEJJzvr1wUtjKJaqrjCXnD/p+eitSKp7SyHkr+k7C54ouezPuTZ5QcMnek7
         dUE52flp1nZeeorqjeCH758SB7k8aJCNuHYvuo/1aGj6Gf2z0D9jUUtaIe4FcWyMRxbM
         tvK6vfuvBR77ejh3zUcsd+HH5fwmZ1DGHcU+AAQDIWQwFOxTuuuvaAhF8LWwRTBi5aud
         8/PkwyKmJ2bth3RCjUNOiUp30ilMG9buAk9dfszEs9ws9jXwNcAz/1ydnHeKbBs2N3v7
         zDhDRrVemrFhkKkGas143UV7quBnx9t1lZndw3ffGdZclWOtk3fqfgKYBwtz53l1hQQz
         1v5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        fh=ZJkW+/rtBwFFKmzIqLw/NpiD8L0qEw5ukbswVH0Ryt0=;
        b=e8cOMQ6pbZUpR79Up1Yz1+KiYdtAjhK8721XT3R2DMWMnkY9ypReSpz9oYX+Jigwld
         avDuMUgM0ysyRYxjB4wUW7s2seqkuYRC6hKS5h0mGRJYfnvgjnJ5KGLmI1hlChGKR9qV
         cuBufoaA0/1XuoinrEpERvn/JbijrD879eSn2ZMCVQWxz8Ev6cJQBs6m34aNI0is2k/O
         akoqsVR08em+901e4+1/IL8CHRo4oruYTlHeZwxBVH3ScgaEN6iLFCLNEBTSfZDgyJJy
         kufs6bR6+MEC/pp2nYGezfjOEelqYWqEhSfx/RsGd92DNS27xgMLPXQ5KkJ0exI9pwNS
         qxHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784010203; x=1784615003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        b=NIKYa8xXsf0KpcGBsYP2wE973EagiMULPOYT2EHyWKRgiO1PD8tEXkKKIL86DwTZDF
         /QUCmZC/yV0QNkeZ9HfF+FqXiVudy24pIQ7M4rYcp3yAy0uT4I5sLpMKSteXlBeNoK0j
         da+hbUtfXAhcVtyLU4+v5ZCoTRMoj9zuRXBuSkWxLF2CUnWFeiVqzIELAR1sJ6m6QqDB
         aD6/dT2tZw429As5STDo5I9V/qLZx0TFKshtzG6x39ij+iMQr/v3i4fBBxUYvYB2PEZo
         E8NgzxfZSBqjKNIJnGtZ3TgTXH9I42ladkyz8fP6JqkgFHeKK1XXQ9mXGHTdgDqCnXZ6
         I92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010203; x=1784615003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        b=Ra2Y+DB5YV/K4DVOsygNwYpUlw+kKekPuMg6cDgPHXpLd1Ve6Ctu5DxbLg3ueihB5e
         /42wem7vaUbmLXFXlGzZQhRwsuF5RrxRniUNtgxv4voHqaaHyP++eRkxjzwkszF/aB6P
         tI5rEf54mdG8ke7hhAjVam9UeeKdqp20+o8uZHqjUVaqthLyrwhNJpN88VUtsF/Rhlta
         9/TRSclzT82/Z8pq/wa3/f7FWxhdEgr/9MTVtoshW4FvXZOV1BNLP3UH2tchpgLOQKxE
         tOqRlS/RxHoIv0eJeEE6UX9ad+5J6N3I4X9qTEmk0gDvNBJgJukbFEz8ZNMB9jKODKxa
         GMhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bp7w173Xcv3G8zIfQiZ7us0BCyYyzgs26jVLBMd3mEyqBseyu0JUnlg388cFhuhlhDzyY@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHlukWIb75w2pDi9UFGvdOA/dKn0RRbUucjZ4Tcqm1V2prOvJ
	61BOlwqWBQVBmXEQ1xMlcIL3jcMSd67syZmukMxTLuk8KShP6gBmBMZSG4n+dF4qPSYsm7MMB5n
	zTlyUKha8PK/u1EQxZ6rT8nnvQCxKMOSDiV2FLzbUcg==
X-Gm-Gg: AfdE7cnPm+Drs/tWuUDCLjPTV89eu8ZHeM2oTc4BKLhWv7R+nrzh5K+Fr3cQPn5IrxR
	DVob+wcXmHDUrnN3IXKdYezGk5aHmbbu8lxRdN6zTK371ExfGACfBv5RCQFXrAOKGhLr9xfAeq9
	B1iNHWCZHsM8ai/zg1+lH5pdk3NiNQu7PNEHL7wvJQ++ZM187J47tldBnJ7sEApaXJcaa8sWcVI
	RQEUdWha4lczuMhsc1NCHXuGwE59IUu6bfprNfIMe8JMMh2ddJ19abyr3mueUMLcQyVo0nGJhY=
X-Received: by 2002:a05:6808:1b24:b0:495:f79d:b08e with SMTP id
 5614622812f47-4a47a6c1d27mr439710b6e.21.1784010203197; Mon, 13 Jul 2026
 23:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-2-cuiyunhui@bytedance.com> <74ffb0c5-4edd-7b64-3d3f-be76c2aec4c2@kernel.org>
In-Reply-To: <74ffb0c5-4edd-7b64-3d3f-be76c2aec4c2@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 14 Jul 2026 14:23:12 +0800
X-Gm-Features: AUfX_mxF_EkkHPpXwVLSHWKREo9gY6a3BeqhKBMKR6LcYXx54wa2zu3a3fsDMQ8
Message-ID: <CAEEQ3wk8gK9pam2da=o5mbfzU3-5EtfH5nyhAoVfCoy+7UuCGA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Jul 14, 2026 at 2:04=E2=80=AFAM Paul Walmsley <pjw@kernel.org> wrot=
e:
>
> On Fri, 3 Jul 2026, Yunhui Cui wrote:
>
> > When port I/O is not supported, exposing the port-string helpers is bot=
h
> > unnecessary and can make clang diagnose null-pointer arithmetic from th=
e
> > PCI_IOBASE based address expression.  Keep the MMIO string helpers
> > available as before, but only provide the port I/O variants when
> > CONFIG_HAS_IOPORT is enabled.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks, queued for v7.2-rc.

Thanks for queuing patch 1.

That patch is independent and safe to take as-is.

For patches 2/3, we later found that the percpu try_cmpxchg fallback path c=
an
expose a variable-shadowing issue in the current RISC-V cmpxchg macro
implementation in arch/riscv/include/asm/cmpxchg.h.

I'll address that in the next revision of the percpu patches, so please jus=
t
take patch 1 from v8 for now.

>
>
> - Paul


Thanks,
Yunhui
